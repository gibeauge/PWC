
using System.IO;
namespace EuCA.Pwc.Pub
{
    public class ProcessParameters
    {
        public string FileOrig { get; set; }

        public string FileTrad { get; set; }

        public string OutDir { get; set; }

        public string XslDir { get; set; }

        public string DirOrig { get { return Path.Combine(OutDir, Path.GetFileNameWithoutExtension(FileOrig)); } }

        public string DirTrad { get { return Path.Combine(OutDir, Path.GetFileNameWithoutExtension(FileTrad)); } }

        public string DirOrigPages { get { return Path.Combine(DirOrig, "Pages"); } }

        public string DirOrigXml { get {return Path.Combine(DirOrig, "XML"); } }

        public string DirTradPages { get { return Path.Combine(DirTrad, "Pages"); } }

        public string DirTradIds { get { return Path.Combine(DirTrad, "IDS"); } }

        public string DirTradMerge { get { return Path.Combine(DirTrad, "Merge"); } }

        public string DirTradPackage { get { return Path.Combine(DirTrad, "Package"); } }

        public string DirTradPackageContent { get { return Path.Combine(DirTradPackage, "Content"); } }
    }
}
