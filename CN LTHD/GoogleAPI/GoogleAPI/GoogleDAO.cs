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
            User user = new User();
            try
            {
                var query = googleentiy.Users.Where(u => u.Email == email && u.Password == pass).First();
                user = (User)query;
            }
            catch (Exception e) { }
            return user;
        }
        //public static bool LuuDiaDiem(Store store)
        //{

        //}
        public static int ThemLoaiDiaDiem(string namelocationType)
        {
            LocationType locationtype = new LocationType();
            locationtype.LocationTypeName = namelocationType;
            googleentiy.LocationTypes.InsertOnSubmit(locationtype);
            googleentiy.SubmitChanges();
            return KiemTraLoaiDiaDiem(namelocationType).ID;
        }

        public static LocationType KiemTraLoaiDiaDiem(String nameLocationType)
        {
            LocationType locationType = new LocationType();
            try
            {
                var query = googleentiy.LocationTypes.Single(l => l.LocationTypeName == nameLocationType);
                locationType = (LocationType)query;
            }
            catch (Exception e) { }
            
            return locationType;
        }

        public static int ThemDiaDiem(Location location)
        {
            googleentiy.Locations.InsertOnSubmit(location);
            googleentiy.SubmitChanges();
            return KiemTraDiaDiem(location.LocationName).ID;
        }

        public static Location KiemTraDiaDiem(string nameLocation)
        {
            Location location = new Location();
            try
            {
                var query = googleentiy.Locations.Single(l => l.LocationName.Contains(nameLocation));
                location = (Location)query;
            }
            catch (Exception e) { }
            return location;
        }

        public static void LuuDiaDiemVaNguoiDung(User user, Location location)
        {
            Location loc = KiemTraDiaDiem(location.LocationName);
            Store store = new Store();
            store.UserID = user.ID;
            if (loc.ID != 0)
            {
                store.LocaionID = loc.ID;       
            }
            else
            {
                int index = ThemDiaDiem(location);
                store.LocaionID = index;
            }
            googleentiy.Stores.InsertOnSubmit(store);
            googleentiy.SubmitChanges();
        }

    }
}
