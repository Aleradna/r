using System.Diagnostics;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace SapiensTranslator
{
    public partial class Main : Form
    {
        Traitements Traitements = new Traitements();
        // Obtenir le chemin du dossier AppData de l'utilisateur        
        internal string appDataAppliPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "TranslatorLua");
        public Main()
        {
            try
            {
                initializeFolders();
                InitializeComponent();

                if (!Traitements.CheckBdd())
                {
                    //Si la BDD est vide ou inexistante
                    btnTransFunct.Enabled = false;
                    btnTransText.Enabled = false;

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning ! ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void initializeFolders()
        {

            if (!Directory.Exists(Path.Combine(appDataAppliPath, $"data")))
            {
                Directory.CreateDirectory(Path.Combine(appDataAppliPath, $"data"));
            }
            if (!Directory.Exists(Path.Combine(appDataAppliPath, $"data\\sqlites")))
            {
                Directory.CreateDirectory(Path.Combine(appDataAppliPath, $"data\\sqlites"));

            }
            if (!Directory.Exists(Path.Combine(appDataAppliPath, $"data\\output")))
            {
                Directory.CreateDirectory(Path.Combine(appDataAppliPath, $"data\\output"));

            }
            if (!Directory.Exists(Path.Combine(appDataAppliPath, $"data\\sources")))
            {
                Directory.CreateDirectory(Path.Combine(appDataAppliPath, $"data\\sources"));

            }
            if (!File.Exists(Path.Combine(appDataAppliPath, $"data\\sqlites\\bdd.sqlite")))
            {
                // Traitements traitements = new Traitements();
                Traitements.CreateBDD();
            }

        }

        private void quitterMenuItem_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }

        private void importOriginalFile_Click(object sender, EventArgs e)
        {
            try
            {
                string filePath = string.Empty;
                string fileName = string.Empty;
                OpenFileDialog openFileDialog1 = new OpenFileDialog();
                openFileDialog1.InitialDirectory = AppDomain.CurrentDomain.BaseDirectory;
                openFileDialog1.Filter = "LUA files (*.lua)|*.lua";
                openFileDialog1.Title = "Import lua original file";

                DialogResult dialogResult = openFileDialog1.ShowDialog();
                if (dialogResult == DialogResult.OK)
                {
                    filePath = openFileDialog1.FileName;
                    var extensionFile = System.IO.Path.GetExtension(filePath);
                    switch (extensionFile)
                    {
                        case ".lua":
                            formLoadProgress("importActionOriginal", filePath);
                            break;
                        default:
                            MessageBox.Show("Only lua files are supported.\r\n Please select a file again.", "File not supported.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            importOriginalFile_Click(sender, e);
                            break;
                    }

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning ! ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void formLoadProgress(string _action, string _filePath = "")
        {
            try
            {
                // Créer une instance du Loader
                Loading loader = new Loading();
                loader.Action = _action;
                loader.SourcePath = _filePath;

                // Obtenir la taille du Forms1
                Size form1Size = Size;
                Point form1Point = Location;

                // Calculer la position pour centrer le Loader
                int posX = (form1Size.Width - loader.Width) / 2;
                int posY = (form1Size.Height - loader.Height) / 2;
                int form1Pos = form1Point.X + posX;
                int form2Pos = form1Point.Y + posY;

                // Définir la position et l'afficher
                loader.StartPosition = FormStartPosition.Manual;
                loader.Location = new Point(form1Pos, form2Pos);
                loader.FormClosed += new FormClosedEventHandler(Loader_FormClosed);
                loader.Show();
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void Loader_FormClosed(object? sender, FormClosedEventArgs e)
        {
            if (Traitements.CheckBdd())
            {
                //Si la BDD existe et qu'elle n'est pas vide
                btnTransFunct.Enabled = true;
                btnTransText.Enabled = true;

            }

        }

        private void importTranslationFileMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                string filePath = string.Empty;
                string fileName = string.Empty;
                OpenFileDialog openFileDialog1 = new OpenFileDialog();
                openFileDialog1.InitialDirectory = AppDomain.CurrentDomain.BaseDirectory;
                openFileDialog1.Filter = "LUA files (*.lua)|*.lua";
                openFileDialog1.Title = "Import lua translate file";

                DialogResult dialogResult = openFileDialog1.ShowDialog();
                if (dialogResult == DialogResult.OK)
                {
                    filePath = openFileDialog1.FileName;
                    var extensionFile = System.IO.Path.GetExtension(filePath);
                    switch (extensionFile)
                    {
                        case ".lua":
                            formLoadProgress("importActionTranslate", filePath);
                            break;
                        default:
                            MessageBox.Show("Only lua files are supported.\r\n Please select a file again.", "File not supported.", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            importOriginalFile_Click(sender, e);
                            break;
                    }

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning ! ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void StatisticsMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                frmStatistics frmStatistics = new frmStatistics();
                // Obtenir la taille du Forms1
                Size form1Size = Size;
                Point form1Point = Location;

                // Calculer la position pour centrer le Loader
                int posX = (form1Size.Width - frmStatistics.Width) / 2;
                int posY = (form1Size.Height - frmStatistics.Height) / 2;
                int form1Pos = form1Point.X + posX;
                int form2Pos = form1Point.Y + posY;

                // Définir la position et l'afficher
                frmStatistics.StartPosition = FormStartPosition.Manual;
                frmStatistics.Location = new Point(form1Pos, form2Pos);
                frmStatistics.ShowDialog();
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning ! ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }


        private void btnTransText_Click(object sender, EventArgs e)
        {
            //Affiche l'éditeur de Texte pour les constantes
            EditorText frmEditor = new EditorText();
            frmEditor.ShowDialog();
        }

        private void btnTransFunct_Click(object sender, EventArgs e)
        {
            //Affiche l'éditeur de Texte pour les functions
            EditorFunct frmEditor = new EditorFunct();
            frmEditor.ShowDialog();
        }

        private void exportLocalizationsFileMenuItem_Click(object sender, EventArgs e)
        {
            //Réalise l'export 
            formLoadProgress("ExportLocalizationsFile");
        }

        private void exportKeyboardFileMenuItem_Click(object sender, EventArgs e)
        {
            //Réalise l'export 
            formLoadProgress("ExportKeyboardFile");
        }

        private void folderDataExportToolStripMenuItem_Click(object sender, EventArgs e)
        {
            try
            {
                // Vérifier si le dossier existe avant d'ouvrir l'Explorateur de fichiers
                if (System.IO.Directory.Exists(appDataAppliPath))
                {
                    // Ouvrir l'Explorateur de fichiers avec le dossier spécifié
                    Process.Start("explorer.exe", appDataAppliPath);
                }
                else
                {
                    Console.WriteLine("Le dossier n'existe pas.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning ! ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}