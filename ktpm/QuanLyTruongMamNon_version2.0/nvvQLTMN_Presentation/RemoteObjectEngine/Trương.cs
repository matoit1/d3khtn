using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;
namespace RemoteObjectEngine
{
    public class Trương
    {      
        public TruongDTO LayThongTinTruong()
        {
            return RemoteObjectManager.Service.LayThongTinTruong();
        }
        
        public bool SuaThongTinTruong(TruongDTO truonghoc)
        {
            return RemoteObjectManager.Service.SuaThongTinTruong(truonghoc);
        }
    }
}
