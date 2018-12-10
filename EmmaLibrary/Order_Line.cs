//Paul Vandyk
//Created 12/03/2018

//Paul Vandyk
//Edited 12/03/2018


using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmmaLibrary
{
    public class Order_Line
    {
        public readonly int id;
        public decimal orlPrice;
        public int orlQuantity;
        public bool orlOrderReq;
        public string orlNote;
        public int inventoryID;
        public int receiptID;

        public Order_Line()
        {
            this.id = -1;
        }
        public Order_Line(int id)
        {
            this.id = id;
        }

        public static List<Order_Line> GetAllOrder_Lines(out string status)
        {
            status = DataConnection.status;
            List<Order_Line> order_Lines = new List<Order_Line>();
            DataConnection.command.CommandText = "Select * From Order_Line";
            if (DataConnection.Open())
            {
                try
                {
                    SqlDataReader reader = DataConnection.command.ExecuteReader();
                    while (reader.Read())
                    {
                        Order_Line orderLine = new Order_Line(Convert.ToInt32(reader[0]));
                        orderLine.orlPrice = Convert.ToDecimal(reader[1]);
                        orderLine.orlQuantity = Convert.ToInt32(reader[2]);
                        orderLine.orlOrderReq = Convert.ToBoolean(reader[3]);
                        orderLine.orlNote = reader[4].ToString();
                        orderLine.inventoryID = Convert.ToInt32(reader[5]);
                        orderLine.receiptID = Convert.ToInt32(reader[6]);
                        order_Lines.Add(orderLine);
                    }
                    status = "Records Found";
                }
                catch (Exception ex)
                {
                    status = "Command Failed\n" + ex.Message;
                }
                finally
                {
                    DataConnection.Close();
                }
            }
            return order_Lines;
        }

        public static bool CreateOrder_Line(Order_Line order_Line, out string status, out int id)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "INSERT INTO Order_Line(orlPrice, orlQuantity, orlOrderReq, orlNote, inventoryID, receiptID) " +
                "OUTPUT INSERTED.ID " +
                "VALUES(" +
                "'" + order_Line.orlPrice + "', " +
                "'" + order_Line.orlQuantity + "', " +
                "'" + order_Line.orlOrderReq + "', " +
                "'" + order_Line.orlNote + "', " +
                "'" + order_Line.inventoryID + "', " +
                "'" + order_Line.receiptID + "' " +
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

        public static bool UpdateOrder_Line(Order_Line order_Line, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "UPDATE Order_Line SET orlPrice '" + order_Line.orlPrice + "', " +
                "orlQuantity = '" + order_Line.orlQuantity + "', " +
                "orlOrderReq = '" + order_Line.orlOrderReq + "', " +
                "orlNote = '" + order_Line.orlNote + "', " +
                "inventoryID = '" + order_Line.inventoryID + "', " +
                "receiptID = '" + order_Line.receiptID + "' " +
                "WHERE ID = '" + order_Line.id.ToString();

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

        public static bool Order_LineDelete(Order_Line order_Line, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = "DELETE FROM Order_Line WHERE id = " + order_Line.id.ToString();

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
