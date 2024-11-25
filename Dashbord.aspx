<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashbord.aspx.cs" Inherits="TasksManegar.Dashbord" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Management</title>

        <!--  the bootstarp css file -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- the fontawesome css file -->
    <link href="fontawesome/css/all.css" rel="stylesheet" />

    

    
<style>
    /* التعديلات الأساسية */
    body, html {
        margin: 0;
        padding: 0;
        font-family: 'Arial', sans-serif;
        height: 100vh;
        display: flex;
        flex-direction: column;
        background-color: #f4f4f9;
    }

    .sidebar {
        background-color: #343a40;
        color: #fff;
        min-width: 170px;
        padding: 20px;
        height: 100vh;
        position: fixed;
    }

    .sidebar .profile img {
        border-radius: 50%;
        margin-bottom: 10px;
        width: 100px;
        height: 100px;
        object-fit: cover;
    }

    .sidebar h4 {
        margin: 10px 0;
        font-size: 1.2rem;
        font-weight: bold;
    }

    .sidebar a {
        color: #fff;
        text-decoration: none;
        padding: 10px 15px;
        display: flex;
        align-items: center;
        border-radius: 5px;
        margin: 5px 0;
        transition: background-color 0.3s ease;
    }
    .sidebar .btnSetting {
        text-transform: none;
        background-color: #343a40;
        border: none;
        color: white;
    }

    .sidebar a:hover ,
    .sidebar a:hover~.btnSetting {
        background-color: #495057;
    }

    .sidebar i {
        margin-right: 10px;
    }

    .sidebar .logout {
        margin-top: auto;
    }

    .container {
        margin-left: 270px; 
        padding: 20px;
        max-width: 1200px;
        margin-top: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .title {
        font-size: 1.8rem;
        color: #333;
    }

    .btn-add-task {
        background-color: #007bff;
        color: white;
        padding: 8px 16px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-add-task:hover {
        background-color: #0056b3;
    }

    .table-wrapper {
        overflow-x: auto;
    }
   
    .btn-edit-green {
        background-color: #4CAF50;
        color: white;
        border: 2px solid #4CAF50;
        padding: 4px 8px;
        border-radius: 8px; 
        font-size: 18px;
        cursor: pointer;
        transition: all 0.3s ease; 
    }

        .btn-edit-star {
       
        color: white;
        border: none;
        
        
        font-size: 25px;
        cursor: pointer;
        transition: all 0.3s ease; 
    }

    .btn-edit-green:hover {
        background-color: #45a049; 
        border-color: #45a049; 
        transform: translateY(-2px); 
    }

    .btn-edit-green:active {
        transform: translateY(0); 
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); 
    }


    .btn-edit-red {
            background-color: white;
            color: white !important;
            border: 2px solid #f44336;
            padding: 4px 8px;
            border-radius: 50%;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
    }

    .btn-edit-red:hover {
        background-color: #e53935; 
        transform: translateY(-2px); 
    }

    .btn-edit-red:active {
        transform: translateY(0); 
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); 
    }

   
    .btn-edit-red:before {
        content: "❌"; 
        font-size: 24px;
        font-weight: bold;
        color: white;
    }

    .custom-table {
        width: 100%;
        border-collapse: collapse;
        background-color: #f9f9f9;
    }

    .custom-table th, .custom-table td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }

    .custom-table thead {
        background-color: #007bff;
        color: #fff;
    }

    .custom-table tbody tr:nth-child(even) {
        background-color: #f1f1f1;
    }

    .custom-table tbody tr:hover {
        background-color: #e9ecef;
    }

    .actions button {
        border: none;
        padding: 8px 12px;
        margin: 0 5px;
        font-size: 14px;
        cursor: pointer;
        border-radius: 5px;
    }

    .btn-edit {
        background-color: #28a745;
        color: #fff;
    }



    .btn-delete {
        background-color: #dc3545;
        color: #fff;
    }

    .btn-edit:hover {
        background-color: #218838;
    }

    .btn-delete:hover {
        background-color: #c82333;
    }

    footer {
        background-color: #343a40;
        color: white;
        text-align: center;
        padding: 10px;
        position: relative;
        bottom: 0;
        width: 100%;
        margin-top: auto;
    }

    @media (max-width: 768px) {
        .container {
            margin-left: 0;
            padding: 15px;
        }

        .sidebar {
            position: static;
            height: auto;
        }

        .custom-table th, .custom-table td {
            font-size: 14px;
        }

        .modal {
            display: none; 
            position: fixed; 
            z-index: 1050; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgba(0, 0, 0, 0.5); 
        }

        .modal-dialog {
            position: relative;
            margin: 10% auto; 
            width: 90%; 
            max-width: 600px;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
        }

        .modal-header {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }


        .modal-body {
            padding: 15px 0;
        }


        .modal-footer {
            border-top: 1px solid #ddd;
            padding: 10px 0;
            text-align: right;
        }

        .modal-close {
            background-color: transparent;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }

    }
