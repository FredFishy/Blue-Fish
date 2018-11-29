/*

    Created by:         Nigel Girouard
    Date:               2018-11-29
    Last modified by:   Nigel Girouard
    Date:               2018-11-29
    Description:        Service table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Service
    {
        public readonly int id;
        public string serName;
        public string serDescription;
        public decimal serPrice;

        public Service(int id, string serName, string serDescription, decimal serPrice)
        {
            this.id = id;
            this.serName = serName;
            this.serDescription = serDescription;
            this.serPrice = serPrice;
        }
    }
}
