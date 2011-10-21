using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace GoogleAPI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_MyLocation_Click(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string name = txb_Email.Text.Trim();
            string matKhau = txb_MatKhau.Text.Trim();
            User user = GoogleDAO.DangNhap(name, matKhau);
            Session.Add("user", user);
        }

    }
}