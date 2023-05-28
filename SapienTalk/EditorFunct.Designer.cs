namespace SapiensTranslator
{
    partial class EditorFunct
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
            components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(EditorFunct));
            btnDuplicat = new Button();
            btnSearch = new Button();
            tbxSearch = new TextBox();
            lblSearch = new Label();
            lblCompteur = new Label();
            btnCopyOriginText = new Button();
            btnCopy = new Button();
            lblCategName = new Label();
            lblCateg = new Label();
            tbxTransl = new TextBox();
            tbxOrigin = new TextBox();
            chkChecked = new CheckBox();
            btnEmpty = new Button();
            btnSave = new Button();
            btnNext = new Button();
            btnPrevious = new Button();
            cbxIdConst = new ComboBox();
            toolTip = new ToolTip(components);
            btnNextCheck = new Button();
            SuspendLayout();
            // 
            // btnDuplicat
            // 
            btnDuplicat.Enabled = false;
            btnDuplicat.Image = (Image)resources.GetObject("btnDuplicat.Image");
            btnDuplicat.Location = new Point(440, 160);
            btnDuplicat.Name = "btnDuplicat";
            btnDuplicat.Size = new Size(23, 23);
            btnDuplicat.TabIndex = 24;
            toolTip.SetToolTip(btnDuplicat, "Copy the Original Text");
            btnDuplicat.UseVisualStyleBackColor = true;
            btnDuplicat.Click += btnDuplicat_Click;
            // 
            // btnSearch
            // 
            btnSearch.Enabled = false;
            btnSearch.Image = (Image)resources.GetObject("btnSearch.Image");
            btnSearch.Location = new Point(207, 331);
            btnSearch.Name = "btnSearch";
            btnSearch.Size = new Size(25, 25);
            btnSearch.TabIndex = 29;
            btnSearch.UseVisualStyleBackColor = true;
            btnSearch.Click += btnSearch_Click;
            // 
            // tbxSearch
            // 
            tbxSearch.Enabled = false;
            tbxSearch.Location = new Point(66, 332);
            tbxSearch.Name = "tbxSearch";
            tbxSearch.Size = new Size(135, 23);
            tbxSearch.TabIndex = 28;
            tbxSearch.KeyPress += tbSearch_KeyPress;
            // 
            // lblSearch
            // 
            lblSearch.AutoSize = true;
            lblSearch.Location = new Point(9, 336);
            lblSearch.Name = "lblSearch";
            lblSearch.Size = new Size(51, 15);
            lblSearch.TabIndex = 35;
            lblSearch.Text = "Search : ";
            // 
            // lblCompteur
            // 
            lblCompteur.AutoSize = true;
            lblCompteur.Location = new Point(421, 5);
            lblCompteur.Name = "lblCompteur";
            lblCompteur.Size = new Size(61, 15);
            lblCompteur.TabIndex = 34;
            lblCompteur.Text = "Compteur";
            lblCompteur.TextAlign = ContentAlignment.MiddleRight;
            // 
            // btnCopyOriginText
            // 
            btnCopyOriginText.Enabled = false;
            btnCopyOriginText.Image = (Image)resources.GetObject("btnCopyOriginText.Image");
            btnCopyOriginText.Location = new Point(413, 160);
            btnCopyOriginText.Name = "btnCopyOriginText";
            btnCopyOriginText.Size = new Size(23, 23);
            btnCopyOriginText.TabIndex = 33;
            toolTip.SetToolTip(btnCopyOriginText, "Copy the Original Function to the Clipboard");
            btnCopyOriginText.UseVisualStyleBackColor = true;
            btnCopyOriginText.Click += btnCopyOriginText_Click;
            // 
            // btnCopy
            // 
            btnCopy.Enabled = false;
            btnCopy.Image = (Image)resources.GetObject("btnCopy.Image");
            btnCopy.Location = new Point(68, 34);
            btnCopy.Name = "btnCopy";
            btnCopy.Size = new Size(20, 23);
            btnCopy.TabIndex = 32;
            toolTip.SetToolTip(btnCopy, "Copy the Constant into the Clipboard");
            btnCopy.UseVisualStyleBackColor = true;
            btnCopy.Click += btnCopy_Click;
            // 
            // lblCategName
            // 
            lblCategName.AutoSize = true;
            lblCategName.Location = new Point(85, 5);
            lblCategName.Name = "lblCategName";
            lblCategName.Size = new Size(29, 15);
            lblCategName.TabIndex = 31;
            lblCategName.Text = "Null";
            // 
            // lblCateg
            // 
            lblCateg.AutoSize = true;
            lblCateg.Location = new Point(12, 5);
            lblCateg.Name = "lblCateg";
            lblCateg.Size = new Size(67, 15);
            lblCateg.TabIndex = 30;
            lblCateg.Text = "Categorie : ";
            // 
            // tbxTransl
            // 
            tbxTransl.Enabled = false;
            tbxTransl.Location = new Point(12, 192);
            tbxTransl.Multiline = true;
            tbxTransl.Name = "tbxTransl";
            tbxTransl.ScrollBars = ScrollBars.Vertical;
            tbxTransl.Size = new Size(470, 133);
            tbxTransl.TabIndex = 25;
            // 
            // tbxOrigin
            // 
            tbxOrigin.Location = new Point(12, 62);
            tbxOrigin.Multiline = true;
            tbxOrigin.Name = "tbxOrigin";
            tbxOrigin.ReadOnly = true;
            tbxOrigin.ScrollBars = ScrollBars.Vertical;
            tbxOrigin.Size = new Size(470, 122);
            tbxOrigin.TabIndex = 36;
            // 
            // chkChecked
            // 
            chkChecked.AutoSize = true;
            chkChecked.Enabled = false;
            chkChecked.Location = new Point(305, 334);
            chkChecked.Name = "chkChecked";
            chkChecked.Size = new Size(96, 19);
            chkChecked.TabIndex = 26;
            chkChecked.Text = "Text Checked";
            chkChecked.UseVisualStyleBackColor = true;
            // 
            // btnEmpty
            // 
            btnEmpty.Enabled = false;
            btnEmpty.Location = new Point(432, 33);
            btnEmpty.Name = "btnEmpty";
            btnEmpty.Size = new Size(50, 25);
            btnEmpty.TabIndex = 23;
            btnEmpty.Text = ">>";
            toolTip.SetToolTip(btnEmpty, "Skip to next empty translation !");
            btnEmpty.UseVisualStyleBackColor = true;
            btnEmpty.Click += btnEmpty_Click;
            // 
            // btnSave
            // 
            btnSave.Enabled = false;
            btnSave.Location = new Point(407, 332);
            btnSave.Name = "btnSave";
            btnSave.Size = new Size(75, 23);
            btnSave.TabIndex = 27;
            btnSave.Text = "Save";
            btnSave.UseVisualStyleBackColor = true;
            btnSave.Click += btnSave_Click;
            // 
            // btnNext
            // 
            btnNext.Enabled = false;
            btnNext.Location = new Point(376, 33);
            btnNext.Name = "btnNext";
            btnNext.Size = new Size(50, 25);
            btnNext.TabIndex = 22;
            btnNext.Text = "Next";
            btnNext.UseVisualStyleBackColor = true;
            btnNext.Click += btnNext_Click;
            // 
            // btnPrevious
            // 
            btnPrevious.Enabled = false;
            btnPrevious.Location = new Point(12, 33);
            btnPrevious.Name = "btnPrevious";
            btnPrevious.Size = new Size(50, 25);
            btnPrevious.TabIndex = 21;
            btnPrevious.Text = "Prev.";
            btnPrevious.UseVisualStyleBackColor = true;
            btnPrevious.Click += btnPrevious_Click;
            // 
            // cbxIdConst
            // 
            cbxIdConst.DropDownStyle = ComboBoxStyle.DropDownList;
            cbxIdConst.Enabled = false;
            cbxIdConst.FormattingEnabled = true;
            cbxIdConst.Location = new Point(94, 34);
            cbxIdConst.Name = "cbxIdConst";
            cbxIdConst.Size = new Size(276, 23);
            cbxIdConst.TabIndex = 20;
            cbxIdConst.SelectedIndexChanged += cbxIdConst_SelectedIndexChanged;
            // 
            // btnNextCheck
            // 
            btnNextCheck.Enabled = false;
            btnNextCheck.Location = new Point(267, 331);
            btnNextCheck.Name = "btnNextCheck";
            btnNextCheck.Size = new Size(31, 25);
            btnNextCheck.TabIndex = 37;
            btnNextCheck.Text = ">>";
            toolTip.SetToolTip(btnNextCheck, "Skip to next entry to check");
            btnNextCheck.UseVisualStyleBackColor = true;
            btnNextCheck.Click += btnNextCheck_Click;
            // 
            // EditorFunct
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(507, 361);
            Controls.Add(btnNextCheck);
            Controls.Add(btnDuplicat);
            Controls.Add(btnSearch);
            Controls.Add(tbxSearch);
            Controls.Add(lblSearch);
            Controls.Add(lblCompteur);
            Controls.Add(btnCopyOriginText);
            Controls.Add(btnCopy);
            Controls.Add(lblCategName);
            Controls.Add(lblCateg);
            Controls.Add(tbxTransl);
            Controls.Add(tbxOrigin);
            Controls.Add(chkChecked);
            Controls.Add(btnEmpty);
            Controls.Add(btnSave);
            Controls.Add(btnNext);
            Controls.Add(btnPrevious);
            Controls.Add(cbxIdConst);
            FormBorderStyle = FormBorderStyle.Fixed3D;
            Icon = (Icon)resources.GetObject("$this.Icon");
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "EditorFunct";
            ShowInTaskbar = false;
            StartPosition = FormStartPosition.CenterParent;
            Text = "Editor";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button btnDuplicat;
        private Button btnSearch;
        private TextBox tbxSearch;
        private Label lblSearch;
        private Label lblCompteur;
        private Button btnCopyOriginText;
        private Button btnCopy;
        private Label lblCategName;
        private Label lblCateg;
        private TextBox tbxTransl;
        private TextBox tbxOrigin;
        private CheckBox chkChecked;
        private Button btnEmpty;
        private Button btnSave;
        private Button btnNext;
        private Button btnPrevious;
        private ComboBox cbxIdConst;
        private ToolTip toolTip;
        private Button btnNextCheck;
    }
}