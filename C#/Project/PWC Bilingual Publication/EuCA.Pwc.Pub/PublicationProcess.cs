using log4net;
using System;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;

namespace EuCA.Pwc.Pub
{
    public class PublicationManager
    {
        #region Members

        private static readonly ILog _logger = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        #endregion

        #region Singleton

        // static holder for instance, need to use lambda to construct since constructor private
        private static readonly Lazy<PublicationManager> _instance
            = new Lazy<PublicationManager>(() => new PublicationManager());

        // private to prevent direct instantiation.
        private PublicationManager() { }

        // accessor for instance
        public static PublicationManager Instance { get { return _instance.Value; } }

        #endregion

        #region Methods

        /// <summary>
        /// Main processing method.
        /// Procedural treatment of a bilingual publication
        /// </summary>
        /// <param name="parameters">Parameters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        public void Run(ProcessParameters parameters, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            progress.Report(new ProgressEventArgs { Message = "Starting publication", Value = 0 });

            // Check for cancellation 
            cancellationToken.ThrowIfCancellationRequested();

            // α. Copy source files to local temp directory
            progress.Report(new ProgressEventArgs { Message = "Copying source data", Value = 0 });
            _logger.Debug("Copy source files to local temp directory");
            CopyDataToWorkDir(parameters, progress, cancellationToken);

            // 1. Extract languages
            progress.Report(new ProgressEventArgs { Message = "Extracting language from source", Value = 0 });
            _logger.Debug("Extract language from source file");
            ExtractLanguageSource(parameters, progress, cancellationToken);

            progress.Report(new ProgressEventArgs { Message = "Extracting language from translated", Value = 1 });
            _logger.Debug("Extract language from translated file");
            ExtractLanguageTranslation(parameters, progress, cancellationToken);

            // 2. Pre-process XML
            progress.Report(new ProgressEventArgs { Message = "Pre-processing source XML", Value = 1 });
            _logger.Debug("Preprocess XML source file");
            PreprocessSource(parameters, progress, cancellationToken);

            progress.Report(new ProgressEventArgs { Message = "Pre-processing translation XML", Value = 2 });
            _logger.Debug("Preprocess XML translated file");
            PreprocessTranslation(parameters, progress, cancellationToken);
            
            // 3a. Generate source HTML files
            progress.Report(new ProgressEventArgs { Message = "Generating source HTML", Value = 2 });
            _logger.Debug("Generating source HTML files");
            GenerateSourceHtml(parameters, progress, cancellationToken);

            // 3b. Generate translated HTML files
            progress.Report(new ProgressEventArgs { Message = "Generating translation HTML", Value = 27 });
            _logger.Debug("Generating translated HTML files");
            GenerateTranslationHtml(parameters, progress, cancellationToken);

            // 4. Merge HTML files
            progress.Report(new ProgressEventArgs { Message = "Merging HTML files", Value = 50 });
            _logger.Debug("Merging HTML files");
            MergeHtmlFiles(parameters, progress, cancellationToken);
            
            // 5.a. Process meta data for banner
            progress.Report(new ProgressEventArgs { Message = "Processing metadata (banner)", Value = 95 });
            _logger.Debug("Processing meta data for banner");
            ProcessMetadata(parameters, progress, cancellationToken);

            // 5.b. Process TOC
            progress.Report(new ProgressEventArgs { Message = "Processing TOC", Value = 96 });
            _logger.Debug("Processing TOC");
            ProcessToc(parameters, progress, cancellationToken);

            // 6. Prepare package
            progress.Report(new ProgressEventArgs { Message = "Preparing package", Value = 97 });
            _logger.Debug("Preparing package");
            PreparePackage(parameters, progress, cancellationToken);

            // 7. Copy graphics
            progress.Report(new ProgressEventArgs { Message = "Copying graphics", Value = 98 });
            _logger.Debug("Copying graphics");
            CopyGraphics(parameters, progress, cancellationToken);

