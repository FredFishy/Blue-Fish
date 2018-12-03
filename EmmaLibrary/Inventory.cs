//Paul Vandyk
//Created 12/03/2018
//Edited 12/03/2018


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    class Inventory
    {
        public readonly int id;
        public int invQuantity;
        public decimal invSize;
        public string invMeasure;
        public decimal invPrice;
        public int productID;

        public Inventory(int id, int invQuantity, decimal invSize, string invMeasure, decimal invPrice, int productID)
        {
            this.id = id;
            this.invQuantity = invQuantity;
            this.invSize = invSize;
            this.invMeasure = invMeasure;
            this.invPrice = invPrice;
            this.productID = productID;
        }
    }
}
