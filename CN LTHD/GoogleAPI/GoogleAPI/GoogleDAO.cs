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
            var query = (User)googleentiy.Users.Select(u => u.Email == email && u.Password == pass);
            return query;
        }
    }
}
