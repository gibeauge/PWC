using EuCA.Pwc.Pub.UI.Model;
using EuCA.Pwc.Pub.UI.View;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.CommandWpf;
using log4net;
using Microsoft.Win32;
using System;
using System.ComponentModel;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

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

        private static readonly ILog _logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        private Task _publishingTask;

        private CancellationTokenSource _tokenSource;

        private IShellView _view;

        #endregion

        #region Properties

        #region Cursor

        /// <summary>
        /// The <see cref="ShellCursor" /> property's name.
        /// </summary>
        public const string CursorPropertyName = "ShellCursor";

        private Cursor _shellCursor = Cursors.Arrow;

        /// <summary>
        /// Sets and gets the Cursor property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public Cursor ShellCursor
        {
            get
            {
                return _shellCursor;
            }

            set
            {
                if (_shellCursor == value)
                {
                    return;
                }

                _shellCursor = value;
                RaisePropertyChanged(CursorPropertyName);
            }
        }

        #endregion

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

        #region DeleteTempFile

        /// <summary>
        /// The <see cref="DeleteTempFile" /> property's name.
        /// </summary>
        public const string IsDeleteTempFileCheckedPropertyName = "DeleteTempFile";

        private bool _deleteTempFile = true;

        /// <summary>
        /// Sets and gets the IsDeleteTempFileChecked property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public bool DeleteTempFile
        {
            get
            {
                return _deleteTempFile;
            }

            set
            {
                if (_deleteTempFile == value)
                {
                    return;
                }

                _deleteTempFile = value;
                RaisePropertyChanged(IsDeleteTempFileCheckedPropertyName);
            }
        }

        #endregion

        #region Enabled

        /// <summary>
        /// The <see cref="Enabled" /> property's name.
        /// </summary>
        public const string EnabledPropertyName = "Enabled";

        private bool _enabled = true;

        /// <summary>
        /// Sets and gets the Enabled property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public bool Enabled
        {
            get
            {
                return _enabled;
            }

            set
            {
                if (_enabled == value)
                {
                    return;
                }

                _enabled = value;
                RaisePropertyChanged(EnabledPropertyName);
            }
        }

        #endregion

        #endregion

        #region Constructor

        /// <summary>
        /// Initializes a new instance of the ShellViewModel class.
        /// </summary>
        public ShellViewModel(IShellView view)
        {
            _view = view;

            Title = "Pratt & Whitney Canada - Bilingual publishing tool";

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

            Run();
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

        private static void OnProgress(object p)
        {
            // TODO! Report progress
            Console.WriteLine(p.ToString());
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

        private void Run()
        {
            // Disable the controls.
            Enabled = false;
            ShellCursor = Cursors.Wait;

            // Publication parameters
            var pubParams = new ProcessParameters
            {
                FileOrig = FileOrig,
                FileTrad = FileTrad,
                DirOut = DirOut,
                DirXsl = DirXsl,
                DeleteTempFile = DeleteTempFile
            };

            // Progress monitoring
            var progress = new Progress<object>(OnProgress);
            
            // Cancellation token, used to interrupt the publication process
            _tokenSource = new CancellationTokenSource();
            var cancellationToken = _tokenSource.Token;

            // Run the publication process
            _publishingTask = Task.Run(() => PublicationManager.Instance.Run(pubParams, progress, cancellationToken), cancellationToken);

            // Handles the publication process result
            _publishingTask.ContinueWith((task) =>
            {
                Enabled = true;
                ShellCursor = Cursors.Arrow;

                if (task.Exception != null)
                {
                    _view.ShowDialogAsync(new DialogMessage { Title = "Exception", Message = task.Exception.InnerException.Message });
                    _logger.Error(task.Exception.Message, task.Exception);
                }
                else if (task.IsCanceled)
                {
                    _view.ShowDialogAsync(new DialogMessage { Title = "Cancelled", Message = "Publication was cancelled." });
                    _logger.Debug("Publication was cancelled.");
                }
                else
                {
                    _view.ShowDialogAsync(new DialogMessage { Title = "Success", Message = "Publication was successful." });
                    _logger.Debug("Publication was successfull.");
                }
            }, TaskScheduler.FromCurrentSynchronizationContext());
        }

        #endregion
    }
}