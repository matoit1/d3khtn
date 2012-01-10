using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using System.Net;
using System.Media;
using System.Text.RegularExpressions;

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
            this.cbbLanguage.SelectedItem = "English - Vietnamese";
            this.cbbFrom.SelectedItem = "English";
            this.cbbTo.SelectedItem = "Vietnamese";
            this.cbbLanguageWiki.SelectedItem = "English";
        }
        #region Dictionary TranTri
        private void btnLookup_Click(object sender, EventArgs e)
        {
            if (txtWord.Text.Trim() != "")
            {
                // Initialize the translator
                VdictDictionary vdict = new VdictDictionary();
                vdict.KeyWord = txtWord.Text;
                vdict.ID = cbbLanguage.SelectedIndex + 1;


                this.tbResult.Text = string.Empty;
                this.tbResult.Update();
                this.tbResult.Text = string.Empty;
                this.tbResult.Update();

                // Translate the text
                try
                {
                    // Forward translation
                    this.Cursor = Cursors.WaitCursor;
                    this.tbStatusDIC.Text = "Translating...";
                    this.tbStatusDIC.Update();
                    vdict.LookUp();
                    Thread.Sleep(500); // doi no chay
                    this.tbResult.Text = vdict.Result;
                    this.tbResult.Update();


                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                finally
                {
                    this.tbStatusDIC.Text = string.Empty;
                    this.Cursor = Cursors.Default;
                }
            }
        }

        private void btnListen_Click(object sender, EventArgs e)
        {

        }
        #endregion

        #region Dictionary Nguyen Anh Tri

        private void btnChange_Click(object sender, EventArgs e)
        {
            String text = cbbFrom.SelectedItem.ToString();
            cbbFrom.SelectedItem = cbbTo.SelectedItem.ToString();
            cbbTo.SelectedItem = text;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Translate();
        }

        private void richTextBox_Left_MouseUp(object sender, MouseEventArgs e)
        {
            if (richTextBox_Left.SelectedText != "")
            {
                Translate();
            }
        }

        private void richTextBox_Left_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (richTextBox_Left.SelectedText != "")
            {
                Translate();
            }
        }

        private void bt_FromSpeech_Click(object sender, EventArgs e)
        {
            string lang = (string)cbbFrom.SelectedItem;
            string lg = Translator.LanguageEnumToIdentifier(lang);
            string name = "translate";
            this.Cursor = Cursors.WaitCursor;
            lb_Status.Text = "Processing ...";
            lb_Status.Update();
            string temp = richTextBox_Left.Text;
            List<string> dsDoanVan = MyClass.chiaDoanVan(temp);
            List<string> dsFileName = MyClass.download(dsDoanVan, lg,name);
            string ketQua = MyClass.noifile(dsFileName);
            lb_Status.Text = string.Empty;
            MyClass.doc(ketQua);
            this.Cursor = Cursors.Default;
        }

        private void bt_ToSpeech_Click(object sender, EventArgs e)
        {
            string lang = (string)cbbTo.SelectedItem;
            string lg = Translator.LanguageEnumToIdentifier(lang);
            string name = "translated";
            this.Cursor = Cursors.WaitCursor;
            lb_Status.Text = "Processing ...";
            lb_Status.Update();
            string temp = richTextBox_Right.Text;
            List<string> dsDoanVan = MyClass.chiaDoanVan(temp);
            List<string> dsFileName = MyClass.download(dsDoanVan, lg,name);
            string ketQua = MyClass.noifile(dsFileName);
            lb_Status.Text = string.Empty;
            MyClass.doc(ketQua);
            this.Cursor = Cursors.Default;
        }

        public void Translate()
        {
            // Initialize the translator
            Translator t = new Translator();
            t.SourceLanguage = (string)this.cbbFrom.SelectedItem;
            t.TargetLanguage = (string)this.cbbTo.SelectedItem;
            t.SourceText = this.richTextBox_Left.Text;

            this.richTextBox_Right.Text = string.Empty;
            this.richTextBox_Right.Update();

            // Translate the text
            try
            {
                // Forward translation
                this.Cursor = Cursors.WaitCursor;
                lb_Status.Text = "Translating ...";
                lb_Status.Update();
                t.Translate();
                this.richTextBox_Right.Text = t.Translation;
                this.richTextBox_Right.Update();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            finally
            {
                lb_Status.Text = "Completed";
                this.Cursor = Cursors.Default;
            }
        }
        #endregion
        
        #region kiwi TranTri
        private void btnSearchWiki_Click(object sender, EventArgs e)
        {
            if (txtKeyWordWiki.Text.Trim() != "")
            {
                Wiki w = new Wiki();
                w.keyWord = txtKeyWordWiki.Text;
                w.ID = cbbLanguageWiki.SelectedIndex;

                tbResultWiki.Text = String.Empty;
                tbResultWiki.Update();
                try
                {
                    this.Cursor = Cursors.WaitCursor;
                    lbSttKiwi2.Text = "Translating ...";
                    lbSttKiwi2.Update();
                    w.Search();

                    // Thread.Sleep(500); // doi no chay

                }
                catch (Exception ex)
                {
                    // MessageBox.Show(ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    w.result = "No result.";
                }
                finally
                {
                    lbSttKiwi2.Text = "Completed";
                    this.Cursor = Cursors.Default;
                    tbResultWiki.Text = w.result;
                    tbResultWiki.Update();
                }
            }
        }


        #endregion
    }
}
