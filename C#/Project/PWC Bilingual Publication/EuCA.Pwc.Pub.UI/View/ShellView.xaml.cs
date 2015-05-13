using EuCA.Pwc.Pub.UI.Model;
using EuCA.Pwc.Pub.UI.ViewModel;
using log4net;
using MahApps.Metro.Controls.Dialogs;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace EuCA.Pwc.Pub.UI.View
{
    /// <summary>
    /// Interaction logic for ShellView.xaml
    /// </summary>
    public partial class ShellView : IShellView
    {
        private static readonly ILog _logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public ShellView()
        {
            DataContext = new ShellViewModel(this);
            _logger.Debug("Shell started");
        }
        
        public Task<MessageDialogResult> ShowDialogAsync(DialogMessage e)
        {
            return this.ShowMessageAsync(e.Title, e.Message, MessageDialogStyle.Affirmative, new MetroDialogSettings { ColorScheme = MetroDialogColorScheme.Theme });
        }
    }
}