            // 8. Copy package to output directory
            progress.Report(new ProgressEventArgs { Message = "Copying package", Value = 99 });
            _logger.Debug("Copying package to output directory");
            CopyPackageToOutDir(parameters, progress, cancellationToken);

            // 9. Delete temporary files and directories
            if (parameters.DeleteTempFile)
            {
                progress.Report(new ProgressEventArgs { Message = "Deleting temporary files", Value = 99 });
                _logger.Debug("Deleting temporary files");
                DeleteTemp(parameters, progress, cancellationToken);
            }

            progress.Report(new ProgressEventArgs { Message = "Publicaton process end.", Value = 100 });
        }

        /// <summary>
        /// Copy source data to a local folder, to avoid UNC problems with saxon
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void CopyDataToWorkDir(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            if (!Directory.Exists(p.WorkDir)) {
                throw new DirectoryNotFoundException("Working directory not found: " + p.WorkDir);
            }

            File.Copy(p.FileOrig, new Uri(p.TempFileOrig).LocalPath);
            File.Copy(p.FileTrad, new Uri(p.TempFileTrad).LocalPath);
        }

        /// <summary>
        /// Retrieve the language of the XML source file
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void ExtractLanguageSource(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var outputPath = 
                new Uri(Path.Combine(Path.GetDirectoryName(p.TempFileOrig), Path.GetFileNameWithoutExtension(p.TempFileOrig)) + ".txt").LocalPath;

            var cmd =
                "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Query " +
                "-o:\"" + outputPath + "\" " +
                "-qs:doc('" + p.TempFileOrig.Replace(@"\", "/") + "')//book/@lang/string() !method=text";

            RunProcess(cmd);
        }

        /// <summary>
        /// Retrieve the language of the XML translation file
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void ExtractLanguageTranslation(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var outputPath =
                new Uri(Path.Combine(Path.GetDirectoryName(p.TempFileTrad), Path.GetFileNameWithoutExtension(p.TempFileTrad)) + ".txt").LocalPath;

            var cmd =
               "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Query " +
               "-o:\"" + outputPath + "\" " +
               "-qs:doc('" + p.TempFileTrad.Replace(@"\", "/") + "')//book/@lang/string() !method=text ";

            RunProcess(cmd);
        }

        /// <summary>
        /// Pre-process of the XML source file
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void PreprocessSource(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            Directory.CreateDirectory(p.DirOrig);

            var cmd =
                "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform " +
                "-s:\"" + p.TempFileOrig + "\" " +
                "-xsl:\"" + p.DirXslBil + "\\preprocess.xsl\" " +
                "-o:\"" + Path.Combine(p.DirOrig, Path.GetFileNameWithoutExtension(p.TempFileOrig) + "_2.xml") + "\"";

            RunProcess(cmd);
        }

        /// <summary>
        /// Pre-process of the XML translation file
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void PreprocessTranslation(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            Directory.CreateDirectory(p.DirTrad);

            var cmd =
               "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform " +
               "-s:\"" + p.TempFileTrad + "\" " +
               "-xsl:\"" + p.DirXslBil + "\\preprocess.xsl\" " +
               "-o:\"" + Path.Combine(p.DirTrad, Path.GetFileNameWithoutExtension(p.TempFileTrad) + "_2.xml") + "\"";

            RunProcess(cmd);
        }

        /// <summary>
        /// Generate the HTMl for the source file
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void GenerateSourceHtml(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var cmd =
                "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform " +
                "-s:\"" + Path.Combine(p.DirOrig, Path.GetFileNameWithoutExtension(p.TempFileOrig) + "_2.xml") + "\" " +
                "-xsl:\"" + p.DirXsl + "\\jmtosmigrate.xsl\" " +
                "-o:\"" + Path.GetFileNameWithoutExtension(p.TempFileOrig) + ".html\" " +
                "output-dir=\"" + new Uri(p.DirOrig).AbsoluteUri  + "\"";

            RunProcess(cmd);

            File.Delete(Path.Combine(Environment.CurrentDirectory, Path.GetFileNameWithoutExtension(p.TempFileOrig) + ".html"));
            File.Delete(Path.Combine(p.DirOrig, Path.GetFileNameWithoutExtension(p.TempFileOrig) + "_2.xml"));
        }

        /// <summary>
        /// Generate the HTMl for the translation file
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void GenerateTranslationHtml(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var cmd =
               "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform " +
               "-s:\"" + Path.Combine(p.DirTrad, Path.GetFileNameWithoutExtension(p.TempFileTrad) + "_2.xml") + "\" " +
               "-xsl:\"" + p.DirXsl + "\\jmtosmigrate.xsl\" " +
               "-o:\"" + Path.GetFileNameWithoutExtension(p.TempFileTrad) + ".html\" " +
               "output-dir=\"" + new Uri(p.DirTrad).AbsoluteUri + "\"";

            RunProcess(cmd);

            File.Delete(Path.Combine(Environment.CurrentDirectory, Path.GetFileNameWithoutExtension(p.TempFileTrad) + ".html"));
            File.Delete(Path.Combine(p.DirTrad, Path.GetFileNameWithoutExtension(p.TempFileTrad) + "_2.xml"));
        }

        /// <summary>
        /// Merge the HTMl from the source and translation
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void MergeHtmlFiles(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            Directory.CreateDirectory(p.DirTradIds);
            Directory.CreateDirectory(p.DirTradMerge);
            Directory.CreateDirectory(p.DirPackage);
            Directory.CreateDirectory(p.DirPackageContent);
            var fileTmp = Path.Combine(p.DirTradIds, "tmp.xml");

            // For all the files contained in the Pages folder of original data
            var files = Directory.EnumerateFiles(p.DirOrigPages, "*.html").ToList();
            var nbFiles = files.Count;
            var cpt = 0;
            foreach (var file in files)
            {
                cancellationToken.ThrowIfCancellationRequested();

                var fileName = Path.GetFileName(file); // Name of the file being processed
                var fileIds = Path.Combine(p.DirTradIds, fileName); // Output file path of the transformation
                progress.Report(new ProgressEventArgs { Message = "Merging: " + fileName, Value = (int)(50 + cpt / nbFiles * 100 * 45) });
                if (!File.Exists(Path.Combine(p.DirTradPages, fileName))) // All the file that do no exist in the translated data (no need to merge)
                {
                    _logger.Debug(Path.GetFileNameWithoutExtension(file) + ": english only");
                    // Copy the file to the IDS directory
                    File.Copy(file, fileIds, true);

                    RemoveNamespaces(fileIds, p.DirXslBil, p.DirTrad, cancellationToken);

                    // "Title page" processing
                    var cmd =
                      "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
                      " -s:\"" + fileIds + "\"" +
                      " -xsl:\"" + p.DirXslBil + "\\bil_title-page.xsl\"" +
                      " -o:\"" + Path.Combine(p.DirPackageContent, fileName) + "\"" +
                      " lang-orig=\"" + p.LangOrig + "\" lang-trad=\"" + p.LangTrad + "\"";
                    RunProcess(cmd);
                }
                else // File exists for english and chinese
                {
                    _logger.Debug(Path.GetFileNameWithoutExtension(file) + ": both language");

                    var fileTradIds = Path.Combine(p.DirTradIds, Path.GetFileNameWithoutExtension(fileName) + ".zh.html");
                    var fileOrigIds = Path.Combine(p.DirTradIds, Path.GetFileNameWithoutExtension(fileName) + ".en.html");

                    // Copy translated files and add language to the filename
                    File.Copy(Path.Combine(p.DirTradPages, fileName), fileTradIds, true);

                    RemoveNamespaces(fileTradIds, p.DirXslBil, p.DirTrad, cancellationToken);
                    // Copy original files and add language to the filename
                    File.Copy(Path.Combine(p.DirOrigPages, fileName), fileOrigIds, true);

                    RemoveNamespaces(fileOrigIds, p.DirXslBil, p.DirTrad, cancellationToken);

                    _logger.Debug(Path.GetFileNameWithoutExtension(file) + ": set ids");

                    // Set the ids of the translated data
                    var cmd =
                       "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform -dtd:off" +
                       " -s:\"" + fileTradIds + "\"" +
                       " -xsl:\"" + p.DirXslBil + "\\bil_set_ids.xsl\"" +
                       " -o:\"" + fileIds + "\"" +
                       " src-doc-path=\"" + new Uri(fileOrigIds).AbsoluteUri + "\"";
                    RunProcess(cmd);

                    _logger.Debug(Path.GetFileNameWithoutExtension(file) + ": merging");

                    // Display content as tables
                    cmd =
                      "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
                      " -s:\"" + fileIds + "\"" +
                      " -xsl:\"" + p.DirXslBil + "\\bil_merge.xsl\"" +
                      " -o:\"" + Path.Combine(p.DirTradMerge, fileName) + "\"";
                    RunProcess(cmd);
                }
                cpt++;
            }
         }

        /// <summary>
        /// Process the metadata of the data
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void ProcessMetadata(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var fileMeta = Path.Combine(p.DirOrigXml, "Metadata.xml");
            RemoveNamespaces(fileMeta, p.DirXslBil, p.DirTrad, cancellationToken);

            var cmd =
                "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
                " -s:\"" + fileMeta + "\"" +
                " -xsl:\"" + p.DirXslBil + "\\bil_mtdt.xsl\"" +
                " -o:\"" + Path.Combine(p.DirPackageContent, "metadata.html") + "\"" +
                " lang-orig=" + p.LangOrig + " lang-trad=" + p.LangTrad;
            RunProcess(cmd);
        }

        /// <summary>
        /// Process the Table Of Content of the data
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void ProcessToc(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var fileToc = Path.Combine(p.DirOrigXml, "Structure.xml");
            var cmd =
                "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
                " -s:\"" + fileToc + "\"" +
                " -xsl:\"" + p.DirXslBil + "\\bil_toc.xsl\"" +
                " -o:\"" + Path.Combine(p.DirPackageContent, "index.html") + "\"";
            RunProcess(cmd);
        }

        /// <summary>
        /// Prepare the output package
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void PreparePackage(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            DeepCopy(new DirectoryInfo(Path.Combine(Environment.CurrentDirectory, ConfigurationManager.AppSettings["pwc_lib_bil"])), new DirectoryInfo(p.DirPackageContent));
            if (File.Exists(Path.Combine(p.DirPackage, "launch.exe"))) File.Delete(Path.Combine(p.DirPackage, "launch.exe"));
            File.Move(Path.Combine(p.DirPackageContent, "launch.exe"), Path.Combine(p.DirPackage, "launch.exe"));

            Directory
                .EnumerateFiles(p.DirTradMerge, "*.html")
                .ToList()
                .ForEach(file => File.Copy(file, Path.Combine(p.DirPackageContent, Path.GetFileName(file)), true));
        }

        /// <summary>
        /// Copies the graphic from the source to the output package
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void CopyGraphics(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();
            var dirGraphics = Path.Combine(Directory.GetParent(new Uri(p.FileOrig).LocalPath).FullName, "graphics");
            if (!Directory.Exists(dirGraphics)) return;

            Directory.CreateDirectory(p.DirGraphics);

            Directory
                .EnumerateFiles(dirGraphics, "*.*", SearchOption.AllDirectories)
                .ToList()
                .ForEach(file => {
                    _logger.Debug(Path.GetFileName(file) + ": copying");
                    File.Copy(file, Path.Combine(p.DirGraphics, Path.GetFileName(file)), true);
                });
        }

        /// <summary>
        /// Copies the output package to the output directory
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void CopyPackageToOutDir(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();
            
            DeepCopy(new DirectoryInfo(p.DirPackage), new DirectoryInfo(Path.Combine(p.DirOut, new DirectoryInfo(p.DirPackage).Name)));
        }

        /// <summary>
        /// Delete temporary files
        /// </summary>
        /// <param name="p">Paramters of the publication</param>
        /// <param name="progress">Progress notifier</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void DeleteTemp(ProcessParameters p, IProgress<ProgressEventArgs> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();
            
            var di = new DirectoryInfo(p.WorkDir);

            foreach (var file in di.GetFiles())
            {
                file.Delete();
            }

            foreach (var dir in di.GetDirectories())
            {
                dir.Delete(true);
            }
        }
        
        /// <summary>
        /// Copies a folder and its content, including its subdirectories and their content to a new directory
        /// </summary>
        /// <param name="source">Source directory</param>
        /// <param name="target">Target directory</param>
        private void DeepCopy(DirectoryInfo source, DirectoryInfo target)
        {
            source.EnumerateDirectories().ToList().ForEach(dir => DeepCopy(dir, target.CreateSubdirectory(dir.Name)));
            source.EnumerateFiles().ToList().ForEach(file => file.CopyTo(Path.Combine(target.FullName, file.Name), true));
        }

        /// <summary>
        /// Removes namespace declaration from and XML file
        /// </summary>
        /// <param name="file">The file to process</param>
        /// <param name="dirXsl">The path to the XSL file that will remvoe the namespaces</param>
        /// <param name="dirTmp">A temporary working directory</param>
        /// <param name="cancellationToken">Cancellation token for the thread</param>
        private void RemoveNamespaces(string file, string dirXsl, string dirTmp, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            _logger.Debug(Path.GetFileNameWithoutExtension(file) + ": removing namespace");

            // Temporary file path
            var fileTmp = Path.Combine(dirTmp, "tmp.xml");

            // Removes the 2 first lines of the fine containing the HTML DOCTYPE declaration
            var lines = File.ReadAllLines(file).ToList().Where(line => !line.Contains("DOCTYPE") && !line.Contains("xhtml1-strict") && !string.IsNullOrEmpty(line));
            File.WriteAllLines(file, lines);

            // Remove namespaces + add xml declaration
            var cmd =
               "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
               " -s:\"" + file + "\"" +
               " -xsl:\"" + dirXsl + "\\bil_del_ns.xsl\"" +
               " -o:\"" + fileTmp + "\"";
            RunProcess(cmd);
            File.Copy(fileTmp, file, true);
            File.Delete(fileTmp);
        }

        /// <summary>
        /// Runs a command in another thread
        /// </summary>
        /// <param name="command">The command to run</param>
        /// <param name="fileName">The executable to use for the command</param>
        /// <returns>The standard output of the command</returns>
        private string RunProcess(string command, string fileName = "cmd.exe") 
        {
            // Log the command
            _logger.Debug(command);

             // Creates a new ProcessStartInfo with the command
            var processStartInfo = new ProcessStartInfo(fileName, command);
            // Forces some settings in the start info so we can capture the output
            processStartInfo.UseShellExecute = false;
            processStartInfo.RedirectStandardOutput = true;
            processStartInfo.RedirectStandardError = true;
            processStartInfo.WindowStyle = ProcessWindowStyle.Hidden;
            processStartInfo.CreateNoWindow = true;
            // Create a new process
            var process = new Process
            {
                StartInfo = processStartInfo, // Process Start Info
                EnableRaisingEvents = true // Enable proces to raise events (allow us to read the outputs)
            };

            process.Start();
            process.WaitForExit();

            if (process.ExitCode != 0)
                throw new InvalidOperationException(process.StandardError.ReadToEnd());

            return process.StandardOutput.ReadToEnd();
        }

        #endregion
    }
}
