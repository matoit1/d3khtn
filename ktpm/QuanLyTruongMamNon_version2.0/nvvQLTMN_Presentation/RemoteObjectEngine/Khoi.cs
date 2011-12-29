using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;

namespace RemoteObjectEngine
{
    public class Khoi
    {
        public static List<KhoiDTO> LayDanhSachKhoi()
        {
            return RemoteObjectManager.Service.LayDanhSachKhoi().ToList();
        }
    }
}
