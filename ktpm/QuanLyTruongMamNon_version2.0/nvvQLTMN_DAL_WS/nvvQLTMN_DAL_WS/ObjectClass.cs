using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;

namespace nvvQLTMN_DAL_WS
{
    public abstract class ObjectClass
    {
        public virtual void Init(int type)
        {

        }

        public virtual CharacterClass Clone()
        {
            return null;
        }
    }
}
