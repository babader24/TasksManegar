using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace busniessLayer
{
    public class clsAchievement
    {
        private enum enMode { AddMode = 0, updateMode = 1 };
        enMode _Mode = enMode.AddMode;

        public int AchievementID {  get; set; }

        public int UserID { get; set; }

        public string AchievementName { get; set; }

        public DateTime AchievementDate { get; set; }

        public string AchievementDescription { get; set; }

        public clsAchievement()
        {
            AchievementID = 0;
            UserID = 0;
            AchievementName = "";
            AchievementDate = DateTime.Now;
            AchievementDescription = "";

            _Mode = enMode.AddMode;
        }

        public clsAchievement(int achievementID, int userID, string achievementName, DateTime achievementDate, string achievementDescription)
        {
            
            AchievementID = achievementID;
            UserID = userID;
            AchievementName = achievementName;
            AchievementDate = achievementDate;
            AchievementDescription = achievementDescription;

            _Mode = enMode.updateMode;
        }

        public static DataTable GetAllAchievement(int AchievementID)
        {
            return clsAchievementsDataAccess.GetAllAchievements(AchievementID);
        }

        public static bool DeleteAchievement(int AchievementID)
        {
            return clsAchievementsDataAccess.DeleteTask(AchievementID);
        }

        private bool AddAchievement()
        {
            this.AchievementID = clsAchievementsDataAccess.AddNewAchievement( this.UserID, this.AchievementName, this.AchievementDate, 
                this.AchievementDescription);

            return (this.AchievementID != -1);
        }

        private bool UpdateAchievement()
        {
            return clsAchievementsDataAccess.UpdateAchievement(this.AchievementID, this.UserID, this.AchievementName, this.AchievementDate,
                this.AchievementDescription);
        }

        public bool Save()
        {
            switch (_Mode)
            {
                case enMode.AddMode:
                    {
                        if(AddAchievement())
                        {
                            _Mode = enMode.updateMode;
                            return true;
                        }
                        else
                            return false;
                    }
                case enMode.updateMode:
                    return UpdateAchievement();
            }
            return false;
        }


    }
}
