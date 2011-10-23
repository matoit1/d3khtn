<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="google.aspx.cs" Inherits="GoogleAPI.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
    //Lưu người dùng và địa chỉ tìm kiếm
    if (Request.QueryString["thoat"] != null)
    {
        Session.Remove("user");
    }
    GoogleAPI.User user = new GoogleAPI.User();
    user = (GoogleAPI.User)Session["user"];
    if (Request.QueryString["save"] != null && user != null)
    {
        string save = Request.QueryString["save"].ToString();
        if (save.Equals("save"))
        {
            string type = Request.QueryString["type"].ToString();
            string name = Request.QueryString["name"].ToString();
            string lat = Request.QueryString["lat"].ToString();
            string lon = Request.QueryString["long"].ToString();
            GoogleAPI.Location location = new GoogleAPI.Location();
            GoogleAPI.LocationType locationtype = GoogleAPI.GoogleDAO.KiemTraLoaiDiaDiem(type);
            if (locationtype.ID != 0)
            {
                location.LocationType = locationtype.ID;
                location.Latitude = lat;
                location.Longitude = lon;
                location.LocationName = name;
            }
            else
            {
                int index = GoogleAPI.GoogleDAO.ThemLoaiDiaDiem(type);
                location.LocationType = index;
                location.Latitude = lat;
                location.Longitude = lon;
                location.LocationName = name;
            }
            GoogleAPI.GoogleDAO.LuuDiaDiemVaNguoiDung(user, location);
        }
    }
%>

<head runat="server">
    <title>Google Map</title>
    <link href="Styles/mystyle.css" rel="Stylesheet" />
    <script src="Scripts/GoogleMap.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false& language=vi"></script>
    <script src="Scripts/gears_init.js" type="text/javascript"></script>
    <style type="text/css">
        a:link
        {
            color: Red;
        }
        a:visited
        {
            color: Blue;
        }
        a:active
        {
            color: Yellow;
        }
        #txb_TenDiaDiem
        {
            width: 370px;
        }
        #form1
        {
            height: 643px;
        }
    </style>
    
</head>
<body onload="initialize()">
    <form id="form1" runat="server">
    <div id="signin">
        <a href="google.aspx?thoat=thoat">Sign out</a>
        <div style="width: 60%; float: right; height: 24px;">
            <p style="color: White; height: 35px;">
                <%     
                    GoogleAPI.User user = new GoogleAPI.User();
                    user = (GoogleAPI.User)Session["user"];
                    if (user == null)
                    {
                %>
                Email<asp:TextBox ID="txb_Email" runat="server" Style="margin-left: 9px" />
                Mật khẩu<asp:TextBox ID="txb_MatKhau" TextMode="Password" runat="server" Style="margin-left: 9px" />
                <asp:Button ID="btn_DangNhap" Text="Đăng nhập" runat="server" Style="margin-left: 16px"
                    OnClick="Unnamed1_Click" />
                <% }
                    else if (user != null)
                    {%>
                <a href="google.aspx?thoat=thoat">
                    <%=user.Email%></a>
                <%} %>
                <a href="signup.aspx">Đăng kí tài khoản</a>
            </p>
        </div>
    </div>
    <div id="TimKiem">
        <div style="width: 27%; float: left; margin-top: 0px; height: 75px;">
            <img src="images/google.png" alt="#" style="height: 78px; width: 267px" />
        </div>
        <div style="float: left; margin-top: 20px; width: 730px;">
            <input type="text" id="txb_TenDiaDiem" />
            <input type="button" id="btn_TimDiaDiem" value="Tìm Địa Điểm" onclick="btn_TimDiaDiem_Click()" />
            <input type="button" id="btn_MyLocation" value="Vị trí của bạn" onclick="btn_MyLocation_Click()" />
        </div>
    </div>
    <br />
    <div id="map">
    </div>
    <div id="diadiembox">
    </div>
    </form>
</body>
</html>
