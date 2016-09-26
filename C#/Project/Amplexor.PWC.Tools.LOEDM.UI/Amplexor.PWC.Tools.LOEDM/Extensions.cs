using System.IO;
using System.Linq;

namespace Amplexor.PWC.Tools.LOEDM
{
    public static class Extensions
    {
        public static string RemoveNonNumericChar(this string str)
        {
            return new string(str.Where(c => char.IsDigit(c)).ToArray());
        }

        public static string Backup(this FileInfo fi)
        {
            var pathBackup = Path.Combine(Path.GetDirectoryName(fi.FullName), Path.GetFileNameWithoutExtension(fi.Name) + "_backup.html");
            File.Copy(fi.FullName, pathBackup, true);
            return pathBackup;
        }
    }
}
