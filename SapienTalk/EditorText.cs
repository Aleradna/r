using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;

namespace SapiensTranslator
{

    public partial class EditorText : Form
    {
        Traitements Traitements = new Traitements();
        public EditorText()
        {
            InitializeComponent();
            loadCheckBoxOption();

        }


        private void btnNext_Click(object sender, EventArgs e)
        {
            cbxIdConst.SelectedIndex++;
            if (cbxIdConst.SelectedIndex < 1)
            {
                btnPrevious.Enabled = false;
            }
            else
            {
                btnPrevious.Enabled = true;
                btnNext.Enabled = true;
                if (tbxSearch.Text.Length == 0)
                {
                    btnEmpty.Enabled = true;
                }
            }

            if (cbxIdConst.SelectedIndex == cbxIdConst.Items.Count - 1)
            {
                btnNext.Enabled = false;
                btnEmpty.Enabled = false;
            }

        }

        private void btnPrevious_Click(object sender, EventArgs e)
        {
            cbxIdConst.SelectedIndex--;
            if (cbxIdConst.SelectedIndex < 1)
            {
                btnPrevious.Enabled = false;
            }
            else
            {
                btnPrevious.Enabled = true;
                btnNext.Enabled = true;
                if (tbxSearch.Text.Length == 0)
                {
                    btnEmpty.Enabled = true;
                }
            }

            if (cbxIdConst.SelectedIndex == 0 && cbxIdConst.Items.Count > 1)
            {
                btnNext.Enabled = true;
                btnEmpty.Enabled = true;
            }

        }

        private void btnCopy_Click(object sender, EventArgs e)
        {
            Clipboard.SetText(cbxIdConst.Text);
        }

        private void cbxIdConst_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxIdConst.Items.Count != 0)
            {
                if (cbxIdConst.SelectedIndex < 1)
                {
                    btnPrevious.Enabled = false;
                }
                else
                {
                    btnPrevious.Enabled = true;
                    btnNext.Enabled = true;
                }

                if (cbxIdConst.SelectedIndex == cbxIdConst.Items.Count - 1)
                {
                    btnNext.Enabled = false;
                }
                loadData();
            }
        }

        private void updateLblCompt()
        {
            int ligne = cbxIdConst.SelectedIndex + 1;
            int nbtot = cbxIdConst.Items.Count;
            lblCompteur.Text = $"{ligne}/{nbtot}";
            if (nbtot == 1)
            {
                btnNext.Enabled = false;
                btnPrevious.Enabled = false;
            }
        }

        private void loadData()
        {
            if (cbxIdConst.SelectedValue is not null)
            {
                if (cbxIdConst.SelectedIndex != cbxIdConst.Items.Count - 1)
                {
                    btnNext.Enabled = true;
                }

                chkChecked.Enabled = true;
                btnSave.Enabled = true;
                cbxIdConst.Enabled = true;
                tbxTransl.Enabled = true;
                btnCopy.Enabled = true;
                btnSearch.Enabled = true;
                tbxSearch.Enabled = true;
                btnDuplicat.Enabled = true;
                btnCopyOriginText.Enabled = true;
                btnNextCheck.Enabled = true;

                CheckBoxOption selectedOption = (CheckBoxOption)cbxIdConst.SelectedItem;
                int Value = (int)selectedOption.ID;

                DataLocalizations data = Traitements.GetData(Value);

                tbxOrigin.TextAlign = HorizontalAlignment.Left;
                tbxOrigin.Font = new Font("Segoe UI", 9.0f);
                tbxOrigin.Text = data.TextOrigin;
                tbxTransl.Text = data.TextTransl;
                lblCategName.Text = data.TypeSource;
                if (data.Checked >= 1) { chkChecked.Checked = true; } else { chkChecked.Checked = false; }
                if (data.TextOrigin is not null)
                {
                    chkAllRef.Enabled = Traitements.GetOccurrenceLocalOrigin(data.TextOrigin);
                }
                chkAllRef.Checked = false;
                updateLblCompt();

            }
        }


        private void btnEmpty_Click(object sender, EventArgs e)
        {
            CheckBoxOption selectedOption = (CheckBoxOption)cbxIdConst.SelectedItem;
            int Value = (int)selectedOption.ID;

            int IdNextTextTranslEmpty = Traitements.NextLocalizationsTranslEmpty(Value);
            if (IdNextTextTranslEmpty > 1)
            {
                cbxIdConst.SelectedValue = IdNextTextTranslEmpty;
            }
        }

        private void loadCheckBoxOption()
        {
            List<CheckBoxOption> options = Traitements.GetListLocalizationsID();
            cbxIdConst.DataSource = options;
            cbxIdConst.DisplayMember = "Constant";  // Propriété à afficher dans le CheckBox
            cbxIdConst.ValueMember = "ID";
            btnEmpty.Enabled = true;
        }

        private void tbxSearch_TextChanged(object sender, EventArgs e)
        {
            if (tbxSearch.Text.Length == 0)
            {
                loadCheckBoxOption();
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (tbxSearch.Text.Length >= 3)
            {
                string searchValue = tbxSearch.Text.ToLower();
                List<CheckBoxOption> options = Traitements.GetListLocalizationIDByTerms(searchValue);
                if (options.Count > 0)
                {
                    cbxIdConst.DataSource = options;
                    cbxIdConst.DisplayMember = "Constant";  // Propriété à afficher dans le CheckBox
                    cbxIdConst.ValueMember = "ID";
                    btnEmpty.Enabled = false;
                }
                else
                {
                    MessageBox.Show("No result", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

            }
            else
            {
                MessageBox.Show("Minimum 3 characters", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        /*
        * Action si la touche entrée est pressée dans le tbSearchWords
        */
        private void tbSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 13)
            {
                btnSearch_Click(sender, e);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            btnSave.Enabled = false;
            if (cbxIdConst.SelectedValue is not null)
            {
                string ID = cbxIdConst.SelectedValue?.ToString() ?? string.Empty;
                string Constant = cbxIdConst.Text;
                string NewTranslate = tbxTransl.Text.ToString();
                string TextOrigin = tbxOrigin.Text.ToString();
                int Checked = 0;
                int CheckedAllRef = 0;
                if (chkChecked.Checked) Checked = 1;
                if (chkAllRef.Checked) CheckedAllRef = 1;
                Traitements.SaveDataLocalizations(NewTranslate, ID, Constant, TextOrigin, Checked, CheckedAllRef);
            }
            if ((cbxIdConst.Items.Count > 1) && (cbxIdConst.SelectedIndex != cbxIdConst.Items.Count - 1))
            {
                btnNext.Invoke(new Action(() => { btnNext.PerformClick(); }));
            }
            else
            {
                this.Close();
            }

            btnSave.Enabled = true;
        }

        private void btnDuplicat_Click(object sender, EventArgs e)
        {
            tbxTransl.Text = tbxOrigin.Text;
        }

        private void btnCopyOriginText_Click(object sender, EventArgs e)
        {
            Clipboard.SetText(tbxOrigin.Text);
        }

        private void btnNextCheck_Click(object sender, EventArgs e)
        {
            CheckBoxOption selectedOption = (CheckBoxOption)cbxIdConst.SelectedItem;
            int Value = (int)selectedOption.ID;

            int IdNextTextTranslEmpty = Traitements.NextLocalizationsNoChecked(Value);
            if (IdNextTextTranslEmpty > 1)
            {
                cbxIdConst.SelectedValue = IdNextTextTranslEmpty;
            }
        }
    }
}
