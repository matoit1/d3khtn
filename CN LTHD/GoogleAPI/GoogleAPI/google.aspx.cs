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
            if (user != null && user.ID != 0)
            {
                Session.Add("user", user);
            }
        }
        //protected void btn_DiaDiemCuaToi_Click(object sender, EventArgs e)
        //{
        //    treeView.Nodes.Clear();
        //    TreeNode root = new TreeNode("Địa điểm");

        //    List<LocationType> listLocationType = GoogleDAO.LayDanhSachLoaiDiaDiem();
        //    User user = (User)Session["user"];
        //    List<Location> myListLocation = new List<Location>();
        //    myListLocation = GoogleDAO.LayDanhSachDiaDiemTheoNguoiDung(user.ID);
        //    foreach (LocationType lsType in listLocationType)
        //    {
        //        TreeNode typeNode = new TreeNode(lsType.LocationTypeName);
        //        foreach (Location loc in myListLocation)
        //        {
        //            if (loc.LocationType == lsType.ID)
        //            {
        //                typeNode.ChildNodes.Add(new TreeNode(loc.LocationName));
        //            }
        //        }
        //        root.ChildNodes.Add(typeNode);
        //    }
        //    treeView.Nodes.Add(root);
        //}

        //protected void treeView_SelectedNodeChanged(object sender, EventArgs e)
        //{
        //    TreeNode parent = treeView.SelectedNode.Parent;
        //    if (!parent.Text.Equals("Địa điểm"))
        //    {   
        //        string name = treeView.SelectedNode.Text;
        //        string script = "<script type=\"text/javascript\" src=\"GoogleMap.js\" >";
        //        script += "findLocation(" + name + ","+false+");</script>";
        //        //Page.RegisterStartupScript("GoogleMap",script);
        //        ClientScript.RegisterStartupScript(this.GetType(), "findlocation", script);
        //    }
        //}
    }
}