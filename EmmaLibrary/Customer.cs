/*

    Created by:         Nigel Girouard
    Date:               2018-11-29
    Last modified by:   Nigel Girouard
    Date:               2018-11-29
    Description:        Customer table

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

        public Customer(string custFirst, string custLast, string custPhone, string custAddress, string custCity, string custPostal, string custEmail)
        {
            this.custFirst = custFirst;
            this.custLast = custLast;
            this.custPhone = custPhone;
            this.custAddress = custAddress;
            this.custCity = custCity;
            this.custPostal = custPostal;
            this.custEmail = custEmail;
        }

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
        
        public static bool CreateCustomer(Customer customer, out string status, out int id)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "INSERT INTO Customer(custFirst, custLast, custPhone, custAddress, " +
                "custCity, custPostal, custEmail) " +
                "OUTPUT INSERTED.ID " +
                "VALUES(" +
                "'" + customer.custFirst + "', " +
                "'" + customer.custLast + "', " +
                "'" + customer.custPhone + "', " +
                ((customer.custAddress.Length > 0) ? "'" + customer.custAddress + "'" : "NULL") + ", " +
                ((customer.custCity.Length > 0) ? "'" + customer.custCity + "'" : "NULL") + ", " +
                ((customer.custPostal.Length > 0) ? "'" + customer.custPostal + "'" : "NULL") + ", " +
                "'" + customer.custEmail + "' " +
                ")";

            if (DataConnection.Open())
            {
                try
                {
                    id = (int)DataConnection.command.ExecuteScalar();
                    status = "Insert successful";
                    DataConnection.Close();
                    return true;
                }
                catch (Exception e)
                {
                    status = "Insert failed\n" + e.Message;

                }
            }

            DataConnection.Close();
            id = 0;
            return false;
        }

        public static bool UpdateCustomer(Customer customer, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = 
                "UPDATE Customer SET " +
                "custFirst = '" + customer.custFirst + "', " + 
                "custLast = '" + customer.custLast + "', " +
                "custPhone = '" + customer.custPhone + "', " +
                "custAddress = " + ((customer.custAddress.Length > 0) ? "'" + customer.custAddress + "'" : "NULL") + ", " +
                "custCity = " + ((customer.custCity.Length > 0) ? "'" + customer.custCity + "'" : "NULL") + ", " +
                "custPostal = " + ((customer.custPostal.Length > 0) ? "'" + customer.custPostal + "'" : "NULL") + ", " +
                "custEmail = '" + customer.custEmail +  "' " + 
                "WHERE ID = " + customer.id;

            if(DataConnection.Open())
            {
                try
                {
                    DataConnection.command.ExecuteNonQuery();
                    status = "Update successful";
                    DataConnection.Close();
                    return true;
                }
                catch(Exception e)
                {
                    status = "Update failed\n" + e.Message;
                    
                }
            }

            DataConnection.Close();
            return false;
        }

        public static bool DeleteCustomer(int id, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = "DELETE FROM Customer WHERE id = " + id;

            if (DataConnection.Open())
            {
                try
                {
                    DataConnection.command.ExecuteNonQuery();
                    status = "Delete successful";
                    DataConnection.Close();
                    return true;
                }
                catch (Exception e)
                {
                    status = "Delete failed\n" + e.Message;

                }
            }

            DataConnection.Close();
            return false;
        }
    }
}
