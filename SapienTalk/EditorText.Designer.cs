namespace SapiensTranslator
{
    partial class EditorText
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(EditorText));
            cbxIdConst = new ComboBox();
            btnPrevious = new Button();
            btnNext = new Button();
            btnSave = new Button();
            btnEmpty = new Button();
            chkChecked = new CheckBox();
            tbxOrigin = new TextBox();
            tbxTransl = new TextBox();
            lblCateg = new Label();
            lblCategName = new Label();
            btnCopy = new Button();
            lblCompteur = new Label();
            lblSearch = new Label();
            tbxSearch = new TextBox();
            btnSearch = new Button();
            btnDuplicat = new Button();
            btnCopyOriginText = new Button();
            chkAllRef = new CheckBox();
            btnNextCheck = new Button();
            toolTip1 = new ToolTip(components);
            SuspendLayout();
            // 
            // cbxIdConst
            // 
            cbxIdConst.DropDownStyle = ComboBoxStyle.DropDownList;
            cbxIdConst.Enabled = false;
            cbxIdConst.FormattingEnabled = true;
            cbxIdConst.Location = new Point(94, 42);
            cbxIdConst.Name = "cbxIdConst";
            cbxIdConst.Size = new Size(170, 23);
            cbxIdConst.TabIndex = 0;
            cbxIdConst.SelectedIndexChanged += cbxIdConst_SelectedIndexChanged;
            // 
            // btnPrevious
            // 
            btnPrevious.Enabled = false;
            btnPrevious.Location = new Point(12, 41);
            btnPrevious.Name = "btnPrevious";
            btnPrevious.Size = new Size(50, 25);
            btnPrevious.TabIndex = 1;
            btnPrevious.Text = "Prev.";
            btnPrevious.UseVisualStyleBackColor = true;
            btnPrevious.Click += btnPrevious_Click;
            // 
            // btnNext
            // 
            btnNext.Enabled = false;
            btnNext.Location = new Point(270, 41);
            btnNext.Name = "btnNext";
            btnNext.Size = new Size(50, 25);
            btnNext.TabIndex = 2;
            btnNext.Text = "Next";
            btnNext.UseVisualStyleBackColor = true;
            btnNext.Click += btnNext_Click;
            // 
            // btnSave
            // 
            btnSave.Enabled = false;
            btnSave.Location = new Point(301, 370);
            btnSave.Name = "btnSave";
            btnSave.Size = new Size(75, 23);
            btnSave.TabIndex = 7;
            btnSave.Text = "Save";
            btnSave.UseVisualStyleBackColor = true;
            btnSave.Click += btnSave_Click;
            // 
            // btnEmpty
            // 
            btnEmpty.Enabled = false;
            btnEmpty.Location = new Point(326, 41);
            btnEmpty.Name = "btnEmpty";
            btnEmpty.Size = new Size(50, 25);
            btnEmpty.TabIndex = 3;
            btnEmpty.Text = ">>";
            toolTip1.SetToolTip(btnEmpty, "Skip to next empty translation !");
            btnEmpty.UseVisualStyleBackColor = true;
            btnEmpty.Click += btnEmpty_Click;
            // 
            // chkChecked
            // 
            chkChecked.AutoSize = true;
            chkChecked.Enabled = false;
            chkChecked.Location = new Point(112, 372);
            chkChecked.Name = "chkChecked";
            chkChecked.Size = new Size(96, 19);
            chkChecked.TabIndex = 6;
            chkChecked.Text = "Text Checked";
            chkChecked.UseVisualStyleBackColor = true;
            // 
            // tbxOrigin
            // 
            tbxOrigin.Location = new Point(12, 72);
            tbxOrigin.Multiline = true;
            tbxOrigin.Name = "tbxOrigin";
            tbxOrigin.ReadOnly = true;
            tbxOrigin.ScrollBars = ScrollBars.Vertical;
            tbxOrigin.Size = new Size(364, 122);
            tbxOrigin.TabIndex = 18;
            // 
            // tbxTransl
            // 
            tbxTransl.Enabled = false;
            tbxTransl.Location = new Point(12, 200);
            tbxTransl.Multiline = true;
            tbxTransl.Name = "tbxTransl";
            tbxTransl.ScrollBars = ScrollBars.Vertical;
            tbxTransl.Size = new Size(364, 133);
            tbxTransl.TabIndex = 5;
            // 
            // lblCateg
            // 
            lblCateg.AutoSize = true;
            lblCateg.Location = new Point(12, 13);
            lblCateg.Name = "lblCateg";
            lblCateg.Size = new Size(67, 15);
            lblCateg.TabIndex = 9;
            lblCateg.Text = "Categorie : ";
            // 
            // lblCategName
            // 
            lblCategName.AutoSize = true;
            lblCategName.Location = new Point(85, 13);
            lblCategName.Name = "lblCategName";
            lblCategName.Size = new Size(29, 15);
            lblCategName.TabIndex = 10;
            lblCategName.Text = "Null";
            // 
            // btnCopy
            // 
            btnCopy.Enabled = false;
            btnCopy.Image = (Image)resources.GetObject("btnCopy.Image");
            btnCopy.Location = new Point(68, 42);
            btnCopy.Name = "btnCopy";
            btnCopy.Size = new Size(20, 23);
            btnCopy.TabIndex = 10;
            toolTip1.SetToolTip(btnCopy, "Copy the Constant into the Clipboard");
            btnCopy.UseVisualStyleBackColor = true;
            btnCopy.Click += btnCopy_Click;
            // 
            // lblCompteur
            // 
            lblCompteur.AutoSize = true;
            lblCompteur.Location = new Point(315, 13);
            lblCompteur.Name = "lblCompteur";
            lblCompteur.Size = new Size(61, 15);
            lblCompteur.TabIndex = 13;
            lblCompteur.Text = "Compteur";
            lblCompteur.TextAlign = ContentAlignment.MiddleRight;
            // 
            // lblSearch
            // 
            lblSearch.AutoSize = true;
            lblSearch.Location = new Point(9, 342);
            lblSearch.Name = "lblSearch";
            lblSearch.Size = new Size(51, 15);
            lblSearch.TabIndex = 14;
            lblSearch.Text = "Search : ";
            // 
            // tbxSearch
            // 
            tbxSearch.Enabled = false;
            tbxSearch.Location = new Point(66, 339);
            tbxSearch.Name = "tbxSearch";
            tbxSearch.Size = new Size(135, 23);
            tbxSearch.TabIndex = 8;
            tbxSearch.TextChanged += tbxSearch_TextChanged;
            tbxSearch.KeyPress += tbSearch_KeyPress;
            // 
            // btnSearch
            // 
            btnSearch.Enabled = false;
            btnSearch.Image = (Image)resources.GetObject("btnSearch.Image");
            btnSearch.Location = new Point(207, 338);
            btnSearch.Name = "btnSearch";
            btnSearch.Size = new Size(25, 25);
            btnSearch.TabIndex = 9;
            btnSearch.UseVisualStyleBackColor = true;
            btnSearch.Click += btnSearch_Click;
            // 
            // btnDuplicat
            // 
            btnDuplicat.Enabled = false;
            btnDuplicat.Image = (Image)resources.GetObject("btnDuplicat.Image");
            btnDuplicat.Location = new Point(332, 168);
            btnDuplicat.Name = "btnDuplicat";
            btnDuplicat.Size = new Size(23, 23);
            btnDuplicat.TabIndex = 4;
            toolTip1.SetToolTip(btnDuplicat, "Copy the Original Text");
            btnDuplicat.UseVisualStyleBackColor = true;
            btnDuplicat.Click += btnDuplicat_Click;
            // 
            // btnCopyOriginText
            // 
            btnCopyOriginText.Enabled = false;
            btnCopyOriginText.Image = (Image)resources.GetObject("btnCopyOriginText.Image");
            btnCopyOriginText.Location = new Point(307, 168);
            btnCopyOriginText.Name = "btnCopyOriginText";
            btnCopyOriginText.Size = new Size(23, 23);
            btnCopyOriginText.TabIndex = 10;
            toolTip1.SetToolTip(btnCopyOriginText, "Copy the Original Text to the Clipboard");
            btnCopyOriginText.UseVisualStyleBackColor = true;
            btnCopyOriginText.Click += btnCopyOriginText_Click;
            // 
            // chkAllRef
            // 
            chkAllRef.AutoSize = true;
            chkAllRef.Enabled = false;
            chkAllRef.Location = new Point(9, 372);
            chkAllRef.Name = "chkAllRef";
            chkAllRef.Size = new Size(97, 19);
            chkAllRef.TabIndex = 19;
            chkAllRef.Text = "All references";
            chkAllRef.UseVisualStyleBackColor = true;
            // 
            // btnNextCheck
            // 
            btnNextCheck.Enabled = false;
            btnNextCheck.Location = new Point(214, 369);
            btnNextCheck.Name = "btnNextCheck";
            btnNextCheck.Size = new Size(31, 25);
            btnNextCheck.TabIndex = 38;
            btnNextCheck.Text = ">>";
            toolTip1.SetToolTip(btnNextCheck, "Skip to next entry to check");
            btnNextCheck.UseVisualStyleBackColor = true;
            btnNextCheck.Click += btnNextCheck_Click;
            // 
            // EditorText
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(388, 396);
            Controls.Add(btnNextCheck);
            Controls.Add(chkAllRef);
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
            Name = "EditorText";
            ShowInTaskbar = false;
            StartPosition = FormStartPosition.CenterParent;
            Text = "Editor";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private ComboBox cbxIdConst;
        private Button btnPrevious;
        private Button btnNext;
        private Button btnSave;
        private Button btnEmpty;
        private CheckBox chkChecked;
        private TextBox tbxOrigin;
        private TextBox tbxTransl;
        private Label lblCateg;
        private Label lblCategName;
        private Button btnCopy;
        private Label lblCompteur;
        private Label lblSearch;
        private TextBox tbxSearch;
        private Button btnSearch;
        private Button btnDuplicat;
        private Button btnCopyOriginText;
        private CheckBox chkAllRef;
        private Button btnNextCheck;
        private ToolTip toolTip1;
    }
}