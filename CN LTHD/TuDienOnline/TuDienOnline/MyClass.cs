using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Media;

namespace TuDienOnline
{
    public class MyClass
    {
        public static List<string> chiaDoanVan(String translate)
        {
            List<string> kq = new List<string>();

            string[] temp = translate.Split('.', ',', ';', '!', '?');
            for (int i = 0; i < temp.Count(); i++)
            {
                if (temp[i].Length > 0 && temp[i].Length < 100)
                {
                    kq.Add(temp[i]);
                }
            }

            return kq;
        }

        public static List<string> download(List<string> dsDoanVan, string lg, string name)
        {
            List<string> kq = new List<string>();
            try
            {
                WebClient web = new WebClient();
                web.Headers.Add(HttpRequestHeader.UserAgent, "Mozilla/4.0 (compatible; MSIE 9.0; Windows;)");
                string encstr = string.Empty;
                for (int i = 0; i < dsDoanVan.Count; i++)
                {
                    string filename = name + i + ".mp3";
                    kq.Add(filename);
                    string s = dsDoanVan[i];
                    encstr = Uri.EscapeDataString(s);
                    web.DownloadFile("http://translate.google.com/translate_tts?tl=" + lg + "&q=" + encstr, ".\\" + filename);
                }
            }
            catch (Exception ex)
            {

            }
            return kq;
        }

        public static string noifile(List<string> dsFileName)
        {
            string ketQua = "";
            FileStream fs1 = null;
            FileStream fs2 = null;
            try
            {
                ketQua = dsFileName[0];
                fs1 = File.Open(ketQua, FileMode.Append);
                for (int i = 1; i < dsFileName.Count; i++)
                {
                    string temp = dsFileName[i];
                    fs2 = File.Open(temp, FileMode.Open);
                    byte[] fs2Content = new byte[fs2.Length];
                    fs2.Read(fs2Content, 0, (int)fs2.Length);
                    fs1.Write(fs2Content, 0, (int)fs2.Length);
                    fs2.Close();
                }
                fs1.Close();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                if (fs1 != null)
                    fs1.Dispose();
                if (fs2 != null)
                    fs2.Dispose();
            }
            return ketQua;
        }

        public static void doc(string filename)
        {
            try
            {
                WMPLib.WindowsMediaPlayer wplayer = new WMPLib.WindowsMediaPlayer();

                wplayer.URL = filename;
                wplayer.controls.play();
                //File.Delete(filename);
            }
            catch (Exception ex)
            {
            }
            
        }
    }
}
