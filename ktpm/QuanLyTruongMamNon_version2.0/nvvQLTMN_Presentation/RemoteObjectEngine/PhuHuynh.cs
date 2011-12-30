using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;
namespace RemoteObjectEngine
{
    public class PhuHuynh
    {
        
        
        public static List<PhuHuynhDTO> LayThongTinPhuHuynh(int maphuhuynh)
        {
            return RemoteObjectManager.Service.LayThongTinPhuHuynh(maphuhuynh).ToList() ;
        }
        
        public static int ThemPhuHuynh(PhuHuynhDTO phuhuynh)
        {
         
            return RemoteObjectManager.Service.ThemPhuHuynh(phuhuynh);
        }
        
        public static bool CapNhapPhuHuynh(PhuHuynhDTO phuhuynh)
        {
            
            return RemoteObjectManager.Service.CapNhapPhuHuynh(phuhuynh);
        }
        
        public static bool XoaPhuHuynh(int maPH)
        {
            return RemoteObjectManager.Service.XoaPhuHuynh(maPH);
        }
    }
}
