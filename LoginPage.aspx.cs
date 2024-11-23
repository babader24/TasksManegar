using busniessLayer;
using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace TasksManegar
{
    public partial class LoginPage : System.Web.UI.Page
    {
        private string remeberMeFile = "F:\\My_github_apps\\TaskManegment\\TheTasksManegar\\rememberMe.txt";

        public static class Globle
        {
            public static clsUsers _GUser {  get; set; }
        }
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // هذا الكود سيعمل فقط عند تحميل الصفحة لأول مرة
                loadUserInfo();
                
            }
        }

        private void checkLogin()
        {
            // Replace with your login validation logic (hash the password before checking)
            if (clsUsers.loginCheck(txtUsername.Text,txtPassword.Text))
            {
                Globle._GUser = clsUsers.FindByUserName(txtUsername.Text);

                ClientScript.RegisterStartupScript(this.GetType(), "WelcomeMessage",
                    "alert('Welcome " + txtUsername.Text + "!');window.location.href = 'Dashbord.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error",
                    "alert('Login Failed');window.location.href = 'LoginPage.aspx';", true);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
           

            if (chkRememberMe.Checked)
            {
                saveUserInfo();
            }
            else if (File.Exists(remeberMeFile))
            {
                File.Delete(remeberMeFile);
            }

            checkLogin();
        }

        private void loadUserInfo()
        {
            if (File.Exists(remeberMeFile))
            {
                var lines = File.ReadAllLines(remeberMeFile);
                if (lines.Length == 2)
                {
                    txtUsername.Text = lines[0];
                    txtPassword.Text = lines[1];
                    chkRememberMe.Checked = true;
                }
            }
        }

        private void saveUserInfo()
        {
            using (StreamWriter writer = new StreamWriter(remeberMeFile))
            {
                writer.WriteLine(txtUsername.Text);
                writer.WriteLine(txtPassword.Text);
            }
        }
      
    }
}
