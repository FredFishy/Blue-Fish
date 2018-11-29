/*

    Created by:         Nigel Girouard
    Date:               2018-11-29
    Last modified by:   Nigel Girouard
    Date:               2018-11-29
    Description:        Equipment table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Equipment
    {
        public readonly int id;
        public string equModel;
        public string equSerial;
        public int custID;
        public int equtypeID;
        public int equManuID;

        public Equipment(int id, string equModel, string equSerial, int custID, int equtypeID, int equManuID)
        {
            this.id = id;
            this.equModel = equModel;
            this.equSerial = equSerial;
            this.custID = custID;
            this.equtypeID = equtypeID;
            this.equManuID = equManuID;
        }
    }
}
