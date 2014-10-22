using EuCA.Pdf.Properties;
using System;
using System.Drawing;
using System.Linq;

namespace EuCA.Pdf
{
    // Contains various HTML to PDF conversion options.
    public class HtmlToPdfConverterOptions: ICloneable
    {
        /// <summary>
        /// Gets or sets the base Url when converting HTML text.
        /// </summary>
        public Uri BaseUrl { get; set; }

        /// <summary>
        /// Gets or sets the export control informations to be displayed in the footer.
        /// </summary>
        public string ExportControl { get; set; }
    
        /// <summary>
        /// Gets or sets the export classification informations to be displayed in the footer.
        /// </summary>
        public string ExportClassification { get; set; }

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
        /// Gets or sets a list of invisble element Ids.
        /// </summary>
        public string[] InvisibleElementIds { get; set; }

        /// <summary>
        /// Default constructor.
        /// </summary>
        public HtmlToPdfConverterOptions()
        {
            BaseUrl = null;
            ExportControl = Resources.EXPORT_CONTROL_DEFAULT;
            ExportClassification = Resources.EXPORT_CLASSIFICATION_DEFAULT;
            RepeatTableHeaderFooter = null;
            Timeout = null;
            VisibleElementIds = new string[] { };
            InvisibleElementIds = new string[] { };
        }

        public object Clone()
        {
            return CloneImpl();
        }

        /// <summary>
        /// Performs a deep copy of the current object
        /// </summary>
        /// <returns>A deep copy of the current object</returns>
        protected HtmlToPdfConverterOptions CloneImpl()
        {
            // Shallow copy
            var copy = (HtmlToPdfConverterOptions)MemberwiseClone();

            // Deep copy of the VisibleElementsIds array
            copy.VisibleElementIds = VisibleElementIds.Select(id => id.Clone()).Cast<string>().ToArray();

            // Deep copy of the InvisibleElementIds array
            copy.InvisibleElementIds = InvisibleElementIds.Select(id => id.Clone()).Cast<string>().ToArray();

            return copy;
        }
    }
}
