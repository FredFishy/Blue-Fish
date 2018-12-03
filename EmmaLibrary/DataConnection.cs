/*

    Created by:         Nigel Girouard
    Date:               2018-12-03
    Last modified by:   Nigel Girouard
    Date:               2018-12-03
    Description:        Use this class to connect to the database from within the library 

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
    /// <summary>
    /// Use this class to interact with the database inside the Library
    /// </summary>
    internal static class DataConnection
    {
        private static SqlConnection connection = new SqlConnection();
        internal static SqlCommand command = new SqlCommand();
        internal static string status = "Ready";

        static DataConnection()
        {
            connection.ConnectionString = global::EmmaLibrary.Properties.Settings.Default.EmmasLibraryConnectionString;
            command.Connection = connection;
        }

        /// <summary>
        /// Open a connection with the database. Returns true if successful, false if an exception occures.
        /// </summary>
        /// <returns>Returns true if successful, false if an exception occures</returns>
        internal static bool Open()
        {
            status = "Ready";

            try
            {
                connection.Open();
                return true;
            }
            catch(Exception e)
            {
                status = "Database failed to open\n" + e.Message;
                return false;
            }
        }

        /// <summary>
        /// Close an opened connection with the database.
        /// </summary>
        internal static void Close()
        {
            try
            {
                if(connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }
            catch(Exception e)
            {
                status = "Database failed to close\n" + e.Message;
            }
        }
    }
}
