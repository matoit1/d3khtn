using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace GoogleService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    public class Service1 : IService1
    {

        #region IService1 Members

        public bool ThemDiaDiem(int idUser, string nameLoc, string lat, string lng)
        {
            BypassCrossDomain();
            if (GoogleDAO.LuuDiaDiemVaNguoiDung(idUser, nameLoc, lat, lng))
                return true;
            return false;
        }

        public List<DiaDiem> LayDanhSachDiaDiem()
        {
          //  BypassCrossDomain();
            List<Location> ds= GoogleDAO.LayDanhSachDiaDiem();
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


        private void BypassCrossDomain()
        {

            WebOperationContext.Current.OutgoingResponse.Headers.Add("Access-Control-Allow-Origin", "*");

        }

        #endregion

        #region IService1 Members


        public string Hello()
        {
            //throw new NotImplementedException();
            return "Hello";
        }

        #endregion
    }
}
