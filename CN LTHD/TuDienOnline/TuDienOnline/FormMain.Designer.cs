namespace TuDienOnline
{
    partial class FormMain
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
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabDictionary = new System.Windows.Forms.TabPage();
            this.tbStatusDIC = new System.Windows.Forms.Label();
            this.cbbLanguage = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnListen = new System.Windows.Forms.Button();
            this.tbResult = new System.Windows.Forms.TextBox();
            this.btnLookup = new System.Windows.Forms.Button();
            this.txtWord = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tabTranslate = new System.Windows.Forms.TabPage();
            this.bt_FromSpeech = new System.Windows.Forms.Button();
            this.bt_ToSpeech = new System.Windows.Forms.Button();
            this.lb_Status = new System.Windows.Forms.Label();
            this.splitContainer = new System.Windows.Forms.SplitContainer();
            this.richTextBox_Left = new System.Windows.Forms.RichTextBox();
            this.richTextBox_Right = new System.Windows.Forms.RichTextBox();
            this.panel_Control = new System.Windows.Forms.Panel();
            this.btnChange = new System.Windows.Forms.Button();
            this.lbStatus = new System.Windows.Forms.Label();
            this.cbbTo = new System.Windows.Forms.ComboBox();
            this.cbbFrom = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.tabWikipedia = new System.Windows.Forms.TabPage();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.optionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tabControl1.SuspendLayout();
            this.tabDictionary.SuspendLayout();
            this.tabTranslate.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer)).BeginInit();
            this.splitContainer.Panel1.SuspendLayout();
            this.splitContainer.Panel2.SuspendLayout();
            this.splitContainer.SuspendLayout();
            this.panel_Control.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tabControl1.Controls.Add(this.tabDictionary);
            this.tabControl1.Controls.Add(this.tabTranslate);
            this.tabControl1.Controls.Add(this.tabWikipedia);
            this.tabControl1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControl1.Location = new System.Drawing.Point(0, 27);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(832, 469);
            this.tabControl1.TabIndex = 1;
            // 
            // tabDictionary
            // 
            this.tabDictionary.Controls.Add(this.tbStatusDIC);
            this.tabDictionary.Controls.Add(this.cbbLanguage);
            this.tabDictionary.Controls.Add(this.label5);
            this.tabDictionary.Controls.Add(this.btnListen);
            this.tabDictionary.Controls.Add(this.tbResult);
            this.tabDictionary.Controls.Add(this.btnLookup);
            this.tabDictionary.Controls.Add(this.txtWord);
            this.tabDictionary.Controls.Add(this.label4);
            this.tabDictionary.Location = new System.Drawing.Point(4, 27);
            this.tabDictionary.Name = "tabDictionary";
            this.tabDictionary.Padding = new System.Windows.Forms.Padding(3);
            this.tabDictionary.Size = new System.Drawing.Size(824, 438);
            this.tabDictionary.TabIndex = 0;
            this.tabDictionary.Text = "Dictionary";
            this.tabDictionary.UseVisualStyleBackColor = true;
            // 
            // tbStatusDIC
            // 
            this.tbStatusDIC.AutoSize = true;
            this.tbStatusDIC.Location = new System.Drawing.Point(534, 30);
            this.tbStatusDIC.Name = "tbStatusDIC";
            this.tbStatusDIC.Size = new System.Drawing.Size(0, 18);
            this.tbStatusDIC.TabIndex = 7;
            // 
            // cbbLanguage
            // 
            this.cbbLanguage.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbbLanguage.FormattingEnabled = true;
            this.cbbLanguage.Items.AddRange(new object[] {
            "English - Vietnamese",
            "Vietnamese - English",
            "Vietnamese - Vietnamese",
            "French - Vietnamese",
            "Vietnamese - French",
            "Computing",
            "English - English",
            "Chinese - Vietnamese",
            "Russian - Vietnamese"});
            this.cbbLanguage.Location = new System.Drawing.Point(118, 22);
            this.cbbLanguage.Name = "cbbLanguage";
            this.cbbLanguage.Size = new System.Drawing.Size(268, 26);
            this.cbbLanguage.TabIndex = 6;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(42, 22);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(74, 18);
            this.label5.TabIndex = 5;
            this.label5.Text = "Dictionary";
            // 
            // btnListen
            // 
            this.btnListen.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnListen.AutoSize = true;
            this.btnListen.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnListen.Image = global::TuDienOnline.Properties.Resources.images;
            this.btnListen.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.btnListen.Location = new System.Drawing.Point(637, 112);
            this.btnListen.Name = "btnListen";
            this.btnListen.Size = new System.Drawing.Size(146, 146);
            this.btnListen.TabIndex = 4;
            this.btnListen.UseVisualStyleBackColor = true;
            this.btnListen.Click += new System.EventHandler(this.btnListen_Click);
            // 
            // tbResult
            // 
            this.tbResult.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tbResult.Location = new System.Drawing.Point(45, 93);
            this.tbResult.Multiline = true;
            this.tbResult.Name = "tbResult";
            this.tbResult.ReadOnly = true;
            this.tbResult.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbResult.Size = new System.Drawing.Size(569, 294);
            this.tbResult.TabIndex = 3;
            // 
            // btnLookup
            // 
            this.btnLookup.Location = new System.Drawing.Point(415, 52);
            this.btnLookup.Name = "btnLookup";
            this.btnLookup.Size = new System.Drawing.Size(75, 35);
            this.btnLookup.TabIndex = 2;
            this.btnLookup.Text = "Look up";
            this.btnLookup.UseVisualStyleBackColor = true;
            this.btnLookup.Click += new System.EventHandler(this.btnLookup_Click);
            // 
            // txtWord
            // 
            this.txtWord.Location = new System.Drawing.Point(118, 57);
            this.txtWord.Name = "txtWord";
            this.txtWord.Size = new System.Drawing.Size(268, 24);
            this.txtWord.TabIndex = 1;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(42, 60);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(70, 18);
            this.label4.TabIndex = 0;
            this.label4.Text = "KeyWord";
            // 
            // tabTranslate
            // 
            this.tabTranslate.Controls.Add(this.bt_FromSpeech);
            this.tabTranslate.Controls.Add(this.bt_ToSpeech);
            this.tabTranslate.Controls.Add(this.lb_Status);
            this.tabTranslate.Controls.Add(this.splitContainer);
            this.tabTranslate.Controls.Add(this.panel_Control);
            this.tabTranslate.Location = new System.Drawing.Point(4, 27);
            this.tabTranslate.Name = "tabTranslate";
            this.tabTranslate.Padding = new System.Windows.Forms.Padding(3);
            this.tabTranslate.Size = new System.Drawing.Size(824, 438);
            this.tabTranslate.TabIndex = 1;
            this.tabTranslate.Text = "Translate";
            this.tabTranslate.UseVisualStyleBackColor = true;
            // 
            // bt_FromSpeech
            // 
            this.bt_FromSpeech.Location = new System.Drawing.Point(333, 389);
            this.bt_FromSpeech.Name = "bt_FromSpeech";
            this.bt_FromSpeech.Size = new System.Drawing.Size(75, 26);
            this.bt_FromSpeech.TabIndex = 7;
            this.bt_FromSpeech.Text = "Speech";
            this.bt_FromSpeech.UseVisualStyleBackColor = true;
            this.bt_FromSpeech.Click += new System.EventHandler(this.bt_FromSpeech_Click);
            // 
            // bt_ToSpeech
            // 
            this.bt_ToSpeech.Location = new System.Drawing.Point(741, 389);
            this.bt_ToSpeech.Name = "bt_ToSpeech";
            this.bt_ToSpeech.Size = new System.Drawing.Size(75, 27);
            this.bt_ToSpeech.TabIndex = 7;
            this.bt_ToSpeech.Text = "Speech";
            this.bt_ToSpeech.UseVisualStyleBackColor = true;
            this.bt_ToSpeech.Click += new System.EventHandler(this.bt_ToSpeech_Click);
            // 
            // lb_Status
            // 
            this.lb_Status.AutoSize = true;
            this.lb_Status.Location = new System.Drawing.Point(8, 414);
            this.lb_Status.Name = "lb_Status";
            this.lb_Status.Size = new System.Drawing.Size(0, 18);
            this.lb_Status.TabIndex = 6;
            // 
            // splitContainer
            // 
            this.splitContainer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.splitContainer.Location = new System.Drawing.Point(3, 77);
            this.splitContainer.Name = "splitContainer";
            // 
            // splitContainer.Panel1
            // 
            this.splitContainer.Panel1.Controls.Add(this.richTextBox_Left);
            // 
            // splitContainer.Panel2
            // 
            this.splitContainer.Panel2.Controls.Add(this.richTextBox_Right);
            this.splitContainer.Size = new System.Drawing.Size(818, 310);
            this.splitContainer.SplitterDistance = 409;
            this.splitContainer.TabIndex = 5;
            // 
            // richTextBox_Left
            // 
            this.richTextBox_Left.Location = new System.Drawing.Point(4, 3);
            this.richTextBox_Left.Name = "richTextBox_Left";
            this.richTextBox_Left.Size = new System.Drawing.Size(400, 302);
            this.richTextBox_Left.TabIndex = 0;
            this.richTextBox_Left.Text = "";
            this.richTextBox_Left.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.richTextBox_Left_MouseDoubleClick);
            this.richTextBox_Left.MouseUp += new System.Windows.Forms.MouseEventHandler(this.richTextBox_Left_MouseUp);
            // 
            // richTextBox_Right
            // 
            this.richTextBox_Right.Location = new System.Drawing.Point(3, 3);
            this.richTextBox_Right.Name = "richTextBox_Right";
            this.richTextBox_Right.Size = new System.Drawing.Size(396, 302);
            this.richTextBox_Right.TabIndex = 0;
            this.richTextBox_Right.Text = "";
            // 
            // panel_Control
            // 
            this.panel_Control.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel_Control.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel_Control.Controls.Add(this.btnChange);
            this.panel_Control.Controls.Add(this.lbStatus);
            this.panel_Control.Controls.Add(this.cbbTo);
            this.panel_Control.Controls.Add(this.cbbFrom);
            this.panel_Control.Controls.Add(this.label1);
            this.panel_Control.Location = new System.Drawing.Point(3, 3);
            this.panel_Control.Name = "panel_Control";
            this.panel_Control.Size = new System.Drawing.Size(818, 68);
            this.panel_Control.TabIndex = 4;
            // 
            // btnChange
            // 
            this.btnChange.Location = new System.Drawing.Point(297, 23);
            this.btnChange.Name = "btnChange";
            this.btnChange.Size = new System.Drawing.Size(43, 26);
            this.btnChange.TabIndex = 6;
            this.btnChange.Text = "<=>";
            this.btnChange.UseVisualStyleBackColor = true;
            this.btnChange.Click += new System.EventHandler(this.btnChange_Click);
            // 
            // lbStatus
            // 
            this.lbStatus.AutoSize = true;
            this.lbStatus.Location = new System.Drawing.Point(612, 26);
            this.lbStatus.Name = "lbStatus";
            this.lbStatus.Size = new System.Drawing.Size(0, 18);
            this.lbStatus.TabIndex = 5;
            // 
            // cbbTo
            // 
            this.cbbTo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbbTo.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbbTo.FormattingEnabled = true;
            this.cbbTo.Items.AddRange(new object[] {
            "Afrikaans",
            "Albanian",
            "Arabic",
            "Belarusian",
            "Bulgarian",
            "Catalan",
            "Chinese",
            "Croatian",
            "Czech",
            "Danish",
            "Dutch",
            "English",
            "Estonian",
            "Filipino",
            "Finnish",
            "French",
            "Galician",
            "German",
            "Greek",
            "Haitian Creole",
            "Hebrew",
            "Hindi",
            "Hungarian",
            "Icelandic",
            "Indonesian",
            "Irish",
            "Italian",
            "Japanese",
            "Korean",
            "Latvian",
            "Lithuanian",
            "Macedonian",
            "Malay",
            "Maltese",
            "Norwegian",
            "Persian",
            "Polish",
            "Portuguese",
            "Romanian",
            "Russian",
            "Serbian",
            "Slovak",
            "Slovenian",
            "Spanish",
            "Swahili",
            "Swedish",
            "Thai",
            "Turkish",
            "Ukrainian",
            "Vietnamese",
            "Welsh",
            "Yiddish"});
            this.cbbTo.Location = new System.Drawing.Point(368, 23);
            this.cbbTo.Name = "cbbTo";
            this.cbbTo.Size = new System.Drawing.Size(121, 26);
            this.cbbTo.Sorted = true;
            this.cbbTo.TabIndex = 4;
            // 
            // cbbFrom
            // 
            this.cbbFrom.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbbFrom.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbbFrom.FormattingEnabled = true;
            this.cbbFrom.Items.AddRange(new object[] {
            "Afrikaans",
            "Albanian",
            "Arabic",
            "Belarusian",
            "Bulgarian",
            "Catalan",
            "Chinese",
            "Croatian",
            "Czech",
            "Danish",
            "Dutch",
            "English",
            "Estonian",
            "Filipino",
            "Finnish",
            "French",
            "Galician",
            "German",
            "Greek",
            "Haitian Creole",
            "Hebrew",
            "Hindi",
            "Hungarian",
            "Icelandic",
            "Indonesian",
            "Irish",
            "Italian",
            "Japanese",
            "Korean",
            "Latvian",
            "Lithuanian",
            "Macedonian",
            "Malay",
            "Maltese",
            "Norwegian",
            "Persian",
            "Polish",
            "Portuguese",
            "Romanian",
            "Russian",
            "Serbian",
            "Slovak",
            "Slovenian",
            "Spanish",
            "Swahili",
            "Swedish",
            "Thai",
            "Turkish",
            "Ukrainian",
            "Vietnamese",
            "Welsh",
            "Yiddish"});
            this.cbbFrom.Location = new System.Drawing.Point(142, 23);
            this.cbbFrom.Name = "cbbFrom";
            this.cbbFrom.Size = new System.Drawing.Size(121, 26);
            this.cbbFrom.Sorted = true;
            this.cbbFrom.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(32, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(80, 18);
            this.label1.TabIndex = 0;
            this.label1.Text = "Language";
            // 
            // tabWikipedia
            // 
            this.tabWikipedia.Location = new System.Drawing.Point(4, 27);
            this.tabWikipedia.Name = "tabWikipedia";
            this.tabWikipedia.Padding = new System.Windows.Forms.Padding(3);
            this.tabWikipedia.Size = new System.Drawing.Size(824, 438);
            this.tabWikipedia.TabIndex = 2;
            this.tabWikipedia.Text = "Wikipedia";
            this.tabWikipedia.UseVisualStyleBackColor = true;
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.optionToolStripMenuItem,
            this.helpToolStripMenuItem,
            this.aboutToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(832, 24);
            this.menuStrip1.TabIndex = 3;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // optionToolStripMenuItem
            // 
            this.optionToolStripMenuItem.Name = "optionToolStripMenuItem";
            this.optionToolStripMenuItem.Size = new System.Drawing.Size(56, 20);
            this.optionToolStripMenuItem.Text = "Option";
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(44, 20);
            this.helpToolStripMenuItem.Text = "Help";
            // 
            // aboutToolStripMenuItem
            // 
            this.aboutToolStripMenuItem.Name = "aboutToolStripMenuItem";
            this.aboutToolStripMenuItem.Size = new System.Drawing.Size(52, 20);
            this.aboutToolStripMenuItem.Text = "About";
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(832, 495);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "FormMain";
            this.Text = "Google Translator";
            this.Load += new System.EventHandler(this.FormMain_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabDictionary.ResumeLayout(false);
            this.tabDictionary.PerformLayout();
            this.tabTranslate.ResumeLayout(false);
            this.tabTranslate.PerformLayout();
            this.splitContainer.Panel1.ResumeLayout(false);
            this.splitContainer.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer)).EndInit();
            this.splitContainer.ResumeLayout(false);
            this.panel_Control.ResumeLayout(false);
            this.panel_Control.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabDictionary;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem optionToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.TextBox tbResult;
        private System.Windows.Forms.Button btnLookup;
        private System.Windows.Forms.TextBox txtWord;
        private System.Windows.Forms.Button btnListen;
        private System.Windows.Forms.TabPage tabTranslate;
        private System.Windows.Forms.Panel panel_Control;
        private System.Windows.Forms.Button btnChange;
        private System.Windows.Forms.Label lbStatus;
        private System.Windows.Forms.ComboBox cbbTo;
        private System.Windows.Forms.ComboBox cbbFrom;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TabPage tabWikipedia;
        private System.Windows.Forms.ComboBox cbbLanguage;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label tbStatusDIC;
        private System.Windows.Forms.Label lb_Status;
        private System.Windows.Forms.SplitContainer splitContainer;
        private System.Windows.Forms.RichTextBox richTextBox_Left;
        private System.Windows.Forms.RichTextBox richTextBox_Right;
        private System.Windows.Forms.Button bt_FromSpeech;
        private System.Windows.Forms.Button bt_ToSpeech;
    }
}

