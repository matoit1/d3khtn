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
            this.cbbLanguage = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnListen = new System.Windows.Forms.Button();
            this.tbResult = new System.Windows.Forms.TextBox();
            this.btnLookup = new System.Windows.Forms.Button();
            this.txtWord = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tabTranslate = new System.Windows.Forms.TabPage();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnChange = new System.Windows.Forms.Button();
            this.lbStatus = new System.Windows.Forms.Label();
            this.cbbTo = new System.Windows.Forms.ComboBox();
            this.cbbFrom = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tabWikipedia = new System.Windows.Forms.TabPage();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.optionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tbStatusDIC = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabDictionary.SuspendLayout();
            this.tabTranslate.SuspendLayout();
            this.panel1.SuspendLayout();
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
            this.tabControl1.Size = new System.Drawing.Size(832, 427);
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
            this.tabDictionary.Size = new System.Drawing.Size(824, 396);
            this.tabDictionary.TabIndex = 0;
            this.tabDictionary.Text = "Dictionary";
            this.tabDictionary.UseVisualStyleBackColor = true;
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
            this.tabTranslate.Controls.Add(this.panel1);
            this.tabTranslate.Location = new System.Drawing.Point(4, 27);
            this.tabTranslate.Name = "tabTranslate";
            this.tabTranslate.Padding = new System.Windows.Forms.Padding(3);
            this.tabTranslate.Size = new System.Drawing.Size(824, 396);
            this.tabTranslate.TabIndex = 1;
            this.tabTranslate.Text = "Translate";
            this.tabTranslate.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.Controls.Add(this.btnChange);
            this.panel1.Controls.Add(this.lbStatus);
            this.panel1.Controls.Add(this.cbbTo);
            this.panel1.Controls.Add(this.cbbFrom);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Location = new System.Drawing.Point(0, 3);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(828, 68);
            this.panel1.TabIndex = 4;
            // 
            // btnChange
            // 
            this.btnChange.Location = new System.Drawing.Point(348, 23);
            this.btnChange.Name = "btnChange";
            this.btnChange.Size = new System.Drawing.Size(43, 26);
            this.btnChange.TabIndex = 6;
            this.btnChange.Text = "<=>";
            this.btnChange.UseVisualStyleBackColor = true;
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
            this.cbbTo.Location = new System.Drawing.Point(429, 23);
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
            this.cbbFrom.Location = new System.Drawing.Point(213, 23);
            this.cbbFrom.Name = "cbbFrom";
            this.cbbFrom.Size = new System.Drawing.Size(121, 26);
            this.cbbFrom.Sorted = true;
            this.cbbFrom.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(397, 26);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(26, 18);
            this.label3.TabIndex = 2;
            this.label3.Text = "To";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(171, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 18);
            this.label2.TabIndex = 1;
            this.label2.Text = "From";
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
            this.tabWikipedia.Size = new System.Drawing.Size(824, 396);
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
            // tbStatusDIC
            // 
            this.tbStatusDIC.AutoSize = true;
            this.tbStatusDIC.Location = new System.Drawing.Point(534, 30);
            this.tbStatusDIC.Name = "tbStatusDIC";
            this.tbStatusDIC.Size = new System.Drawing.Size(0, 18);
            this.tbStatusDIC.TabIndex = 7;
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(832, 453);
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
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
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
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnChange;
        private System.Windows.Forms.Label lbStatus;
        private System.Windows.Forms.ComboBox cbbTo;
        private System.Windows.Forms.ComboBox cbbFrom;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TabPage tabWikipedia;
        private System.Windows.Forms.ComboBox cbbLanguage;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label tbStatusDIC;
    }
}

