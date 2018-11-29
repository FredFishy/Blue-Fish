/*

    Created by:         Nigel Girouard
    Date:               2018-11-29
    Last modified by:   Nigel Girouard
    Date:               2018-11-29
    Description:        Equip_Type table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Equip_Type
    {
        public readonly int id;
        public string eqtType;

        public Equip_Type(int id, string eqtType)
        {
            this.id = id;
            this.eqtType = eqtType;
        }
    }
}
