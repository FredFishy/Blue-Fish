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
    public class Product
    {
        public readonly int id;
        public string prodName;
        public string prodDescription;
        public string prodBrand;


        private Product(int id)
        {
            this.id = id;
        }
        public Product()
        {
            this.id = -1;
        }

        public static List<Product> GetAllProducts(out string status)
        {
            status = DataConnection.status;
            List<Product> products = new List<Product>();
            DataConnection.command.CommandText = "Select * From Product";
            if (DataConnection.Open())
            {
                try
                {
                    SqlDataReader reader = DataConnection.command.ExecuteReader();
                    while (reader.Read())
                    {
                        Product product = new Product(Convert.ToInt32(reader[0]));
                        product.prodName = reader[1].ToString();
                        product.prodDescription = reader[2].ToString();
                        product.prodBrand = reader[3].ToString();                  
                        products.Add(product);
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
            return products;
        }

        public static bool CreateProduct(Product product, out string status, out int id)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "INSERT INTO Product(prodName, prodDesciption, prodBrand) " +
                "OUTPUT INSERTED.ID " +
                "VALUES(" +
                "'" + product.prodName + "', " +
                "'" + product.prodDescription + "', " +
                "'" + product.prodBrand + "' " +
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

        public static bool UpdateProduct(Product product, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText =
                "UPDATE Product SET prodName '" + product.prodName+ "', " +
                "prodDesciption = '" + product.prodDescription + "', " +
                "prodBrand = '" + product.prodBrand + "' "  +
                "WHERE ID = '" + product.id.ToString();

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

        public static bool ProductDelete(Product product, out string status)
        {
            status = DataConnection.status;

            DataConnection.command.CommandText = "DELETE FROM Product WHERE id = " + product.id.ToString();

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
