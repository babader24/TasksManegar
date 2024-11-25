# TaskManagement

**TaskManagement** is an application designed to help you efficiently organize and manage your daily tasks. With a user-friendly interface and robust features, it allows users to create, update, and track tasks with ease.

---

## Features

- **User Account Management**: Create an account, log in, and utilize the "Remember Me" feature for quick access.
- **Dashboard**: View an overview of your tasks and achievements.
- **Task CRUD Operations**: Create, read, update, and delete tasks.
- **Client-Side Validation**: All form validations are handled via JavaScript for a smooth user experience and reduced server load.
- **Three-Tier Architecture**: Built with a clear separation of concerns, including Presentation, Business, and Data Access layers.

---

## Technologies Used

- **.NET Framework**: Version 4.8
- **C#**: For backend development
- **Windows Forms**: For the user interface
- **AJAX & JSON**: For asynchronous communication and data exchange
- **HTML, CSS, JavaScript**: For the front-end development
- **SQL Server**: For database management

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/babader24/TheTasksManegar.git

  TaskManegmentBackup
2. Restore `TaskManegmentBackup` to SQL Server.  
3. Go to the `DataAccess` layer and find the `cls_Settings` class.  
4. Update the connection string with your own SQL Server settings credentials (e.g., ID, password).  
5. In the `Create Account` page, specify your preferred directory for images and the `.txt` file used for storing user credentials.  
6. On the `Dashboard`, set the directory path for uploading profile images to suit your preferences.  
7. Build the solution to resolve dependencies.  
8. Run the application.  


