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
    class Receipt
    {
        public readonly int id;
        public string ordNumber;
        public DateTime ordDate;
        public bool ordPaid;
        public int paymentID;
        public int custID;
        public int empID;

        public Receipt(int id, string ordNumber, DateTime ordDate, bool ordPaid, int paymentID, int custID, int empID)
        {
            this.id = id;
            this.ordNumber = ordNumber;
            this.ordDate = ordDate;
            this.ordPaid = ordPaid;
            this.paymentID = paymentID;
            this.custID = custID;
            this.empID = empID;
        }
    }
}
