using EO.Pdf;
using EO.Pdf.Contents;
using EO.Pdf.Drawing;
using System.Drawing;
using System.IO;
using System.Linq;

namespace EuCA.Pdf
{
    /// <summary>
    /// HTML to PDF converter.
    /// </summary>
    public class HtmlToPdfConverter
    {
        #region consts

        private static readonly float _regionBefore = 1F;
        private static readonly float _regionAfter = 1F;
        private static readonly float _regionStart = 0.75F;
        private static readonly float _regionEnd = 0.75F;
        
        #endregion

        #region Properties

        /// <summary>
        /// Gets or sets the path of a file containing the license for the third party library.
        /// </summary>
        public static string License { get; set; }

        /// <summary>
        /// Gets if the license is correctly set for the third party library.
        /// </summary>
        public static bool IsLicensed { get; private set; }

        private static readonly HtmlToPdfConverterOptions _options = 
            new HtmlToPdfConverterOptions
            {
                PageSize = PdfPageSizes.Letter,
                OutputArea = new RectangleF(_regionStart, _regionBefore, PdfPageSizes.Letter.Width - _regionStart - _regionEnd, PdfPageSizes.Letter.Height - _regionBefore - _regionAfter),
                RepeatTableHeaderFooter = false,
            };

        /// <summary>
        /// Gets the HtmlToPdfConverterOptions object that contains various conversion options.
        /// </summary>
        public static HtmlToPdfConverterOptions Options 
        {
            get 
            {
                return _options;
            }
        }

        #endregion

        #region public static Methods

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="output"></param>
        public static void Convert(string html, Stream output)
        {
            Convert(html, output, null);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="output"></param>
        /// <param name="options"></param>
        public static void Convert(string html, Stream output, HtmlToPdfConverterOptions options)
        {
            // Initialize parameters
            var opts = InitParameters(options);
           
            // Convert HTMl to PDF
            HtmlToPdf.ConvertHtml(html, output, opts);
        }   

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <param name="output"></param>
        public static void Convert(Stream input, Stream output) 
        {
            Convert(input, output, null);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="input"></param>
        /// <param name="output"></param>
        /// <param name="options"></param>
        public static void Convert(Stream input, Stream output, HtmlToPdfConverterOptions options)
        {
            using (var sr = new StreamReader(input))
            {
                var html = sr.ReadToEnd();
                Convert(html, output, options);
            }
        }

        #endregion

        #region private static Methods

        /// <summary>
        /// 
        /// </summary>
        /// <param name="options"></param>
        /// <returns></returns>
        private static HtmlToPdfOptions InitParameters(HtmlToPdfConverterOptions options)
        {
            var parameters = Options;
            if (options != null) 
            {
                parameters.BaseUrl = options.BaseUrl ?? parameters.BaseUrl;
                parameters.Footer = string.IsNullOrEmpty(options.Footer) ? parameters.Footer : options.Footer;
                parameters.Header = string.IsNullOrEmpty(options.Header) ? parameters.Header : options.Header;
                parameters.OutputArea = options.OutputArea.IsEmpty ? parameters.OutputArea : options.OutputArea;
                parameters.PageSize = options.PageSize.IsEmpty ? parameters.PageSize : options.PageSize;
                parameters.RepeatTableHeaderFooter = options.RepeatTableHeaderFooter ?? parameters.RepeatTableHeaderFooter;
                parameters.Timeout = options.Timeout ?? parameters.Timeout;
                parameters.VisibleElementIds = options.VisibleElementIds.Length == 0 ? parameters.VisibleElementIds : options.VisibleElementIds;
                parameters.Watermark = string.IsNullOrEmpty(options.Watermark) ? parameters.Watermark : options.Watermark;
            }

            // Options that are always set
            var opts = new HtmlToPdfOptions
            {
                PageSize = parameters.PageSize,
                OutputArea = parameters.OutputArea,
                NoLink = true,
                RepeatTableHeaderAndFooter = parameters.RepeatTableHeaderFooter ?? false,
                HeaderHtmlPosition = 0F,
                FooterHtmlPosition = parameters.PageSize.Height - _regionAfter
            };

            // BaseUrl
            if (parameters.BaseUrl != null) { opts.BaseUrl = parameters.BaseUrl.AbsoluteUri; }

            // Hendling of the header
            if (!string.IsNullOrEmpty(parameters.Header) && File.Exists(parameters.Header)) 
            {
                // TODO !
                opts.HeaderHtmlFormat = File.ReadAllText(parameters.Header);
            }

            // Handling of the footer
            if (!string.IsNullOrEmpty(parameters.Footer) && File.Exists(parameters.Footer))
            {
                // TODO !
                opts.FooterHtmlFormat = File.ReadAllText(parameters.Footer);
            }

            // Handling of the visible ids list
            if (parameters.VisibleElementIds != null && parameters.VisibleElementIds.Length > 0) { opts.VisibleElementIds = string.Join(";", parameters.VisibleElementIds); }

            // Handling of the watermark
            if (!string.IsNullOrEmpty(parameters.Watermark))
            {
                var helper = new WatermarkHelper { Watermark = parameters.Watermark };
                opts.BeforeRenderPage = new PdfPageEventHandler(helper.AddWatermark);
            }

            return opts;
        }

        #endregion
        
        #region Inner Class

        private class WatermarkHelper
        {
            public string Watermark { get; set; }

            public void AddWatermark(object sender, PdfPageEventArgs e)
            {
                // Create a new text layer.
                var textLayer = new PdfTextLayer();

                // Use a big font, light text color and also rotate the text 45 degrees.
                textLayer.Font = new PdfFont("Arial", 50);
                textLayer.NonStrokingColor = Color.LightGray;
                textLayer.GfxMatrix.Rotate(45);

                //Create the text object
                var textContent = new PdfTextContent(this.Watermark);

                // PDf unit is 1/72 of an inch.
                // Offset is from the bottom of the page.
                // The rotation mixes thing up.
                textContent.PositionMode = PdfTextPositionMode.Offset;
                textContent.Offset = new PdfPoint(380F, 50F);

                // Add the text object into the text layer object.
                textLayer.Contents.Add(textContent);

                // Add the text layer into the page.
                e.Page.Contents.Add(textLayer);
            }
        }



        #endregion

    }
}
