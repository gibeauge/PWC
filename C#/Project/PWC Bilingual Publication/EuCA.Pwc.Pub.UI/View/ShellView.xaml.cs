using EuCA.Pwc.Pub.UI.ViewModel;

namespace EuCA.Pwc.Pub.UI.View
{
    /// <summary>
    /// Interaction logic for ShellView.xaml
    /// </summary>
    public partial class ShellView
    {
        public ShellView()
        {
            DataContext = new ShellViewModel();
        }
    }
}
