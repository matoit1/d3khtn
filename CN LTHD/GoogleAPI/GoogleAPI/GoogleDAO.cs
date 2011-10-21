using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GoogleAPI
{
    public class GoogleDAO
    {
        public static GoogleModelDataContext googleentiy = new GoogleModelDataContext();
        public static User DangNhap(string email, string pass)
        {
            var query = (User)googleentiy.Users.Where(u => u.Email == email && u.Password == pass).First();
            return query;
        }
        //public static bool LuuDiaDiem(Store store)
        //{

        //}
        public static void ThemLoaiDiaDiem(LocationType locationType)
        {
            googleentiy.LocationTypes.InsertOnSubmit(locationType);
        }

        public static LocationType KiemTraLoaiDiaDiam(String nameLocationType)
        {
            var query = (LocationType)googleentiy.LocationTypes.Where(l => l.LocationTypeName == nameLocationType);
            return query;
        }

    }
}
