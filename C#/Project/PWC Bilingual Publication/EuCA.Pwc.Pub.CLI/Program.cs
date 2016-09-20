using System;
using System.Threading;

namespace EuCA.Pwc.Pub.CLI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("-=== PWC Bilingual Publication CLI ===-");

            var param = new ProcessParameters{
                FileOrig = @"C:\Work\Projects\PWC\Bilingue\Work\xml\tmm_pt6a_pt6a140_3075742_5.EN.v4.xml",
                FileTrad = @"C:\Work\Projects\PWC\Bilingue\Work\xml\tmm_pt6a_pt6a140_3075742_5.ZH.v4.xml",
                DirOut = @"C:\Work\Projects\PWC\Bilingue\Work\chunks",
                DirXsl = @"C:\Work\Projects\PWC\Bilingue\git\PWC\XSL"
            };

            var cancellationTokenSource = new CancellationTokenSource();
            var cancellationToken = cancellationTokenSource.Token;

            PublicationManager.Instance.Run(param, new Progress<object>(OnProgress), cancellationToken);
            Console.ReadLine();
        }

        private static void OnProgress(object p)
        {
            Console.WriteLine(p);
        }
    }
}
