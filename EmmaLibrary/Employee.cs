/*

    Created by:         Nigel Girouard
    Date:               2018-11-29
    Last modified by:   Nigel Girouard
    Date:               2018-11-29
    Description:        Employee table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Employee
    {
        public readonly int id;
        public string empFirst;
        public string empLast;
        public int posID;

        public Employee(int id, string empFirst, string empLast, int posID)
        {
            this.id = id;
            this.empFirst = empFirst;
            this.empLast = empLast;
            this.posID = posID;
        }
    }
}
