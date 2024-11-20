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

    .sidebar a:hover {
        background-color: #495057;
    }

    .sidebar i {
        margin-right: 10px;
    }

    .sidebar .logout {
        margin-top: auto;
    }

    .container {
        margin-left: 270px; /* لتجنب تداخل المحتوى مع الـ sidebar */
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
                <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile text-center">           <!-- src="imgs/man400px.png"  -->  
                <asp:Image ID="imgUserProfile" runat="server"  CssClass="img-fluid" AlternateText="User Image" />                     
                <asp:Label ID="lblUserName" runat="server" Text="User Name" CssClass="h4" />
            </div>
            <nav>
                <a href="#Tasks"><i class="fas fa-tasks"></i> Tasks</a>
                <a href="#Achievements" class="mt-3"><i class="fas fa-trophy"></i> Achievements</a>
                <a href="#" class="mt-3"><i class="fas fa-cogs"></i> Settings</a>
            </nav>
            <div class="logout">
                <a href="loginPage.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>

          <!-- Main Content -->
        <div class="container">
            <!-- Task Management Section -->
            <div class="header-container">
                <h1 class="title">Task Management</h1>
                <button type="button" class="btn-add-task " data-bs-toggle="modal" data-bs-target="#addTaskModal">Add Task</button>
            </div>

            <div id="Tasks" class="table-wrapper">
                <asp:GridView ID="gvTasks" runat="server" AutoGenerateColumns="False" CssClass="custom-table" OnRowCommand="gvTasks_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:Button ID="btnSelect" runat="server" Text="✔" CommandName="MarkComplete" CommandArgument='<%# Eval("TaskID") %>' CssClass="btn-edit" />
                            </ItemTemplate>
                        </asp:TemplateField>

       
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />

                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />

      
                        <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />

      
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" />

      
                        <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" />

       
                        <asp:TemplateField HeaderText="Completed">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkCompleted" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="EditTask" CommandArgument='<%# Eval("TaskID") %>' Text="Edit" CssClass="btn-edit" />
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
                <h5 class="modal-title" id="addTaskModalLabel">Add New Task</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Title"></asp:TextBox>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control mt-2" placeholder="Description"></asp:TextBox>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control mt-2">
                    
                   <%-- <asp:ListItem Text="Select Category" Value="" />
                    <asp:ListItem Text="Category 1" Value="1" />
                    <asp:ListItem Text="Category 2" Value="2" />--%>
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
        <div class="container">
    <h2 class="title">Achievements</h2>
    <div id="Achievements" class="table-wrapper">
        <asp:GridView ID="gvAchievements" runat="server" AutoGenerateColumns="False" CssClass="custom-table" OnRowCommand="gvAchievements_RowCommand">
            <Columns>
                <asp:BoundField DataField="NoteId" HeaderText="ID" SortExpression="NoteId" Visible="false" />
                <asp:BoundField DataField="Achievement" HeaderText="Achievement" SortExpression="Achievement" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnEditAchievement" runat="server" CommandName="EditAchievement" CommandArgument='<%# Eval("NoteId") %>' Text="Edit" CssClass="btn-edit" />
                        <asp:Button ID="btnDeleteAchievement" runat="server" CommandName="DeleteAchievement" CommandArgument='<%# Eval("NoteId") %>' Text="Delete" CssClass="btn-delete" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <!-- Form to add or update achievements -->
    <div style="margin-top: 20px;">
        <asp:TextBox ID="txtAchievement" runat="server" Placeholder="Enter your achievement here..." CssClass="form-control" Width="80%" />
        <asp:HiddenField ID="hfNoteId" runat="server" />
        <asp:Button ID="btnAddAchievement" runat="server" Text="Add Achievement" CssClass="btn-add-task" OnClick="btnAddAchievement_Click" />
        <asp:Button ID="btnUpdateAchievement" runat="server" Text="Update Achievement" CssClass="btn-add-task" OnClick="btnUpdateAchievement_Click" Style="display:none;" />
        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn-add-task" OnClick="btnCancelEdit_Click" Style="display:none;" />
    </div>
</div>


    </form>
    <script>
        // Event Listeners for Edit and Delete Buttons
        document.addEventListener("DOMContentLoaded", () => {
            const editButtons = document.querySelectorAll(".btn-edit");
            const deleteButtons = document.querySelectorAll(".btn-delete");

            editButtons.forEach((btn) => {
                btn.addEventListener("click", () => {
                    alert("Edit functionality is not implemented yet!");
                });
            });

            deleteButtons.forEach((btn) => {
                btn.addEventListener("click", () => {
                    const row = btn.closest("tr");
                    row.remove(); // Remove the row
                });
            });
        });

        
        function closeModal() {
                $('#addTaskModal').modal('hide');
        }

        function openAddTaskModal() {
            $('#addTaskModal').modal('show');
        }

    </script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
