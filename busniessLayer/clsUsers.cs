using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace busniessLayer
{
    public class clsUsers
    {

        private enum enMode { addMode = 0, updateMpde = 1 }
        enMode _Mode = enMode.addMode;


        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; }
        public byte Gender { get; set; }
        public string ImagePath { get; set; }
        public string Password { get; set; }
        public string UserName { get; set; }

        public clsUsers()
        {
            this.UserID = -1;
            this.FirstName = "";
            this.LastName = "";
            this.DateOfBirth = DateTime.Now;
            this.Email = "";
            this.Gender = 0;
            this.ImagePath = "";
            this.Password = "";
            this.UserName = "";

            _Mode = enMode.addMode;
        }

        public clsUsers(int userID, string firstName, string lastName, DateTime dateOfBirth, string email, byte gender,
            string imagePath, string password, string userName)
        {
            UserID = userID;
            FirstName = firstName;
            LastName = lastName;
            DateOfBirth = dateOfBirth;
            Email = email;
            Gender = gender;
            ImagePath = imagePath;
            Password = password;
            UserName = userName;

            _Mode= enMode.updateMpde;
        }


        public static DataTable GetAllUsers()
        {
            return clsUsersDataAccess.GetAllUsers();
        }
        public static bool loginCheck(string UserName,  string Password)
        {
            return clsUsersDataAccess.checkLogin(UserName, Password);
        }

        public static bool IsExsist(int UserID)
        {
            return clsUsersDataAccess.IsExsist(UserID);
        }

        public static clsUsers Find(int UserID)
        {
            string FirstName = "", LastName = "", Email = "", ImagePath = "", Password = "", UserName = "";
            DateTime dateOfBirth = DateTime.Now;
            byte Gender = 0;

            if (clsUsersDataAccess.FindByUserID(UserID, ref FirstName, ref LastName, ref dateOfBirth, ref Email, ref Gender,
                ref ImagePath, ref UserName, ref Password))
            {
                return new clsUsers(UserID, FirstName, LastName, dateOfBirth, Email, Gender, ImagePath, Password, UserName);

            }
            else
                return null;
        }

        public static clsUsers FindByUserName(string UserName)
        {
            string FirstName = "", LastName = "", Email = "", ImagePath = "", Password = "";
            int UserID = -1;
            DateTime dateOfBirth = DateTime.Now;
            byte Gender = 0;

            if (clsUsersDataAccess.FindByUserName(ref UserID, ref FirstName, ref LastName, ref dateOfBirth, ref Email, ref Gender,
                ref ImagePath, UserName, ref Password))
            {
                return new clsUsers(UserID, FirstName, LastName, dateOfBirth, Email, Gender, ImagePath, Password, UserName);

            }
            else
                return null;
        }

        public static bool Delete(int UserID)
        {
            return clsUsersDataAccess.DeleteUser(UserID);
        }

        private bool _AddUser()
        {
            this.UserID = clsUsersDataAccess.AddNewUser(this.FirstName, this.LastName, this.DateOfBirth, this.Email, this.Gender,
               this.ImagePath, this.UserName, this.Password);

            return (UserID != -1); 
        }

        private bool _UpdateUser()
        {
            return clsUsersDataAccess.UpdateUser(this.UserID, this.FirstName, this.LastName, this.DateOfBirth, this.Email, this.Gender,
               this.ImagePath, this.UserName, this.Password);
            
        }

        public bool Save()
        {
            switch (_Mode)
            {
                case enMode.addMode:
                    {
                        if(_AddUser())
                        {
                            _Mode = enMode.updateMpde;
                            return true;
                        }
                        else
                            return false;
                    }
                case enMode.updateMpde:
                    {
                        return _UpdateUser();
                    }                    
            }
            return false;
        }

    }
}
