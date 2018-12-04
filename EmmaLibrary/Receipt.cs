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
    public class Receipt
    {
        public readonly int id;
        public string ordNumber = "Unknown";
        public DateTime ordDate = new DateTime(0001,01,01);
        public bool ordPaid = false;
        public int paymentID = -1;
        public int custID = -1;
        public int empID = -1;

        public Receipt()
        {
            this.id = -1;
        }
        private Receipt(int id)
        {
            this.id = id;
        }

        public static List<Receipt> GetAllReceipts(out string status)
        {
            status = DataConnection.status;
            List<Receipt> receipts = new List<Receipt>();
            DataConnection.command.CommandText = "Select * From Receipt";
            if (DataConnection.Open())
            {
                try
                {
                    SqlDataReader reader = DataConnection.command.ExecuteReader();
                    while (reader.Read())
                    {
                        Receipt receipt = new Receipt(Convert.ToInt32(reader[0]));
                        receipt.ordNumber = reader[1].ToString();
                        receipt.ordDate = Convert.ToDateTime(reader[2]);
                        receipt.ordPaid = Convert.ToBoolean(reader[3]);
                        receipt.paymentID = Convert.ToInt32(reader[4]);
                        receipt.custID = Convert.ToInt32(reader[5]);
                        receipt.empID = Convert.ToInt32(reader[6]);
                        receipts.Add(receipt);
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
            return receipts;
        }

        public static bool CreateReceipt(Receipt receipt, out string status, out int id)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "INSERT INTO Receipt(ordNumber, ordDate, ordPaid, paymentID, " +
                "custID, empID) " +
                "OUTPUT INSERTED.ID " +
                "VALUES(" +
                "'" + receipt.ordNumber + "', " +
                "'" + receipt.ordDate + "', " +
                "'" + receipt.ordPaid + "', " +
                "'" + receipt.paymentID + "', " +
                "'" + receipt.custID + "', " +
                "'" + receipt.empID + "' " +
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

        public static bool UpdateReceipt(Receipt receipt, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "UPDATE Receipt SET ordNumber '" + receipt.ordNumber + "', " +
                "ordDate = '" + receipt.ordDate + "', " +
                "ordPaid = '" + receipt.ordPaid + "', " +
                "paymentID = '" + receipt.paymentID + "', " +
                "custID = '" + receipt.custID + "', " +
                "empID = '" + receipt.empID + "' " +
                "WHERE ID = '" + receipt.id.ToString();

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

        public static bool DeleteReceipt(Receipt receipt, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = "DELETE FROM Receipt WHERE id = " + receipt.id.ToString();

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
