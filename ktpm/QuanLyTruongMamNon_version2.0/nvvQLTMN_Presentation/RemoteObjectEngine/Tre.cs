using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;
namespace RemoteObjectEngine
{
    public class Tre
    {
        
        
        public static List<TreDTO> LayDanhSachTre()
        {
            return RemoteObjectManager.Service.LayDanhSachTre().ToList();
        }
        
        public static List<TreDTO> LayDSTreTheoLop(string tenlop)
        {
            return RemoteObjectManager.Service.LayDSTreTheoLop(tenlop).ToList();
        }
        
        public static bool ThemTre(TreDTO tretam)
        {

            return RemoteObjectManager.Service.ThemTre(tretam);
        }
        
        public static bool CapNhapTre(TreDTO tretam)
        {

            return RemoteObjectManager.Service.CapNhapTre(tretam);
        }
        
        public static bool XoaTre(TreDTO tretam)
        {
 
            return RemoteObjectManager.Service.XoaTre(tretam);
        }
    }
}
