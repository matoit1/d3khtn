using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GoogleService
{
    public class TaiKhoanDAO
    {
        public static GoogleModelDataContext googleDataContext = new GoogleModelDataContext();

        public bool DangNhap(string email, string password)
        {
            bool result = false;
            User user = new User();
            try
            {
                var query = googleDataContext.Users.FirstOrDefault(u => u.Email == email && u.Password == password);
                user = (User)query;
                if(user != null){
                    result = true;
                }
            }
            catch (Exception e) {
                result = false;
            }
            return result;
        }
    }
}