﻿using System;
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
using System.Speech.Recognition;

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
            string lang = (string)cbbFrom.SelectedItem;
            string lg = Translator.LanguageEnumToIdentifier(lang);
            string name = "vdictranslate";
            this.Cursor = Cursors.WaitCursor;
            lb_Status.Text = "Processing ...";
            lb_Status.Update();
            string temp = txtWord.Text;
            List<string> dsDoanVan = MyClass.chiaDoanVan(temp);
            List<string> dsFileName = MyClass.download(dsDoanVan, lg, name);
            string ketQua = MyClass.noifile(dsFileName);
            lb_Status.Text = string.Empty;
            MyClass.doc(ketQua);
            this.Cursor = Cursors.Default;
        }
        #endregion

        #region Dictionary Nguyen Anh Tri

        private void btnChange_Click(object sender, EventArgs e)
        {
            String text = cbbFrom.SelectedItem.ToString();
            cbbFrom.SelectedItem = cbbTo.SelectedItem.ToString();
            cbbTo.SelectedItem = text;
        }

        private void bt_Translate_Click(object sender, EventArgs e)
        {
            string translate = richTextBox_Left.Text;
            Translate(translate);
        }

        private void richTextBox_Left_MouseUp(object sender, MouseEventArgs e)
        {
            //if (richTextBox_Left.SelectedText != "")
            //{
            //    string translate = richTextBox_Left.SelectedText;
            //    Translate(translate);
            //}
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
            List<string> dsFileName = MyClass.download(dsDoanVan, lg, name);
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
            List<string> dsFileName = MyClass.download(dsDoanVan, lg, name);
            string ketQua = MyClass.noifile(dsFileName);
            lb_Status.Text = string.Empty;
            MyClass.doc(ketQua);
            this.Cursor = Cursors.Default;
        }

        private string CallTranslator(string str)
        {
            // Initialize the translator
            Translator t = new Translator();
            t.SourceLanguage = (string)this.cbbFrom.SelectedItem;
            t.TargetLanguage = (string)this.cbbTo.SelectedItem;
            t.SourceText = str;
            // Translate the text
            try
            {
                // Forward translation
                this.Cursor = Cursors.WaitCursor;
                lb_Status.Text = "Translating ...";
                lb_Status.Update();
                t.Translate();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, this.Text, MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            return t.Translation;
        }

        public static List<string> SplitTranslate(string translate, int length)
        {
            List<string> kq = new List<string>();

            int index = length;
            string temp = "";
            do
            {
                if (translate.Length > length)
                {

                    temp = translate[index].ToString();
                    if (temp.Equals(".") || temp.Equals(",") || temp.Equals(";"))
                    {
                        //string b = translate[translate.Length - 1].ToString();
                        temp = translate.Substring(0, index);
                        translate = translate.Substring(index, translate.Length - index);
                        kq.Add(temp);
                        index = length;
                    }
                    else
                        index--;
                }
                else
                {
                    kq.Add(translate);
                    break;
                }
            }
            while (translate.Length > 0);

            return kq;
        }

        public void Translate(string translate)
        {
            List<string> listStr = SplitTranslate(translate, 282);
            StringBuilder strBuilder = new StringBuilder();

            foreach (string str in listStr)
            {
                strBuilder.Append(CallTranslator(str));
            }

            this.richTextBox_Right.Text = string.Empty;
            this.richTextBox_Right.Update();

            // Translate the text
            try
            {
                // Forward translation
                this.richTextBox_Right.Text = strBuilder.ToString();
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
                    throw new ApplicationException("operation failed!", ex);

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


        private void richTextBox_Left_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Space)
            {
                string translate = richTextBox_Left.Text;
                Translate(translate);
            }
        }

        private void bt_Speak_Click(object sender, EventArgs e)
        {
            SpeechRecognitionEngine recognizer = new SpeechRecognitionEngine();
            Grammar dictationGrammar = new DictationGrammar();
            recognizer.LoadGrammar(dictationGrammar);
            try
            {
                bt_Speak.Text = "Speak Now";
                recognizer.SetInputToDefaultAudioDevice();
                RecognitionResult result = recognizer.Recognize();
                MessageBox.Show(result.Text);
            }
            catch (InvalidOperationException exception)
            {
                string text = String.Format("Could not recognize input from default aduio device. Is a microphone or sound card available?\r\n{0} - {1}.", exception.Source, exception.Message);
                MessageBox.Show(text);
            }
            finally
            {
                bt_Speak.Text = "Speak";
                recognizer.UnloadAllGrammars();
            }
        }


    }
}
