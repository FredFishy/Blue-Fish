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

        public Employee(string empFirst, string empLast, int posID)
        {
            this.empFirst = empFirst;
            this.empLast = empLast;
            this.posID = posID;
        }

        public Employee(int id, string empFirst, string empLast, int posID)
        {
            this.id = id;
            this.empFirst = empFirst;
            this.empLast = empLast;
            this.posID = posID;
        }




        public static bool CreateEmployee(Employee employee, out string status, out int id)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "INSERT INTO Employee(empFirst, empLast, posID) " +
                "OUTPUT INSERTED.ID " +
                "VALUES(" +
                "'" + employee.empFirst + "', " +
                "'" + employee.empLast + "', " +
                "" + employee.posID + " " +
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

        public static bool UpdateEmployee(Employee employee, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "UPDATE Employee SET " +
                "empFirst = '" + employee.empFirst + "', " +
                "empLast = '" + employee.empLast + "', " +
                "posID = " + employee.posID + " " +
                "WHERE ID = " + employee.id;

            if (DataConnection.Open())
            {
                try
                {
                    DataConnection.command.ExecuteNonQuery();
                    status = "Update successful";
                    DataConnection.Close();
                    return true;
                }
                catch (Exception e)
                {
                    status = "Update failed\n" + e.Message;

                }
            }

            DataConnection.Close();
            return false;
        }

        public static bool DeleteEmployee(int id, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = "DELETE FROM Employee WHERE id = " + id;

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
