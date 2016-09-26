using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;

namespace Amplexor.PWC.Tools.LOEDM
{
    public class LOEDMHelper
    {
        #region Consts

        private static readonly string XHMTL_NAMESPACE = "http://www.w3.org/1999/xhtml";

        private static readonly string XPATH_LOEDM_DM_INFO = "/x:html/x:body//x:div[@id='loedm-table']//x:table[1]/x:tbody/x:tr";

        private static readonly string DATE_FORMAT = "yyyyMMdd";

        private static readonly string DTD_NAME = "html";

        private static readonly string DTD_PUBLIC_ID = "-//W3C//DTD XHTML 1.0 Strict//EN";

        private static readonly string DTD_SYSTEM_ID = "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd";

        private static readonly string DTD_INTERNAL_SUBSET = null;

        private static readonly XDocumentType DTD_XHTML = new XDocumentType(DTD_NAME, DTD_PUBLIC_ID, DTD_SYSTEM_ID, DTD_INTERNAL_SUBSET);

        private static readonly string DM_NEW = "N";

        private static readonly string DM_CHANGED = "C";

        private static readonly string DM_UNCHANGED = string.Empty;
        
        #endregion
        
        #region Singleton

        private static readonly Lazy<LOEDMHelper> lazy =
            new Lazy<LOEDMHelper>(() => new LOEDMHelper());

        public static LOEDMHelper Instance { get { return lazy.Value; } }

        private LOEDMHelper() { }

        #endregion

        #region Methods

        /// <summary>
        /// Update the DM status in a LOEDM based on the DM issue dates from a preivous LOEDM
        /// </summary>
        /// <param name="pathPreviousLOEDM">Path to the previous LOEDM</param>
        /// <param name="pathCurrentLOEDM">Path to the current LOEDM</param>
        /// <param name="progress">Progress of the processing</param>
        /// <param name="cancellationToken">Cancellation token</param>
        public void UpdateLOEDMDMStatus(string pathPreviousLOEDM, string pathCurrentLOEDM, IProgress<ProgressChangedEventArgs> progress, CancellationToken cancellationToken)
        {
            // Validate method arguments
            ValidateUpdateLOEDMArguments(pathPreviousLOEDM, pathCurrentLOEDM, progress);
            progress.Report(new ProgressChangedEventArgs { Status = "Starting update", ProgressPourcentage = 0 });

            // Backup of the current loedm to process
            cancellationToken.ThrowIfCancellationRequested();
            progress.Report(new ProgressChangedEventArgs { Status = "Creating backup file", ProgressPourcentage = 0 });
            var backup = new FileInfo(pathCurrentLOEDM).Backup();

            // Retrieve information from the preivous LOEDM
            cancellationToken.ThrowIfCancellationRequested();
            progress.Report(new ProgressChangedEventArgs { Status = "Reading previous LOEDM info", ProgressPourcentage = 0 });
            var previousDMInfo = GetDMInfoFromPreviousLOEDM(pathPreviousLOEDM);

            // Updates the current LOEDM
            cancellationToken.ThrowIfCancellationRequested();
            progress.Report(new ProgressChangedEventArgs { Status = "Reading previous LOEDM info", ProgressPourcentage = 50 });
            UpdateCurrentLOEDM(backup, pathCurrentLOEDM, previousDMInfo);

            progress.Report(new ProgressChangedEventArgs { Status = "Done.", ProgressPourcentage = 100 });
        }

        /// <summary>
        /// Validate the argument values for the UpdateLOEDMDMStatus method
        /// </summary>
        /// <param name="pathPreviousLOEDM">Path to the previous LOEDM</param>
        /// <param name="pathCurrentLOEDM">Path to the current LOEDM</param>
        /// <param name="progress">Progress for the processing</param>
        private void ValidateUpdateLOEDMArguments(string pathPreviousLOEDM, string pathCurrentLOEDM, IProgress<ProgressChangedEventArgs> progress)
        {
            if (string.IsNullOrWhiteSpace(pathPreviousLOEDM))
                throw new ArgumentException("Invalid path for the previous LOEDM");

            if (string.IsNullOrWhiteSpace(pathCurrentLOEDM))
                throw new ArgumentException("Invalid path for the current LOEDM");

            if (!string.Equals(Path.GetExtension(pathPreviousLOEDM), ".html", StringComparison.InvariantCultureIgnoreCase))
                throw new ArgumentException("Invalid file format for the previous LOEDM");

            if (!string.Equals(Path.GetExtension(pathCurrentLOEDM), ".html", StringComparison.InvariantCultureIgnoreCase))
                throw new ArgumentException("Invalid file format for the current LOEDM");

            if (!File.Exists(pathCurrentLOEDM))
                throw new FileNotFoundException("Previous LOEDM not found");

            if (!File.Exists(pathPreviousLOEDM))
                throw new FileNotFoundException("Current LOEDM not found");

            if (progress == null)
                throw new ArgumentNullException("Progress object cannot be null");
        }
        
