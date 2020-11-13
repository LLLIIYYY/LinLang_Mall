using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Entity;
using Model.Enums;

namespace Model.Enums
{
    public enum GenderEnum
    {
        [Description ("保密")]
        Unknown=0,
        [Description ("男")]
        Male =1,
        [Description ("女")]
        Female =2
    }
}
