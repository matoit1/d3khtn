<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	XemDanhSachSanPhamMoiDang
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% List<DauGia.Models.SanPham> dsmd = (List<DauGia.Models.SanPham>)ViewData["DanhSachSanPhamMoiDang"];%>
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
                <img src="<%=dsmd[i*3+j].HinhAnh %>" alt="Không có hình ảnh trong dữ liệu" style="height:150px; width:100px"/>
                </div>
                <div>
                <%=Html.ActionLink(dsmd[i*3+j].TenSanPham,"XemChiTietSanPham/"+dsmd[i*3+j].MaSanPham.ToString(),"SanPham")%>
                </div>
                </div>
            <%} %> 
        </div>
     <%} %>
    <%} %>
  
</asp:Content>
