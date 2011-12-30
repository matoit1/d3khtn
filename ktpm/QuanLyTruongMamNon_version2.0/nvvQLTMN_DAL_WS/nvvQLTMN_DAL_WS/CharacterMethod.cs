using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;

namespace nvvQLTMN_DAL_WS
{
    public abstract class CharacterMethod : ObjectMethod
    {
        public virtual System.Collections.Generic.List<CharacterClass> LayDanhSach()
        {
            return null;
        }

        public virtual bool Them(CharacterClass objectClass)
        {
            return true;
        }
        public virtual bool Xoa(int ma)
        {
            return true;
        }

        public virtual bool CapNhap(CharacterClass objectClass)
        {
            return true;
        }
    }
}
