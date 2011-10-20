<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="google.aspx.cs" Inherits="GoogleAPI.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        <asp:Label ID="Label1" runat="server" Text="SignOut"></asp:Label>
        <div style="width: 60%; float: right; height: 24px;">
            <p style="color: White; height: 35px;">
                <%
                    GoogleAPI.User user = null;
                    if (ViewState["user"] != null)
                    {
                        user = (GoogleAPI.User)ViewState["user"];
                    }
                    if (user == null)
                    {
                %>
                Email<asp:TextBox ID="txb_Email" runat="server" Style="margin-left: 9px" />
                Mật khẩu<asp:TextBox ID="txb_MatKhau" TextMode="Password" runat="server" Style="margin-left: 9px" />
                <asp:Button ID="btn_DangNhap" Text="Đăng nhập" runat="server" Style="margin-left: 16px"
                    OnClick="Unnamed1_Click" />
                <% }
                    else
                    {%>
                <a href="google.aspx?thoat=thoat">
                    <%=txb_Email.Text.Trim() %></a>
                <%} %>
                <a href="signup.aspx">Đăng kí tài khoản</a>
            </p>
        </div>
    </div>
    <div id="TimKiem">
        <div style="width: 27%; float: left; margin-top: 0px; height: 75px;">
            <img src="images/google.png" style="height: 78px; width: 267px" alt=""/>
        </div>
        <div style="float: left; margin-top: 20px; width: 730px;">
            <input id="txb_TenDiaDiem" type="text" />
            <input id="btn_TimDiaDiem" value="Tìm Địa Điểm" type="button" onclick="btn_TimDiaDiem_Click()" />
            <input id="btn_MyLocation" type="button" value="Vị trí của bạn" onclick="btn_MyLocation_Click()" />
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
