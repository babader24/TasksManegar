using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class clsTaskDataAccess
    {
        //select TaskID, Title, Description, CategoryName, StartDate, EndDate, IsActive ,Task.UserID from Task inner join Category 
        //on Task.CategoryID = Category.CategoryID Where UserID = @UserID
        public static DataTable GetAllTasks(int UserID)
        {
            DataTable dt = new DataTable(); 

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = @"select TaskID, Title, Description, CategoryName, StartDate, EndDate, IsActive ,Task.UserID from Task inner join Category 
            on Task.CategoryID = Category.CategoryID Where Task.UserID = @UserID";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", UserID);

            try
            {
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if(reader.HasRows)
                {
                    dt.Load(reader);
                }
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

        public static int AddNewTask( string Title, string Description, int CategoryID, DateTime StartDate,
            DateTime EndDate, bool IsActive , int UserID)
        {
            int TaskID = -1;

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = @"insert into Task ( Title, Description, CategoryID, StartDate, EndDate, IsActive ,UserID)
                values (@Title, @Description, @CategoryID, @StartDate, @EndDate, @IsActive ,@UserID);
                Select Scope_identity();";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@Title", Title);
            command.Parameters.AddWithValue("@Description", Description);
            command.Parameters.AddWithValue("@CategoryID", CategoryID);
            command.Parameters.AddWithValue("@StartDate", StartDate);
            command.Parameters.AddWithValue("@EndDate", EndDate);
            command.Parameters.AddWithValue("@IsActive", IsActive);
            command.Parameters.AddWithValue("@UserID", UserID);

            try
            {
                connection.Open();

                object result = command.ExecuteScalar();
                if (result != null && int.TryParse(result.ToString(), out int insertID))
                {
                    TaskID = insertID;
                }
            }
            catch
            {
                //Write The Exception
            }
            finally
            {
                connection.Close() ;
            }
            return TaskID;  
        }

        public static bool UpdateTask(int TaskID, string Title, string Description, int CategoryID, DateTime StartDate,
            DateTime EndDate, bool IsActive, int UserID)
        {
            int rowEffected;

            SqlConnection connection = new SqlConnection (clsSettings.ConnetionString);
            string query = @"update Task
                set Title = @Title, Description = @Description, CategoryID = @CategoryID, StartDate = @StartDate,
                EndDate = @EndDate,IsActive = @IsActive, UserID = @UserID
                where TaskID = @TaskID";

            SqlCommand command = new SqlCommand (query, connection);

            command.Parameters.AddWithValue("@Title", Title);
            command.Parameters.AddWithValue("@Description", Description);
            command.Parameters.AddWithValue("@CategoryID", CategoryID);
            command.Parameters.AddWithValue("@StartDate", StartDate);
            command.Parameters.AddWithValue("@EndDate", EndDate);
            command.Parameters.AddWithValue("@IsActive", IsActive);
            command.Parameters.AddWithValue("@UserID", UserID);
            command.Parameters.AddWithValue("@TaskID", TaskID);

            try
            {
                connection.Open();

                rowEffected = command.ExecuteNonQuery();
            }
            catch
            {
                return false;
            }
            finally
            {
                connection.Close();
            }
            return (rowEffected > 0);

        }

        public static bool DeleteTask(int UserID)
        {
            int rowEffected;
            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = "Delete From Task Where UserID = @UserID";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@UserID", UserID);

            try
            {
                connection.Open();

                rowEffected = command.ExecuteNonQuery();
            }
            catch
            {
                return false;
            }
            finally
            {
                connection.Close();
            }
            return (rowEffected > 0);
        }


    }
}
