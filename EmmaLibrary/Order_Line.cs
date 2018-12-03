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
    class Order_Line
    {
        public readonly int id;
        public decimal orlPrice;
        public int orlQuantity;
        public bool orlOrderReq;
        public string orlNote;
        public int inventoryID;
        public int receiptID;

        public Order_Line(int id, decimal orlPrice, int orlQuantity, bool orlOrderReq, string orlNote, int inventoryID, int receiptID)
        {
            this.id = id;
            this.orlPrice = orlPrice;
            this.orlQuantity = orlQuantity;
            this.orlOrderReq = orlOrderReq;
            this.orlNote = orlNote;
            this.inventoryID = inventoryID;
            this.receiptID = receiptID;
        }
    }
}
