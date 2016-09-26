using Amplexor.PWC.Tools.LOEDM.UI.Model;
using Amplexor.PWC.Tools.LOEDM.UI.View;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.CommandWpf;
using log4net;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Amplexor.PWC.Tools.LOEDM.UI.ViewModel
{
    public class ShellViewModel : ViewModelBase
    {
        #region Members

        private static readonly ILog _logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        private Task _updateTask;

        private CancellationTokenSource _tokenSource;

        private IShellView _view;

        #endregion

        #region Properties

        #region Cursor

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
                RaisePropertyChanged();
            }
        }

        #endregion

        #region Title
        
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
                RaisePropertyChanged();
            }
        }

        #endregion

        #region LOEDMPrevious

        /// <summary>
        /// The <see cref="LOEDMPrevious" /> property's name.
        /// </summary>
        public const string LOEDMPreviousPropertyName = "LOEDMPrevious";

        private string _loedmPrevious = string.Empty;

        /// <summary>
        /// Sets and gets the LOEDMPrevious property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public string LOEDMPrevious
        {
            get
            {
                return _loedmPrevious;
            }

            set
            {
                if (_loedmPrevious == value)
                {
                    return;
                }

                _loedmPrevious = value;
                RaisePropertyChanged();
            }
        }

        #endregion

        #region LOEDMCurrent

        /// <summary>
        /// The <see cref="LOEDMCurrent" /> property's name.
        /// </summary>
        public const string LOEDMCurrentPropertyName = "LOEDMCurrent";

        private string _loedmCurrent = string.Empty;

        /// <summary>
        /// Sets and gets the LOEDMCurrent property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public string LOEDMCurrent
        {
            get
            {
                return _loedmCurrent;
            }

            set
            {
                if (_loedmCurrent == value)
                {
                    return;
                }

                _loedmCurrent = value;
                RaisePropertyChanged();
            }
        } 

        #endregion

        #region Enabled

        string EnabledPropertyName = "IsEnabled";

        private bool _isEnabled = true;

        /// <summary>
        /// Sets and gets the Enabled property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public bool IsEnabled
        {
            get
            {
                return _isEnabled;
            }

            set
            {
                if (_isEnabled == value)
                {
                    return;
                }

                _isEnabled = value;
                RaisePropertyChanged();
            }
        }

        #endregion

        #region Progress

        #region ProgressLabel

        private string _progressLabel = string.Empty;

        /// <summary>
        /// Sets and gets the ProgressLabel property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public string ProgressLabel
        {
            get
            {
                return _progressLabel;
            }

            set
            {
                if (_progressLabel == value)
                {
                    return;
                }

                _progressLabel = value;
                RaisePropertyChanged();
            }
        }

        #endregion

        #region ProgressValue

        private int _progressValue = 0;

        /// <summary>
        /// Sets and gets the ProgressValue property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public int ProgressValue
        {
            get
            {
                return _progressValue;
            }

            set
            {
                if (_progressValue == value)
                {
                    return;
                }

                _progressValue = value;
                RaisePropertyChanged();
            }
        }

        #endregion

        #region IsProcessing

        private bool _isProcessing = false;

        /// <summary>
        /// Sets and gets the Isprocessing property.
        /// Changes to that property's value raise the PropertyChanged event. 
        /// </summary>
        public bool IsProcessing
        {
            get
            {
                return _isProcessing;
            }

            set
            {
                if (_isProcessing == value)
                {
                    return;
                }

                _isProcessing = value;
                RaisePropertyChanged();
            }
        }

        #endregion

        #endregion

        #endregion

        #region Constructor

        /// <summary>
        /// Initializes a new instance of the ShellViewModel class.
        /// </summary>
        public ShellViewModel(IShellView view)
        {
            _view = view;

            Title = "Pratt & Whitney Canada - LOEDM Update tool";

            Application.Current.MainWindow.Closing += new CancelEventHandler(MainWindowClosing);
        }

        #endregion

        #region Commands
        
        #region BrowseCommand

        /// <summary>
        /// Browse folder command
        /// </summary>
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

        /// <summary>
        /// Browse command delegate
        /// </summary>
        /// <param name="arg">Command argument</param>
        private void ExecuteBrowseCommand(string arg)
        {
            if (!BrowseCommand.CanExecute(arg))
            {
                return;
            }

            switch (arg)
            {
                case LOEDMPreviousPropertyName:
                    var resultLOEDMPrevious = BrowseFile(LOEDMPrevious, "*.xml", "DMC-*-00S*");
                    if (resultLOEDMPrevious.Length > 0) LOEDMPrevious = resultLOEDMPrevious;
                    break;
                case LOEDMCurrentPropertyName:
                    var resultLOEDMCurrent = BrowseFile(LOEDMCurrent, "*.xml", "DMC-*-00S*");
                    if (resultLOEDMCurrent.Length > 0) LOEDMCurrent = resultLOEDMCurrent;
                    break;
            }
        }

        /// <summary>
        /// Checks if the browse command delegate can be executed
        /// </summary>
        /// <param name="arg">command argument</param>
        /// <returns>true is the delegate can be executed, false otherwise</returns>
        private bool CanExecuteBrowseCommand(string arg)
        {
            return true;
        }

        #endregion
        
        #region UpdateCommand

        /// <summary>
        /// Publish data command
        /// </summary>
        private RelayCommand _updateCommand;

        /// <summary>
        /// Gets the PublishCommand.
        /// </summary>
        public RelayCommand UpdateCommand
        {
            get
            {
                return _updateCommand ?? (_updateCommand = new RelayCommand(
                    ExecuteUpdateCommand,
                    CanExecuteUpdateCommand));
            }
        }

        /// <summary>
        /// Publish data command delegate
        /// </summary>
        private void ExecuteUpdateCommand()
        {
            if (!UpdateCommand.CanExecute(null))
            {
                return;
            }

            Update();
        }

        /// <summary>
        /// Checks if the publish command delegate can be executed
        /// </summary>
        /// <returns>True if the command can be executer, false otherwise</returns>
        private bool CanExecuteUpdateCommand()
        {
            return (_updateTask == null || _updateTask.IsCompleted) &&
                File.Exists(LOEDMPrevious) && File.Exists(LOEDMCurrent) && 
                !string.Equals(LOEDMPrevious, LOEDMCurrent, StringComparison.InvariantCultureIgnoreCase);
        }

        #endregion

        #region CancelCommand

        /// <summary>
        /// Cancel command
        /// </summary>
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

        /// <summary>
        /// Cancel command delegate
        /// </summary>
        private void ExecuteCancelCommand()
        {
            if (!CancelCommand.CanExecute(null))
            {
                return;
            }

            if (_updateTask != null && !_updateTask.IsCompleted && _tokenSource != null)
            {
                _tokenSource.Cancel();
            }
        }

        /// <summary>
        /// Checks if the cancel command delegate can be executed
        /// </summary>
        /// <returns>True if the command can be executer, false otherwise</returns>
        private bool CanExecuteCancelCommand()
        {
            return _updateTask != null && !_updateTask.IsCompleted;
        }

        #endregion
        
        #endregion

        #region Events

        /// <summary>
        /// Window closing event handler
        /// </summary>
        /// <param name="sender">The event sender</param>
        /// <param name="e">The event arguments</param>
        private void MainWindowClosing(object sender, CancelEventArgs e)
        {
            e.Cancel = (_updateTask != null && !_updateTask.IsCompleted);
        }

        /// <summary>
        /// Progress event handler
        /// </summary>
        /// <param name="p">Progress arguments</param>
        private void OnProgressChanged(Amplexor.PWC.Tools.LOEDM.ProgressChangedEventArgs e)
        {
            ProgressLabel = e.Status;
            ProgressValue = e.ProgressPourcentage;
        }

        #endregion

        #region Methods
        
        /// <summary>
        /// Initialize a file browser
        /// </summary>
        /// <param name="initialFile">The initial file to use as a starting point for the browsing</param>
        /// <param name="filter">Filter for the file to display in the browser</param>
        /// <returns>The file selected by the user</returns>
        private string BrowseFile(string initialFile, string filter, string fileName)
        {
            var dlg = new OpenFileDialog();
            if (Directory.Exists(initialFile)) dlg.InitialDirectory = initialFile;
            else if (File.Exists(initialFile)) dlg.InitialDirectory = Directory.GetParent(initialFile).FullName;
            dlg.DefaultExt = filter;
            dlg.FileName = fileName;
            dlg.Filter = "Documents (" + filter + ")|" + filter;
            return (dlg.ShowDialog() == true) ? dlg.FileName : string.Empty;
        }
        
        private void Update()
        {
            // Indicate that the application is processing the publication of a package
            IsProcessing = true;

            // Disable the controls.
            IsEnabled = false;
            ShellCursor = Cursors.Wait;
            
            // Progress monitoring
            var progress = new Progress<ProgressChangedEventArgs>(OnProgressChanged);

            // Cancellation token, used to interrupt the publication process
            _tokenSource = new CancellationTokenSource();
            var cancellationToken = _tokenSource.Token;

            // Run the publication process
            _updateTask = Task.Run(() => LOEDMHelper.Instance.UpdateLOEDMDMStatus(LOEDMPrevious, LOEDMCurrent, progress, cancellationToken), cancellationToken);

            // Handles the publication process result
            _updateTask.ContinueWith((task) =>
            {
                IsProcessing = false;
                IsEnabled = true;
                ShellCursor = Cursors.Arrow;

                if (task.Exception != null)
                {
                    _view.ShowDialogAsync(new DialogMessage { Title = "Exception", Message = task.Exception.InnerException.Message });
                    _logger.Error(task.Exception.Message, task.Exception);
                }
                else if (task.IsCanceled)
                {
                    _view.ShowDialogAsync(new DialogMessage { Title = "Cancelled", Message = "LOEDM update was cancelled." });
                    _logger.Debug("LOEDM update was cancelled.");
                }
                else
                {
                    _view.ShowDialogAsync(new DialogMessage { Title = "Success", Message = "LOEDM update was successful." });
                    _logger.Debug("LOEDM update was successfull.");
                }
            }, TaskScheduler.FromCurrentSynchronizationContext());
        }

        #endregion
    }
}