</style>

</head>
<body>
    <form id="form1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server" />

       
                <!-- Sidebar -->
<div class="sidebar">
            <div class="profile text-center">           
                <asp:Image ID="imgUserProfile" runat="server"  CssClass="img-fluid" AlternateText="User Image" />                     
                <asp:Label ID="lblUserName" runat="server" Text="User Name" CssClass="h4" />
            </div>
            <nav>
                <a href="#Tasks"><i class="fas fa-tasks"></i> Tasks</a>
                <a href="#Achievements" class="mt-3"><i class="fas fa-trophy"></i> Achievements</a>
                <a href="#" class="mt-3" data-bs-toggle="modal" data-bs-target="#userSettingsModal" onclick="fetchUserDetails()"><i class="fas fa-cogs"></i> Settings</a>
            </nav>
            <div class="logout">
                <a href="loginPage.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>






        <!-- Settings Modal -->
<div class="modal fade" id="userSettingsModal" tabindex="-1" aria-labelledby="userFormModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userFormModalLabel">User Registration</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                
                    <!-- First and Last Name -->
                    <div class="row mb-3">
                        <div class="col">
                            <label for="firstName" class="form-label">First Name</label>
                            <asp:TextBox runat="server" ID="firstName" CssClass="form-control" placeholder="Enter your first name"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label for="lastName" class="form-label">Last Name</label>
                            <asp:TextBox runat="server" ID="lastName" CssClass="form-control" placeholder="Enter your last name"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Email and Date of Birth -->
                    <div class="row mb-3">
                        <div class="col">
                            <label for="email" class="form-label">Email</label>
                            <asp:TextBox runat="server" ID="email" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label for="dob" class="form-label">Date of Birth</label>
                            <asp:TextBox runat="server" ID="dob" CssClass="form-control" placeholder="Enter a Date" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Gender and Upload Photo -->
                    <div class="row mb-3">
                        <div class="col">
                            <label class="form-label">Gender</label>
                            <div>
                                <input type="radio" class="btn-check" name="gender" id="male" value="Male">
                                <label class="btn btn-outline-primary" for="male">Male</label>

                                <input type="radio" class="btn-check" name="gender" id="female" value="Female">
                                <label class="btn btn-outline-primary" for="female">Female</label>
                            </div>
                        </div>
                        <div class="col">
                            <label for="photo" class="form-label">Upload Photo</label>
                            <asp:FileUpload runat="server" ID="photo" CssClass="form-control" />
                        </div>
                    </div>

                    <!-- Username, Password, and Confirm Password -->
                    <div class="row mb-3">
                        <div class="col">
                            <label for="username" class="form-label">Username</label>
                            <asp:TextBox runat="server" ID="username" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label for="password" class="form-label">Password</label>
                            <asp:TextBox runat="server" ID="password" CssClass="form-control" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                            <asp:TextBox runat="server" ID="confirmPassword" CssClass="form-control" placeholder="Confirm password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="btn btn-primary" OnClientClick="return validateSettingsForm();" OnClick="saveButton_Click" />                                                
            </div>
        </div>
    </div>
</div>



          <!-- Tasks -->
<div id="Tasks" class="container">

            <!-- Task Management Section -->
            <div class="header-container">
                <h1 class="title">Task Management</h1>
                <button type="button" class="btn-add-task " data-bs-toggle="modal" data-bs-target="#addTaskModal" onclick="clearModal()" >Add Task</button>
            </div>
            <div class="table-wrapper">                
                <asp:GridView ID="gvTasks" runat="server" AutoGenerateColumns="False" CssClass="custom-table" OnRowCommand="gvTasks_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:Button ID="btnSelect" runat="server" Text='<%# bool.Parse(Eval("IsActive").ToString()) ? "✔" : "❌" %>' CommandName="MarkComplete" CommandArgument='<%# Eval("TaskID") %>' CssClass='<%# bool.Parse(Eval("IsActive").ToString()) ? "btn-edit-green" : "btn-edit-red" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>       
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />      
                        <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />      
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" />      
                        <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" />       
                        <asp:TemplateField HeaderText="Completed">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkCompleted" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="true" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <button type="button" class="btn-edit" data-bs-toggle="modal" data-bs-target="#addTaskModal" onclick="fillModal('<%# Eval("TaskID") %>', '<%# Eval("Title") %>', '<%# Eval("Description") %>', '<%# Eval("CategoryName") %>', '<%# Eval("StartDate") %>', '<%# Eval("EndDate") %>', '<%# Eval("IsActive") %>')">Edit</button>
                                <asp:Button ID="btnDelete" runat="server" CommandName="DeleteTask" CommandArgument='<%# Eval("TaskID") %>' Text="Delete" CssClass="btn-delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                    
            </div>

        </div>


        <!-- Modal Add Task -->

