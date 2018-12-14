/*

    Created by:         Nigel Girouard
    Date:               2018-12-12
    Last modified by:   Nigel Girouard
    Date:               2018-12-12
    Description:        Prod_Order table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Prod_Order
    {
        public readonly int id;
        public string pordNumber;
        public DateTime pordDateOrdered;
        public bool pordPaid;

        public Prod_Order(string pordNumber, DateTime pordDateOrdered, bool pordPaid)
        {
            this.pordNumber = pordNumber;
            this.pordDateOrdered = pordDateOrdered;
            this.pordPaid = pordPaid;
        }

        public Prod_Order(int id, string pordNumber, DateTime pordDateOrdered, bool pordPaid)
        {
            this.id = id;
            this.pordNumber = pordNumber;
            this.pordDateOrdered = pordDateOrdered;
            this.pordPaid = pordPaid;
        }






        public static bool CreateProd_Order(Prod_Order prod_Order, out string status, out int id)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "INSERT INTO PROD_ORDER(pordNumber, pordDateOrdered, pordPaid) " +
                "OUTPUT INSERTED.ID " +
                "VALUES(" +
                "'" + prod_Order.pordNumber + "', " +
                "'" + prod_Order.pordDateOrdered + "', " +
                "'" + prod_Order.pordPaid + "' " +")";

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

        public static bool UpdateProd_Order(Prod_Order prod_Order, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "UPDATE Prod_Order SET pordNumber '" + prod_Order.pordNumber + "', " +
                "pordDateOrdered = '" + prod_Order.pordDateOrdered + "', " +
                "pordPaid = '" + prod_Order.pordPaid + "' " +
                "WHERE ID = " + prod_Order.id.ToString();

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

        public static bool DeleteProd_Order(Prod_Order prod_Order, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = "DELETE FROM Prod_Order WHERE id = " + prod_Order.id.ToString();

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
