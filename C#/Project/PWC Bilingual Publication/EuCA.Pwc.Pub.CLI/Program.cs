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
                FileOrig = @"C:\Work\Projets\PWC\115M009001 PWC - Bilingual\2 - Dossier technique\22 - Prestation\223 - Developpement & Configuration\poc_compl_zh\tmm_pt6a_pt6a140_303ABCD.EN.v3.xml",
                FileTrad = @"C:\Work\Projets\PWC\115M009001 PWC - Bilingual\2 - Dossier technique\22 - Prestation\223 - Developpement & Configuration\poc_compl_zh\tmm_pt6a_pt6a140_303ABCD.ZH.v3.xml",
                DirOut = @"C:\Work\Projets\PWC\chunks",
                DirXsl = @"C:\Work\eclipse2\workspace\GitHub\PWC\XSL"
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
