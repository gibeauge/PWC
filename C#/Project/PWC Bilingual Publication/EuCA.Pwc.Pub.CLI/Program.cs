using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace EuCA.Pwc.Pub.CLI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("-=== PWC Bilingual Publication CLI ===-");

            var param = new ProcessParameters{
                FileOrig = @"M:\PWC\115M009001 PWC - Bilingual\2 - Dossier technique\22 - Prestation\223 - Developpement & Configuration\poc_compl_zh\tmm_pt6a_pt6a140_303ABCD.EN.corr.out.xml",
                FileTrad = @"M:\PWC\115M009001 PWC - Bilingual\2 - Dossier technique\22 - Prestation\223 - Developpement & Configuration\poc_compl_zh\tmm_pt6a_pt6a140_303ABCD.ZH.corr.out.xml",
                DirOut = @"C:\temp\out",
                DirXsl = @"C:\Data\02_Projects\13_P&WC\02_Dev\GitHub\PWC"
            };

            var cancellationTokenSource = new CancellationTokenSource();
            var cancellationToken = cancellationTokenSource.Token;

            PublicationManager.Instance.Run(param, new Progress<object>(OnProgress), cancellationToken);
            Console.ReadLine();
        }

        private static void OnProgress(object p)
        {
            Console.WriteLine((string)p);
        }
    }
}
