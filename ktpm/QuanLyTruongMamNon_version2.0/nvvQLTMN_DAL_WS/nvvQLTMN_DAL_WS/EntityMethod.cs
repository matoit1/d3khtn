using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;

namespace nvvQLTMN_DAL_WS
{
    public abstract class EntityMethod : ObjectMethod
    {
        public virtual System.Collections.Generic.List<EntityClass> LayDanhSach()
        {
            return null;
        }

        public virtual bool Them(EntityClass objectClass)
        {
            return true;
        }
        public virtual bool Xoa(int ma)
        {
            return true;
        }

        public virtual bool CapNhap(EntityClass objectClass)
        {
            return true;
        }
    }
}
