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
    public class Payment
    {
        public readonly int id;
        public string payType;

        public Payment(int id, string payType)
        {
            this.id = id;
            this.payType = payType;
        }
    }
}
