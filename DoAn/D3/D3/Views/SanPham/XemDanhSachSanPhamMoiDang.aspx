<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	XemDanhSachSanPhamMoiDang
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% List<D3.Models.SanPham> dsmd = (List<D3.Models.SanPham>)ViewData["DanhSachSanPhamMoiDang"];%>
<div style="height:30px">
   <div style="float:left;  vertical-align:middle; text-align:center; margin-left:300px; font-size:x-large"><%=Html.Encode(ViewData["Title"]) %></div>
   <div style="float:left"><%=Html.ActionLink(">> Xem Danh Sách Sản Phẩm Đấu Giá Nhiều Nhất","XemDanhSachSanPhamDauGiaNhieuNhat","SanPham")%></div>
</div>
   <% if (dsmd.Count > 0)
       { %>
     <% for (int i = 0; i < 3; i++)
        { %>
        <div style="height:250px ; margin-top:<%=i*250%>">
            <% for (int j = 0; j < 3; j++)
               { %>
                <div style="float:left; width:250px; margin-left:<%=j*250%>; text-align:center ">
                <div>
                <img src="" alt="Không có hình ảnh trong dữ liệu" width=100 height=150/>
                </div>
                <div>
                <%=Html.ActionLink(dsmd[i*3+j].MaSanPham,"XemChiTietSanPham/"+dsmd[i*3+j].MaSanPham,"SanPham")%>
                </div>
                </div>
            <%} %> 
        </div>
     <%} %>
    <%} %>
</asp:Content>
