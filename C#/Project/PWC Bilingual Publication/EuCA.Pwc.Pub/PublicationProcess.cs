using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace EuCA.Pwc.Pub
{
    public class PublicationManager
    {
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

        public void Run(ProcessParameters parameters, IProgress<object> progress, CancellationToken cancellationToken)
        {
            progress.Report("Publication process start.");

            // Check for cancellation 
            cancellationToken.ThrowIfCancellationRequested();

            // 1. Generate source (english) HTML files
            progress.Report("1. Generate source (english) HTML files");
            //GenerateSourceHtml(parameters, progress, cancellationToken);

            // 2. Generate translated HTML files
            progress.Report("2. Generate translated HTML files");
            //GenerateTranslationHtml(parameters, progress, cancellationToken);

            // 3. Merge HTML files
            progress.Report("3. Merge HTML files");
            MergeHtmlFiles(parameters, progress, cancellationToken);

            // 4.a. Process meta data for banner
            progress.Report("4.a. Process meta data for banner");
            ProcessMetadata(parameters, progress, cancellationToken);

            // 4.b. Process TOC
            progress.Report("4.b. Process TOC");
            ProcessToc(parameters, progress, cancellationToken);

            // 5. Prepare package
            progress.Report("5. Prepare package");
            PreparePackage(parameters, progress, cancellationToken);

            // 6. Delete temporary files and directories
            progress.Report("6. Delete temporary files and directories");
            DeleteTemp(parameters, progress, cancellationToken);

            progress.Report("Publicaton process end.");
        }

        private void GenerateSourceHtml(ProcessParameters p, IProgress<object> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var cmd =
                "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform " +
                "-s:\"" + p.FileOrig + "\" " +
                "-xsl:\"" + p.XslDir + "\\XSL\\jmtosmigrate.xsl\" " +
                "-o:" + Path.GetFileNameWithoutExtension(p.FileOrig) + ".html " +
                "output-dir=\"" + new Uri(p.DirOrig).AbsoluteUri  + "\"";

            RunProcess(cmd);
        }

        private void GenerateTranslationHtml(ProcessParameters p, IProgress<object> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var cmd =
               "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform " +
               "-s:\"" + p.FileTrad + "\" " +
               "-xsl:\"" + p.XslDir + "\\XSL\\jmtosmigrate.xsl\" " +
               "-o:" + Path.GetFileNameWithoutExtension(p.FileTrad) + ".html " +
               "output-dir=\"" + new Uri(p.DirTrad).AbsoluteUri + "\"";

            RunProcess(cmd);
        }

        private void MergeHtmlFiles(ProcessParameters p, IProgress<object> progress, CancellationToken cancellationToken)
        {
            Directory.CreateDirectory(p.DirTradIds);
            Directory.CreateDirectory(p.DirTradMerge);
            Directory.CreateDirectory(p.DirTradPackage);
            Directory.CreateDirectory(p.DirTradPackageContent);
            var fileTmp = Path.Combine(p.DirTradIds, "tmp.xml");

            // For all the files contained in the Pages folder of original data
            var files = Directory.EnumerateFiles(p.DirOrigPages, "*.html").ToList();
            foreach (var file in files)
            {
                cancellationToken.ThrowIfCancellationRequested();

                var fileName = Path.GetFileName(file); // Name of the file being processed
                var fileIds = Path.Combine(p.DirTradIds, fileName); // Output file path of the transformation
                if (!File.Exists(Path.Combine(p.DirTradPages, fileName))) // All the file that do no exist in the translated data (no need to merge)
                {
                    // Copy the file to the IDS directory
                    File.Copy(file, fileIds, true);

                    RemoveNamespaces(fileIds, p.XslDir, p.DirTrad, cancellationToken);

                    // "Title page" processing
                    var cmd =
                      "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
                      " -s:\"" + fileIds + "\"" +
                      " -xsl:\"" + p.XslDir + "\\XSL_BIL\\bil_title-page.xsl\"" +
                      " -o:" + Path.Combine(p.DirTradPackageContent, fileName);
                    RunProcess(cmd);
                }
                else // File exists for english and chinese
                {
                    var fileTradIds = Path.Combine(p.DirTradIds, Path.GetFileNameWithoutExtension(fileName) + ".zh.html");
                    var fileOrigIds = Path.Combine(p.DirTradIds, Path.GetFileNameWithoutExtension(fileName) + ".en.html");

                    // Copy translated files and add language to the filename
                    File.Copy(Path.Combine(p.DirTradPages, fileName), fileTradIds, true);

                    RemoveNamespaces(fileTradIds, p.XslDir, p.DirTrad, cancellationToken);
                    // Copy original files and add language to the filename
                    File.Copy(Path.Combine(p.DirOrigPages, fileName), fileOrigIds, true);

                    RemoveNamespaces(fileOrigIds, p.XslDir, p.DirTrad, cancellationToken);

                    // Set the ids of the translated data
                    var cmd =
                       "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform -dtd:off" +
                       " -s:\"" + fileTradIds + "\"" +
                       " -xsl:\"" + p.XslDir + "\\XSL_BIL\\bil_set_ids.xsl\"" +
                       " -o:" + fileIds +
                       " src-doc-path=" + fileOrigIds;
                    RunProcess(cmd);

                    // Display content as tables
                    cmd =
                      "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
                      " -s:\"" + fileIds + "\"" +
                      " -xsl:\"" + p.XslDir + "\\XSL_BIL\\bil_merge.xsl\"" +
                      " -o:" + Path.Combine(p.DirTradMerge, fileName);
                    RunProcess(cmd);
                }
            }
         }

        private void ProcessMetadata(ProcessParameters p, IProgress<object> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var fileMeta = Path.Combine(p.DirOrigXml, "Metadata.xml");
            RemoveNamespaces(fileMeta, p.XslDir, p.DirTrad, cancellationToken);

            var cmd =
                "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
                " -s:\"" + fileMeta + "\"" +
                " -xsl:\"" + p.XslDir + "\\XSL_BIL\\bil_mtdt.xsl\"" +
                " -o:" + Path.Combine(p.DirTradPackageContent, "metadata.html");
            RunProcess(cmd);
        }

        private void ProcessToc(ProcessParameters p, IProgress<object> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var fileToc = Path.Combine(p.DirOrigXml, "Structure.xml");
            var cmd =
                "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
                " -s:\"" + fileToc + "\"" +
                " -xsl:\"" + p.XslDir + "\\XSL_BIL\\bil_toc.xsl\"" +
                " -o:" + Path.Combine(p.DirTradPackageContent, "index.html");
            RunProcess(cmd);
        }

        private void PreparePackage(ProcessParameters p, IProgress<object> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            DeepCopy(new DirectoryInfo(Path.Combine(p.XslDir, "Lib_BIL")), new DirectoryInfo(p.DirTradPackageContent));
            if (File.Exists(Path.Combine(p.DirTradPackage, "launch.exe"))) File.Delete(Path.Combine(p.DirTradPackage, "launch.exe"));
            File.Move(Path.Combine(p.DirTradPackageContent, "launch.exe"), Path.Combine(p.DirTradPackage, "launch.exe"));

            Directory
                .EnumerateFiles(p.DirTradMerge, "*.html")
                .ToList()
                .ForEach(file => File.Copy(file, Path.Combine(p.DirTradPackageContent, Path.GetFileName(file)), true));
        }

        private void DeepCopy(DirectoryInfo source, DirectoryInfo target)
        {
            source.EnumerateDirectories().ToList().ForEach(dir => DeepCopy(dir, target.CreateSubdirectory(dir.Name)));
            source.EnumerateFiles().ToList().ForEach(file => file.CopyTo(Path.Combine(target.FullName, file.Name), true));
        }

        private void DeleteTemp(ProcessParameters p, IProgress<object> progress, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();
        }

        private void RemoveNamespaces(string file, string dirXsl, string dirTmp, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            var fileTmp = Path.Combine(dirTmp, "tmp.xml");

            // Removes the 2 first lines of the fine containing the HTML DOCTYPE declaration
            var lines = File.ReadAllLines(file).ToList().Where(line => !line.Contains("DOCTYPE") && !line.Contains("xhtml1-strict") && !string.IsNullOrEmpty(line));
            File.WriteAllLines(file, lines);

            // Remove namespaces + add xml declaration
            var cmd =
               "/c java -cp \"./lib/java/saxonb9-1-0-8j/saxon9.jar\" net.sf.saxon.Transform" +
               " -s:\"" + file + "\"" +
               " -xsl:\"" + dirXsl + "\\XSL_BIL\\bil_del_ns.xsl\"" +
               " -o:" + fileTmp;
            RunProcess(cmd);
            File.Copy(fileTmp, file, true);
            File.Delete(fileTmp);
        }

        /*private async void XSLTransform(string cmd, IProgress<object> progress, CancellationToken cancellationToken)
        {
            var t = RunProcessAsync(cmd, cancellationToken);

            await t.ContinueWith((task) =>
            {
                if (task.Exception != null)
                {
                    // Throw exception
                }
                else if (task.IsCanceled)
                {

                }
                else
                {

                }
            });
        }
        
        private Task<ProcessResults> RunProcessAsync(string command, CancellationToken cancellationToken)
        {
            // Creates a new ProcessStartInfo with the command
            var processStartInfo = new ProcessStartInfo("cmd.exe", "/c " + command);

            // Forces some settings in the start info so we can capture the output
            processStartInfo.UseShellExecute = false;
            processStartInfo.RedirectStandardOutput = true;
            processStartInfo.RedirectStandardError = true;
            
            // Creates an instance of a TaskCompletionSource
            var tcs = new TaskCompletionSource<ProcessResults>();

            // List that will hold the outputs of the process
            var standardOutput = new List<string>();
            var standardError = new List<string>();

            // Create a new process
            var process = new Process
            {
                StartInfo = processStartInfo, // Process Start Info
                EnableRaisingEvents = true // Enable proces to raise events (allow us to read the outputs)
            };

            // Handles the exit of the process
            process.Exited += (sender, args) =>
            {
                // Handles error
                if (process.ExitCode != 0) tcs.TrySetException(new InvalidOperationException(string.Join("\n", standardError.ToArray())));

                // Set the result
                tcs.TrySetResult(new ProcessResults(process, standardOutput, standardError));

                // Dispose the process
                process.Dispose();
            };

            // Handles the output data
            process.OutputDataReceived  +=  (sender, args)  =>    {  if (args.Data != null) standardOutput.Add(args.Data);    };
            // Handle the error data
            process.ErrorDataReceived   +=  (sender, args)  =>    {  if (args.Data != null) standardError.Add(args.Data);     };

            // Handles the cancellation of the task
            cancellationToken.Register(() =>
            {
                // Try to cancel the task
                tcs.TrySetCanceled();
                // Dispose the process
                process.Dispose();
            });

            cancellationToken.ThrowIfCancellationRequested();

            // Start process
            if (process.Start() == false)  tcs.TrySetException(new InvalidOperationException("Failed to start process"));

            // Begin reading the outputs
            process.BeginOutputReadLine();
            process.BeginErrorReadLine();

            // Return the task
            return tcs.Task;
        }*/

        private string RunProcess(string command, string fileName = "cmd.exe") 
        {
             // Creates a new ProcessStartInfo with the command
            var processStartInfo = new ProcessStartInfo(fileName, command);
            // Forces some settings in the start info so we can capture the output
            processStartInfo.UseShellExecute = false;
            processStartInfo.RedirectStandardOutput = true;
            processStartInfo.RedirectStandardError = true;
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
    /*
    public class ProcessResults
    {
        private readonly Process _process;
        private readonly IEnumerable<string> _standardOutput;
        private readonly IEnumerable<string> _standardError;

        public ProcessResults(Process process, IEnumerable<string> standardOutput, IEnumerable<string> standardError)
        {
            _process = process;
            _standardOutput = standardOutput;
            _standardError = standardError;
        }

        public Process Process
        {
            get { return _process; }
        }

        public IEnumerable<string> StandardOutput
        {
            get { return _standardOutput; }
        }

        public IEnumerable<string> StandardError
        {
            get { return _standardError; }
        }
    }*/
}
