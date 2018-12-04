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
    public class Inventory
    {
        public readonly int id;
        public int invQuantity;
        public decimal invSize;
        public string invMeasure;
        public decimal invPrice;
        public int productID;

        public Inventory()
        {
            this.id = -1;
        }
        public Inventory(int id)
        {
            this.id = id;
        }

        public static List<Inventory> GetAllInventories(out string status)
        {
            status = DataConnection.status;
            List<Inventory> inventories = new List<Inventory>();
            DataConnection.command.CommandText = "Select * From Inventory";
            if (DataConnection.Open())
            {
                try
                {
                    SqlDataReader reader = DataConnection.command.ExecuteReader();
                    while (reader.Read())
                    {
                        Inventory inventory = new Inventory(Convert.ToInt32(reader[0]));
                        inventory.invQuantity = Convert.ToInt32(reader[1]);
                        inventory.invSize = Convert.ToDecimal(reader[2]);
                        inventory.invMeasure = reader[3].ToString();
                        inventory.invPrice = Convert.ToDecimal(reader[4]);
                        inventory.productID = Convert.ToInt32(reader[5]);
                        inventories.Add(inventory);
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
            return inventories;
        }

        public static bool CreateInventory(Inventory inventory, out string status, out int id)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "INSERT INTO Inventory(invQuantity, invSize, invMeasure, invPrice, " +
                "productID) " +
                "OUTPUT INSERTED.ID " +
                "VALUES(" +
                "'" + inventory.invQuantity + "', " +
                "'" + inventory.invSize + "', " +
                "'" + inventory.invMeasure + "', " +
                "'" + inventory.invPrice + "', " +
                "'" + inventory.productID + "' " +
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

        public static bool UpdateInventory(Inventory inventory, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "UPDATE Inventory SET invQuantity '" + inventory.invQuantity + "', " +
                "invSize = '" + inventory.invSize + "', " +
                "invMeasure = '" + inventory.invMeasure + "', " +
                "invPrice = '" + inventory.invPrice + "', " +
                "productID = '" + inventory.productID + "' " +
                "WHERE ID = '" + inventory.id.ToString();

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

        public static bool DeleteInventory(Inventory inventory, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = "DELETE FROM Inventory WHERE id = " + inventory.id.ToString();

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
