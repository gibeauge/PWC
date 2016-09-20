using System;
using System.Configuration;
using System.IO;

namespace EuCA.Pwc.Pub
{
    public class ProcessParameters
    {
        public bool DeleteTempFile { get; set; }

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

        public string FileOrig { get; set; }

        public string FileTrad { get; set; }

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

        public string LangOrig { get; set; }

        public string LangTrad { get; set; }

        public string DirOut { get; set; }

        public string DirXsl { get; set; }

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

        private string _dirOrig = string.Empty;

        public string DirOrig
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirOrig))
                    _dirOrig =  Path.Combine(WorkDir, Path.GetFileNameWithoutExtension(FileOrig));

                return _dirOrig;
            }
        }

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

        private string _dirTradPackage = string.Empty;

        public string DirTradPackage
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirTradPackage))
                    return Path.Combine(WorkDir, "Package");

                return _dirTradPackage;
            }
        }

        private string _dirTradPackageContent = string.Empty;

        public string DirTradPackageContent
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirTradPackageContent))
                    _dirTradPackageContent = Path.Combine(DirTradPackage, "Content");

                return _dirTradPackageContent;
            }
        }

        private string _dirGraphics = string.Empty;

        public string DirGraphics
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_dirGraphics))
                    _dirGraphics = Path.Combine(DirTradPackageContent, "graphics");

                return _dirGraphics;
            }
        }
        
    }
}
