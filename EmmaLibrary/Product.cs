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
    class Product
    {
        public readonly int id;
        public string prodName;
        public string prodDescription;
        public string prodBrand;

        public Product(int id, string prodName, string prodDescription, string prodBrand)
        {
            this.id = id;
            this.prodName = prodName;
            this.prodDescription = prodDescription;
            this.prodBrand = prodBrand;
        }
    }
}
