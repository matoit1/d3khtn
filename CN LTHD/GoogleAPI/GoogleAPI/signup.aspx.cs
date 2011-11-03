using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoogleAPI
{
    public partial class signup : System.Web.UI.Page
    {
        public string message_error = "";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_DangKy_Click(object sender, EventArgs e)
        {
            User us = new User();
            us.UserName = tb_HoTen.Text.Trim();
            us.Password = tb_MatKhau.Text.Trim();
            us.Email = tb_Email.Text.Trim();

            if (GoogleDAO.DangKy(us))
            {
                Response.Redirect("google.aspx");
            }
            else
            {
                message_error = "Đăng ký thành viên không thành công ! Vui lòng thử lại ...";
            }
        }

    }
}