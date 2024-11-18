using busniessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TasksManegar
{
    public partial class TasksPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("Id");
                dt.Columns.Add("Title");
                dt.Columns.Add("Description");
                dt.Columns.Add("Category");
                dt.Columns.Add("StartDate");
                dt.Columns.Add("EndDate");
                dt.Columns.Add("IsCompleted", typeof(bool));

                // إضافة بيانات وهمية لتوضيح الفكرة
                dt.Rows.Add(1,"Task 1", "Description 1", "Category 1", DateTime.Now.AddDays(-1), DateTime.Now, true);
                dt.Rows.Add(2,"Task 2", "Description 2", "Category 2", DateTime.Now.AddDays(-2), DateTime.Now, false);


                // ربط البيانات
                gvTasks.DataSource = dt; // فرضًا أن GetTasks() يعيد قائمة من المهام.
                gvTasks.DataBind();
                
            }
        }

        protected void gvTasks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int taskId = Convert.ToInt32(e.CommandArgument);

            //if (e.CommandName == "EditTask")
            //{
            //    // منطق التعديل هنا
            //    EditTask(taskId);
            //}
            //else if (e.CommandName == "DeleteTask")
            //{
            //    // منطق الحذف هنا
            //    DeleteTask(taskId);
            //}
        }


    }
}