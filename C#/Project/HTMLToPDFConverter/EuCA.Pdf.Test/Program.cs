using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace EuCA.Pdf.Test
{
    public class Program
    {
        public static void Main(string[] args)
        {
            //Test1();
            //Test2();
            //Test3();
            //Test4();
            Test5();
        }

        public static void Test1()
        {
            using (var fs = new FileStream(@"C:\temp\test1.pdf", FileMode.Create, FileAccess.ReadWrite, FileShare.None))
            {
                HtmlToPdfConverter.Convert(File.ReadAllText(@"C:\Users\dabenard.EUDOC\Desktop\ENGINE - GENERAL - FAULT ISOLATION 1.htm"), fs);
            }
        }

        public static void Test2()
        {
            var options = new HtmlToPdfConverterOptions
            {
                BaseUrl = new Uri(@"C:\Users\dabenard.EUDOC\Desktop"),
                RepeatTableHeaderFooter = true
            };

            using (var fs = new FileStream(@"C:\temp\test2.pdf", FileMode.Create, FileAccess.ReadWrite, FileShare.None))
            {
                HtmlToPdfConverter.Convert(File.ReadAllText(@"C:\Users\dabenard.EUDOC\Desktop\ENGINE - GENERAL - FAULT ISOLATION 1.htm"), fs, options);
            }
        }

        public static void Test3()
        {
            var options = new HtmlToPdfConverterOptions
            {
                BaseUrl = new Uri(@"C:\Users\dabenard.EUDOC\Desktop"),
                VisibleElementIds = new string[] {"g2000047016", "g2000047036"} ,
            };

            using (var fs = new FileStream(@"C:\temp\test3.pdf", FileMode.Create, FileAccess.ReadWrite, FileShare.None))
            {
                HtmlToPdfConverter.Convert(File.ReadAllText(@"C:\Users\dabenard.EUDOC\Desktop\ENGINE - GENERAL - FAULT ISOLATION 1.htm"), fs, options);
            }
        }

        public static void Test4()
        {
            var options = new HtmlToPdfConverterOptions
            {
                BaseUrl = new Uri(@"C:\Users\dabenard.EUDOC\Desktop"),
                RepeatTableHeaderFooter = true,
                Watermark = "Printed Version"
            };

            using (var fs = new FileStream(@"C:\temp\test4.pdf", FileMode.Create, FileAccess.ReadWrite, FileShare.None))
            {
                HtmlToPdfConverter.Convert(File.ReadAllText(@"C:\Users\dabenard.EUDOC\Desktop\ENGINE - GENERAL - FAULT ISOLATION 1.htm"), fs, options);
            }
        }

        public static void Test5()
        {
            var options = new HtmlToPdfConverterOptions
            {
                BaseUrl = new Uri(@"C:\Users\dabenard.EUDOC\Desktop"),
                RepeatTableHeaderFooter = true,
                Watermark = "Print Only",
                Header = @"C:\Users\dabenard.EUDOC\Desktop\header.xml",
                Footer = @"C:\Users\dabenard.EUDOC\Desktop\footer.xml",
            };

            using (var fs = new FileStream(@"C:\temp\test5.pdf", FileMode.Create, FileAccess.ReadWrite, FileShare.None))
            {
                HtmlToPdfConverter.Convert(File.ReadAllText(@"C:\Users\dabenard.EUDOC\Desktop\ENGINE - GENERAL - FAULT ISOLATION 1.htm"), fs, options);
            }
        }
    }
}
