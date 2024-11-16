using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class clsAchievementsDataAccess
    {
        public static DataTable GetAllAchievements(int UserID)
        {
            DataTable dt = new DataTable();

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = "select * from Achievements Where UserID = @UserID";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", UserID);

            try
            {
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
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

        public static int AddNewAchievement(int UserID, string AchievementName, DateTime AchievementDate,
            string AchievementDescription)
        {
            int AchievementID = -1;

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = @"insert into Achievements (UserID, AchievementName,AchievementDate,AchievementDescription)
                values (UserID = @UserID, AchievementName = @AchievementName,AchievementDate = @AchievementDate,
                AchievementDescription = @AchievementDescription);
                Select Scope_identity();";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@UserID", UserID);
            command.Parameters.AddWithValue("@AchievementName", AchievementName);
            command.Parameters.AddWithValue("@AchievementDate", AchievementDate);
            command.Parameters.AddWithValue("@AchievementDescription", AchievementDescription);

            try
            {
                connection.Open();

                object result = command.ExecuteScalar();
                if (result != null && int.TryParse(result.ToString(), out int insertID))
                {
                    AchievementID = insertID;
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
            return AchievementID;
        }

        public static bool UpdateAchievement(int AchievementID, int UserID, string AchievementName, DateTime AchievementDate,
            string AchievementDescription)
        {
            int rowEffected;

            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = @"Update Achievements 
                set UserID = @UserID, AchievementName = @AchievementName,AchievementDate = @AchievementDate
                AchievementDescription = @AchievementDescription
                Where AchievementID = @AchievementID ";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@UserID", UserID);
            command.Parameters.AddWithValue("@AchievementName", AchievementName);
            command.Parameters.AddWithValue("@AchievementDate", AchievementDate);
            command.Parameters.AddWithValue("@AchievementDescription", AchievementDescription);
            command.Parameters.AddWithValue("@AchievementID", AchievementID);

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

        public static bool DeleteTask(int AchievementID)
        {
            int rowEffected;
            SqlConnection connection = new SqlConnection(clsSettings.ConnetionString);
            string query = "Delete From Achievements Where AchievementID = @AchievementID";

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.AddWithValue("@AchievementID", AchievementID);

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
