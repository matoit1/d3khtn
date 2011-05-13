<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	XemChiTietSanPham
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% D3.Models.SanPham sp = (D3.Models.SanPham)ViewData["SanPhamChiTiet"]; %>
<div>
   <div class="leftColumn">
       <img src="" alt="Không có ảnh trong dữ liệu" />
   </div>
   <div class="rightColumn">
       <div class="row">
            Tên Sản Phẩm:<%=sp.TenSanPham %>
       </div>
       <div class="row">
            Loại Sản Phẩm:<%=sp.LoaiSanPham.TenLoaiSanPham %>
       </div>
       <div class="row">
            Giá Khởi Điểm:<%=sp.GiaKhoiDiem %>
       </div>
       <div class="row">
            Giá Hiện Tại:<%=sp.GiaHienTai %>
       </div>
       <div class="row">
            Thòi Điểm Đăng:<%=sp.NgayDang.ToString() %>
       </div>
       <div class="row">
            Thời Điểm Hết Hạn:<%=sp.NgayHetHan.ToString() %>
       </div>
   </div>
</div>
</asp:Content>
