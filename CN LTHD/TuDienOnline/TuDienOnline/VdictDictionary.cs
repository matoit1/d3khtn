using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HtmlAgilityPack;
using System.Net;
using System.Text.RegularExpressions;


namespace TuDienOnline
{
    class VdictDictionary
    {

        public String KeyWord
        {
            get;
            set;
        }
        public String Result
        {
            get;
            set;
        }
        public int ID
        {
            get;
            set;
        }

        public VdictDictionary()
        {
            KeyWord = "Hello";
            Result = "No result.";
            ID = 1;
        }
        public void LookUp()
        {
            try
            {
                String url = "http://v2.vdict.com/" + KeyWord + "," + ID.ToString() + ",0,0.html";
                HtmlWeb hw = new HtmlWeb();
                HtmlAgilityPack.HtmlDocument doc = hw.Load(url);

                string s = "";
                HtmlNode nc = doc.DocumentNode.SelectSingleNode("//td[@class='resultContent']");
                s = nc.InnerHtml;
                s = Regex.Replace(s, "<div class=\"phanloai\">", "***").Trim();
                s = Regex.Replace(s, "</div>", " \r\n");
                s = Regex.Replace(s, "<b>", " +");
                s = Regex.Replace(s, "</b>", "\r\n");
                s = Regex.Replace(s, "<li>", "   ");
                s = Regex.Replace(s, "<br>", " --> ");
                s = Regex.Replace(s, "</li>", " \r\n");
                s = Regex.Replace(s, "<.*?>", String.Empty).Trim();
                Result = s;
                    
              
            }
            catch (Exception e)
            {
            }
            //txtNews.Text = s;
        }
    }
}
