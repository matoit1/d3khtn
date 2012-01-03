using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;

namespace nvvQLTMN_DAL_WS
{
    public abstract class StateMethod : ObjectMethod
    {
        public virtual System.Collections.Generic.List<StateClass> LayDanhSach()
        {
            return null;
        }

        public virtual bool Them(StateClass objectClass)
        {
            return true;
        }
        public virtual bool Xoa(int ma)
        {
            return true;
        }

        public virtual bool CapNhap(StateClass objectClass)
        {
            return true;
        }
    }
}
