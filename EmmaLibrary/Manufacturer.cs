/*

    Created by:         Nigel Girouard
    Date:               2018-11-29
    Last modified by:   Nigel Girouard
    Date:               2018-11-29
    Description:        Manufacturer table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Manufacturer
    {
        public readonly int id;
        public string manName;

        public Manufacturer(int id, string manName)
        {
            this.id = id;
            this.manName = manName;
        }
    }
}
