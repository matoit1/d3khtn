﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GoogleService
{
    public class GoogleDAO
    {
        public static GoogleModelDataContext googleentiy = new GoogleModelDataContext();
        public static User DangNhap(string email, string pass)
        {
            User user = new User();
            try
            {
                var query = googleentiy.Users.FirstOrDefault(u => u.Email == email && u.Password == pass);
                user = (User)query;
            }
            catch (Exception e) { }
            return user;
        }

        public static bool DangKy(User us)
        {
            try
            {
                googleentiy.Users.InsertOnSubmit(us);
                googleentiy.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
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
            return locationtype.ID;
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
            return location.ID;
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

        public static Location LayDiaDiemTheoID(int id)
        {
            Location loc = new Location();
            try
            {
                var query = (Location)googleentiy.Locations.FirstOrDefault(lc => lc.ID == id);
                loc = query;
            }
            catch (Exception e) { }
            return loc;
        }

        public static bool LuuDiaDiemVaNguoiDung(int idUser, string nameLoc, string lat, string lng)
        {
            bool result = false;
            try
            {
                Location loc = new Location();
                loc.LocationName = nameLoc;
                loc.Latitude = lat;
                loc.Longitude = lng;

                Store store = new Store();
                store.UserID = idUser;

                int index = ThemDiaDiem(loc);
                store.LocaionID = index;

                googleentiy.Stores.InsertOnSubmit(store);
                googleentiy.SubmitChanges();
                result = true;
            }
            catch (Exception ex)
            {
                result = false;
                Console.WriteLine(ex.Message);
            }
            return result;
        }

        public static bool XoaDiaDiem(Location location)
        {
            bool result = false;
            try
            {
                var query = googleentiy.Locations.Where(l => l.LocationName.Contains(location.LocationName) && l.LocationType == location.LocationType).Single();
                googleentiy.Locations.DeleteOnSubmit(query);
                googleentiy.SubmitChanges();
            }
            catch (Exception e) { }
            return result;
        }

        public static List<LocationType> LayDanhSachLoaiDiaDiem()
        {
            List<LocationType> listLocationType = new List<LocationType>();
            try
            {
                var query = googleentiy.LocationTypes.ToList();
                listLocationType = query.ToList();
            }
            catch (Exception e) { }
            return listLocationType;
        }

        public static List<Location> LayDanhSachDiaDiemTheoNguoiDung(int idUser)
        {
            List<Store> listStore = new List<Store>();
            List<Location> listLocation = new List<Location>();
            try
            {
                var query = googleentiy.Stores.Where(ls => ls.UserID == idUser);
                listStore = query.ToList();
                foreach (Store stor in listStore)
                {
                    Location loc = LayDiaDiemTheoID(stor.LocaionID);
                    listLocation.Add(loc);
                }
            }
            catch (Exception e) { }
            return listLocation;
        }

        public static List<Location> LayDanhSachDiaDiem()
        {
            List<Location> listLocation = new List<Location>();
            try
            {
                var query = googleentiy.Locations.ToList();
                listLocation = query;
            }
            catch (Exception e)
            {
                listLocation = new List<Location>();
            }
            return listLocation;
        }
    }
}
