<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="GoogleAPI.signup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Google Map - Signup</title>
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
        #txb_HoTen
        {
            width: 179px;
        }
        #txb_Email
        {
            width: 180px;
        }
        #Password1
        {
            width: 180px;
        }
        #Password2
        {
            width: 180px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="width: 100%; float: left; margin-top: 0px; text-align: right; height: 30px;">
        <a href="google.aspx">Trở về trang chủ</a>
            <h2 style="text-align: center">
                ĐĂNG KÍ TÀI KHOẢN</h2>
            
        </div>
        <div>
            <div style="width: 858px; height: 188px">
                <div style="width: 235px; height: 183px; float: left">
                </div>
                <div style="width: 126px; height: 181px;">
                    <br />
                    <br />
                    Họ tên:<br />
                    <br />
                    Email:<br />
                    <br />
                    Mật khẩu:<br />
                    <br />
                    Nhập lại mật khẩu:<br />
                    <br />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
