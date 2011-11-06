using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Net;
using System.IO;
using System.Xml;

namespace GoogleService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    public class Service1 : IService1
    {

        #region IService1 Members

        public bool ThemDiaDiemMoi(string idUser, string nameloc, string type, string lat, string lng)
        {
            BypassCrossDomain();
            int id = int.Parse(idUser);
            if (GoogleDAO.LuuDiaDiemVaNguoiDung(id, nameloc, type, lat, lng))
                return true;
            return false;
        }

        public List<DiaDiem> LayDanhSachDiaDiem()
        {
            BypassCrossDomain();
            List<Location> ds = GoogleDAO.LayDanhSachDiaDiem();
            List<DiaDiem> kq = new List<DiaDiem>();
            for (int i = 0; i < ds.Count; i++)
            {
                DiaDiem dd = new DiaDiem();
                dd.ID = ds[i].ID;
                dd.Lat = ds[i].Latitude;
                dd.Lng = ds[i].Longitude;
                kq.Add(dd);

            }
            return kq;

        }

        public List<DiaDiem> LayDanhSachDiaDiemTheoNguoiDung(string idUser)
        {
            BypassCrossDomain();
            int id = int.Parse(idUser);
            List<DiaDiem> listDiaDiem = new List<DiaDiem>();
            List<Location> listLocation = GoogleDAO.LayDanhSachDiaDiemTheoNguoiDung(id);
            foreach (Location lc in listLocation)
            {
                DiaDiem dd = new DiaDiem();
                dd.ID = lc.ID;
                dd.name = lc.LocationName;
                dd.Lat = lc.Latitude;
                dd.Lng = lc.Longitude;

                listDiaDiem.Add(dd);
            }
            return listDiaDiem;
        }

        private void BypassCrossDomain()
        {
            WebOperationContext.Current.OutgoingResponse.Headers.Add("Access-Control-Allow-Origin", "*");
        }

        //public bool ThemDiaDiem(string idUser, string nameloc)
        //{
        //    string type = "", lat = "", lng = "";
        //    bool result = false;
        //    try
        //    {
        //        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://maps.googleapis.com/maps/api/geocode/xml?sensor=false&address=" + nameloc);
        //        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        //        StreamReader reader = new StreamReader(response.GetResponseStream());
        //        XmlDocument xml = new XmlDocument();
        //        xml.LoadXml(reader.ReadToEnd());
        //        XmlElement root = xml.DocumentElement;
        //        XmlElement status = (XmlElement)root.SelectSingleNode("/GeocodeResponse/status");
        //        if (status.Name == "OK")
        //        {
        //            foreach (XmlElement e in root.ChildNodes)
        //            {
        //                if(e.Name.Equals("result"))
        //                {
        //                    foreach (XmlElement ex in e)
        //                    {
        //                        if (ex.Name.Equals("type"))
        //                        {
        //                            type = ex.InnerText;
        //                        }
        //                        if (ex.Name.Equals("geometry"))
        //                        {
        //                            foreach (XmlElement exx in ex)
        //                            {
        //                                if (exx.Name.Equals("geometry"))
        //                                {

        //                                }
        //                            }
        //                        }
        //                    }
        //                }
        //            }
        //        }

        //    }
        //    catch
        //    {
        //        result = false;
        //    }
        //    return result;
        //}

        public bool XoaDiaDiem(string id)
        {
            BypassCrossDomain();
            bool result = false;
            try
            {
                result = GoogleDAO.XoaDiaDiem(id);  
            }
            catch (Exception e)
            {
                result = false;
            }
            return result;
        }



        #endregion
    }
}
