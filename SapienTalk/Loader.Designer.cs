namespace SapiensTranslator
{
    partial class Loading
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
            prgsBarImport = new ProgressBar();
            SuspendLayout();
            // 
            // prgsBarImport
            // 
            prgsBarImport.Location = new Point(10, 20);
            prgsBarImport.Margin = new Padding(3, 2, 3, 2);
            prgsBarImport.Name = "prgsBarImport";
            prgsBarImport.Size = new Size(202, 22);
            prgsBarImport.TabIndex = 0;
            prgsBarImport.Value = 45;
            // 
            // Loading
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.ActiveBorder;
            ClientSize = new Size(223, 62);
            ControlBox = false;
            Controls.Add(prgsBarImport);
            FormBorderStyle = FormBorderStyle.Fixed3D;
            Margin = new Padding(3, 2, 3, 2);
            MaximizeBox = false;
            MinimizeBox = false;
            Name = "Loading";
            StartPosition = FormStartPosition.CenterParent;
            ResumeLayout(false);
        }

        #endregion

        private ProgressBar prgsBarImport;
    }
}