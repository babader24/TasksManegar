using busniessLayer;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using static TasksManegar.LoginPage;

namespace TasksManegar
{
    public partial class Dashbord : System.Web.UI.Page
    {
        private enum enMode { AddTask=0, UpdateTask=1};
         enMode _Mode;

        clsTasks TheTask;
        int TheTaskID;

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
            //DataTable dt = new DataTable();
            //dt.Columns.Add("Id");
            //dt.Columns.Add("Title");
            //dt.Columns.Add("Description");
            //dt.Columns.Add("Category");
            //dt.Columns.Add("StartDate");
            //dt.Columns.Add("EndDate");
            //dt.Columns.Add("IsCompleted", typeof(bool));

            //// بيانات وهمي
            //dt.Rows.Add(1, "Task 1", "Description 1", "Category 1", DateTime.Now.AddDays(-1), DateTime.Now, true);
            //dt.Rows.Add(2, "Task 2", "Description 2", "Category 2", DateTime.Now.AddDays(-2), DateTime.Now, false);

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
            if (e.CommandName == "EditTask")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "openModal", "openAddTaskModal();", true);

                TheTaskID = (int)e.CommandArgument;
            }

            if (e.CommandName == "DeleteTask")
            {
                int taskId =(int)e.CommandArgument;
                clsTasks.DeleteTask(taskId);
            }



            // إعادة تحميل المهام
            LoadTasks();
        }

        private void EditTask()
        {
            _Mode = enMode.UpdateTask;
            TheTask = clsTasks.Find(TheTaskID);

           txtTitle.Text = TheTask.Title;
           txtDescription.Text = TheTask.Description;
           ddlCategory.SelectedIndex = TheTask.CategoryID;
           txtStartDate.Text = TheTask.StartDate.ToString("dd/MM/yyyy");
           txtEndDate.Text = TheTask.EndDate.ToString("dd/MM/yyyy");
           chkIsActive.Checked = TheTask.IsActive;



        }
        private void BindAchievements()
        {
            DataTable dtAchievements = new DataTable();
            dtAchievements.Columns.Add("NoteId", typeof(int));
            dtAchievements.Columns.Add("Achievement", typeof(string));

            // بيانات وهمية، استبدلها ببيانات من قاعدة البيانات
            dtAchievements.Rows.Add(1, "Completed first module");
            dtAchievements.Rows.Add(2, "Created a new feature");

            gvAchievements.DataSource = dtAchievements;
            gvAchievements.DataBind();
        }

        protected void btnAddAchievement_Click(object sender, EventArgs e)
        {
            string achievement = txtAchievement.Text.Trim();
            if (!string.IsNullOrEmpty(achievement))
            {
                // إضافة الإنجاز لقاعدة البيانات
                string query = "INSERT INTO Achievements (Achievement) VALUES (@Achievement)";
                using (SqlConnection conn = new SqlConnection("your_connection_string"))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Achievement", achievement);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                txtAchievement.Text = string.Empty;
                BindAchievements();
            }
        }

        protected void btnUpdateAchievement_Click(object sender, EventArgs e)
        {
            int noteId = int.Parse(hfNoteId.Value);
            string updatedAchievement = txtAchievement.Text.Trim();

            if (!string.IsNullOrEmpty(updatedAchievement))
            {
                // تحديث الإنجاز في قاعدة البيانات
                string query = "UPDATE Achievements SET Achievement = @Achievement WHERE NoteId = @NoteId";
                using (SqlConnection conn = new SqlConnection("your_connection_string"))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Achievement", updatedAchievement);
                        cmd.Parameters.AddWithValue("@NoteId", noteId);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                txtAchievement.Text = string.Empty;
                hfNoteId.Value = string.Empty;
                btnAddAchievement.Visible = true;
                btnUpdateAchievement.Visible = false;
                btnCancelEdit.Visible = false;
                BindAchievements();
            }
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            txtAchievement.Text = string.Empty;
            hfNoteId.Value = string.Empty;
            btnAddAchievement.Visible = true;
            btnUpdateAchievement.Visible = false;
            btnCancelEdit.Visible = false;
        }

        protected void gvAchievements_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int noteId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditAchievement")
            {
                // استرجاع البيانات من قاعدة البيانات
                hfNoteId.Value = noteId.ToString();
                txtAchievement.Text = "Existing achievement text"; // استبدلها ببيانات من قاعدة البيانات
                btnAddAchievement.Visible = false;
                btnUpdateAchievement.Visible = true;
                btnCancelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteAchievement")
            {
                // حذف الإنجاز من قاعدة البيانات
                string query = "DELETE FROM Achievements WHERE NoteId = @NoteId";
                using (SqlConnection conn = new SqlConnection("your_connection_string"))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@NoteId", noteId);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindAchievements();
            }

        }


        protected void AddTask_Command(object sender, CommandEventArgs e)
        {
            // هنا يمكنك كتابة الكود الذي ترغب في تنفيذه عند الضغط على الزر
            // مثال: فتح المودال أو تنفيذ أي عملية أخرى
            Response.Write("Add Task button clicked");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {


            clsTasks _Task = new clsTasks();

            _Task.Title = txtTitle.Text;
            _Task.Description = txtDescription.Text;
            _Task.CategoryID = int.Parse(ddlCategory.SelectedValue);
            _Task.StartDate = DateTime.Parse(txtStartDate.Text);
            _Task.EndDate = DateTime.Parse(txtEndDate.Text);
            _Task.IsActive = chkIsActive.Checked;
            _Task.UserID = Globle._GUser.UserID;

            if(_Task.Save())
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


    }
}