<div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <asp:Label ID="lModalTitle" runat="server" Text="Add New Task " CssClass="modal-title"/>              
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Title"></asp:TextBox>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control mt-2" placeholder="Description"></asp:TextBox>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control mt-2">
                    
                   <asp:ListItem Text="Select Category" Value="0" />
                   
                </asp:DropDownList>
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control mt-2" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control mt-2" placeholder="End Date" TextMode="Date"></asp:TextBox>
                <asp:CheckBox ID="chkIsActive" runat="server" Text="Is Active" CssClass="mt-2" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            </div>
        </div>
    </div>
</div>

        



        <!--  achievements -->
<div id="Achievements" class="container">
    <h2 class="title">Achievements🎉</h2>
    <div  class="table-wrapper">
        <asp:GridView ID="gvAchievements" runat="server" AutoGenerateColumns="False" CssClass="custom-table" OnRowCommand="gvAchievements_RowCommand">
            <Columns>
               <asp:TemplateField HeaderText="Star">
                    <ItemTemplate>
                         <asp:Button ID="btnStar" runat="server" Text="✨"  CssClass= "btn-edit-star"/>
                    </ItemTemplate>
                </asp:TemplateField>  
                <asp:BoundField DataField="AchievementName" HeaderText="Achievement" SortExpression="AchievementName" />
                <asp:BoundField DataField="AchievementDescription" HeaderText="Description" SortExpression="AchievementDescription" />
                <asp:BoundField DataField="AchievementDate" HeaderText="Achievement Date" SortExpression="AchievementDate" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <button type="button" class="btn-edit" data-bs-toggle="modal" data-bs-target="#addAchievmentModal" onclick="fillAchievmentModal('<%# Eval("AchievementID") %>', '<%# Eval("AchievementName") %>', '<%# Eval("AchievementDescription") %>', '<%# Eval("AchievementDate") %>')" >Edit</button>
                        <asp:Button ID="btnDeleteAchievement" runat="server" CommandName="DeleteAchievement" CommandArgument='<%# Eval("AchievementID") %>' Text="Delete" CssClass="btn-delete" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
     <button type="button" class="btn-add-task " data-bs-toggle="modal" data-bs-target="#addAchievmentModal" onclick="clearAchievmentmodal()" >Add Achievment</button>
</div>

        <!-- Modal Add Achievment -->

<div class="modal fade" id="addAchievmentModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <asp:Label ID="lTitle" runat="server" Text="Add New Achievment " CssClass="modal-title"/>              
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               
                <asp:TextBox ID="txtAchievement" runat="server" CssClass="form-control" placeholder="Title"></asp:TextBox>
                <asp:TextBox ID="txtAchievementDate" runat="server" CssClass="form-control mt-2" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                <asp:TextBox ID="txtAchievmentDescription" runat="server" CssClass="form-control mt-2" placeholder="Description"></asp:TextBox>

                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <asp:Button ID="AbtnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="AbtnSave_Click" />
            </div>
        </div>
    </div>
