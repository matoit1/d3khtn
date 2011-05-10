<%@ Page CodeBehind="~/Controllers/HomeController.cs" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>
<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <% List<D3.Models.SanPham> ds=(List<D3.Models.SanPham>)ViewData["DanhSachSanPham"]; %>
    <% D3.Models.DauGiaDataContext data=new D3.Models.DauGiaDataContext (); %>
    <% if (ds.Count > 0)
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
                <%=Html.ActionLink(ds[i*3+j].MaSanPham,"XemChiTietSanPham/"+ds[i*3+j].MaSanPham,"SanPham")%>
                </div>
                </div>
            <%} %> 
        </div>
     <%} %>
    <%} %>
</asp:Content>
