using EO.Pdf;
using EuCA.Pdf.Properties;
using System;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace EuCA.Pdf
{
    /// <summary>
    /// HTML to PDF converter.
    /// </summary>
    public class HtmlToPdfConverter
    {
        #region consts

        /// <summary>
        /// Margin-top
        /// </summary>
        private static readonly float _regionBefore = 0.8F;

        /// <summary>
        /// Margin-bottom
        /// </summary>
        private static readonly float _regionAfter = 0.8F;

        /// <summary>
        /// Margin-left
        /// </summary>
        private static readonly float _regionStart = 0.5F;

        /// <summary>
        /// Margin-right
        /// </summary>
        private static readonly float _regionEnd = 0.5F;

        /// <summary>
        /// xHTML namespace
        /// </summary>
        private static XNamespace _htmlNamespace = "http://www.w3.org/1999/xhtml";

        /// <summary>
        /// License flag
        /// </summary>
        private static bool IsLicensed = false;

        private static string log = "";

        #endregion

        #region Properties

        /// <summary>
        /// Gets or sets the path of a file containing the license for the third party library.
        /// </summary>
        //public static string License { get; set; }

        private static readonly HtmlToPdfConverterOptions _options =
            new HtmlToPdfConverterOptions
            {
                PageSize = PdfPageSizes.Letter,
                OutputArea = new RectangleF(_regionStart, _regionBefore, PdfPageSizes.Letter.Width - _regionStart - _regionEnd, PdfPageSizes.Letter.Height - _regionBefore - _regionAfter),
                RepeatTableHeaderFooter = true,
                ExportControl = Resources.EXPORT_CONTROL_DEFAULT,
                ExportClassification = Resources.EXPORT_CLASSIFICATION_DEFAULT
            };

        /// <summary>
        /// Gets the HtmlToPdfConverterOptions object that contains various conversion options.
        /// </summary>
        public static HtmlToPdfConverterOptions Options 
        {
            get 
            {
                return _options;
            }
        }

        #endregion

        #region public static Methods

        /// <summary>
        /// Converts an HTML page to PDF using the default options.
        /// </summary>
        /// <param name="html">The HTML content to convert.</param>
        /// <param name="output">The output stream.</param>
        public static void Convert(string html, Stream output)
        {
            Convert(html, output, null);
        }

        /// <summary>
        /// Converts an HTML page to PDF using the given options
        /// </summary>
        /// <param name="html">The HTML content to convert.</param>
        /// <param name="output">The output stream.</param>
        /// <param name="options">The options to use for the conversion.</param>
        public static void Convert(string html, Stream output, HtmlToPdfConverterOptions options)
        {
            log = "Start Convert()<br/>";
#if DEBUG
            /*
            var logPath = System.IO.Path.GetTempPath() + "logs_print_dll";
            if (!Directory.Exists(logPath))
            {
                Directory.CreateDirectory(logPath);
            }
            using (var f = File.CreateText(logPath + "\\html_string.txt"))
            {
                f.Write(html);
                f.Close();
            }
            using (var fw = File.CreateText(logPath + "\\debug_trace_EO.txt")) 
            {
                HtmlToPdf.DebugConsole = fw;
            }
            */
#endif

            // Sets the license
            SetLicense();

            // Initialize parameters
            var opts = InitParameters(html, options);

            log += "End Convert() (before rendering PDF)<br/>";
#if DEBUG
            String logs = "<div style='page-break-before:always;margin-bottom:5mm'> -- FOR DEBUGGING ONLY -- </div>" +
                            "<div style='font-size:12pt'>Logs:</div>" +
                            "<div style='font-size:11pt'>" + log + "</div>" +
                            "<div style='font-size:12pt;margin-top:5mm'>Source stream:</div>" +
                            "<div style='font-family:Courier; font-size:10pt'>" + html.Replace("\u003C", "&lt;") + "</div>";
            var idx = html.LastIndexOf("</body>");
            if (idx != -1)
            {
                html = html.Insert(idx, logs);
            }
            else
            {
                html = html + logs;
            }
#endif
            // Convert HTMl to PDF
            HtmlToPdf.ConvertHtml(html, output, opts);
        }

        /// <summary>
        /// Converts an HTML stream to PDF using the default options.
        /// </summary>
        /// <param name="input">The input stream.</param>
        /// <param name="output">The output stream.</param>
        public static void Convert(Stream input, Stream output) 
        {
            Convert(input, output, null);
        }

        /// <summary>
        /// Converts an HTML stream to PDF using the given options
        /// </summary>
        /// <param name="input">The input stream.</param>
        /// <param name="output">The output stream.</param>
        /// <param name="options">The options to use for the conversion.</param>
        public static void Convert(Stream input, Stream output, HtmlToPdfConverterOptions options)
        {
            using (var sr = new StreamReader(input))
            {
                var html = sr.ReadToEnd();
                sr.Close();
                Convert(html, output, options);
            }
        }

#endregion

        #region private static Methods

        /// <summary>
        /// Sets the EO PDf license
        /// </summary>
        private static void SetLicense() 
        {
            if (!IsLicensed)
            {
                Runtime.AddLicense(Resources.EO_PDF_LICENSE);
                IsLicensed = true;
            }
        }

        /// <summary>
        /// Initialise the parameters of the conversion,
        /// using the class parameters and the given parameters
        /// </summary>
        /// <param name="options">custom user parameter values</param>
        /// <returns>An HtmlToPdfOptions object</returns>
        private static HtmlToPdfOptions InitParameters(string html, HtmlToPdfConverterOptions options)
        {
            log += "Start InitParameters()<br/>";
            var parameters = (HtmlToPdfConverterOptions)Options.Clone();
            if (options != null) 
            {
                parameters.BaseUrl = options.BaseUrl ?? parameters.BaseUrl;
                parameters.ExportControl = string.IsNullOrEmpty(options.ExportControl) ? parameters.ExportControl : options.ExportControl;
                parameters.ExportClassification = string.IsNullOrEmpty(options.ExportClassification) ? parameters.ExportClassification : options.ExportClassification;
                parameters.OutputArea = options.OutputArea.IsEmpty ? parameters.OutputArea : options.OutputArea;
                parameters.PageSize = options.PageSize.IsEmpty ? parameters.PageSize : options.PageSize;
                parameters.RepeatTableHeaderFooter = options.RepeatTableHeaderFooter ?? parameters.RepeatTableHeaderFooter;
                parameters.Timeout = options.Timeout ?? parameters.Timeout;
                parameters.VisibleElementIds = options.VisibleElementIds.Length == 0 ? parameters.VisibleElementIds : options.VisibleElementIds;
                parameters.InvisibleElementIds = options.InvisibleElementIds.Length == 0 ? parameters.InvisibleElementIds : options.InvisibleElementIds;
            }

            // Try to parse the HTML source as XML.
            XDocument doc = null;
            try
            {
                doc = XDocument.Parse(html);
            }  catch (Exception e) {
                log += " Parsing error in InitParameters()<br/>";
                log += e.ToString() + "<br/>";
            }

            // Build the HTML header if the source HTML could be parsed as XML.
            var header = (doc != null) ? BuildHeader(doc) : string.Empty;
            // Build the HTML footer.
            var footer = BuildFooter(parameters);

            // Options that are always set
            var opts = new HtmlToPdfOptions
            {
                PageSize = parameters.PageSize,
                OutputArea = parameters.OutputArea,
                NoLink = true,
                RepeatTableHeaderAndFooter = parameters.RepeatTableHeaderFooter ?? true,
                FooterHtmlPosition = parameters.PageSize.Height - _regionAfter,
                FooterHtmlFormat = footer,
                HeaderHtmlPosition = 0F,
                HeaderHtmlFormat = header,
                NoCache = true
            };

            // BaseUrl
            if (parameters.BaseUrl != null) { opts.BaseUrl = parameters.BaseUrl.AbsoluteUri; }
            
            // Handling of the visible ids list
            if (parameters.VisibleElementIds != null && parameters.VisibleElementIds.Length > 0) { opts.VisibleElementIds = string.Join(";", parameters.VisibleElementIds); }

            // Handling of the invisible ids list
            if (parameters.InvisibleElementIds != null && parameters.InvisibleElementIds.Length > 0) { opts.InvisibleElementIds = string.Join(";", parameters.InvisibleElementIds); }

            log += "End InitParameters()<br/>";
            return opts;
        }

        /// <summary>
        /// Builds an HTML header for the PDF publication
        /// from informations contained in the HTML source.
        /// </summary>
        /// <param name="doc">The HTML source loaded as XML</param>
        /// <returns>A string containing the HTML header for the PDF publication.</returns>
        private static string BuildHeader(XDocument doc)
        {
            log += "Start BuildHeader()<br/>";
            var header = string.Empty;
            try
            {
                // Retrieve the metadatas information from the HTML source.
                var metadatas = doc
                    .Root
                    .Element(_htmlNamespace + Resources.TAG_BODY)
                    .Descendants()
                    .Where(n =>
                        n.Name.LocalName.Equals(Resources.TAG_DIV, StringComparison.InvariantCultureIgnoreCase) &&
                        n.Attribute(Resources.TAG_ID) != null &&
                        n.Attribute(Resources.TAG_ID).Value.Equals(Resources.PWCBANNERINFO, StringComparison.InvariantCultureIgnoreCase)
                    )
                    .Descendants()
                    .ToList()
                    .Select(meta =>
                        new
                        {
                            Key = (meta.Attribute(Resources.TAG_ID) != null) ? meta.Attribute(Resources.TAG_ID).Value : string.Empty,
                            Value = meta.Value
                        }
                     )
                    .ToDictionary(meta => meta.Key, meta => meta.Value);

                // Extract the informations from the metadatas
                if (metadatas.Count > 0)
                {
                    log += " Found metadatas in BuildHeader()<br/>";
                    var manualTitle = metadatas.ContainsKey(Resources.MANUALTITLE) ? metadatas[Resources.MANUALTITLE] : string.Empty;
                    var engine = metadatas.ContainsKey(Resources.ENGINE) ? metadatas[Resources.ENGINE] : string.Empty;
                    var manualPn = metadatas.ContainsKey(Resources.MANUALPN) ? metadatas[Resources.MANUALPN] : string.Empty;
                    var pointRev = metadatas.ContainsKey(Resources.POINTREV) ? metadatas[Resources.POINTREV] : string.Empty;
                    var revision = metadatas.ContainsKey(Resources.REVISION) ? metadatas[Resources.REVISION] : string.Empty;
                    var csu = metadatas.ContainsKey(Resources.CSU) ? metadatas[Resources.CSU] : string.Empty;
                    if (!csu.Equals(string.Empty))
                    {
                        csu += " - ";
                    }
                    var pbName = metadatas.ContainsKey(Resources.PBNAME) ? metadatas[Resources.PBNAME] : string.Empty;

                    // Revision date needs to be processed differently, being a date.
                    var revDate = string.Empty;
                    if (metadatas.ContainsKey(Resources.REVDATE))
                    {
                        var rawDate = metadatas[Resources.REVDATE];
                        DateTime parsedDate;
                        DateTime.TryParseExact(rawDate, new string[] { Resources.RAW_DATE_FORMAT }, CultureInfo.InvariantCulture, DateTimeStyles.None, out parsedDate);
                        revDate = parsedDate.ToString(Resources.DATE_FORMAT, new CultureInfo(Resources.CULTURE_EN_US)).ToUpper();
                    }

                    header = string.Format(Resources.HEADER, manualTitle, csu + pbName, manualPn, revision, pointRev, revDate);
                }
            }
            catch (Exception e) {
                log += " Error in BuildHeader()<br/>";
                log += e.ToString() + "<br/>";
            }

            log += " Header contents:<br/>" + header.Replace("\u003C", "&lt;") + "<br/>";
            log += "End BuildHeader()<br/>";
            return header; 
        }

        /// <summary>
        /// Builds an HTML footer for the PDF publication
        /// from informations contained in the conversion parameters.
        /// </summary>
        /// <param name="parameters">The parameters of the conversion.</param>
        /// <returns>A string containing the HTML footer for the PDF publication.</returns>
        private static string BuildFooter(HtmlToPdfConverterOptions parameters)
        {
            log += "Start BuildFooter()<br/>";
            var date = DateTime.Now.ToString(Resources.DATE_FORMAT, new CultureInfo(Resources.CULTURE_EN_US)).ToUpper();
            var footer = string.Format(Resources.FOOTER, parameters.ExportClassification, parameters.ExportControl, date, Resources.PAGE_NUMBER);
            log += " Footer contents:<br/>" + footer.Replace("\u003C", "&lt;") + "<br/>";
            log += "End BuildFooter()<br/>";
            return footer;
        }

#endregion
    }
}
