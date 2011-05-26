<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% List<DauGia.Models.SanPham> ds=(List<DauGia.Models.SanPham>)ViewData["DanhSachSanPham"]; %>
 <%--   <% DauGia.Models.DauGiaDataContext data=new DauGia.Models.DauGiaDataContext (); %>--%>
    <% if (ds.Count > 0)
       { %>
     <% for (int i = 0; i < 3; i++)
        { %>
        <div style="height:250px ; margin-top:<%=i*250%>">
            <% for (int j = 0; j < 3; j++)
               { %>
                <div style="float:left; width:250px; margin-left:"<%=j*250%>"; text-align:center ">
                <div>
                <img  src="../../Content/imagesanpham/<%=ds[i*3+j].HinhAnh%>"   alt="Không có hình ảnh trong dữ liệu" style="height:150px ; width:100px"/>
                </div>
                <div>
                <%=Html.ActionLink(ds[i*3+j].TenSanPham,"XemChiTietSanPham/"+ds[i*3+j].MaSanPham.ToString(),"SanPham")%>
                </div>
                </div>
            <% } %> 
        </div>
     <% } %>
    <% } %>
</asp:Content>
