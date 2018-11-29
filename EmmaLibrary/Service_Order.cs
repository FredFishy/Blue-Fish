/*

    Created by:         Nigel Girouard
    Date:               2018-11-29
    Last modified by:   Nigel Girouard
    Date:               2018-11-29
    Description:        Service_Order table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Service_Order
    {
        public readonly int id;
        public DateTime serordDateIn;
        public DateTime serordDateOut;
        public string serordIssue;
        public bool serordWarranty;
        public int receiptID;
        public int serviceID;
        public int equipID;
        public int empID;

        public Service_Order(int id, DateTime serordDateIn, DateTime serordDateOut, string serordIssue, bool serordWarranty, int receiptID, int serviceID, int equipID, int empID)
        {
            this.id = id;
            this.serordDateIn = serordDateIn;
            this.serordDateOut = serordDateOut;
            this.serordIssue = serordIssue;
            this.serordWarranty = serordWarranty;
            this.receiptID = receiptID;
            this.serviceID = serviceID;
            this.equipID = equipID;
            this.empID = empID;
        }
    }
}
