using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace GoogleService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        [WebGet(UriTemplate = "ThemDiaDiemMoi/DiaDiem?idUser={idUser}&nameloc={nameLoc}&type={type}&lat={lat}&lng={lng}", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        //http://localhost:2817/Service1.svc/ThemDiaDiem/DiaDiem?idUser=1&nameLoc=123&type=123&lat=543535&lng=432423
        bool ThemDiaDiemMoi(string idUser,string nameloc, string type,string lat, string lng);


        //[OperationContract]
        //[WebGet(UriTemplate = "ThemDiaDiem/DiaDiem?idUser={idUser}&nameloc={nameLoc}", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ////http://localhost:2817/Service1.svc/ThemDiaDiem/DiaDiem?idUser=1&nameLoc=123
        //bool ThemDiaDiem(string idUser, string nameloc);

        [OperationContract]
        [WebGet(UriTemplate = "LayDanhSachDiaDiemTheoNguoiDung?idUser={idUser}", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        //http://localhost:2817/Service1.svc/LayDanhSachDiaDiemTheoNguoiDung?idUser=1
        List<DiaDiem> LayDanhSachDiaDiemTheoNguoiDung(string idUser);

        [OperationContract]
        [WebGet(UriTemplate = "DanhSachDiaDiem", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        //http://localhost:2817/Service1.svc/DanhSachDiaDiem
        List<DiaDiem> LayDanhSachDiaDiem();

        [OperationContract]
        [WebGet(UriTemplate = "XoaDiaDiem?id={id}", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        //http://localhost:2817/Service1.svc/DanhSachDiaDiem
        bool XoaDiaDiem(string id);

    }
}
