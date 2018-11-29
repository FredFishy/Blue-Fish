/*

    Created by:         Nigel Girouard
    Date:               2018-11-29
    Last modified by:   Nigel Girouard
    Date:               2018-11-29
    Description:        Customer table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Customer
    {
        public readonly int id;
        public string custFirst;
        public string custLast;
        public string custPhone;
        public string custAddress;
        public string custCity;
        public string custPostal;
        public string custEmail;

        public Customer(int id, string custFirst, string custLast, string custPhone, string custAddress, string custCity, string custPostal, string custEmail)
        {
            this.id = id;
            this.custFirst = custFirst;
            this.custLast = custLast;
            this.custPhone = custPhone;
            this.custAddress = custAddress;
            this.custCity = custCity;
            this.custPostal = custPostal;
            this.custEmail = custEmail;
        }
    }
}
