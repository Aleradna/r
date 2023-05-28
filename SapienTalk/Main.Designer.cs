namespace SapiensTranslator
{
    partial class Main
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Main));
            menuStrip1 = new MenuStrip();
            menuMenuItem = new ToolStripMenuItem();
            importToolStripMenuItem = new ToolStripMenuItem();
            importOriginalFileMenuItem = new ToolStripMenuItem();
            importTranslationFileMenuItem = new ToolStripMenuItem();
            exportToolStripMenuItem = new ToolStripMenuItem();
            exportLocalizationsFileMenuItem = new ToolStripMenuItem();
            exportKeyboardFileMenuItem = new ToolStripMenuItem();
            toolStripSeparator1 = new ToolStripSeparator();
            folderDataExportToolStripMenuItem = new ToolStripMenuItem();
            toolStripSeparator2 = new ToolStripSeparator();
            quitterMenuItem = new ToolStripMenuItem();
            StatisticsMenuItem = new ToolStripMenuItem();
            btnTransText = new Button();
            btnTransFunct = new Button();
            menuStrip1.SuspendLayout();
            SuspendLayout();
            // 
            // menuStrip1
            // 
            menuStrip1.Items.AddRange(new ToolStripItem[] { menuMenuItem, StatisticsMenuItem });
            menuStrip1.Location = new Point(0, 0);
            menuStrip1.Name = "menuStrip1";
            menuStrip1.Size = new Size(166, 24);
            menuStrip1.TabIndex = 0;
            menuStrip1.Text = "menuStrip1";
            // 
            // menuMenuItem
            // 
            menuMenuItem.DropDownItems.AddRange(new ToolStripItem[] { importToolStripMenuItem, exportToolStripMenuItem, toolStripSeparator1, folderDataExportToolStripMenuItem, toolStripSeparator2, quitterMenuItem });
            menuMenuItem.Name = "menuMenuItem";
            menuMenuItem.Size = new Size(50, 20);
            menuMenuItem.Text = "Menu";
            // 
            // importToolStripMenuItem
            // 
            importToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { importOriginalFileMenuItem, importTranslationFileMenuItem });
            importToolStripMenuItem.Name = "importToolStripMenuItem";
            importToolStripMenuItem.Size = new Size(171, 22);
            importToolStripMenuItem.Text = "Import";
            // 
            // importOriginalFileMenuItem
            // 
            importOriginalFileMenuItem.Name = "importOriginalFileMenuItem";
            importOriginalFileMenuItem.Size = new Size(150, 22);
            importOriginalFileMenuItem.Text = "Original file";
            importOriginalFileMenuItem.Click += importOriginalFile_Click;
            // 
            // importTranslationFileMenuItem
            // 
            importTranslationFileMenuItem.Name = "importTranslationFileMenuItem";
            importTranslationFileMenuItem.Size = new Size(150, 22);
            importTranslationFileMenuItem.Text = "Translation file";
            importTranslationFileMenuItem.Click += importTranslationFileMenuItem_Click;
            // 
            // exportToolStripMenuItem
            // 
            exportToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { exportLocalizationsFileMenuItem, exportKeyboardFileMenuItem });
            exportToolStripMenuItem.Name = "exportToolStripMenuItem";
            exportToolStripMenuItem.Size = new Size(171, 22);
            exportToolStripMenuItem.Text = "Export";
            // 
            // exportLocalizationsFileMenuItem
            // 
            exportLocalizationsFileMenuItem.Name = "exportLocalizationsFileMenuItem";
            exportLocalizationsFileMenuItem.Size = new Size(180, 22);
            exportLocalizationsFileMenuItem.Text = "Localizations file";
            exportLocalizationsFileMenuItem.Click += exportLocalizationsFileMenuItem_Click;
            // 
            // exportKeyboardFileMenuItem
            // 
            exportKeyboardFileMenuItem.Name = "exportKeyboardFileMenuItem";
            exportKeyboardFileMenuItem.Size = new Size(180, 22);
            exportKeyboardFileMenuItem.Text = "KeyboardNames file";
            exportKeyboardFileMenuItem.Click += exportKeyboardFileMenuItem_Click;
            // 
            // toolStripSeparator1
            // 
            toolStripSeparator1.Name = "toolStripSeparator1";
            toolStripSeparator1.Size = new Size(168, 6);
            // 
            // folderDataExportToolStripMenuItem
            // 
            folderDataExportToolStripMenuItem.Name = "folderDataExportToolStripMenuItem";
            folderDataExportToolStripMenuItem.Size = new Size(171, 22);
            folderDataExportToolStripMenuItem.Text = "Folder Data Export";
            folderDataExportToolStripMenuItem.Click += folderDataExportToolStripMenuItem_Click;
            // 
            // toolStripSeparator2
            // 
            toolStripSeparator2.Name = "toolStripSeparator2";
            toolStripSeparator2.Size = new Size(168, 6);
            // 
            // quitterMenuItem
            // 
            quitterMenuItem.Name = "quitterMenuItem";
            quitterMenuItem.Size = new Size(171, 22);
            quitterMenuItem.Text = "Quitter";
            quitterMenuItem.Click += quitterMenuItem_Click;
            // 
            // StatisticsMenuItem
            // 
            StatisticsMenuItem.Name = "StatisticsMenuItem";
            StatisticsMenuItem.Size = new Size(65, 20);
            StatisticsMenuItem.Text = "Statistics";
            StatisticsMenuItem.Click += StatisticsMenuItem_Click;
            // 
            // btnTransText
            // 
            btnTransText.Location = new Point(23, 71);
            btnTransText.Name = "btnTransText";
            btnTransText.Size = new Size(120, 24);
            btnTransText.TabIndex = 1;
            btnTransText.Text = "Translate texts";
            btnTransText.UseVisualStyleBackColor = true;
            btnTransText.Click += btnTransText_Click;
            // 
            // btnTransFunct
            // 
            btnTransFunct.Location = new Point(23, 101);
            btnTransFunct.Name = "btnTransFunct";
            btnTransFunct.Size = new Size(120, 24);
            btnTransFunct.TabIndex = 2;
            btnTransFunct.Text = "Translate functions";
            btnTransFunct.UseVisualStyleBackColor = true;
            btnTransFunct.Click += btnTransFunct_Click;
            // 
            // Main
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(166, 169);
            Controls.Add(btnTransFunct);
            Controls.Add(btnTransText);
            Controls.Add(menuStrip1);
            FormBorderStyle = FormBorderStyle.Fixed3D;
            Icon = (Icon)resources.GetObject("$this.Icon");
            MainMenuStrip = menuStrip1;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "Main";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "SapienTalk";
            menuStrip1.ResumeLayout(false);
            menuStrip1.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private MenuStrip menuStrip1;
        private ToolStripMenuItem menuMenuItem;
        private ToolStripSeparator toolStripSeparator1;
        private ToolStripMenuItem quitterMenuItem;
        private ToolStripMenuItem importToolStripMenuItem;
        private ToolStripMenuItem importOriginalFileMenuItem;
        private ToolStripMenuItem importTranslationFileMenuItem;
        private ToolStripMenuItem exportToolStripMenuItem;
        private ToolStripMenuItem exportLocalizationsFileMenuItem;
        private ToolStripMenuItem exportKeyboardFileMenuItem;
        private ToolStripMenuItem StatisticsMenuItem;
        private Button btnTransText;
        private Button btnTransFunct;
        private ToolStripMenuItem folderDataExportToolStripMenuItem;
        private ToolStripSeparator toolStripSeparator2;
    }
}