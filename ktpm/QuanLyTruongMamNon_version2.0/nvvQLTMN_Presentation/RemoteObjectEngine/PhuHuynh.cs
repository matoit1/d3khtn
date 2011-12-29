using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;
namespace RemoteObjectEngine
{
    public class PhuHuynh
    {
        
        
        public List<PhuHuynhDTO> LayThongTinPhuHuynh(int maphuhuynh)
        {
            return RemoteObjectManager.Service.LayThongTinPhuHuynh(maphuhuynh).ToList() ;
        }
        
        public int ThemPhuHuynh(PhuHuynhDTO phuhuynh)
        {
         
            return RemoteObjectManager.Service.ThemPhuHuynh(phuhuynh);
        }
        
        public bool CapNhapPhuHuynh(PhuHuynhDTO phuhuynh)
        {
            
            return RemoteObjectManager.Service.CapNhapPhuHuynh(phuhuynh);
        }
        
        public bool XoaPhuHuynh(int maPH)
        {
            return XoaPhuHuynh(maPH);
        }
    }
}
