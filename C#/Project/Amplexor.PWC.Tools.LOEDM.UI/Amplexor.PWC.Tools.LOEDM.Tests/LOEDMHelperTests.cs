using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.IO;
using System.Linq;
using System.Threading;
using System.Xml.Linq;
using System.Xml.XPath;
using System.Xml;
using System.Text.RegularExpressions;

namespace Amplexor.PWC.Tools.LOEDM.Tests
{
    [TestClass]
    public class LOEDMHelperTests
    {
        private string _LOEDMPrevious = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\data\n\DMC-PW800-A-00-40-01-00A-00SA-D_N.html");
        private string _LOEDMCurrent = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\data\n_1\DMC-PW800-A-00-40-01-00A-00SA-D_N_1.html");
        private string _LOEDMInvalidContent = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\data\invalid\DMC-PW800-A-00-40-01-00A-00SA-D_INVALID.html");
        private string _LOEDMInvalidFormat = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\data\invalid\DMC-PW800-A-00-40-01-00A-00SA-D_INVALID_FORMAT.txt");
        private string _LOEDMCurrentOrig = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\data\n_1\DMC-PW800-A-00-40-01-00A-00SA-D_N_1_ORIGINAL.html");
        private string _LOEDMbackup = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\data\n_1\DMC-PW800-A-00-40-01-00A-00SA-D_N_1_backup.html");
        private string _TRACE = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"..\..\data\n_1\trace.csv");

        private static readonly string XHMTL_NAMESPACE = "http://www.w3.org/1999/xhtml";
        private static readonly string XPATH_LOEDM_DM_INFO = "/x:html/x:body//x:div[@id='loedm-table']//x:table[1]/x:tbody/x:tr";
        private static readonly string DM_NEW = "N";
        private static readonly string DM_CHANGED = "C";
        private static readonly string DM_UNCHANGED = string.Empty;

        private CancellationTokenSource _tokenSource;
        private Progress<ProgressChangedEventArgs> _progress;

        [TestInitialize]
        public void InitTest()
        {
            _tokenSource = new CancellationTokenSource();
            _progress = new Progress<ProgressChangedEventArgs>((args) =>
            {
                Assert.IsTrue(args.ProgressPourcentage >= 0);
                Assert.IsTrue(!string.IsNullOrWhiteSpace(args.Status));
            });
        }

