using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SapiensTranslator
{
    public partial class Loading : Form
    {
        Traitements traitements = new Traitements();

        public string? Action { get; set; }
        public string? SourcePath { get; set; }

        public Loading()
        {
            try
            {
                InitializeComponent();
                RunProcessInBackground();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void RunProcessInBackground()
        {
            try
            {
                BackgroundWorker worker = new BackgroundWorker();
                worker.WorkerReportsProgress = true;  // On avtive le suivi de progression afin d'intercepter les retours de ReportProgress
                worker.DoWork += Worker_DoWork;  // On déclare la méthode du boulot a faire
                worker.ProgressChanged += Worker_ProgressChanged; // On déclare la méthode des actions a mener à fonction du retour de ReportProgress
                worker.RunWorkerCompleted += Worker_Completed; // On déclare la méthode qui va s'éxécuter une fois le thread terminé
                                                               //worker.RunWorkerAsync(new object[] { sourcePath, actions }); // On lance le thread en mode asynchrone
                worker.RunWorkerAsync(); // On lance le thread en mode asynchrone
            }
            catch (Exception)
            {
                throw;
            }

        }
        private void Worker_DoWork(object? sender, DoWorkEventArgs e)
        {

            try
            {
                if ((Action != null) && (SourcePath != null) && (sender != null))
                {
                    switch (Action)
                    {
                        case "importActionOriginal":
                            traitements.ImportFileOriginal(SourcePath, sender);
                            break;
                        case "ExportLocalizationsFile":
                            traitements.ExportFiles(sender);
                            break;
                        case "ExportKeyboardFile":
                            traitements.ExportFiles(sender,true);
                            break;
                        case "importActionTranslate":
                            traitements.ImportFileTranslate(SourcePath, sender);
                            break;
                    }
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning ! ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /*
 * Traite le retour de ReportProgress 
 */
        private void Worker_ProgressChanged(object? sender, ProgressChangedEventArgs e)
        {
            prgsBarImport.Value = e.ProgressPercentage;
            //Si progress = 100 % on a terminé et on l'affiche Sinon c'est que l'on vient de relancer une étape ou que le job est en cour
        }
        /*
         * Lance les traitements lorsque le Thread est terminé.
         */
        private void Worker_Completed(object? sender, RunWorkerCompletedEventArgs e)
        {
            MessageBox.Show("Completed.", "Finished ! ", MessageBoxButtons.OK, MessageBoxIcon.None);
            Close();
        }
    }
}
