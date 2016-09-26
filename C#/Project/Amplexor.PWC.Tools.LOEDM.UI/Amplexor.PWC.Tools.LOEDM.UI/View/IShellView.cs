using Amplexor.PWC.Tools.LOEDM.UI.Model;
using MahApps.Metro.Controls.Dialogs;
using System.Threading.Tasks;

namespace Amplexor.PWC.Tools.LOEDM.UI.View
{
    public interface IShellView
    {
        Task<MessageDialogResult> ShowDialogAsync(DialogMessage e);
    }
}
