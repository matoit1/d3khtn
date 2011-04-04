<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangKi.aspx.cs" Inherits="DangKi" Title="Đăng kí" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span class="Apple-style-span" 
        style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Arial, Tahoma; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; font-size: medium; ">
    <span class="Apple-style-span" 
        style="color: rgb(77, 77, 77); font-size: 12px; ">
    <table align="center" cellpadding="0" cellspacing="0" class="form_table" 
        style="font-family: Arial, Tahoma; ">
        <tbody style="font-family: Arial, Tahoma; ">
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name_top" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 7px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; vertical-align: top; ">
                    <span class="form_asterisk" 
                        style="font-family: Arial, Tahoma; color: rgb(255, 51, 0); ">*</span><span 
                        class="Apple-converted-space">&nbsp;</span>Tên truy cập :</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <div style="font-family: Arial, Tahoma; ">
                        <input id="use_loginname" class="form_control" name="use_loginname" 
                            onblur="checkAvailability()" 
                            style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; width: 300px; background-position: 0% 0%; background-repeat: repeat no-repeat;" 
                            title="Tên truy cập" type="text" value="" /></div>
                    <div class="form_text_warning" 
                        style="font-family: Arial, Tahoma; font-size: 11px; margin-top: 3px; ">
                        - Tên truy cập phải có ít nhất 4 ký tự (chữ, số, ký tự _, viết liền, không dấu).<br 
                            style="font-family: Arial, Tahoma; " />
                        - Nếu đăng ký gian hàng, xin hãy lấy tên phù hợp với Công ty của bạn.<br 
                            style="font-family: Arial, Tahoma; " />
                        - Ví dụ: Công ty TNHH Trần Anh thì nên lấy tên &quot;trananh&quot;<br 
                            style="font-family: Arial, Tahoma; " />
                        - Tên gian hàng sẽ được hiển thị http://www.vatgia.com/trananh</div>
                </td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name_top" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 7px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; vertical-align: top; ">
                    <span class="form_asterisk" 
                        style="font-family: Arial, Tahoma; color: rgb(255, 51, 0); ">*</span><span 
                        class="Apple-converted-space">&nbsp;</span>Mật khẩu :</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <div style="font-family: Arial, Tahoma; ">
                        <input id="use_password" class="form_control" maxlength="50" 
                            name="use_password" onblur="checkPasswordMatch()" 
                            style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; width: 300px; background-position: 0% 0%; background-repeat: repeat no-repeat;" 
                            title="Mật khẩu" type="password" /></div>
                    <div class="form_text_warning" 
                        style="font-family: Arial, Tahoma; font-size: 11px; margin-top: 3px; ">
                        - Mật khẩu phải có ít nhất 6 ký tự.<br style="font-family: Arial, Tahoma; " />
                        - Gần đây có nhiều trường hợp bị chiếm đoạt tài khoản sử dụng vào mục đích<span 
                            class="Apple-converted-space">&nbsp;</span><span class="form_errorMsg" 
                            style="font-family: Arial, Tahoma; color: rgb(255, 0, 0); ">vi phạm pháp 
                        luật</span>. Do vậy:<br style="font-family: Arial, Tahoma; " />
                        - Bạn không được đặt mật khẩu quá đơn giản, dễ đoán (vd:<span 
                            class="Apple-converted-space">&nbsp;</span><span class="form_errorMsg" 
                            style="font-family: Arial, Tahoma; color: rgb(255, 0, 0); ">123456, 
                        vatgia,...</span>)<br style="font-family: Arial, Tahoma; " />
                        - Không được trùng với Tên truy cập, Email, Điện thoại cố định, Điện thoại di 
                        động,...</div>
                </td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <font class="form_asterisk" 
                        style="font-family: Arial, Tahoma; color: rgb(255, 51, 0); ">*<span 
                        class="Apple-converted-space">&nbsp;</span></font>Xác nhận mật khẩu :</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <input id="use_confirm_password" class="form_control" maxlength="50" 
                        name="use_confirm_password" 
                        style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; width: 300px; background-position: 0% 0%; background-repeat: repeat no-repeat;" 
                        title="Xác nhận mật khẩu" type="password" value="" /></td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <font class="form_asterisk" 
                        style="font-family: Arial, Tahoma; color: rgb(255, 51, 0); ">*<span 
                        class="Apple-converted-space">&nbsp;</span></font>Họ và tên :</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <input id="use_name" autocomplete="off" class="form_control" maxlength="255" 
                        name="use_name" 
                        style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; width: 300px; background-position: 0% 0%; background-repeat: repeat no-repeat;" 
                        title="Họ và tên" type="text" value="" /></td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <font class="form_asterisk" 
                        style="font-family: Arial, Tahoma; color: rgb(255, 51, 0); ">*<span 
                        class="Apple-converted-space">&nbsp;</span></font>Email :</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <input id="use_email" autocomplete="off" class="form_control" maxlength="255" 
                        name="use_email" 
                        style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; width: 300px; background-position: 0% 0%; background-repeat: repeat no-repeat;" 
                        title="Email" type="text" value="" /><div class="form_text_warning" 
                        style="font-family: Arial, Tahoma; font-size: 11px; margin-top: 3px; ">
                        Email bạn nhập phải tồn tại, chúng tôi sẽ gửi mã kích hoạt vào email đó.</div>
                </td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <font class="form_asterisk" 
                        style="font-family: Arial, Tahoma; color: rgb(255, 51, 0); ">*<span 
                        class="Apple-converted-space">&nbsp;</span></font>Xác nhận Email :</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <input id="use_confirm_email" autocomplete="off" class="form_control" 
                        maxlength="255" name="use_confirm_email" 
                        style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; width: 300px; background-position: 0% 0%; background-repeat: repeat no-repeat;" 
                        title="Xác nhận Email" type="text" value="" /></td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <font class="form_asterisk" 
                        style="font-family: Arial, Tahoma; color: rgb(255, 51, 0); ">*<span 
                        class="Apple-converted-space">&nbsp;</span></font>Giới tính :</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <select id="use_gender" class="form_control" name="use_gender" size="1" 
                        style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; background-position: 0% 0%; background-repeat: repeat no-repeat;" 
                        title="Giới tính">
                        <option selected="selected" style="font-family: Arial, Tahoma; " 
                            title="- Chọn -" value="-1">- Chọn -</option>
                        <option style="font-family: Arial, Tahoma; " title="Nam" value="1">Nam</option>
                        <option style="font-family: Arial, Tahoma; " title="Nữ" value="0">Nữ</option>
                    </select></td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <span class="form_asterisk" 
                        style="font-family: Arial, Tahoma; color: rgb(255, 51, 0); ">*</span><span 
                        class="Apple-converted-space">&nbsp;</span>Ngày sinh :</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <select id="birth_day" class="form_control" name="birth_day" 
                        style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; background-position: 0% 0%; background-repeat: repeat no-repeat;">
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="0">Ngày</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1">01</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2">02</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="3">03</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="4">04</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="5">05</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="6">06</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="7">07</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="8">08</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="9">09</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="10">10</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="11">11</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="12">12</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="13">13</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="14">14</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="15">15</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="16">16</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="17">17</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="18">18</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="19">19</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="20">20</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="21">21</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="22">22</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="23">23</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="24">24</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="25">25</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="26">26</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="27">27</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="28">28</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="29">29</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="30">30</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="31">31</option>
                        <span class="Apple-converted-space"></span>
                    </select><span class="Apple-converted-space">&nbsp;</span>-<span 
                        class="Apple-converted-space">&nbsp;</span><select id="birth_month" 
                        class="form_control" name="birth_month" 
                        style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; background-position: 0% 0%; background-repeat: repeat no-repeat;">
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="0">Tháng</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1">01</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2">02</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="3">03</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="4">04</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="5">05</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="6">06</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="7">07</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="8">08</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="9">09</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="10">10</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="11">11</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="12">12</option>
                        <span class="Apple-converted-space"></span>
                    </select><span class="Apple-converted-space">&nbsp;</span>-<span 
                        class="Apple-converted-space">&nbsp;</span><select id="birth_year" 
                        class="form_control" name="birth_year" 
                        style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; background-position: 0% 0%; background-repeat: repeat no-repeat;">
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="0">Năm</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1950">1950</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1951">1951</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1952">1952</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1953">1953</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1954">1954</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1955">1955</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1956">1956</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1957">1957</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1958">1958</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1959">1959</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1960">1960</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1961">1961</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1962">1962</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1963">1963</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1964">1964</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1965">1965</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1966">1966</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1967">1967</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1968">1968</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1969">1969</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1970">1970</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1971">1971</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1972">1972</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1973">1973</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1974">1974</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1975">1975</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1976">1976</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1977">1977</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1978">1978</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1979">1979</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1980">1980</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1981">1981</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1982">1982</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1983">1983</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1984">1984</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1985">1985</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1986">1986</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1987">1987</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1988">1988</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1989">1989</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1990">1990</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1991">1991</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1992">1992</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1993">1993</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1994">1994</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1995">1995</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1996">1996</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1997">1997</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1998">1998</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="1999">1999</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2000">2000</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2001">2001</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2002">2002</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2003">2003</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2004">2004</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2005">2005</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2006">2006</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2007">2007</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2008">2008</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2009">2009</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2010">2010</option>
                        <span class="Apple-converted-space"></span>
                        <option style="font-family: Arial, Tahoma; " value="2011">2011</option>
                        <span class="Apple-converted-space"></span>
                    </select><span class="Apple-converted-space">&nbsp;</span>(dd-mm-yyyy)</td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <font class="form_asterisk" 
                        style="font-family: Arial, Tahoma; color: rgb(255, 51, 0); ">*<span 
                        class="Apple-converted-space">&nbsp;</span></font>Tỉnh/ Thành phố :</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <select id="use_province" class="form_control" name="use_province" 
                        onchange="$('#use_province_2').val(this.value)" size="1" 
                        style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: url(http://static.vatgia.com/css/multi_css_v2/standard/form_control_bg.gif); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; background-position: 0% 0%; background-repeat: repeat no-repeat;" 
                        title="Chọn">
                        <option style="font-family: Arial, Tahoma; " value="">--[Chọn]--</option>
                        <option style="font-family: Arial, Tahoma; " title="Hà Nội" value="2">Hà Nội
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Hồ Chí Minh" value="3">Hồ Chí 
                            Minh</option>
                        <option style="font-family: Arial, Tahoma; " title="Hải Phòng" value="32">Hải Phòng
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Đà Nẵng" value="65">Đà Nẵng
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="An Giang" value="4">An Giang
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Bà Rịa - Vũng Tàu" 
                            value="5">Bà Rịa - Vũng Tàu</option>
                        <option style="font-family: Arial, Tahoma; " title="Bắc Cạn" value="14">Bắc Cạn
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Bắc Giang" value="7">Bắc Giang
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Bạc Liêu" value="12">Bạc Liêu
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Bắc Ninh" value="6">Bắc Ninh
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Bến Tre" value="13">Bến Tre
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Bình Dương" value="8">Bình Dương
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Bình Phước" value="10">Bình 
                            Phước</option>
                        <option style="font-family: Arial, Tahoma; " title="Bình Thuận" value="11">Bình 
                            Thuận</option>
                        <option style="font-family: Arial, Tahoma; " title="Bình Định" value="9">Bình Định
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Buôn Mê Thuột" value="66">Buôn 
                            Mê Thuột</option>
                        <option style="font-family: Arial, Tahoma; " title="Cà Mau" value="24">Cà Mau
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Cần Thơ" value="15">Cần Thơ
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Cao Bằng" value="25">Cao Bằng
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Gia Lai" value="26">Gia Lai
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Hà Giang" value="27">Hà Giang
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Hà Nam" value="28">Hà Nam
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Hà Nội 2" value="29">Hà Nội 2
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Hà Tĩnh" value="30">Hà Tĩnh
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Hải Dương" value="31">Hải Dương
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Hậu Giang" value="68">Hậu Giang
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Hoà Bình" value="33">Hoà Bình
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Hưng Yên" value="34">Hưng Yên
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Khánh Hòa" value="17">Khánh Hòa
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Kiên Giang" value="35">Kiên 
                            Giang</option>
                        <option style="font-family: Arial, Tahoma; " title="Kon Tum" value="36">Kon Tum
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Lai Châu" value="37">Lai Châu
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Lâm Đồng" value="38">Lâm Đồng
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Lạng Sơn" value="39">Lạng Sơn
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Lào Cai" value="20">Lào Cai
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Long An" value="40">Long An
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Nam Định" value="23">Nam Định
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Nghệ An" value="41">Nghệ An
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Ninh Bình" value="42">Ninh Bình
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Ninh Thuận" value="43">Ninh 
                            Thuận</option>
                        <option style="font-family: Arial, Tahoma; " title="Phú Thọ" value="44">Phú Thọ
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Phú Yên" value="45">Phú Yên
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Quảng Bình" value="46">Quảng 
                            Bình</option>
                        <option style="font-family: Arial, Tahoma; " title="Quảng Nam" value="47">Quảng Nam
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Quảng Ngãi" value="48">Quảng 
                            Ngãi</option>
                        <option style="font-family: Arial, Tahoma; " title="Quảng Ninh" value="21">Quảng 
                            Ninh</option>
                        <option style="font-family: Arial, Tahoma; " title="Quảng Trị" value="49">Quảng Trị
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Sóc Trăng" value="50">Sóc Trăng
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Sơn La" value="51">Sơn La
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Tây Ninh" value="52">Tây Ninh
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Thái Bình" value="53">Thái Bình
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Thái Nguyên" value="54">Thái 
                            Nguyên</option>
                        <option style="font-family: Arial, Tahoma; " title="Thanh Hoá" value="55">Thanh Hoá
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Thừa Thiên Huế" value="19">Thừa 
                            Thiên Huế</option>
                        <option style="font-family: Arial, Tahoma; " title="Tiền Giang" value="56">Tiền 
                            Giang</option>
                        <option style="font-family: Arial, Tahoma; " title="Trà Vinh" value="57">Trà Vinh
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Tuyên Quang" value="58">Tuyên 
                            Quang</option>
                        <option style="font-family: Arial, Tahoma; " title="Vĩnh Long" value="59">Vĩnh Long
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Vĩnh Phúc" value="60">Vĩnh Phúc
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Yên Bái" value="61">Yên Bái
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Đà Lạt" value="69">Đà Lạt
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Đắc Lắc" value="62">Đắc Lắc
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Đắc Nông" value="67">Đắc Nông
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Đồng Nai" value="22">Đồng Nai
                        </option>
                        <option style="font-family: Arial, Tahoma; " title="Đồng Tháp" value="64">Đồng Tháp
                        </option>
                    </select></td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    &nbsp;</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    &nbsp;</td>
            </tr>
            <tr style="font-family: Arial, Tahoma; ">
                <td class="form_name" 
                    style="font-family: Arial, Tahoma; font-weight: bold; white-space: nowrap; text-align: right; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    &nbsp;</td>
                <td class="form_text" 
                    style="font-family: Arial, Tahoma; text-align: left; padding-top: 4px; padding-right: 5px; padding-bottom: 4px; padding-left: 5px; ">
                    <span class="Apple-style-span" 
                        style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Arial, Tahoma; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; font-size: medium; ">
                    <span class="Apple-style-span" 
                        style="color: rgb(77, 77, 77); font-size: 12px; ">
                    <div class="fr" 
                        style="font-family: Arial, Tahoma; float: left; margin-left: 20px; ">
                        <input id="submit_register" class="form_button" 
                            style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-weight: normal; width: 150px; " 
                            type="submit" value="Đồng ý, đăng ký" /></div>
                    </span></span>
                    <br class="Apple-interchange-newline" />
                </td>
            </tr>
        </tbody>
    </table>
    </span></span>
</asp:Content>