        /// <summary>
        /// Gets DM info from a LOEDM
        /// </summary>
        /// <param name="pathLOEDM">File path to the LOEDM</param>
        /// <returns>A Dictionary which keys are DMCs and values the corresponding Issue Dates</returns>
        private IDictionary<string, DateTime> GetDMInfoFromPreviousLOEDM(string pathLOEDM)
        {            
            // Create a namespace manager with an xhtml namespace
            // used for xpath requests
            var xnm = new XmlNamespaceManager(new NameTable());
            xnm.AddNamespace("x", XHMTL_NAMESPACE);
            
            // Read data modules info from the previous LOEDM
            using (var stream = new FileStream(pathLOEDM, FileMode.Open, FileAccess.Read, FileShare.Read))
            using (var reader = XmlReader.Create(stream, new XmlReaderSettings { XmlResolver = null, DtdProcessing = DtdProcessing.Ignore })) // Ignore DTD declaration
            {
                var doc = XDocument.Load(reader); // Load previous LOEDM
                var ns = doc.Root.Name.Namespace; // Retrieve root namespace (should be xhtml)

                // Retrieve the tr elements of the LOEDM table that represent Data Module info.
                var nodes = doc.Root.XPathSelectElements(XPATH_LOEDM_DM_INFO, xnm);
                if (nodes.Count() == 0) throw new Exception("The previous LOEDM does not contain any Data Module information");

                // Retrieve Data Module info and store it in a dictionary 
                // which keys are DMCs and values the corresponding issue dates.
                return nodes
                    .Where(node => node.Elements(ns + "td").Count() == 5)
                    .Select(node => {
                        var children = node.Elements(ns + "td").ToList();
                        // DMC
                        var dmc = children[1].Value;
                        // If the date can't be parsed, return a null value
                        DateTime date; 
                        return DateTime.TryParseExact(children[3].Value.RemoveNonNumericChar(), DATE_FORMAT, null, DateTimeStyles.None, out date) ? new { DMC = dmc, IssueDate = date } : null;
                    })
                    .Where(dm => dm.IssueDate != null) // Remove the DM entry for which we don't have an issue date
                    .ToDictionary(dm => dm.DMC, dm => dm.IssueDate);
            }
        }

        /// <summary>
        /// Updates an LOEDM according to DM info from a previous LOEDM
        /// </summary>
        /// <param name="pathSource">File path to the LEODM to update</param>
        /// <param name="pathOutput">Output path for the result of the update</param>
        /// <param name="previousDMInfo">DM info from a previous LOEDM</param>
        private void UpdateCurrentLOEDM(string pathSource, string pathOutput, IDictionary<string, DateTime> previousDMInfo)
        {
            // Trace
            var trace = previousDMInfo.Keys.ToDictionary(k => k, k => new DMStatus { Old = previousDMInfo[k].ToShortDateString() });

            // Create a namespace manager with an xhtml namespace
            // used for xpath requests
            var xnm = new XmlNamespaceManager(new NameTable());
            xnm.AddNamespace("x", XHMTL_NAMESPACE);

            // Setup XML Writer Output settings
            var xws = new XmlWriterSettings { OmitXmlDeclaration = true, Encoding = Encoding.UTF8, Indent = false };
            SetXmlWriterSettings(xws);

            using (var stream = new FileStream(pathSource, FileMode.Open, FileAccess.ReadWrite, FileShare.Read))
            using (var reader = XmlReader.Create(stream, new XmlReaderSettings { XmlResolver = null, DtdProcessing = DtdProcessing.Ignore })) // Ignore DTD
            using (var xw = XmlWriter.Create(pathOutput, xws)) // Sets output paremeters
            {
                var doc = XDocument.Load(reader); // Load LOEDM
                var ns = doc.Root.Name.Namespace; // Retrieve root namespace (should be xhtml)

                // Retrieve the tr elements of the LOEDM table that represent Data Module info.
                var nodes = doc.Root.XPathSelectElements(XPATH_LOEDM_DM_INFO, xnm);
                if (nodes.Count() == 0) throw new Exception("The previous LOEDM does not contain any Data Module information");

                // Update DM info
                foreach (var node in nodes.Where(node => node.Elements(ns + "td").Count() == 5))
                {
                    var children = node.Elements(ns + "td").ToList();
                    var dmc = children[1].Value;

                    // If the date can't be parsed, skip this dm entry
                    DateTime date;
                    if (!DateTime.TryParseExact(children[3].Value.RemoveNonNumericChar(), DATE_FORMAT, null, DateTimeStyles.None, out date))
                        continue;
                    
                    // Find what the DM status should be
                    var newStatus = previousDMInfo.ContainsKey(dmc) ? date > previousDMInfo[dmc] ? DM_CHANGED : DM_UNCHANGED : DM_NEW;
                    children[2].Element(ns + "div").SetValue(newStatus); // Updates the XML tree with the status

                    if (trace.ContainsKey(dmc)) trace[dmc] = new DMStatus { Old = trace[dmc].Old, Current = date.ToShortDateString(), Status = newStatus };
                    else trace.Add(dmc, new DMStatus { Current = date.ToShortDateString(), Status = newStatus });
                }

                doc.AddFirst(DTD_XHTML); // Add XHTML DTD declaration (ignored when loading the XML tree)
                doc.Save(xw); // Save the modifications
            }

            // Write trace to CSV file
            var lines = new List<string> { "DMC,Old,Current,Status" };
            lines.AddRange(trace.Select(x => x.Key.Replace('‑', '-') + ", " + (x.Value.Old ?? " ") + "," + (x.Value.Current ?? " ") + "," + x.Value.Status));
            File.WriteAllLines(Path.Combine(Path.GetDirectoryName(pathOutput), "trace.csv"), lines);
        }

        [Conditional("DEBUG")]
        private void SetXmlWriterSettings(XmlWriterSettings xws) 
        {
            xws.Indent = true;
        }
        
        public struct DMStatus
        {
            public string Old { get; set; }
            public string Current { get; set; }
            public string Status { get; set; }
        }

        #endregion
    }    
}
