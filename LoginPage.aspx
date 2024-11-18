<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="TasksManegar.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- يمكن إضافة أي محتوى خاص بالـ head هنا -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- Navbar -->
<header class="header">
    <nav class="navbar navbar-expand-lg navbar-light py-3">
        <div class="container">
            <!-- Navbar Brand -->
            <a href="#" class="navbar-brand">
                <img src="imgs/toplogo.png" alt="logo" width="150">
            </a>
        </div>
    </nav>
</header>

<!-- Login Form -->
<div class="container">
    <div class="row py-5 mt-4 align-items-center">
        <!-- Illustration for Demo Purpose -->
        <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
            <img src="imgs/login.png" alt="" class="img-fluid mb-3 d-none d-md-block">
            <h1>Login to Your Account</h1>
            <p class="font-italic text-muted mb-0">Enter your username and password to access your account.</p>
        </div>

        <!-- Login Form -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <form action="#" method="post">
                <div class="row">
                    <!-- Username -->
                    <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-user-circle text-muted"></i>
                            </span>
                        </div>
                        <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="form-control bg-white border-left-0 border-md"></asp:TextBox>
                    </div>

                    <!-- Password -->
                    <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-lock text-muted"></i>
                            </span>
                        </div>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control bg-white border-left-0 border-md"></asp:TextBox>
                        <div class="input-group-append">
                            <span class="input-group-text bg-white border-md">
                                <i class="fa fa-eye text-muted toggle-password" style="cursor: pointer;"></i>
                            </span>
                        </div>
                    </div>

                    <!-- Remember Me -->
                    <div class="form-group col-lg-12 d-flex align-items-center">
                        <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="mr-2" />
                        <label for="remember" class="text-muted">Remember Me</label>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group col-lg-12 mx-auto mb-0">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block py-2" OnClientClick="return validateLoginForm();" OnClick="btnLogin_Click" />
                    </div>

                    <!-- Divider Text -->
                    <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                        <div class="border-bottom w-100 ml-5"></div>
                        <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                        <div class="border-bottom w-100 mr-5"></div>
                    </div>

                    <!-- Create Account Text -->
                    <div class="text-center w-100">
                        <p class="text-muted font-weight-bold">Don't have an account? <a href="CreateAccountPage.aspx" class="text-primary ml-2">Create One</a></p>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>



<!-- Script for Toggle Password Visibility -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Add toggle password visibility functionality
        const togglePassword = document.querySelector('.toggle-password');
        const passwordField = document.getElementById('<%= txtPassword.ClientID %>');

        togglePassword.addEventListener('click', function () {
            // Toggle password field type
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                togglePassword.classList.remove('fa-eye');
                togglePassword.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                togglePassword.classList.remove('fa-eye-slash');
                togglePassword.classList.add('fa-eye');
            }
        });
    });


    function validateLoginForm() {
        var username = document.getElementById('<%= txtUsername.ClientID %>').value;
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;

            if (username == "") {
                alert('يرجى إدخال اسم المستخدم.');
                return false; // منع إرسال النموذج
            }
            if (password == "") {
                alert('يرجى إدخال كلمة المرور.');

                return false; // منع إرسال النموذج
            }

            return true; // السماح بإرسال النموذج
    } 
    

</script>


</asp:Content>
