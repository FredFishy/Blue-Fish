/*

    Created by:         Nigel Girouard
    Date:               2018-11-29
    Last modified by:   Nigel Girouard
    Date:               2018-11-29
    Description:        Position table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Position
    {
        public readonly int id;
        public string posName;

        public Position(int id, string posName)
        {
            this.id = id;
            this.posName = posName;
        }
    }
}
