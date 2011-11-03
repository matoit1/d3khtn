<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="GoogleAPI.signup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Google Map - Signup</title>
    <script src="Scripts/myscript.js" type="text/javascript"></script>
    <link href="Styles/mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="DangKy" runat="server">
    <div>
        <div style="width: 100%; float: left; margin-top: 0px; text-align: right; height: 80px;">
            <a href="google.aspx">Trở về trang chủ</a>
            <h2 style="text-align: center">
                ĐĂNG KÍ TÀI KHOẢN</h2>
        </div>
        <%
            if (string.IsNullOrEmpty(message_error))
            {
        %>        
            <p class="message">   
                <%=message_error %>         
            </p>
            <%} %>
        <div style="width: 40%; height: 491px; text-align: left; margin-left: 30%; margin-right: 30%;">
            <fieldset class="register">
                <legend>Thông tin tài khoản</legend>
                <p>
                    <asp:Label ID="lb_HoTen" Text="Họ và tên" AssociatedControlID="tb_HoTen" runat="server"></asp:Label>
                    <asp:TextBox ID="tb_HoTen" runat="server" CssClass="textEntry"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_HoTen" runat="server" ControlToValidate="tb_HoTen"
                        ErrorMessage="Họ tên không được để trống" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cv_HoTen" runat="server" ClientValidationFunction="checkHoTen"
                        ControlToValidate="tb_HoTen" ErrorMessage="Họ tên không được để trống"
                        SetFocusOnError="True">*</asp:CustomValidator>
                </p>
                <p>
                    <asp:Label ID="lb_Email" Text="Email" AssociatedControlID="tb_Email" runat="server"></asp:Label>
                    <asp:TextBox ID="tb_Email" runat="server" CssClass="textEntry"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ControlToValidate="tb_Email"
                        ErrorMessage="Email không được để trống" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cv_Email" runat="server" ClientValidationFunction="checkEmail"
                        ControlToValidate="tb_Email" ErrorMessage="Email không được để trống"
                        SetFocusOnError="True">*</asp:CustomValidator>
                </p>
                <p>
                    <asp:Label ID="lb_Email2" Text="Nhập lại email" AssociatedControlID="tb_Email2" runat="server"></asp:Label>
                    <asp:TextBox ID="tb_Email2" runat="server" CssClass="textEntry"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Email2" runat="server" ControlToValidate="tb_Email2"
                        ErrorMessage="Lặp lại email không được để trống" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv_Email2" runat="server" ControlToCompare="tb_Email2"
                        ControlToValidate="tb_Email2" ErrorMessage="Lặp lại email không đúng"
                        SetFocusOnError="True">*</asp:CompareValidator>
                </p>
                <p>
                    <asp:Label ID="lb_MatKhau" Text="Mật khẩu" AssociatedControlID="tb_MatKhau" runat="server"></asp:Label>
                    <asp:TextBox ID="tb_MatKhau" TextMode="Password" runat="server" CssClass="textEntry"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_MatKhau" runat="server" ControlToValidate="tb_MatKhau"
                        ErrorMessage="Mật khẩu không được để trống" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cv_MatKhau" runat="server" ClientValidationFunction="checkMatKhau"
                        ControlToValidate="tb_MatKhau" ErrorMessage="Mật khẩu phải lớn hơn 6 ký tự" SetFocusOnError="True">*</asp:CustomValidator>
                </p>
                <p>
                    <asp:Label ID="lb_MatKhau2" Text="Nhập lại mật khẩu" AssociatedControlID="tb_MatKhau2"
                        runat="server"></asp:Label>
                    <asp:TextBox ID="tb_MatKhau2" TextMode="Password" runat="server" CssClass="textEntry"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_MatKhau2" runat="server" ControlToValidate="tb_MatKhau2"
                        ErrorMessage="Lặp lại mật khẩu không được để trống" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv_MatKhau2" runat="server" ControlToCompare="tb_MatKhau2"
                        ControlToValidate="tb_MatKhau2" ErrorMessage="Lặp lại mật khẩu không đúng"
                        SetFocusOnError="True">*</asp:CompareValidator>
                </p>
            </fieldset>
            <p style="text-align: center;">
                <asp:Button ID="bt_DangKy" CausesValidation="true" Text="Đăng ký" runat="server" OnClick="bt_DangKy_Click" />
                <asp:Button ID="bt_HuyBo" CausesValidation="false" Text="Hủy bỏ" runat="server" PostBackUrl="~/google.aspx" />
            </p>
        </div>
    </div>
    </form>
</body>
</html>
