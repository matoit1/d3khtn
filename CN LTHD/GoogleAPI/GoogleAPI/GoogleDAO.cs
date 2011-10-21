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
            var query = googleentiy.Users.Where(u => u.Email == email && u.Password == pass).First();
            User user = (User)query;
            return user;
        }
    }
}
