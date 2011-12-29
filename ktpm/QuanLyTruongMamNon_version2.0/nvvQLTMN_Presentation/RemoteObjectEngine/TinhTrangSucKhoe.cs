using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;
namespace RemoteObjectEngine
{
    public class TinhTrangSucKhoe
    {
        
        
        public List<TinhTrangSucKhoeDTO> LayThongTinSucKhoe(int masuckhoe)
        {
            return RemoteObjectManager.Service.LayThongTinSucKhoe(masuckhoe).ToList();
        }
        
        public int ThemSucKhoe(TinhTrangSucKhoeDTO suckhoe)
        {
            
            return RemoteObjectManager.Service.ThemSucKhoe(suckhoe);
        }
        
        public bool CapNhapSucKhoe(TinhTrangSucKhoeDTO suckhoe)
        {
          
            return RemoteObjectManager.Service.CapNhapSucKhoe(suckhoe);
        }
        
        public bool XoaSucKhoe(int maSk)
        {
            return RemoteObjectManager.Service.XoaSucKhoe(maSk);
        }
    }
}
