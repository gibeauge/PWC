using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.CommandWpf;
using Microsoft.Win32;
using System.ComponentModel;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace EuCA.Pwc.Pub.UI.ViewModel
{
    /// <summary>
    /// This class contains properties that a View can data bind to.
    /// <para>
    /// See http://www.galasoft.ch/mvvm
    /// </para>
    /// </summary>
    public class ShellViewModel : ViewModelBase
    {
        #region Members

        private Task _publishingTask;

        private CancellationTokenSource _tokenSource;

        #endregion

        #region Properties

        #region Title

        /// <summary>
        /// The <see cref="Title" /> property's name.
        /// </summary>
        public const string TitlePropertyName = "Title";

        private string _title = string.Empty;

        /// <summary>
        /// Sets and gets the Title property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public string Title
        {
            get
            {
                return _title;
            }

            set
            {
                if (_title == value)
                {
                    return;
                }

                _title = value;
                RaisePropertyChanged(TitlePropertyName);
            }
        }

        #endregion

        #region FileOrig

        /// <summary>
        /// The <see cref="FileOrig" /> property's name.
        /// </summary>
        public const string FileOrigPropertyName = "FileOrig";

        private string _fileOrig = string.Empty;

        /// <summary>
        /// Sets and gets the DirOrig property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public string FileOrig
        {
            get
            {
                return _fileOrig;
            }

            set
            {
                if (_fileOrig == value)
                {
                    return;
                }

                _fileOrig = value;
                RaisePropertyChanged(FileOrigPropertyName);
            }
        }

        #endregion

        #region DirTrad

        /// <summary>
        /// The <see cref="FileTrad" /> property's name.
        /// </summary>
        public const string FileTradPropertyName = "FileTrad";

        private string _fileTrad = string.Empty;

        /// <summary>
        /// Sets and gets the DirTrad property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public string FileTrad
        {
            get
            {
                return _fileTrad;
            }

            set
            {
                if (_fileTrad == value)
                {
                    return;
                }

                _fileTrad = value;
                RaisePropertyChanged(FileTradPropertyName);
            }
        }

        #endregion

        #region DirOut

        /// <summary>
        /// The <see cref="DirOut" /> property's name.
        /// </summary>
        public const string DirOutPropertyName = "DirOut";

        private string _dirOut = string.Empty;

        /// <summary>
        /// Sets and gets the DirOut property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public string DirOut
        {
            get
            {
                return _dirOut;
            }

            set
            {
                if (_dirOut == value)
                {
                    return;
                }

                _dirOut = value;
                RaisePropertyChanged(DirOutPropertyName);
            }
        }

        #endregion

        #region DirXsl

        /// <summary>
        /// The <see cref="DirXsl" /> property's name.
        /// </summary>
        public const string DirXslPropertyName = "DirXsl";

        private string _dirXsl = string.Empty;

        /// <summary>
        /// Sets and gets the DirXsl property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public string DirXsl
        {
            get
            {
                return _dirXsl;
            }

            set
            {
                if (_dirXsl == value)
                {
                    return;
                }

                _dirXsl = value;
                RaisePropertyChanged(DirXslPropertyName);
            }
        }

        #endregion

        #endregion

        #region Constructor

        /// <summary>
        /// Initializes a new instance of the ShellViewModel class.
        /// </summary>
        public ShellViewModel()
        {
            Title = "PW&C Bilingual publishing tool";

            Application.Current.MainWindow.Closing += new CancelEventHandler(MainWindowClosing);
        }

        #endregion

        #region Commands

        #region BrowseCommand

        private RelayCommand<string> _browseCommand;

        /// <summary>
        /// Gets the BrowseCommand.
        /// </summary>
        public RelayCommand<string> BrowseCommand
        {
            get
            {
                return _browseCommand ?? (_browseCommand = new RelayCommand<string>(
                    ExecuteBrowseCommand,
                    CanExecuteBrowseCommand));
            }
        }

        private void ExecuteBrowseCommand(string parameter)
        {
            if (!BrowseCommand.CanExecute(parameter))
            {
                return;
            }

            switch (parameter)
            {
                case DirXslPropertyName:
                    var resultXsl = BrowseFolder(DirXsl);
                    if (resultXsl.Length > 0) DirXsl = resultXsl;
                    break;
                case DirOutPropertyName:
                    var resultOut = BrowseFolder(DirOut);
                    if (resultOut.Length > 0) DirOut = resultOut;
                    break;
                case FileOrigPropertyName:
                    var resultOrig = BrowseFile(FileOrig, "*.xml");
                    if (resultOrig.Length > 0) FileOrig = resultOrig;
                    break;
                case FileTradPropertyName:
                    var resultTrad = BrowseFile(FileTrad, "*.xml");
                    if (resultTrad.Length > 0) FileTrad = resultTrad;
                    break;
            }
        }

        private bool CanExecuteBrowseCommand(string parameter)
        {
            return true;
        }

        #endregion

        #region PublishCommand

        private RelayCommand _publishCommand;

        /// <summary>
        /// Gets the PublishCommand.
        /// </summary>
        public RelayCommand PublishCommand
        {
            get
            {
                return _publishCommand ?? (_publishCommand = new RelayCommand(
                    ExecutePublishCommand,
                    CanExecutePublishCommand));
            }
        }

        private void ExecutePublishCommand()
        {
            if (!PublishCommand.CanExecute(null))
            {
                return;
            }

            _tokenSource = new CancellationTokenSource();
            var cancellationToken = _tokenSource.Token;
            _publishingTask = Task.Run(() =>
                {
                    while (true)
                    {
                        cancellationToken.ThrowIfCancellationRequested();
                    }
                }, cancellationToken);

            _publishingTask.ContinueWith((task) =>
                {
                    if (task.Exception != null)
                    {
                        MessageBox.Show("Exception.");
                    }
                    else if (task.IsCanceled)
                    {
                        MessageBox.Show("Cancelled.");
                    }
                    else
                    {
                        MessageBox.Show("Done.");
                    }
                });
        }

        private bool CanExecutePublishCommand()
        {
            return (_publishingTask == null || _publishingTask.IsCompleted) &&
                File.Exists(FileTrad) && File.Exists(FileOrig) &&
                Directory.Exists(DirOut) && Directory.Exists(DirXsl);
        }

        #endregion

        #region CancelCommand

        private RelayCommand _cancelCommand;

        /// <summary>
        /// Gets the CancelCommand.
        /// </summary>
        public RelayCommand CancelCommand
        {
            get
            {
                return _cancelCommand ?? (_cancelCommand = new RelayCommand(
                    ExecuteCancelCommand,
                    CanExecuteCancelCommand));
            }
        }

        private void ExecuteCancelCommand()
        {
            if (!CancelCommand.CanExecute(null))
            {
                return;
            }

            if (_publishingTask != null && !_publishingTask.IsCompleted && _tokenSource != null)
            {
                _tokenSource.Cancel();
            }
        }

        private bool CanExecuteCancelCommand()
        {
            return _publishingTask != null && !_publishingTask.IsCompleted;
        }

        #endregion

        #endregion

        #region Events

        private void MainWindowClosing(object sender, CancelEventArgs e)
        {
            e.Cancel = (_publishingTask != null && !_publishingTask.IsCompleted);
        }

        #endregion

        #region Methods

        private string BrowseFolder(string initialDir)
        {
            // https://wpffolderbrowser.codeplex.com/
            var dlg = new WPFFolderBrowser.WPFFolderBrowserDialog();
            if (Directory.Exists(initialDir)) dlg.InitialDirectory = initialDir;
            return (dlg.ShowDialog() == true) ? dlg.FileName : string.Empty;
        }

        private string BrowseFile(string initialFile, string filter)
        {
            var dlg = new OpenFileDialog();
            if (Directory.Exists(initialFile)) dlg.InitialDirectory = initialFile;
            else if (File.Exists(initialFile)) dlg.InitialDirectory = Directory.GetParent(initialFile).FullName;
            dlg.DefaultExt = filter;
            dlg.Filter = "Documents (" + filter + ")|" + filter;
            return (dlg.ShowDialog() == true) ? dlg.FileName : string.Empty;
        }

        #endregion
    }
}