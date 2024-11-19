using busniessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TasksManegar
{
    public partial class CreateAccountPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            clsUsers _User= new clsUsers();

            _User.FirstName = txtFirstName.Text;
            _User.LastName = txtLastName.Text;
            _User.UserName = txtUsername.Text;
            _User.Email = txtEmail.Text;
            _User.DateOfBirth =Convert.ToDateTime(txtBirthDate.Text);
            _User.Gender = Convert.ToByte(ddlGender.SelectedValue);
            _User.Password = txtPassword.Text;
            //_User.ImagePath = Server.MapPath("~/imgs") + filePhoto.FileName;
            _User.ImagePath = @"F:\My_github_apps\TaskManegment\TheTasksManegar\imgs\" + filePhoto.FileName;
            filePhoto.SaveAs(_User.ImagePath);

            if(_User.Save())
            {
               
                ClientScript.RegisterStartupScript(this.GetType(), "redirect",
                "alert('Validate All Will Done'); window.location.href = 'LoginPage.aspx';", true);
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Error",
                "alert(Register Failed)");





        }
    }
}