/*

    Created by:         Nigel Girouard
    Date:               2018-12-03
    Last modified by:   Nigel Girouard
    Date:               2018-12-03
    Description:        Use this class to connect to the database

*/

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    internal static class DataConnection
    {
        internal static SqlCommand command = new SqlCommand();
    }
}
