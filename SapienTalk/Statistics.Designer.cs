namespace SapiensTranslator
{
    partial class frmStatistics
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lblRowBDD = new Label();
            lblCountBdd = new Label();
            lblTranslated = new Label();
            lblCountTranslated = new Label();
            lblUntranslated = new Label();
            lblCountUntranslated = new Label();
            button1 = new Button();
            lblCountLocalizations = new Label();
            lblLocalizations = new Label();
            lblCountFunctions = new Label();
            lblFunctions = new Label();
            SuspendLayout();
            // 
            // lblRowBDD
            // 
            lblRowBDD.AutoSize = true;
            lblRowBDD.Location = new Point(15, 21);
            lblRowBDD.Name = "lblRowBDD";
            lblRowBDD.Size = new Size(139, 15);
            lblRowBDD.TabIndex = 0;
            lblRowBDD.Text = "Row Count in Database : ";
            // 
            // lblCountBdd
            // 
            lblCountBdd.AutoSize = true;
            lblCountBdd.Location = new Point(274, 21);
            lblCountBdd.Name = "lblCountBdd";
            lblCountBdd.Size = new Size(31, 15);
            lblCountBdd.TabIndex = 1;
            lblCountBdd.Text = "9999";
            // 
            // lblTranslated
            // 
            lblTranslated.AutoSize = true;
            lblTranslated.Location = new Point(15, 36);
            lblTranslated.Name = "lblTranslated";
            lblTranslated.Size = new Size(225, 15);
            lblTranslated.TabIndex = 0;
            lblTranslated.Text = "Number of Translated Rows in Database : ";
            // 
            // lblCountTranslated
            // 
            lblCountTranslated.AutoSize = true;
            lblCountTranslated.Location = new Point(274, 36);
            lblCountTranslated.Name = "lblCountTranslated";
            lblCountTranslated.Size = new Size(31, 15);
            lblCountTranslated.TabIndex = 1;
            lblCountTranslated.Text = "9999";
            // 
            // lblUntranslated
            // 
            lblUntranslated.AutoSize = true;
            lblUntranslated.Location = new Point(15, 51);
            lblUntranslated.Name = "lblUntranslated";
            lblUntranslated.Size = new Size(239, 15);
            lblUntranslated.TabIndex = 0;
            lblUntranslated.Text = "Number of Untranslated Rows in Database : ";
            // 
            // lblCountUntranslated
            // 
            lblCountUntranslated.AutoSize = true;
            lblCountUntranslated.Location = new Point(274, 51);
            lblCountUntranslated.Name = "lblCountUntranslated";
            lblCountUntranslated.Size = new Size(31, 15);
            lblCountUntranslated.TabIndex = 1;
            lblCountUntranslated.Text = "9999";
            // 
            // button1
            // 
            button1.Location = new Point(138, 108);
            button1.Name = "button1";
            button1.Size = new Size(75, 23);
            button1.TabIndex = 2;
            button1.Text = "Close";
            button1.UseVisualStyleBackColor = true;
            button1.Click += button1_Click;
            // 
            // lblCountLocalizations
            // 
            lblCountLocalizations.AutoSize = true;
            lblCountLocalizations.Location = new Point(274, 66);
            lblCountLocalizations.Name = "lblCountLocalizations";
            lblCountLocalizations.Size = new Size(31, 15);
            lblCountLocalizations.TabIndex = 4;
            lblCountLocalizations.Text = "9999";
            // 
            // lblLocalizations
            // 
            lblLocalizations.AutoSize = true;
            lblLocalizations.Location = new Point(15, 66);
            lblLocalizations.Name = "lblLocalizations";
            lblLocalizations.Size = new Size(213, 15);
            lblLocalizations.TabIndex = 3;
            lblLocalizations.Text = "Number of uncontrolled Localizations :";
            // 
            // lblCountFunctions
            // 
            lblCountFunctions.AutoSize = true;
            lblCountFunctions.Location = new Point(274, 81);
            lblCountFunctions.Name = "lblCountFunctions";
            lblCountFunctions.Size = new Size(31, 15);
            lblCountFunctions.TabIndex = 6;
            lblCountFunctions.Text = "9999";
            // 
            // lblFunctions
            // 
            lblFunctions.AutoSize = true;
            lblFunctions.Location = new Point(15, 81);
            lblFunctions.Name = "lblFunctions";
            lblFunctions.Size = new Size(197, 15);
            lblFunctions.TabIndex = 5;
            lblFunctions.Text = "Number of uncontrolled Functions :";
            // 
            // frmStatistics
            // 
            AutoScaleMode = AutoScaleMode.Inherit;
            ClientSize = new Size(342, 142);
            Controls.Add(lblCountFunctions);
            Controls.Add(lblFunctions);
            Controls.Add(lblCountLocalizations);
            Controls.Add(lblLocalizations);
            Controls.Add(button1);
            Controls.Add(lblCountUntranslated);
            Controls.Add(lblCountTranslated);
            Controls.Add(lblCountBdd);
            Controls.Add(lblUntranslated);
            Controls.Add(lblTranslated);
            Controls.Add(lblRowBDD);
            FormBorderStyle = FormBorderStyle.Fixed3D;
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "frmStatistics";
            ShowIcon = false;
            ShowInTaskbar = false;
            StartPosition = FormStartPosition.CenterParent;
            Text = "Statistics";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lblRowBDD;
        private Label lblCountBdd;
        private Label lblTranslated;
        private Label lblCountTranslated;
        private Label lblUntranslated;
        private Label lblCountUntranslated;
        private Button button1;
        private Label lblCountLocalizations;
        private Label lblLocalizations;
        private Label lblCountFunctions;
        private Label lblFunctions;
    }
}