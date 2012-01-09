using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;

namespace TuDienOnline
{
    public partial class FormMain : Form
    {
        public FormMain()
        {
            InitializeComponent();
        }

        private void FormMain_Load(object sender, EventArgs e)
        {
            this.cbbFrom.SelectedItem = "English";
            this.cbbTo.SelectedItem = "Vietnamese";
        }

        private void btnLookup_Click(object sender, EventArgs e)
        {
            // Initialize the translator
            Translator t = new Translator();
            t.SourceLanguage = (string)this.cbbFrom.SelectedItem;
            t.TargetLanguage = (string)this.cbbTo.SelectedItem;
            t.SourceText = this.txtWord.Text;

            this.tbResult.Text = string.Empty;
            this.tbResult.Update();
            this.tbResult.Text = string.Empty;
            this.tbResult.Update();

            // Translate the text
            try
            {
                // Forward translation
                this.Cursor = Cursors.WaitCursor;
                this.lbStatus.Text = "Translating...";
                this.lbStatus.Update();
                t.Translate();
                this.tbResult.Text = t.Translation;
                this.tbResult.Update();


                // Thread.Sleep(500); // let Google breathe

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            finally
            {
                this.lbStatus.Text = string.Empty;
                this.Cursor = Cursors.Default;
            }
        }

        //private void richTextBox_Left_MouseDoubleClick(object sender, MouseEventArgs e)
        //{
        //    if (richTextBox_Left.SelectedText != "")
        //    {
        //        // Initialize the translator
        //        Translator t = new Translator();
        //        t.SourceLanguage = (string)this.cbbFrom.SelectedItem;
        //        t.TargetLanguage = (string)this.cbbTo.SelectedItem;
        //        t.SourceText = richTextBox_Left.SelectedText;

        //        this.tbRight.Text = string.Empty;
        //        this.tbRight.Update();
        //        this.tbRight.Text = string.Empty;
        //        this.tbRight.Update();

        //        // Translate the text
        //        try
        //        {
        //            // Forward translation
        //            this.Cursor = Cursors.WaitCursor;
        //            this.lbStatus.Text = "Translating...";
        //            this.lbStatus.Update();
        //            t.Translate();
        //            this.tbRight.Text = t.Translation;
        //            this.tbRight.Update();


        //            // Thread.Sleep(500); // let Google breathe

        //        }
        //        catch (Exception ex)
        //        {
        //            MessageBox.Show(ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
        //        }
        //        finally
        //        {
        //            this.lbStatus.Text = string.Empty;
        //            this.Cursor = Cursors.Default;
        //        }
        //    }
        //}

        //private void richTextBox_Left_MouseUp(object sender, MouseEventArgs e)
        //{
        //    if (richTextBox_Left.SelectedText != "")
        //    {
        //        string temp = richTextBox_Left.SelectedText;
        //        // Initialize the translator
        //        Translator t = new Translator();
        //        t.SourceLanguage = (string)this.cbbFrom.SelectedItem;
        //        t.TargetLanguage = (string)this.cbbTo.SelectedItem;
        //        t.SourceText = temp;

        //        this.tbRight.Text = string.Empty;
        //        this.tbRight.Update();
        //        this.tbRight.Text = string.Empty;
        //        this.tbRight.Update();

        //        // Translate the text
        //        try
        //        {
        //            // Forward translation
        //            this.Cursor = Cursors.WaitCursor;
        //            this.lbStatus.Text = "Translating...";
        //            this.lbStatus.Update();
        //            t.Translate();
        //            this.tbRight.Text = t.Translation;
        //            this.tbRight.Update();


        //            // Thread.Sleep(500); // let Google breathe

        //        }
        //        catch (Exception ex)
        //        {
        //            MessageBox.Show(ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
        //        }
        //        finally
        //        {
        //            this.lbStatus.Text = string.Empty;
        //            this.Cursor = Cursors.Default;
        //        }
        //    }
        //}

        private void btnChange_Click(object sender, EventArgs e)
        {
            String textTam = cbbFrom.SelectedItem.ToString();
            cbbFrom.SelectedItem = cbbTo.SelectedItem.ToString();
            cbbTo.SelectedItem = textTam;
        }

 

    }
}
