using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class clsCategoryDataAccess
    {
        public static DataTable GetAllCategory(int UserID)
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = "select * from Category Where UserID = @UserID ";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", UserID);

            try
            {
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                    dt.Load(reader);

                reader.Close();
            }
            catch
            {

            }
            finally
            {
                connection.Close();
            }
            return dt;

        }

        public static int AddNewCategory(string categoryName, int UserID)
        {
            int categoryId = -1;

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = "insert into Category (CategoryName, UserID) values(@CategoryName,@UserID)";

            SqlCommand command = new SqlCommand(query,connection);

            command.Parameters.AddWithValue("@CategoryName", categoryName);
            command.Parameters.AddWithValue("@UserID", UserID);

            try
            {
                connection.Open();

                object result = command.ExecuteScalar();

                if (result != null && int.TryParse(result.ToString(), out int insertID))
                    categoryId = insertID;

            }
            catch
            {
                //Write The Exception
            }
            finally
            {
                connection.Close();
            }
            return categoryId;

        }

        public static bool DeleteCaegoty(int categoryId)
        {
            int roweffected;

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = "Delete from Category Where CategoryId = @CategoryID";

            SqlCommand command = new SqlCommand(query,connection);

            command.Parameters.AddWithValue("@CategoryID", categoryId);

            try
            {
                connection.Open();

                roweffected = command.ExecuteNonQuery();
            }
            catch
            {
                return false;
            }
            finally
            {
                connection.Close();
            }
            return (roweffected > 0);
        }

    }


}
