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
using System.Speech.Recognition;
using HtmlAgilityPack;
using System.IO;

namespace TuDienOnline
{
    public partial class FormMain : Form
    {
        private static Dictionary<string, string> _languageModeMap;
        private string SourceLang = "en";

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

        #region LanguageEnum

        /// <summary>
        /// Converts a language to its identifier.
        /// </summary>
        /// <param name="language">The language."</param>
        /// <returns>The identifier or <see cref="string.Empty"/> if none.</returns>
        public static string LanguageEnumToIdentifier
            (string language)
        {
            if (_languageModeMap == null)
            {
                _languageModeMap = new Dictionary<string, string>();
                _languageModeMap.Add("af", "Afrikaans");
                _languageModeMap.Add("sq", "Albanian");
                _languageModeMap.Add("ar", "Arabic");
                _languageModeMap.Add("be", "Belarusian");
                _languageModeMap.Add("bg", "Bulgarian");
                _languageModeMap.Add("ca", "Catalan");
                _languageModeMap.Add("zh-CN", "Chinese");
                _languageModeMap.Add("hr", "Croatian");
                _languageModeMap.Add("cs", "Czech");
                _languageModeMap.Add("da", "Danish");
                _languageModeMap.Add("nl", "Dutch");
                _languageModeMap.Add("en", "English");
                _languageModeMap.Add("et", "Estonian");
                _languageModeMap.Add("tl", "Filipino");
                _languageModeMap.Add("fi", "Finnish");
                _languageModeMap.Add("fr", "French");
                _languageModeMap.Add("gl", "Galician");
                _languageModeMap.Add("de", "German");
                _languageModeMap.Add("el", "Greek");
                _languageModeMap.Add("ht", "Haitian Creole ALPHA");
                _languageModeMap.Add("iw", "Hebrew");
                _languageModeMap.Add("hi", "Hindi");
                _languageModeMap.Add("hu", "Hungarian");
                _languageModeMap.Add("is", "Icelandic");
                _languageModeMap.Add("id", "Indonesian");
                _languageModeMap.Add("ga", "Irish");
                _languageModeMap.Add("it", "Italian");
                _languageModeMap.Add("ja", "Japanese");
                _languageModeMap.Add("ko", "Korean");
                _languageModeMap.Add("lv", "Latvian");
                _languageModeMap.Add("lt", "Lithuanian");
                _languageModeMap.Add("mk", "Macedonian");
                _languageModeMap.Add("ms", "Malay");
                _languageModeMap.Add("mt", "Maltese");
                _languageModeMap.Add("no", "Norwegian");
                _languageModeMap.Add("fa", "Persian");
                _languageModeMap.Add("pl", "Polish");
                _languageModeMap.Add("pt", "Portuguese");
                _languageModeMap.Add("ro", "Romanian");
                _languageModeMap.Add("ru", "Russian");
                _languageModeMap.Add("sr", "Serbian");
                _languageModeMap.Add("sk", "Slovak");
                _languageModeMap.Add("sl", "Slovenian");
                _languageModeMap.Add("es", "Spanish");
                _languageModeMap.Add("sw", "Swahili");
                _languageModeMap.Add("sv", "Swedish");
                _languageModeMap.Add("ta", "Tamil");
                _languageModeMap.Add("th", "Thai");
                _languageModeMap.Add("tr", "Turkish");
                _languageModeMap.Add("uk", "Ukrainian");
                _languageModeMap.Add("vi", "Vietnamese");
                _languageModeMap.Add("cy", "Welsh");
                _languageModeMap.Add("yi", "Yiddish");
                
            }
            string mode = string.Empty;
            _languageModeMap.TryGetValue(language, out mode);
            return mode;
        }

        #endregion

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

        public static string textKeyword = "";
        public static string ketquaDOC = "";
        private void btnListen_Click(object sender, EventArgs e)
        {
            try
            {
                if (textKeyword != txtWord.Text.Trim())
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
                    textKeyword = temp;
                    ketquaDOC = ketQua;
                }
                else
                {
                    MyClass.doc(ketquaDOC);
                    this.Cursor = Cursors.Default;
                }
            }
            catch
            {
                lb_Status.Text = "Complete";
                lb_Status.Update();
            }
            finally
            {
                this.Cursor = Cursors.Default;
            }
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
            if (!translate.Trim().Equals(""))
                Translate(translate);
        }

        private string AutoDetectLanguage(string text)
        {
            string result = "";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://ws.detectlanguage.com/0.1/detect?q=" + text);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            StreamReader streamReader = new StreamReader(response.GetResponseStream());
            string str = streamReader.ReadToEnd();
            int firstIndex = str.IndexOf("language\":\"") + 11;
            int lastIndex = 0;
            string temp = "";
            int a = firstIndex;
            do
            {
                temp = str[a].ToString();
                if (temp.Equals("\""))
                {
                    lastIndex = a;
                    break;
                }
                else
                    a++;
            }
            while (str.Length > firstIndex);
            result = str.Substring(firstIndex, lastIndex - firstIndex);
            return result;
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
            //t.SourceLanguage = SourceLang;
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
            ChuyenDoiKiTu(translate);
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

        private void ChuyenDoiKiTu(string translate)
        {
            //kiem tra ngon ngu dau vao
            int index = translate.IndexOf(" ");
            if (index > 0)
            {
                string temp = translate.Substring(0, index);
                SourceLang = AutoDetectLanguage(temp);
                SourceLang = LanguageEnumToIdentifier(SourceLang);
            }
            else
            {
                SourceLang = AutoDetectLanguage(translate);
                SourceLang = LanguageEnumToIdentifier(SourceLang);
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
                if(!translate.Trim().Equals(""))
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
