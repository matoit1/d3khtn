<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	XemChiTietSanPham
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% DauGia.Models.SanPham sp = (DauGia.Models.SanPham)ViewData["SanPhamChiTiet"]; %>
    <%List<DauGia.Models.Comment> cm = (List<DauGia.Models.Comment>)ViewData["DanhSachCommnet"];  %>
<div>
   <div class="leftColumn">
       <img src="../../Content/imagesanpham/Apple iPhone 4.jpg" alt="Không có ảnh trong dữ liệu" />
  <%-- </div>
   <div class="rightColumn">--%>
       <div class="row">
            Tên Sản Phẩm:<%=sp.TenSanPham %>
       </div>
       <div class="row">
            Loại Sản Phẩm:<%=sp.LoaiSanPham.TenLoaiSanPham %>
       </div>
       <div class="row">
            Giá Khởi Điểm:<%=sp.GiaKhoiDiem %>
       </div>
       <div class="row" >
            Giá Hiện Tại:<%=sp.GiaHienTai %>
       </div>
       <div class="row" >
            Thòi Điểm Đăng:<%=sp.NgayDang.ToString() %>
       </div>
       <div class="row" >
            Thời Điểm Hết Hạn:<%=sp.NgayHetHan.ToString() %>
       </div>
       <div class="commmet">
        <input type="text"  value="<%=cm[0].NoiDungComment %>" name="txb_Comment" style="border:1; background-color:Gray" />
        </div>
   </div>
</div>
</asp:Content>
