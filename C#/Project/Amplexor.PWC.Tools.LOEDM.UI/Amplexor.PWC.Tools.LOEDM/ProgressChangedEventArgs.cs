namespace Amplexor.PWC.Tools.LOEDM
{
    /// <summary>
    /// Process Event Args
    /// </summary>
    public class ProgressChangedEventArgs
    {
        /// <summary>
        /// Message
        /// </summary>
        public string Status { get; set; }

        /// <summary>
        /// Progress value (on a scale from 0 to 100)
        /// </summary>
        public int ProgressPourcentage { get; set; }

        /// <summary>
        /// ToString
        /// </summary>
        /// <returns>A string representation of the object</returns>
        public override string ToString()
        {
            return Status;
        }
    }
}
