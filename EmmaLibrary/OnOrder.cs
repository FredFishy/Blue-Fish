using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class OnOrder
    {
        public int quantity;
        public decimal price;
        public string name;

        public OnOrder(int quantity, decimal price, string name)
        {
            this.quantity = quantity;
            this.price = price;
            this.name = name;
        }
    }
}
