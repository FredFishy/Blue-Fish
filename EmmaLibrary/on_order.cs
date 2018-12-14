/*

    Created by:         Nigel Girouard
    Date:               2018-12-12
    Last modified by:   Nigel Girouard
    Date:               2018-12-12
    Description:        On_Order table

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class On_Order
    {
        public readonly int id;
        public string onordInvoiceNum;
        public DateTime onordArriveDate;
        public int onordNumInOrder;
        public decimal onordPrice;
        public int inventoryID;
        public int prodorderID;

        public On_Order(string onordInvoiceNum, DateTime onordArriveDate, int onordNumInOrder, decimal onordPrice, int inventoryID, int prodorderID)
        {
            this.onordInvoiceNum = onordInvoiceNum;
            this.onordArriveDate = onordArriveDate;
            this.onordNumInOrder = onordNumInOrder;
            this.onordPrice = onordPrice;
            this.inventoryID = inventoryID;
            this.prodorderID = prodorderID;
        }

        public On_Order(int id, string onordInvoiceNum, DateTime onordArriveDate, int onordNumInOrder, decimal onordPrice, int inventoryID, int prodorderID)
        {
            this.id = id;
            this.onordInvoiceNum = onordInvoiceNum;
            this.onordArriveDate = onordArriveDate;
            this.onordNumInOrder = onordNumInOrder;
            this.onordPrice = onordPrice;
            this.inventoryID = inventoryID;
            this.prodorderID = prodorderID;
        }




        public static bool CreateOn_Order(On_Order on_Order, out string status, out int id)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "INSERT INTO ON_ORDER(onordInvoiceNum, onordArriveDate, onordNumInOrder, onordPrice, inventoryID, prodorderID) " +
                "OUTPUT INSERTED.ID " +
                "VALUES(" +
                "'" + on_Order.onordInvoiceNum + "', " +
                "'" + on_Order.onordArriveDate + "', " +
                "" + on_Order.onordNumInOrder + ", " +
                "" + on_Order.onordPrice + ", " +
                "" + on_Order.inventoryID + ", " +
                "" + on_Order.prodorderID + ")";

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

        public static bool UpdateOn_Order(On_Order on_Order, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "UPDATE On_Order SET onordInvoiceNum '" + on_Order.onordInvoiceNum + "', " +
                "onordArriveDate = '" + on_Order.onordArriveDate + "', " +
                "onordNumInOrder = " + on_Order.onordNumInOrder + ", " +
                "onordPrice = " + on_Order.onordPrice + ", " +
                "inventoryID = " + on_Order.inventoryID + ", " +
                "prodorderID = " + on_Order.prodorderID + " " +
                "WHERE ID = " + on_Order.id.ToString();

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

        public static bool DeleteOn_Order(On_Order on_Order, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = "DELETE FROM On_Order WHERE id = " + on_Order.id.ToString();

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
