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
            this.tbResult = new System.Windows.Forms.TextBox();
            this.btnLookup = new System.Windows.Forms.Button();
            this.txtWord = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tabTranslate = new System.Windows.Forms.TabPage();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.richTextBox_Left = new System.Windows.Forms.RichTextBox();
            this.tbRight = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lbStatus = new System.Windows.Forms.Label();
            this.cbbTo = new System.Windows.Forms.ComboBox();
            this.cbbFrom = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.optionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.btnChange = new System.Windows.Forms.Button();
            this.tabControl1.SuspendLayout();
            this.tabDictionary.SuspendLayout();
            this.tabTranslate.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
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
            this.tabControl1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControl1.Location = new System.Drawing.Point(0, 101);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(832, 353);
            this.tabControl1.TabIndex = 1;
            // 
            // tabDictionary
            // 
            this.tabDictionary.Controls.Add(this.tbResult);
            this.tabDictionary.Controls.Add(this.btnLookup);
            this.tabDictionary.Controls.Add(this.txtWord);
            this.tabDictionary.Controls.Add(this.label4);
            this.tabDictionary.Location = new System.Drawing.Point(4, 27);
            this.tabDictionary.Name = "tabDictionary";
            this.tabDictionary.Padding = new System.Windows.Forms.Padding(3);
            this.tabDictionary.Size = new System.Drawing.Size(824, 322);
            this.tabDictionary.TabIndex = 0;
            this.tabDictionary.Text = "Dictionary";
            this.tabDictionary.UseVisualStyleBackColor = true;
            // 
            // tbResult
            // 
            this.tbResult.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tbResult.Location = new System.Drawing.Point(37, 71);
            this.tbResult.Multiline = true;
            this.tbResult.Name = "tbResult";
            this.tbResult.ReadOnly = true;
            this.tbResult.Size = new System.Drawing.Size(551, 227);
            this.tbResult.TabIndex = 3;
            // 
            // btnLookup
            // 
            this.btnLookup.Location = new System.Drawing.Point(289, 13);
            this.btnLookup.Name = "btnLookup";
            this.btnLookup.Size = new System.Drawing.Size(75, 35);
            this.btnLookup.TabIndex = 2;
            this.btnLookup.Text = "Look up";
            this.btnLookup.UseVisualStyleBackColor = true;
            this.btnLookup.Click += new System.EventHandler(this.btnLookup_Click);
            // 
            // txtWord
            // 
            this.txtWord.Location = new System.Drawing.Point(96, 18);
            this.txtWord.Name = "txtWord";
            this.txtWord.Size = new System.Drawing.Size(167, 24);
            this.txtWord.TabIndex = 1;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(20, 21);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(70, 18);
            this.label4.TabIndex = 0;
            this.label4.Text = "KeyWord";
            // 
            // tabTranslate
            // 
            this.tabTranslate.Controls.Add(this.splitContainer1);
            this.tabTranslate.Location = new System.Drawing.Point(4, 27);
            this.tabTranslate.Name = "tabTranslate";
            this.tabTranslate.Padding = new System.Windows.Forms.Padding(3);
            this.tabTranslate.Size = new System.Drawing.Size(824, 322);
            this.tabTranslate.TabIndex = 1;
            this.tabTranslate.Text = "Translate";
            this.tabTranslate.UseVisualStyleBackColor = true;
            // 
            // splitContainer1
            // 
            this.splitContainer1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(3, 3);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.richTextBox_Left);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.tbRight);
            this.splitContainer1.Size = new System.Drawing.Size(818, 316);
            this.splitContainer1.SplitterDistance = 394;
            this.splitContainer1.TabIndex = 0;
            // 
            // richTextBox_Left
            // 
            this.richTextBox_Left.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.richTextBox_Left.Location = new System.Drawing.Point(3, 3);
            this.richTextBox_Left.Name = "richTextBox_Left";
            this.richTextBox_Left.Size = new System.Drawing.Size(384, 306);
            this.richTextBox_Left.TabIndex = 0;
            this.richTextBox_Left.Text = "";
            this.richTextBox_Left.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.richTextBox_Left_MouseDoubleClick);
            this.richTextBox_Left.MouseUp += new System.Windows.Forms.MouseEventHandler(this.richTextBox_Left_MouseUp);
            // 
            // tbRight
            // 
            this.tbRight.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tbRight.Location = new System.Drawing.Point(7, 3);
            this.tbRight.Multiline = true;
            this.tbRight.Name = "tbRight";
            this.tbRight.Size = new System.Drawing.Size(408, 306);
            this.tbRight.TabIndex = 1;
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
            this.panel1.Location = new System.Drawing.Point(0, 27);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(828, 68);
            this.panel1.TabIndex = 2;
            // 
            // lbStatus
            // 
            this.lbStatus.AutoSize = true;
            this.lbStatus.Location = new System.Drawing.Point(612, 26);
            this.lbStatus.Name = "lbStatus";
            this.lbStatus.Size = new System.Drawing.Size(0, 13);
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
            // btnChange
            // 
            this.btnChange.Location = new System.Drawing.Point(357, 23);
            this.btnChange.Name = "btnChange";
            this.btnChange.Size = new System.Drawing.Size(34, 26);
            this.btnChange.TabIndex = 6;
            this.btnChange.Text = "<=>";
            this.btnChange.UseVisualStyleBackColor = true;
            this.btnChange.Click += new System.EventHandler(this.btnChange_Click);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(832, 453);
            this.Controls.Add(this.panel1);
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
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.Panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
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
        private System.Windows.Forms.TabPage tabTranslate;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.ComboBox cbbTo;
        private System.Windows.Forms.ComboBox cbbFrom;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem optionToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aboutToolStripMenuItem;
        private System.Windows.Forms.TextBox tbResult;
        private System.Windows.Forms.Button btnLookup;
        private System.Windows.Forms.TextBox txtWord;
        private System.Windows.Forms.TextBox tbRight;
        private System.Windows.Forms.Label lbStatus;
        private System.Windows.Forms.RichTextBox richTextBox_Left;
        private System.Windows.Forms.Button btnChange;
    }
}

