using busniessLayer;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static TasksManegar.LoginPage;

namespace TasksManegar
{
    public partial class Dashbord : System.Web.UI.Page
    {
        
        private enum enMode { AddTask=0, UpdateTask=1};
         enMode _Mode;

       static clsTasks Tasks;
       static clsAchievement Achievement;
       int TaskID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Config();
            }



        }


        private void Config()
        {
            LoadTasks();
            BindAchievements();
            LoadSideBarInfo();
            LoadCategories();
            BindAchievements();

        }

        private void LoadCategories()
        {

            ddlCategory.DataSource = clsCategory.GetAllCategory();
            ddlCategory.DataTextField = "CategoryName"; 
            ddlCategory.DataValueField = "CategoryID";  
            ddlCategory.DataBind();
        }

        private void LoadSideBarInfo()
        {
            string imagePath = Server.MapPath("~/imgs/man400px.png");
            if (!System.IO.File.Exists(imagePath))
            {
                throw new Exception($"File not found: {imagePath}");
            }

            //set Side Bar Settings
            if (string.IsNullOrEmpty(Globle._GUser.ImagePath))
            {
                imgUserProfile.ImageUrl = "~/imgs/man400px.png";
            }
            else
            {
                // تحويل المسار المطلق إلى نسبي
                string relativePath = Globle._GUser.ImagePath.Replace(Server.MapPath("~/"), "~/").Replace("\\", "/");
                imgUserProfile.ImageUrl = relativePath;
            }


            lblUserName.Text = Globle._GUser.UserName;
        }

        private void LoadTasks()
        {

            gvTasks.DataSource = clsTasks.GetAllTasks(Globle._GUser.UserID);
            
            gvTasks.DataBind();
        }

        protected void gvTasks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MarkComplete")
            {
                
                clsTasks _Task = clsTasks.Find(int.Parse(e.CommandArgument.ToString()));

                if(_Task.IsActive)
                    _Task.IsActive = false;

                else
                    _Task.IsActive = true;

                if (_Task.Save())
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Error",
                        "alert('Suceessfully')");
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "Error",
                        "alert('Failed')");

            }

            if (e.CommandName == "DeleteTask")
            {                
                clsTasks.DeleteTask(Convert.ToInt32(e.CommandArgument));
            }

            // إعادة تحميل المهام
            LoadTasks();
        }

        [WebMethod]
        public static int TaskServerHandler(int TaskID)
        {
            if (TaskID == -1)
            {
                Tasks = new clsTasks(); 
            }
            else
                Tasks = clsTasks.Find(TaskID);


            return TaskID;
        }

        [WebMethod]
        public static int AhcievmentServerHandler(int AchievmentID)
        {
            if (AchievmentID == -1)
            {
                Achievement = new clsAchievement();
            }
            else
                Achievement = clsAchievement.Find(AchievmentID);


            return AchievmentID;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            Tasks.Title = txtTitle.Text;
            Tasks.Description = txtDescription.Text;
            Tasks.CategoryID = int.Parse(ddlCategory.SelectedValue);
            Tasks.StartDate = DateTime.Parse(txtStartDate.Text);
            Tasks.EndDate = DateTime.Parse(txtEndDate.Text);
            Tasks.IsActive = chkIsActive.Checked;
            Tasks.UserID = Globle._GUser.UserID;
                        

            if (Tasks.Save())
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error",
                    "alert('Suceessfully')");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Error",
                    "alert('Failed')");

            // إعادة تحميل البيانات في 
            LoadTasks();
        }


        private void BindAchievements()
        {

            gvAchievements.DataSource = clsAchievement.GetAllAchievement(Globle._GUser.UserID);
            gvAchievements.DataBind();
        }

        protected void btnAddAchievement_Click(object sender, EventArgs e)
        {
            //string achievement = txtAchievement.Text.Trim();
            //if (!string.IsNullOrEmpty(achievement))
            //{
            //    // إضافة الإنجاز لقاعدة البيانات
            //    string query = "INSERT INTO Achievements (Achievement) VALUES (@Achievement)";
            //    using (SqlConnection conn = new SqlConnection("your_connection_string"))
            //    {
            //        using (SqlCommand cmd = new SqlCommand(query, conn))
            //        {
            //            cmd.Parameters.AddWithValue("@Achievement", achievement);
            //            conn.Open();
            //            cmd.ExecuteNonQuery();
            //        }
            //    }

            //    txtAchievement.Text = string.Empty;
            //    BindAchievements();
            //}
        }

        protected void btnUpdateAchievement_Click(object sender, EventArgs e)
        {
            //int noteId = int.Parse(hfNoteId.Value);
            //string updatedAchievement = txtAchievement.Text.Trim();

            //if (!string.IsNullOrEmpty(updatedAchievement))
            //{
            //    // تحديث الإنجاز في قاعدة البيانات
            //    string query = "UPDATE Achievements SET Achievement = @Achievement WHERE NoteId = @NoteId";
            //    using (SqlConnection conn = new SqlConnection("your_connection_string"))
            //    {
            //        using (SqlCommand cmd = new SqlCommand(query, conn))
            //        {
            //            cmd.Parameters.AddWithValue("@Achievement", updatedAchievement);
            //            cmd.Parameters.AddWithValue("@NoteId", noteId);
            //            conn.Open();
            //            cmd.ExecuteNonQuery();
            //        }
            //    }

            //    txtAchievement.Text = string.Empty;
            //    hfNoteId.Value = string.Empty;
            //    btnAddAchievement.Visible = true;
            //    btnUpdateAchievement.Visible = false;
            //    btnCancelEdit.Visible = false;
            //    BindAchievements();
            //}
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            //txtAchievement.Text = string.Empty;
            //hfNoteId.Value = string.Empty;
            //btnAddAchievement.Visible = true;
            //btnUpdateAchievement.Visible = false;
            //btnCancelEdit.Visible = false;
        }

        protected void gvAchievements_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "DeleteAchievement")
            {

                clsAchievement.DeleteAchievement(Convert.ToInt32(e.CommandArgument));
                
            }
            BindAchievements();
        }


        protected void AddTask_Command(object sender, CommandEventArgs e)
        {
            lModalTitle.Text = "Add New new Task";
        }

        protected void AbtnSave_Click(object sender, EventArgs e)
        {
            Achievement.AchievementName = txtAchievement.Text;
            Achievement.AchievementDescription = txtAchievmentDescription.Text;
            Achievement.AchievementDate = DateTime.Parse(txtAchievementDate.Text);
            Achievement.UserID =Globle._GUser.UserID;
            
           

            if (Achievement.Save())
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error",
                    "alert('Suceessfully')");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Error",
                    "alert('Failed')");

            // تحميل الانجازات 
            BindAchievements();
        }

    }
}
