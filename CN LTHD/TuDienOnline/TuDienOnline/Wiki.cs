using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HtmlAgilityPack;
using System.Text.RegularExpressions;

namespace TuDienOnline
{
    class Wiki
    {
        public static List<string> language = new List<string>();
        public string keyWord
        {
            get;
            set;
        }
        public string result
        {
            get;
            set;
        }

        public int ID { get; set; }

        public Wiki()
        {
            ID = 1;
            keyWord = "name";
            result = "no result.";
            language.Clear();
            language.Add("ar");
            language.Add("bg");
            language.Add("ca");
            language.Add("cs");
            language.Add("da");
            language.Add("de");
            language.Add("en");
            language.Add("es");
            language.Add("eo");
            language.Add("eu");
            language.Add("fa");
            language.Add("fr");
            language.Add("ko");
            language.Add("hi");
            language.Add("hr");
            language.Add("id");
            language.Add("it");
            language.Add("he");
            language.Add("lt");
            language.Add("hu");
            language.Add("ms");
            language.Add("nl");
            language.Add("ja");
            language.Add("no");
            language.Add("pl");
            language.Add("pt");
            language.Add("kk");
            language.Add("ro");
            language.Add("ru");
            language.Add("sk");
            language.Add("sl");
            language.Add("sr");
            language.Add("fi");
            language.Add("sv");
            language.Add("tr");
            language.Add("uk");
            language.Add("vi");
            language.Add("vo");
            language.Add("war");
            language.Add("zh");

        }
        public void Search()
        {

            string url = "http://www.wikipedia.org/search-redirect.php?search=" + keyWord + "&language=" + language[ID] ;
            HtmlWeb hw = new HtmlWeb();
            HtmlAgilityPack.HtmlDocument doc = hw.Load(url);

            string s = "";
            result = s;
            HtmlNodeCollection nc = doc.DocumentNode.SelectNodes("//div[@id='bodyContent']/div[@class='mw-content-ltr']/p");
            //HtmlNode nc = doc.DocumentNode.SelectSingleNode("//div[@id='bodyContent']/div[@class='mw-content-ltr']/p[1]");
            foreach (HtmlNode hn in nc)
            {
                s = hn.InnerHtml;
                s = Regex.Replace(s, "<.*?>", String.Empty).Trim();
                s = Regex.Replace(s, "They may refer to:", String.Empty).Trim();
                result = result + "\r\n   " + s;
            }
           
            //result = s;
        }

        
    }
}
