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
    public class Payment
    {
        public readonly int id;
        public string payType;

        public Payment()
        {
            this.id = -1;
        }
        private Payment(int id)
        {
            this.id = id;            
        }

        public static List<Payment> GetAllPayments(out string status)
        {
            status = DataConnection.status;
            List<Payment> payments = new List<Payment>();
            DataConnection.command.CommandText = "Select * From Movie";
            if (DataConnection.Open())
            {
                try
                {
                    SqlDataReader reader = DataConnection.command.ExecuteReader();
                    while (reader.Read())
                    {
                        Payment payment = new Payment(Convert.ToInt32(reader[0]));
                        payment.payType = reader[1].ToString();
                        payments.Add(payment);
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
            return payments;
        }

        public static bool CreatePayment(Payment payment, out string status, out int id)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "INSERT INTO Payment(payType) " +
                "OUTPUT INSERTED.ID " +
                "VALUES(" +
                "'" + payment.payType + "' " +
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

        public static bool UpdatePayment(Payment payment, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "UPDATE Payment SET payType'" + payment.payType + "' " +
                "WHERE ID = '" + payment.id.ToString();

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

        public static bool PaymentDelete(Payment payment, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = "DELETE FROM Product WHERE id = " + payment.id.ToString();

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
