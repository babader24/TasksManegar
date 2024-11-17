using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TasksManegar
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // الكود الذي ينفذ عند الضغط على زر تسجيل الدخول
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            bool rememberMe = chkRememberMe.Checked;

            // عملية التحقق من بيانات المستخدم وتسجيل الدخول
        }
    }
}