using System;
using System.Configuration;
using System.IO;

namespace EuCA.Pwc.Pub
{
    public class ProcessParameters
    {
        /// <summary>
        /// Delete temporary files flag
        /// </summary>
        public bool DeleteTempFile { get; set; }
        
        #region WorkDir

        /// <summary>
        /// Workign directory
        /// </summary>
        private string _workDir = string.Empty;

        public string WorkDir
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_workDir))
                    _workDir = Path.Combine(Directory.GetCurrentDirectory(), "_work");

                return _workDir;
            }
        }

        #endregion

        /// <summary>
        /// Path of the XML source file
        /// </summary>
        public string FileOrig { get; set; }

        /// <summary>
        /// Path of the XML translation file
        /// </summary>
        public string FileTrad { get; set; }
        
        #region TempFileOrig

        /// <summary>
        /// Path of the copy of the XML source file
        /// </summary>
        private string _tempFileOrig = string.Empty;

        public string TempFileOrig
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_tempFileOrig))
                    _tempFileOrig = new Uri(Path.Combine(WorkDir, Path.GetFileName(FileOrig))).AbsoluteUri;

                return _tempFileOrig;
            }
        }

        #endregion

        #region TempFileTrad

        /// <summary>
        /// Path of the copy of the XMl translation file
        /// </summary>
        private string _tempFileTrad = string.Empty;

        public string TempFileTrad
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_tempFileTrad))
                    _tempFileTrad = new Uri(Path.Combine(WorkDir, Path.GetFileName(FileTrad))).AbsoluteUri;

                return _tempFileTrad;
            }
        }

        #endregion

        #region PreProcessedFileOrig

        private string _preProcessedFileOrig = string.Empty;

        public string PreProcessedFileOrig
        {
            get
            {
                if (string.IsNullOrEmpty(_preProcessedFileOrig))
                    _preProcessedFileOrig = Path.Combine(DirOrig, Path.GetFileNameWithoutExtension(TempFileOrig) + "_2.xml");

                return _preProcessedFileOrig;
            }
        }

        #endregion

        #region PreProcessedFileTrad

        private string _preProcessedFileTrad = string.Empty;

        public string PreProcessedFileTrad
        {
            get
            {
                if (string.IsNullOrEmpty(_preProcessedFileTrad))
                    _preProcessedFileTrad = Path.Combine(DirTrad, Path.GetFileNameWithoutExtension(TempFileTrad) + "_2.xml");

                return _preProcessedFileTrad;
            }
        }

        #endregion

        /// <summary>
        /// Language of the XML source file
        /// </summary>
        public string LangOrig { get; set; }

        /// <summary>
        /// Language of the XMl translation file
        /// </summary>
        public string LangTrad { get; set; }

        /// <summary>
        /// Output directory of the package
        /// </summary>
        public string DirOut { get; set; }

        /// <summary>
        /// Directory containing the necessary XSL files for the HTMl publication
        /// </summary>
        public string DirXsl { get; set; }

        #region DirXslBil

        /// <summary>
        /// Directory containing the necessary XSL files for the Biligual data processing
        /// </summary>
        private string _dirXslBil = string.Empty;

        public string DirXslBil
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirXslBil))
                    _dirXslBil = Path.Combine(Environment.CurrentDirectory, ConfigurationManager.AppSettings["pwc_xsl_bil"]);

                return _dirXslBil;
            }
        }

        #endregion
        
        #region DirOrig

        /// <summary>
        /// Directory containing the copy of the XML source file
        /// </summary>
        private string _dirOrig = string.Empty;

        public string DirOrig
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirOrig))
                    _dirOrig = Path.Combine(WorkDir, Path.GetFileNameWithoutExtension(FileOrig));

                return _dirOrig;
            }
        }

        #endregion

        #region DirTrad

        /// <summary>
        /// Directory containing the copy of the XML translation file
        /// </summary>
        private string _dirTrad = string.Empty;

        public string DirTrad
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirTrad))
                    _dirTrad = Path.Combine(WorkDir, Path.GetFileNameWithoutExtension(FileTrad));

                return _dirTrad;
            }
        }

        #endregion

        #region DirOrigPages

        /// <summary>
        /// Directory containing the HTML output of the HTML publishing
        /// </summary>
        private string _dirOrigPages = string.Empty;

        public string DirOrigPages
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirOrigPages))
                    _dirOrigPages = Path.Combine(DirOrig, "Pages");

                return _dirOrigPages;
            }
        }

        #endregion

        #region DirOrigXml

        /// <summary>
        /// Output directory for XML files generated from the source (TOC, Metadata)
        /// </summary>
        private string _dirOrigXml = string.Empty;

        public string DirOrigXml
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirOrigXml))
                    _dirOrigXml = Path.Combine(DirOrig, "XML");

                return _dirOrigXml;
            }
        }

        #endregion

        #region DirTradPages

        /// <summary>
        /// Output directory for XML files generated from the translation (TOC, Metadata)
        /// </summary>
        private string _dirTradPages = string.Empty;

        public string DirTradPages
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirTradPages))
                    return Path.Combine(DirTrad, "Pages");

                return _dirTradPages;
            }
        }

        #endregion

        #region DirTradIds

        /// <summary>
        /// Directory of the translation id folder
        /// </summary>
        private string _dirTradIds = string.Empty;

        public string DirTradIds
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirTradIds))
                    _dirTradIds = Path.Combine(DirTrad, "IDS");

                return _dirTradIds;
            }
        }

        #endregion

        #region DirTradMerge

        /// <summary>
        /// Directory for the translation merged HTML files
        /// </summary>
        private string _dirTradMerge = string.Empty;

        public string DirTradMerge
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirTradMerge))
                    return Path.Combine(DirTrad, "Merge");

                return _dirTradMerge;
            }
        }

        #endregion

        #region DirPackage

        /// <summary>
        /// Directory of the package
        /// </summary>
        private string _dirPackage = string.Empty;

        public string DirPackage
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirPackage))
                    return Path.Combine(WorkDir, "Package");

                return _dirPackage;
            }
        }

        #endregion

        #region DiPackageContent

        /// <summary>
        /// Directory of the content of the package
        /// </summary>
        private string _dirPackageContent = string.Empty;

        public string DirPackageContent
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirPackageContent))
                    _dirPackageContent = Path.Combine(DirPackage, "Content");

                return _dirPackageContent;
            }
        }

        #endregion
        
        #region DirGraphics

        /// <summary>
        /// Directory of the graphics of the package
        /// </summary>
        private string _dirGraphics = string.Empty;

        public string DirGraphics
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirGraphics))
                    _dirGraphics = Path.Combine(DirPackageContent, "graphics");

                return _dirGraphics;
            }
        }

        #endregion
        
        #region Schema

        public string Schema { get; set; } 
        
        #endregion
    }
}
