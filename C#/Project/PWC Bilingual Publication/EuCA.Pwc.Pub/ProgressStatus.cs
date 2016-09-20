namespace EuCA.Pwc.Pub
{
    public class ProgressStatus
    {
        public string Message { get; set; }

        public int Value { get; set; }

        public override string ToString()
        {
            return Message;
        }
    }
}
