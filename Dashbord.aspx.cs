using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TasksManegar
{
    public partial class Dashbord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTasks();
                BindAchievements();
            }
        }

        private void LoadTasks()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("Title");
            dt.Columns.Add("Description");
            dt.Columns.Add("Category");
            dt.Columns.Add("StartDate");
            dt.Columns.Add("EndDate");
            dt.Columns.Add("IsCompleted", typeof(bool));

            // بيانات وهمية، استبدلها ببيانات من قاعدة البيانات
            dt.Rows.Add(1, "Task 1", "Description 1", "Category 1", DateTime.Now.AddDays(-1), DateTime.Now, true);
            dt.Rows.Add(2, "Task 2", "Description 2", "Category 2", DateTime.Now.AddDays(-2), DateTime.Now, false);

            gvTasks.DataSource = dt;
            gvTasks.DataBind();
        }

        protected void gvTasks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MarkComplete")
            {
                int taskId = Convert.ToInt32(e.CommandArgument);

                // تحديث حالة المهمة في قاعدة البيانات
                string query = "UPDATE Tasks SET IsCompleted = 1 WHERE Id = @Id";
                using (SqlConnection conn = new SqlConnection("your_connection_string"))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Id", taskId);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // إعادة تحميل المهام
                LoadTasks();
            }
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


    }
}
