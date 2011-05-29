<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	XemChiTietSanPham
    <script type="text/javascript" src="../../Scripts/jquery-1.4.4.min.js">
        $("btn_Comment").click(function () {
            $("txt_NoiDung").append("vdsfvs");
        }
        );
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% DauGia.Models.SanPham sp = (DauGia.Models.SanPham)ViewData["SanPhamChiTiet"]; %>
    <%List<DauGia.Models.Comment> cm = (List<DauGia.Models.Comment>)ViewData["DanhSachCommnet"];  %>
    <%List<DauGia.Models.TaiKhoan> dsTaiKhoan = (List<DauGia.Models.TaiKhoan>)ViewData["TaiKhoanComment"];%>
    
<div>
   <div class="leftColumn">
       <img src="../../Content/imagesanpham/<%=sp.HinhAnh %>" alt="Không có ảnh trong dữ liệu" />
       
  <%-- </div>
   <div class="rightColumn">--%>
       <div class="row">
            Tên Sản Phẩm:<b> <%=sp.TenSanPham %> </b>
       </div>
       <div class="row">
            Loại Sản Phẩm:<b> <%=sp.LoaiSanPham.TenLoaiSanPham %> </b>
       </div>
       <div class="row">
            Giá Khởi Điểm:<b> <%=sp.GiaKhoiDiem %> </b>
       </div>
       <div class="row" >
            Giá Hiện Tại:<b> <%=sp.GiaHienTai %> </b>
       </div>
       <div class="row" >
            Thòi Điểm Đăng:<b> <%=sp.NgayDang.ToString() %> </b>
       </div>
       <div class="row" >
            Thời Điểm Hết Hạn:<b> <%=sp.NgayHetHan.ToString() %> </b>
       </div>
       <div class="comment">
            <h4 style="border-style:solid; background-color:Silver">Các bài bình luận</h4>
            <div>&nbsp</div>
            <%for (int i = 0; i < cm.Count; i++)
              { %>
              <b>Được gửi bởi: <%=dsTaiKhoan[i].TenTaiKhoan %></b><div></div>
              <b>Gửi lúc: <%=cm[i].NgayComment.Value.ToLocalTime() %></b>
              <p><%=cm[i].NoiDungComment %></p>
            <%} %> 
            <table id="tb_Comment" style=" border-style:none; height:300"  border="1" class="comment" >
                <tr style="width:20% ; height:30%">
                    <td>Tiêu đề</td>
                    <td><input type="text" id="txt_TieuDe" style="width:100%;height:100%" value="<%=sp.TenSanPham %>" /></td>
                </tr>
                <tr>
                    <td rowspan="2">Nội dung</td>
                    <td rowspan="2"><input type="text" id="txt_NoiDung" 
                            style="width:100%;height:193px"/></td>
                </tr>
            </table>
            <div>
            <input name="btn_Comment" type="submit" id="btn_Comment" value="Gửi bài" />
            <% %>
            </div>
       </div>
   </div>
</div>
</asp:Content>
