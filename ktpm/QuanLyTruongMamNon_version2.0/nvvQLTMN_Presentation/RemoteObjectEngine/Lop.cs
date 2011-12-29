using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;
namespace RemoteObjectEngine
{
    public class Lop
    {
        
        
        public List<LopDTO> LayDanhSachLop()
        {
            return RemoteObjectManager.Service.LayDanhSachLop().ToList() ;
        }
        
        public bool ThemLop(LopDTO loptam)
        {
         
            return RemoteObjectManager.Service.ThemLop(loptam);
        }
        
        public bool CapNhapLop(LopDTO loptam)
        {
   
            return RemoteObjectManager.Service.CapNhapLop(loptam);
        }
        
        public bool XoaLop(LopDTO loptam)
        {
     
            return RemoteObjectManager.Service.XoaLop(loptam);
        }
    }
}
