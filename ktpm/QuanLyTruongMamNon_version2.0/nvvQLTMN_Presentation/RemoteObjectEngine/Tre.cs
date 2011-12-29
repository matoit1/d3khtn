using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;
namespace RemoteObjectEngine
{
    public class Tre
    {
        
        
        public List<TreDTO> LayDanhSachTre()
        {
            return RemoteObjectManager.Service.LayDanhSachTre().ToList();
        }
        
        public List<TreDTO> LayDSTreTheoLop(string tenlop)
        {
            return RemoteObjectManager.Service.LayDSTreTheoLop(tenlop).ToList();
        }
        
        public bool ThemTre(TreDTO tretam)
        {

            return RemoteObjectManager.Service.ThemTre(tretam);
        }
        
        public bool CapNhapTre(TreDTO tretam)
        {

            return RemoteObjectManager.Service.CapNhapTre(tretam);
        }
        
        public bool XoaTre(TreDTO tretam)
        {
 
            return RemoteObjectManager.Service.XoaTre(tretam);
        }
    }
}
