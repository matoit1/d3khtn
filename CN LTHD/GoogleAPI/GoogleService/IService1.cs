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
        [WebInvoke(Method = "POST", UriTemplate = "ThemDiaDiem/DiaDiem?idUser={idUser}&nameLoc={nameLoc}&lat={lat}&lng={lng}",ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        bool ThemDiaDiem(int idUser, string nameLoc, string lat, string lng);

        [OperationContract]
        [WebGet(UriTemplate = "DanhSachDiaDiem", ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        //http://localhost:2817/Service1.svc/DanhSachDiaDiem
        List<DiaDiem> LayDanhSachDiaDiem();
        // TODO: Add your service operations here

        [OperationContract]
        [WebGet(UriTemplate = "Hello")]
        string Hello();
    }
}
