using EuCA.Pwc.Pub.UI.Model;
using MahApps.Metro.Controls.Dialogs;
using System.Threading.Tasks;

namespace EuCA.Pwc.Pub.UI.View
{
    public interface IShellView
    {
        Task<MessageDialogResult> ShowDialogAsync(DialogMessage e);
    }
}
