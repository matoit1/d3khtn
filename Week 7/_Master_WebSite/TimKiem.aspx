<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TimKiem.aspx.cs" Inherits="TimKiem" Title="Tìm kiếm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span class="Apple-style-span" 
        style="border-collapse: separate; color: rgb(0, 0, 0); font-family: Arial, Tahoma; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; font-size: medium; ">
    <span class="Apple-style-span" 
        style="color: rgb(77, 77, 77); font-size: 12px; ">
    <div class="fr" style="font-family: Arial, Tahoma; float: right; ">
        <ul style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style-type: none; list-style-position: initial; list-style-image: initial; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;">
            <li class="bar search" 
                style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; background-image: none; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; background-position: initial initial; background-repeat: initial initial;">
                <div class="search_form" 
                    style="font-family: Arial, Tahoma; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(179, 179, 179); border-right-color: rgb(179, 179, 179); border-bottom-color: rgb(179, 179, 179); border-left-color: rgb(179, 179, 179); border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; margin-top: 5px; margin-right: 5px; margin-bottom: 5px; margin-left: 5px; height: 21px; overflow-x: hidden; overflow-y: hidden; float: left; background-position: initial initial; background-repeat: initial initial;">
                    <div class="select" style="font-family: Arial, Tahoma; float: left; ">
                        <select class="form_control" name="D1" onchange="changeSearchType(this.value)" 
                            style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: none; border-right-style: none; border-bottom-style: none; border-left-style: none; padding-top: 1px; padding-right: 1px; padding-bottom: 1px; padding-left: 1px; font-size: 13px; font-weight: normal; border-width: initial; border-color: initial; background-position: initial initial; background-repeat: initial initial;">
                            <span class="Apple-converted-space"></span>
                            <option selected="selected" style="font-family: Arial, Tahoma; " value="0">Sản phẩm
                            </option>
                            <span class="Apple-converted-space"></span>
                            <option style="font-family: Arial, Tahoma; " value="1">Rao vặt</option>
                            <span class="Apple-converted-space"></span>
                            <option style="font-family: Arial, Tahoma; " value="2">Hỏi đáp</option>
                            <span class="Apple-converted-space"></span>
                            <option style="font-family: Arial, Tahoma; " value="3">Đánh giá</option>
                            <span class="Apple-converted-space"></span>
                            <option style="font-family: Arial, Tahoma; " value="4">Cửa hàng</option>
                            <span class="Apple-converted-space"></span>
                            <option style="font-family: Arial, Tahoma; " value="5">B.Đ.S</option>
                            <span class="Apple-converted-space"></span>
                        </select></div>
                    <div class="text" style="font-family: Arial, Tahoma; float: left; ">
                        <input autocomplete="off" 
                            class="form_control search_keyword none_category ac_input form_control_null_value" 
                            maxlength="100" name="keyword" onblur="keywordBlur($(this))" 
                            onfocus="keywordFocus($(this))" 
                            style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: rgb(255, 255, 255); border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-top-style: none; border-right-style: none; border-bottom-style: none; border-left-style: none; padding-top: 2px; padding-right: 2px; padding-bottom: 2px; padding-left: 2px; font-size: 13px; font-weight: normal; color: rgb(187, 187, 187); border-width: initial; border-color: initial; width: 544px; background-position: initial initial; background-repeat: initial initial;" 
                            title="Bạn hãy gõ Tiếng Việt có dấu" type="text" value="" /></div>
                    <div class="button" style="font-family: Arial, Tahoma; float: left; ">
                        <input style="font-family: Arial, Tahoma; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px;  background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; border-top-style: none; border-right-style: none; border-bottom-style: none; border-left-style: none; border-width: initial; border-color: initial; width: 26px; height: 21px; background-position: initial initial; background-repeat: no-repeat no-repeat;" 
                            title="Tìm kiếm" type="submit" value="" /> </a></div>
                  
                </div>
            </li>
            <li class="bar" 
                style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; ">
                <a class="bar_link menu_current" href="TrangChu.aspx" 
                    module="product" 
                    style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(72, 139, 218); float: left; line-height: 33px; height: 33px;  background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; font-weight: bold; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 8px; background-position: 0% 50%; background-repeat: no-repeat no-repeat;">
                <span style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; cursor: pointer; padding-top: 0px; padding-right: 8px; padding-bottom: 0px; padding-left: 0px;  background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; background-position: 100% 50%; background-repeat: no-repeat no-repeat;">
                Sản phẩm</span></a></li>
            <li class="bar" 
                style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; ">
                <a class="bar_link menu" href="" module="raovat" 
                    style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(255, 255, 255); float: left; line-height: 33px; height: 33px; ">
                <span style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; cursor: pointer; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 6px; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; background-position: 100% 50%; background-repeat: no-repeat no-repeat;">
                Rao vặt</span></a></li>
            <li class="bar" 
                style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; ">
                <a class="bar_link menu" href="" module="hoidap" 
                    style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(255, 255, 255); float: left; line-height: 33px; height: 33px; ">
                <span style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; cursor: pointer; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 6px;background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; background-position: 100% 50%; background-repeat: no-repeat no-repeat;">
                Hỏi đáp</span></a></li>
            <li class="bar" 
                style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; ">
                <a class="bar_link menu" href="" 
                    style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(255, 255, 255); float: left; line-height: 33px; height: 33px; ">
                <span style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; cursor: pointer; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 6px;  background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; background-position: 100% 50%; background-repeat: no-repeat no-repeat;">
                Cửa hàng</span></a></li>
            <li class="bar" 
                style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; ">
                <a class="bar_link menu_more" href="" rel="nofollow" 
                    style="font-family: Arial, Tahoma; text-decoration: none; color: rgb(255, 255, 255); float: left; line-height: 33px; height: 33px; ">
                <span style="font-family: Arial, Tahoma; float: left; line-height: 33px; height: 33px; cursor: pointer; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 6px; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; background-position: 100% 50%; background-repeat: no-repeat no-repeat;">
                Thêm</span></a></li>
        </ul>
    </div>
    </span></span>
    <br class="Apple-interchange-newline" />
</asp:Content>