        [TestCleanup]
        public void CleanUpTest()
        {
            if (File.Exists(_LOEDMbackup)) File.Delete(_LOEDMbackup);            
            if (File.Exists(_TRACE)) File.Delete(_TRACE);

            File.Move(_LOEDMCurrent, _LOEDMCurrent + ".todelete");
            File.Delete(_LOEDMCurrent + ".todelete");
            File.Copy(_LOEDMCurrentOrig, _LOEDMCurrent);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException), "The file path to the previous LOEDM is invalid.")]
        public void UpdateLOEDMStatus_NoLOEDMPrevious_Exception()
        {
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(string.Empty, _LOEDMCurrent, _progress, _tokenSource.Token);
        }

        [TestMethod]
        [ExpectedException(typeof(FileNotFoundException), "The previous LOEDM file cannot be found.")]
        public void UpdateLOEDMStatus_NoFileLOEDMPrevious_Exception()
        {
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(@"C:\error.html", _LOEDMCurrent, _progress, _tokenSource.Token);
        }
        
        [TestMethod]
        [ExpectedException(typeof(XmlException), "The previous LOEDM content is invalid.")]
        public void UpdateLOEDMStatus_WrongLOEDMPrevious_Exception()
        {
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(_LOEDMInvalidContent, _LOEDMCurrent, _progress, _tokenSource.Token);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException), "The previous LOEDM file format is invalid.")]
        public void UpdateLOEDMStatus_WrongFormatLOEDMPrevious_Exception()
        {
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(_LOEDMInvalidFormat, _LOEDMCurrent, _progress, _tokenSource.Token);
        }
        
        [TestMethod]
        [ExpectedException(typeof(ArgumentException), "The file path to the current LOEDM is invalid.")]
        public void UpdateLOEDMStatus_NoLOEDMCurrent_Exception()
        {
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(_LOEDMPrevious, string.Empty, _progress, _tokenSource.Token);
        }

        [TestMethod]
        [ExpectedException(typeof(FileNotFoundException), "The current LOEDM file cannot be found.")]
        public void UpdateLOEDMStatus_NoFileLOEDMCurrent_Exception()
        {
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(_LOEDMPrevious, @"C:\error.html", _progress, _tokenSource.Token);
        }

        [TestMethod]
        [ExpectedException(typeof(XmlException), "The current LOEDM content is invalid.")]
        public void UpdateLOEDMStatus_WrongLOEDMCurrent_Exception()
        {
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(_LOEDMPrevious, _LOEDMInvalidContent, _progress, _tokenSource.Token);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException), "The current LOEDM file format is invalid.")]
        public void UpdateLOEDMStatus_WrongFormatLOEDMCurrent_Exception()
        {
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(_LOEDMPrevious, _LOEDMInvalidFormat, _progress, _tokenSource.Token);
        }
        
        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException), "The progress event handler is null.")]
        public void UpdateLOEDMStatus_NullProgressEventHanlder_Exception()
        {
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(_LOEDMPrevious, _LOEDMCurrent, null, _tokenSource.Token);
        }

        [TestMethod]
        public void UpdateLOEDMDMStatus_Success()
        {
            // Test if the tests file are found
            Assert.IsTrue(File.Exists(_LOEDMPrevious));
            Assert.IsTrue(File.Exists(_LOEDMCurrent));

            // Verify that the helper instance is correctly instantiated
            Assert.IsNotNull(LOEDMHelper.Instance);
            Assert.IsInstanceOfType(LOEDMHelper.Instance, typeof(LOEDMHelper));

            // Process the test files
            LOEDMHelper.Instance.UpdateLOEDMDMStatus(_LOEDMPrevious, _LOEDMCurrent, _progress, _tokenSource.Token);

            Assert.IsTrue(File.Exists(_LOEDMPrevious));
            Assert.IsTrue(File.Exists(_LOEDMCurrent));
            Assert.IsTrue(File.Exists(_LOEDMbackup));
            Assert.IsTrue(File.Exists(_TRACE));

            //Assert.Fail("Implement other tests");
            // Create a namespace manager with an xhtml namespace
            // used for xpath requests
            var xnm = new XmlNamespaceManager(new NameTable());
            xnm.AddNamespace("x", XHMTL_NAMESPACE);

            using (var stream = new FileStream(_LOEDMCurrent, FileMode.Open, FileAccess.Read, FileShare.Read))
            using (var reader = XmlReader.Create(stream, new XmlReaderSettings { XmlResolver = null, DtdProcessing = DtdProcessing.Ignore })) // Ignore DTD
            {
                var doc = XDocument.Load(reader); // Load LOEDM
                var ns = doc.Root.Name.Namespace; // Retrieve root namespace (should be xhtml)

                // Retrieve the tr elements of the LOEDM table that represent Data Module info.
                var nodes = doc.Root.XPathSelectElements(XPATH_LOEDM_DM_INFO, xnm);
                
                Assert.AreEqual(1, nodes.Where(node => Regex.Replace(node.Elements(ns + "td").ToList()[2].Value, @"\s+", string.Empty)  == DM_NEW).Count());
                Assert.AreEqual(12, nodes.Where(node => Regex.Replace(node.Elements(ns + "td").ToList()[2].Value, @"\s+", string.Empty) == DM_CHANGED).Count());
                Assert.AreEqual(588, nodes.Where(node => Regex.Replace(node.Elements(ns + "td").ToList()[2].Value, @"\s+", string.Empty) == DM_UNCHANGED).Count());
            }
        }

    }
}
