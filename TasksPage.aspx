<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TasksPage.aspx.cs" Inherits="TasksManegar.TasksPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

/* التعديلات الأساسية */
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    box-sizing: border-box;
}

.container {
    max-width: 1200px;
    margin: 40px auto;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* إضافة ظل خفيف للـ container */
    background-color: #fff;
    border-radius: 8px;
    margin-bottom: 20px; /* جعل المسافة أسفل الـ container لتفادي تأثير الفوتر */
}

.header-container {
    display: flex;
    justify-content: space-between; /* توزيع المسافة بين العنوان وزر إضافة المهام */
    align-items: center;
    margin-bottom: 20px;
}

.title {
    color: #333;
    font-size: 2rem;
    margin: 0; /* إزالة المسافة الفارغة حول العنوان */
    text-align: center;
    flex: 1; /* جعل العنوان يشغل المساحة المتاحة */
}

.btn-add-task {
    background-color: #007bff; /* اللون الأزرق */
    color: white;
    border: none;
    padding: 8px 16px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.btn-add-task:hover {
    background-color: #0056b3; /* لون أزرق داكن عند المرور */
}

/* تحسين الجدول */
.table-wrapper {
    overflow-x: auto; /* Allow horizontal scrolling for small screens */
}

.custom-table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
    background: #f8f9fa;
}

.custom-table thead {
    background: linear-gradient(90deg, #1e3a8a, #6c757d); /* الأزرق الداكن المائل إلى الرمادي */
    color: #fff;
}

.custom-table th, 
.custom-table td {
    padding: 12px 15px;
    text-align: left;
    border: 1px solid #ddd;
    word-wrap: break-word; /* Prevent overflow */
}

.custom-table th {
    text-align: center;
}

/* التبديل بين خلفية الصفوف */
.custom-table tbody tr:nth-child(even) {
    background-color: #f1f1f1;
}

.custom-table tbody tr:hover {
    background-color: #e9ecef;
}

/* تحسين الأزرار */
.actions {
    text-align: center;
}

.actions button {
    background: none;
    border: 2px solid #fff; /* إضافة حدود بيضاء للأزرار */
    cursor: pointer;
    padding: 8px 12px;
    margin: 0 5px;
    font-size: 16px;
    border-radius: 5px; /* جعل الزوايا دائرية للأزرار */
    transition: all 0.3s ease; /* إضافة تأثير التحول عند التفاعل */
}

.btn-edit {
    color: #007bff;
}

.btn-delete {
    color: #dc3545;
}

/* إضافة تأثير عند المرور على الأزرار */
.actions button:hover {
    opacity: 0.8;
    transform: scale(1.1); /* تكبير الأزرار قليلاً عند التفاعل */
}

.btn-edit:hover {
    background-color: #007bff;
    color: #fff;
}

.btn-delete:hover {
    background-color: #dc3545;
    color: #fff;
}

/* تحسين عرض الجدول للأجهزة الصغيرة */
@media (max-width: 768px) {
    .custom-table th, .custom-table td {
        font-size: 14px;
        padding: 8px;
    }

    .container {
        padding: 10px;
    }

    .title {
        font-size: 24px;
    }
}

/* الفوتر */
footer {
    background-color: #343a40;
    color: #fff;
    padding: 10px 0;
    text-align: center;
    position: relative;
    bottom: 0;
    width: 100%;
    margin-top: 20px; /* ضمان وجود مساحة بين الجدول والفوتر */
}

footer p {
    margin: 0;
    font-size: 1rem;
}





    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <!-- @model IEnumerable<TaskModel> -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Management</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>


   <div class="container">
    <div class="header-container">
        <h1 class="title">Task Management</h1>
        <button class="btn-add-task">Add Task</button> <!-- زر إضافة المهام -->
    </div>
    <div class="table-wrapper">
        <asp:GridView ID="gvTasks" runat="server" AutoGenerateColumns="False" CssClass="custom-table" OnRowCommand="gvTasks_RowCommand">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" />
                <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" />
                <asp:TemplateField HeaderText="Completed">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkCompleted" runat="server" Checked='<%# Eval("IsCompleted") %>' Enabled="False" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CommandName="EditTask" CommandArgument='<%# Eval("Id") %>' Text="Edit" CssClass="btn-edit" />
                        <asp:Button ID="btnDelete" runat="server" CommandName="DeleteTask" CommandArgument='<%# Eval("Id") %>' Text="Delete" CssClass="btn-delete" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</div>


    
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

    </script>
</body>
</html>

</asp:Content>
