using System;
using System.Drawing;

namespace EuCA.Pdf
{
    // Contains various HTML to PDF conversion options.
    public class HtmlToPdfConverterOptions
    {
        /// <summary>
        /// Gets or sets the base Url when converting HTML text.
        /// </summary>
        public Uri BaseUrl { get; set; }

        /// <summary>
        /// Gets or sets the path to a configuration file containing the information of the header of the PDF pages.
        /// </summary>
        public string Header { get; set; }

        /// <summary>
        /// Gets or sets the path to a configuration file containing the information regarding the footer of the PDF pages.
        /// </summary>
        public string Footer { get; set; }

        /// <summary>
        /// Gets or sets the output area in inches.
        /// </summary>
        public RectangleF OutputArea { get; set; }

        /// <summary>
        /// Gets or sets the page size in inches.
        /// </summary>
        public SizeF PageSize { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether the HTML to PDF converter should automatically repeat table header and footer.
        /// </summary>
        public bool? RepeatTableHeaderFooter { get; set; }

        /// <summary>
        /// Gets or sets the maximum wait time in milliseconds to load a page to be rendered.
        /// </summary>
        public int? Timeout { get; set; }

        /// <summary>
        /// Gets or sets a list of visible element Ids.
        /// </summary>
        public string[] VisibleElementIds { get; set; }

        /// <summary>
        /// Gets or sets the watermark to add to the pages of the PDFs.
        /// </summary>
        public string Watermark { get; set; }

        /// <summary>
        /// Default constructor.
        /// </summary>
        public HtmlToPdfConverterOptions()
        {
            BaseUrl = null;
            Header = null;
            Footer = null;
            RepeatTableHeaderFooter = null;
            Timeout = null;
            VisibleElementIds = new string[] {};
            Watermark = null;
        }
    }
}
