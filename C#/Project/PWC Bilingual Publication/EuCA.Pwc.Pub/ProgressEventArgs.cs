namespace EuCA.Pwc.Pub
{
    /// <summary>
    /// Process Event Args
    /// </summary>
    public class ProgressEventArgs
    {
        /// <summary>
        /// Message
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// Progress value (on a scale from 0 to 100)
        /// </summary>
        public int Value { get; set; }

        /// <summary>
        /// ToString
        /// </summary>
        /// <returns>A string representation of the object</returns>
        public override string ToString()
        {
            return Message;
        }
    }
}
