using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class clsUsersDataAccess
    {

        public static DataTable GetAllUsers()
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = "Select * from Users";

            SqlCommand command =  new SqlCommand(query, connection);

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

        public static bool checkLogin(string username, string password)
        {
            bool IsFound;
            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);

            string query = "select found = 1 from Users where UserName = @UserName and Password = @Password";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserName", username);
            command.Parameters.AddWithValue("@Password", password);

            try
            {
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                    IsFound = true;
                else
                    IsFound = false;

                reader.Close();
            }
            catch 
            {
                IsFound = false;
            }
            finally
            {
                connection.Close();
            }
            return IsFound;
        }

        public static bool IsExsist(int UserID)
        {
            bool IsFound;
            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);

            string query = "select found = 1 from Users where UserID = @UserID ";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", UserID);
            

            try
            {
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                IsFound = reader.HasRows;

                reader.Close();
            }
            catch
            {
                IsFound = false;
            }
            finally
            {
                connection.Close();
            }
            return IsFound;
        }

        public static int AddNewUser(string FirstName,  string LastName, DateTime DateOfBirth, string Email, byte Gender,
            string ImagePath, string UserName, string Password)
        {
            int UserID = -1;
            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);

            string query = @"insert into Users (FirstName, LastName, DateOfBirth,Email,Gender,ImagePath,UserName,Password)
                values(@FirstName,@LastName,@DateOfBirth,@Email,@Gender,
                @ImagePath,@UserName,@Password);
                Select Scope_identity();";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@FirstName", FirstName);
            command.Parameters.AddWithValue("@LastName", LastName);
            command.Parameters.AddWithValue("@DateOfBirth", DateOfBirth);
            command.Parameters.AddWithValue("@Email", Email);
            command.Parameters.AddWithValue("@Gender", Gender);
            command.Parameters.AddWithValue("@ImagePath", ImagePath);
            command.Parameters.AddWithValue("@UserName", UserName);
            command.Parameters.AddWithValue("@Password", Password);

            try
            {
                connection.Open();

                object result = command.ExecuteScalar();

                if (result != null && int.TryParse(result.ToString(), out int insertID))
                {
                    UserID = insertID;
                }
            }
            catch
            {
                //Write The Exception
            }
            finally
            {
                connection.Close();
            }
            return UserID;
        }

        public static bool UpdateUser(int UserID, string FirstName, string LastName, DateTime DateOfBirth, string Email, byte Gender,
            string ImagePath, string UserName, string Password)
        {
            int rowEffected;

            SqlConnection connection =  new SqlConnection(clsSettings.ConnetionString);
            string query = @"Update Users 
                set FirstName = @FirstName , LastName = @LastName, DateOfBirth = @DateOfBirth,Email = @Email,
                Gender = @Gender,ImagePath = @ImagePath,Password = @Password,UserName = @UserName
                where UserID = 1";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@UserID", UserID);
            command.Parameters.AddWithValue("@FirstName", FirstName);
            command.Parameters.AddWithValue("@LastName", LastName);
            command.Parameters.AddWithValue("@DateOfBirth", DateOfBirth);
            command.Parameters.AddWithValue("@Email", Email);
            command.Parameters.AddWithValue("@Gender", Gender);
            command.Parameters.AddWithValue("@ImagePath", ImagePath);
            command.Parameters.AddWithValue("@Password", Password);
            command.Parameters.AddWithValue("@UserName", UserName);

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

        public static bool DeleteUser(int  UserID)
        {
            int rowEffected;

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = @"DELETE From Users
                             WHERE UserID = @UserID";

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

        public static bool FindByUserID(int UserID, ref string FirstName, ref string LastName, ref DateTime DateOfBirth, ref string Email, ref byte Gender,
           ref string ImagePath, ref string UserName, ref string Password)
        {
            bool IsFound;

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = "select * from Users WHere UserID = @UserID";

            SqlCommand command = new SqlCommand(query,connection);
            command.Parameters.AddWithValue("@UserID", UserID);

            try
            {
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    IsFound = true;
                    
                    FirstName = (string)reader["FirstName"];
                    LastName = (string)reader["LastName"];
                    DateOfBirth = (DateTime)reader["DateOfBirth"];
                    Email = (string)reader["Email"];
                    Gender = (byte)reader["Gender"];                    
                    UserName = (string)reader["UserName"];
                    Password = (string)reader["Password"];

                    if (reader["ImagePath"] != DBNull.Value)
                        ImagePath = (string)reader["ImagePath"];
                    else
                        ImagePath = "";
                }
                else
                    IsFound = false;
                reader.Close();

            }
            catch
            {
                IsFound = false;
            }
            finally
            {
                connection.Close();
            }
            return IsFound;
        }

        public static bool FindByUserName(ref int UserID, ref string FirstName, ref string LastName, ref DateTime DateOfBirth, ref string Email, ref byte Gender,
           ref string ImagePath,  string UserName, ref string Password)
        {
            bool IsFound;

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = "select * from Users WHere UserName = @UserID";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", UserName);

            try
            {
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    IsFound = true;

                    UserID = (int)reader["UserID"];
                    FirstName = (string)reader["FirstName"];
                    LastName = (string)reader["LastName"];
                    DateOfBirth = (DateTime)reader["DateOfBirth"];
                    Email = (string)reader["Email"];
                    Gender = (byte)reader["Gender"];                    
                    Password = (string)reader["Password"];

                    if (reader["ImagePath"] != DBNull.Value)
                        ImagePath = (string)reader["ImagePath"];
                    else
                        ImagePath = "";
                }
                else
                    IsFound = false;
                reader.Close();

            }
            catch
            {
                IsFound = false;
            }
            finally
            {
                connection.Close();
            }
            return IsFound;
        }


    }
}
