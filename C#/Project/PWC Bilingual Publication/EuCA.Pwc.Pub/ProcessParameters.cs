using System;
using System.Configuration;
using System.IO;

namespace EuCA.Pwc.Pub
{
    public class ProcessParameters
    {
        public bool DeleteTempFile { get; set; }

        public string WorkDir { get { return Path.Combine(Directory.GetCurrentDirectory(), "_work"); } }

        public string FileOrig { get; set; }

        public string FileTrad { get; set; }

        public string TempFileOrig { get { return Path.Combine(WorkDir, Path.GetFileName(FileOrig)); } }

        public string tempFileTrad { get { return Path.Combine(WorkDir, Path.GetFileName(FileTrad)); } }

        public string LangOrig { get; set; }

        public string LangTrad { get; set; }

        public string DirOut { get; set; }

        public string DirXsl { get; set; }

        public string DirXslBil { get { return Path.Combine(Environment.CurrentDirectory, ConfigurationManager.AppSettings["pwc_xsl_bil"]); } }

        public string DirOrig { get { return Path.Combine(WorkDir, Path.GetFileNameWithoutExtension(FileOrig)); } }

        public string DirTrad { get { return Path.Combine(WorkDir, Path.GetFileNameWithoutExtension(FileTrad)); } }

        public string DirOrigPages { get { return Path.Combine(DirOrig, "Pages"); } }

        public string DirOrigXml { get {return Path.Combine(DirOrig, "XML"); } }

        public string DirTradPages { get { return Path.Combine(DirTrad, "Pages"); } }

        public string DirTradIds { get { return Path.Combine(DirTrad, "IDS"); } }

        public string DirTradMerge { get { return Path.Combine(DirTrad, "Merge"); } }

        public string DirTradPackage { get { return Path.Combine(WorkDir, "Package"); } }

        public string DirTradPackageContent { get { return Path.Combine(DirTradPackage, "Content"); } }

        public string DirGraphics { get { return Path.Combine(DirTradPackageContent, "graphics"); } }
        
    }
}
