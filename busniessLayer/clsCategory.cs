using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace busniessLayer
{
    public class clsCategory
    {
       

        public int CategoryID { get; set; } 

        public string CategoryName { get; set; }

        public int UserID { get; set; }

        clsCategory()
        {
            CategoryID = -1;
            CategoryName = "";
            UserID = -1;

           
        }

        clsCategory(int categoryID, string categoryName, int userID)
        {
            CategoryID = categoryID;
            CategoryName = categoryName;
            UserID = userID;

            
        }

        public static DataTable GetAllCategory(int UserID)
        {
            return clsCategoryDataAccess.GetAllCategory(UserID);
        }

        public static bool DeleteCategory(int UserID)
        {
            return clsCategoryDataAccess.DeleteCaegoty(UserID);
        }

        public static bool AddCategory( string categoryName, int UserID)
        {
            int CategoryID =  clsCategoryDataAccess.AddNewCategory(categoryName, UserID);

            return CategoryID != -1;
        }

        public static int GetCategoryID(string categoryName)
        {
            return clsCategoryDataAccess.GetCategoryIdByName(categoryName);
        }

    }
}
