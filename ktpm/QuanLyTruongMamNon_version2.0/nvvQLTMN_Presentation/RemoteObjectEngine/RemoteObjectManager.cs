using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;

namespace RemoteObjectEngine
{
    public class RemoteObjectManager
    {
        private static nvvQLTMN_BUS_WS.Service1 service = null;

        public static nvvQLTMN_BUS_WS.Service1 Service
        {
            get { return RemoteObjectManager.service; }
            set { RemoteObjectManager.service = value; }
        }

        public static void Connect()
        {
            service = new Service1();
        }

    }
}
