﻿using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;

namespace nvvQLTMN_DAL_WS
{
    public abstract class EntityClass : ObjectClass
    {
        public override void Init(int type)
        {

        }

        public override CharacterClass Clone()
        {
            return null;
        }
    }
}