<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateAccountPage.aspx.cs" Inherits="TasksManegar.CreateAccountPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- Navbar-->
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

<div class="container">
    <div class="row py-5 mt-4 align-items-center">
        <!-- For Demo Purpose -->
        <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
            
            <img src="imgs/createAccount.png"  alt="" class="img-fluid mb-3 d-none d-md-block">
            <h1>Create an Account</h1>
            <p class="font-italic text-muted mb-0">Create a minimal registeration page using Bootstrap 4 HTML form elements.</p>
        </div>

        <!-- Registration Form -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <form action="#">
                <div class="row">

                    <!-- First Name -->
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-user text-muted"></i>
                            </span>
                        </div>
                        <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" CssClass="form-control bg-white border-left-0 border-md"></asp:TextBox>
                    </div>

                    <!-- Last Name -->
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-user text-muted"></i>
                            </span>
                        </div>
                        <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" CssClass="form-control bg-white border-left-0 border-md"></asp:TextBox>
                    </div>

                    <!-- Username -->
                    <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-user-circle text-muted"></i>
                            </span>
                        </div>
                        <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="form-control bg-white border-left-0 border-md"></asp:TextBox>
                    </div>

                    <!-- Email Address -->
                    <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-envelope text-muted"></i>
                            </span>
                        </div>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Email Address" CssClass="form-control bg-white border-left-0 border-md"></asp:TextBox>
                    </div>

                    <!-- Date of Birth -->
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-calendar text-muted"></i>
                            </span>
                        </div>
                        <asp:TextBox ID="txtBirthDate" runat="server" TextMode="Date" CssClass="form-control bg-white border-left-0 border-md"></asp:TextBox>
                    </div>

                    <!-- Gender -->
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-venus-mars text-muted"></i>
                            </span>
                        </div>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control custom-select bg-white border-left-0 border-md">
                            <asp:ListItem Text="Select Gender" Value="" />
                            <asp:ListItem Text="Male" Value="1" />
                            <asp:ListItem Text="Female" Value="0" />
                        </asp:DropDownList>
                    </div>

                    <!-- Upload Photo -->
                    <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-camera text-muted"></i>
                            </span>
                        </div>
                        <asp:FileUpload ID="filePhoto" runat="server" CssClass="form-control bg-white border-left-0 border-md" />
                    </div>                                 

                    <!-- Password -->
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-lock text-muted"></i>
                            </span>
                        </div>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control bg-white border-left-0 border-md"></asp:TextBox>
                    </div>

                    <!-- Confirm Password -->
                    <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-lock text-muted"></i>
                            </span>
                        </div>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password" CssClass="form-control bg-white border-left-0 border-md"></asp:TextBox>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-group col-lg-12 mx-auto mb-0">
                        <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn btn-primary btn-block py-2" OnClientClick="return validateRegisterForm();"  OnClick="btnRegister_Click" />
                    </div>

                    <!-- Login Link -->
                    <div class="text-center w-100">
                        <p class="text-muted font-weight-bold">Already have an account? <a href="LoginPage.aspx" class="text-primary ml-2">Login Here</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


    <script type="text/javascript">
    function validateRegisterForm() {
        var firstName = document.getElementById('<%= txtFirstName.ClientID %>').value;
        var lastName = document.getElementById('<%= txtLastName.ClientID %>').value;
        var username = document.getElementById('<%= txtUsername.ClientID %>').value;
        var birthday = document.getElementById('<%= txtBirthDate.ClientID %>').value;
        var gender = document.getElementById('<%= ddlGender.ClientID %>').value;
        var email = document.getElementById('<%= txtEmail.ClientID %>').value;
        var photo = document.getElementById('<%= filePhoto.ClientID %>').value;
        var password = document.getElementById('<%= txtPassword.ClientID %>').value;
        var confirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;

        if (firstName == "" || lastName == "" || username == "" || birthday == "" || gender == ""
            || email == "" || photo == "" || password == "" || confirmPassword == "" ) {
            alert("يرجى ملء جميع الحقول المطلوبة.");
            return false; // منع إرسال النموذج إذا كانت الحقول فارغة
        }

        // التحقق من تطابق كلمة المرور
        if (password !== confirmPassword) {
            alert("كلمة المرور وتأكيد كلمة المرور لا يتطابقان.");
            return false;
        }

        return true; // السماح بإرسال النموذج إذا كانت جميع الحقول مكتملة
        }


       
    function previewImage(event) {
        const file = event.target.files[0];
            if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('previewImage').src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }

    </script>


</asp:Content>
