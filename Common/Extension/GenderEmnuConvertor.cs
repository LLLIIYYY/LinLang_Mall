using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Extension
{
    public static class GenderEmnuConvertor
    {
        public static string toDescription(this Enum value) {
            if (value is null) return string.Empty;
            var type = value.GetType();
            var field = type.GetField(Enum.GetName(type, value));

            if (field == null)
            {
                return string.Empty;
            }
            var desc = Attribute.GetCustomAttribute(field, typeof(DescriptionAttribute)) as DescriptionAttribute;
            return desc == null ? string.Empty : desc.Description;
        }
    }
}
