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
                ClientScript.RegisterStartupScript(this.GetType(), "WelcomeMessage",
                    "alert('Welcome " + txtUsername.Text + "!');window.location.href = 'Home.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error",
                    "alert('Login Failed');window.location.href = 'LoginPage.aspx';", true);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
           // if (!validateLoginForm()) return; // Prevent further processing if form is invalid

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

        // Hash the password before storing or comparing
        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