</div>


    </form>
    <script>

      
        function closeModal() {
                $('#addTaskModal').modal('hide');
        }

        function formatDate(dateString) {

            var parts = dateString.split(' ')[0].split('/');
            return '20' + parts[2] + '-' + parts[1] + '-' + parts[0];
        }

        function fillModal(taskId, title, description, category, startDate, endDate, isActive) {




            document.getElementById('<%= lModalTitle.ClientID %>').innerText = "Update Task";
            document.getElementById('<%= txtTitle.ClientID %>').value = title;
            document.getElementById('<%= txtDescription.ClientID %>').value = description;

            var categoryDropdown = document.getElementById('<%= ddlCategory.ClientID %>');
            var options = categoryDropdown.options;
            
            for (var i = 0; i < options.length; i++) {
                if (options[i].text === category) {
                    categoryDropdown.selectedIndex = i; 
                    break; 
                }
            }

            
            document.getElementById('<%= txtStartDate.ClientID %>').value = formatDate(startDate);
            document.getElementById('<%= txtEndDate.ClientID %>').value = formatDate(endDate);
            document.getElementById('<%= chkIsActive.ClientID %>').checked = (isActive === "true");  

            sendTaskIDToServer(taskId);
        }

        function clearModal() {
           
            document.getElementById('<%= lModalTitle.ClientID %>').innerText = "Add New Task";            
            document.getElementById('txtTitle').value = "";
            document.getElementById('txtDescription').value = "";
            document.getElementById('ddlCategory').value = 1; 
            document.getElementById('txtStartDate').value = "";
            document.getElementById('txtEndDate').value = "";

            sendTaskIDToServer(-1);
        }

        function fillAchievmentModal(AchievementID, Achievement, Description, ADate) {

            document.getElementById('<%= lTitle.ClientID %>').innerText = "Update Achievment"; 
            document.getElementById('<%= txtAchievement.ClientID %>').value = Achievement;
            document.getElementById('<%= txtAchievementDate.ClientID %>').value = formatDate(ADate);          
            document.getElementById('<%= txtAchievmentDescription.ClientID %>').value = Description


            sendAchievmentIDToServer(AchievementID);

        }

        function clearAchievmentmodal() {

            document.getElementById('<%= lTitle.ClientID %>').innerText = "Add New Achievment"; 
            document.getElementById('txtAchievement').value = "";
            document.getElementById('txtAchievementDate').value = "";
            document.getElementById('txtAchievmentDescription').value = "";

            sendAchievmentIDToServer(-1);
        }

        function sendTaskIDToServer(taskId) {
            fetch('/Dashbord.aspx/TaskServerHandler', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ TaskID: taskId })
            })
                .then(response => response.json())
                .then(data => console.log('Success:', data))
                .catch(error => console.error('Error:', error));
        }

        function sendAchievmentIDToServer(achievmentId) {
            fetch('/Dashbord.aspx/AhcievmentServerHandler', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ AchievmentID: achievmentId })
            })
                .then(response => response.json())
                .then(data => console.log('Success:', data))
                .catch(error => console.error('Error:', error));
        }

        function formatJsonDate(jsonDate) {
        
            var timestamp = parseInt(jsonDate.match(/\d+/)[0], 10);

           
            var date = new Date(timestamp);

            
            var year = date.getFullYear();
            var month = String(date.getMonth() + 1).padStart(2, '0'); 
            var day = String(date.getDate()).padStart(2, '0');       

            return year + '-' + month + '-' + day; 
        }

        function validateSettingsForm() {
           
            var firstName = document.getElementById('<%= firstName.ClientID %>').value.trim();
            var lastName = document.getElementById('<%= lastName.ClientID %>').value.trim();
            var email = document.getElementById('<%= email.ClientID %>').value.trim();
            var dob = document.getElementById('<%= dob.ClientID %>').value.trim();
            var username = document.getElementById('<%= username.ClientID %>').value.trim();
            var password = document.getElementById('<%= password.ClientID %>').value.trim();
            var confirmPassword = document.getElementById('<%= confirmPassword.ClientID %>').value.trim();
            var photo = document.getElementById('<%= photo.ClientID %>').value.trim();

          
            var genderMale = document.getElementById("male").checked;
            var genderFemale = document.getElementById("female").checked;

         
            if (firstName === "" || lastName === "" || email === "" || dob === "" || username === "" ||
                password === "" || confirmPassword === "" || (!genderMale && !genderFemale)) {
                alert("يرجى ملء جميع الحقول المطلوبة.");
                return false; // منع إرسال النموذج
            }

          
            var noLeadingSpacesRegex = /^[^\s]/;
            if (!noLeadingSpacesRegex.test(firstName) || !noLeadingSpacesRegex.test(lastName) ||
                !noLeadingSpacesRegex.test(username) || !noLeadingSpacesRegex.test(password) ||
                !noLeadingSpacesRegex.test(confirmPassword)) {
                alert("لا يمكن أن تحتوي الحقول على مسافات في البداية.");
                return false;
            }

           
            var emailRegex = /^[^\s@]+@gmail\.com$/;
            if (!emailRegex.test(email)) {
                alert("يرجى إدخال بريد إلكتروني ينتهي بـ @gmail.com.");
                return false;
            }

           
            if (password !== confirmPassword) {
                alert("كلمة المرور وتأكيد كلمة المرور لا يتطابقان.");
                return false;
            }

            return true; 
        }


        async function fetchUserDetails() {
            const response = await fetch('/Dashbord.aspx/GetUserDetails', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            });

            const data = await response.json();
            const user = data.d; 

           
            document.getElementById('firstName').value = user.FirstName;
            document.getElementById('lastName').value = user.LastName;
            document.getElementById('email').value = user.Email;
            document.getElementById('dob').value = formatJsonDate(user.DateOfBirth)
            document.getElementById('username').value = user.UserName;
            

           
            if (user.Gender === 1) {
                document.getElementById('male').checked = true;
            } else {
                document.getElementById('female').checked = true;
            }

            
                   
        }



    </script>


    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="bootstrap/jquery-3.6.0.min.js"></script>
    
</body>
</html>
