namespace SapiensTranslator
{
    public partial class frmStatistics : Form
    {
        StatBdd statBdd = new StatBdd();
        public frmStatistics()
        {
            try
            {
                InitializeComponent();
                InitializeCounter();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Warning ! ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void InitializeCounter()
        {
            lblCountBdd.Text = statBdd.nbRow.ToString();
            lblCountTranslated.Text = statBdd.nbRowTransl.ToString();
            lblCountUntranslated.Text = statBdd.nbRowUntransl.ToString();
            lblCountLocalizations.Text = statBdd.nbRowLocalizationChecked.ToString();
            lblCountFunctions.Text = statBdd.nbRowFunctionChecked.ToString();

        }
    }
}
