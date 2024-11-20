<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TasksManegar.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <title>Task Manager - Features</title>

  <!--  the bootstarp css file -->
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

  <!-- the fontawesome css file -->
  <link href="fontawesome/css/all.css" rel="stylesheet" />
  <style>
      body {
          font-family: Arial, sans-serif;
          background-color: #f8f9fa;
      }

      .feature-icon {
          font-size: 2rem;
          color: #007bff;
      }

      .feature-box {
          transition: transform 0.3s ease;
      }

      .feature-box:hover {
          transform: translateY(-10px);
      }

      .hero-section {
          background-color: #343a40;
          color: white;
          padding: 80px 0;
      }

      .cta-button {
          background-color: #007bff;
          color: white;
          padding: 12px 30px;
          font-size: 18px;
          border: none;
          border-radius: 5px;
          text-decoration: none;
      }

      .cta-button:hover {
          background-color: #0056b3;
      }

      .cta-section {
          background-color: #007bff;
          color: white;
          padding: 80px 0;
          text-align: center;
      }

      .cta-section h2 {
          font-size: 2.5rem;
          font-weight: bold;
          margin-bottom: 20px;
      }

      .cta-section p {
          font-size: 1.2rem;
          margin-bottom: 30px;
      }

      .cta-button-explore {
          background-color: #ff9800;
          color: white;
          padding: 12px 30px;
          font-size: 18px;
          border: none;
          border-radius: 5px;
          text-decoration: none;
      }

      .cta-button-explore:hover {
          background-color: #e68900;
      }

      .cta-button-signup{
          background-color: white;
          color: black;
          padding: 12px 30px;
          font-size: 18px;
          border: none;
          border-radius: 5px;
          text-decoration: none;
      }


      .cta-button-signup:hover {
          background-color:  #007bff;
          color: white;
      }

      .feature-image {
          width: 100%;
          height: 250px;
          object-fit: cover;
          border-radius: 10px;
      }

      .feature-card {
          padding: 15px;
          background-color: white;
          border-radius: 10px;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .feature-card:hover {
          box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
      }

      .feature-title {
          font-size: 1.25rem;
          font-weight: bold;
          color: #343a40;
      }

      .feature-description {
          font-size: 1rem;
          color: #6c757d;
      }

        .about-section {
          background-color: #f8f9fa;
          padding: 60px 0;
          color: #343a40;
      }

      .about-section h2 {
          font-size: 2.5rem;
          font-weight: bold;
          margin-bottom: 20px;
      }

      .about-section p {
          font-size: 1.2rem;
          color: #6c757d;
          line-height: 1.5;
      }

      .team-member {
          margin: 30px 0;
          text-align: center;
      }

      .team-member img {
          width: 120px;
          height: 120px;
          border-radius: 50%;
          object-fit: cover;
      }

      .team-member h4 {
          font-size: 1.5rem;
          color: white;
          margin-top: 10px;
      }

      .team-member p {
          color: #6c757d;
          font-size: 1rem;
      }

      .team-section {
          background-color: #343a40;
          color: white;
          padding: 60px 0;
      }

      .team-section h2 {
          font-size: 2.5rem;
          font-weight: bold;
          margin-bottom: 20px;
      }

      .team-section .team-card {
          background-color: #343a40;
          padding: 30px;
          border-radius: 10px;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .footer {
          background-color: #343a40;
          color: white;
          padding: 20px;
          text-align: center;
      }

  </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- Hero Section -->
 <header class="hero-section text-center">
     <h1>Task Manager</h1>
     <p>Organize, manage, and optimize your tasks with ease!</p>
     <a href="#features" class="cta-button-explore">Explore Features</a>
 </header>

 <!-- Call-to-Action Section (Encourage Sign-Up) -->
 <section class="cta-section">
     <h2>Start Organizing Your Tasks Today!</h2>
     <p>Join thousands of users who are boosting their productivity with Task Manager. Try it out now and start managing your tasks like a pro!</p>
     <a href="CreateAccountPage.aspx" class="cta-button-signup" >Sign Up Now</a>
 </section>

 <!-- Features Section -->
 <section id="features" class="container py-5">
     <h2 class="text-center mb-4">Key Features</h2>
     <div class="row text-center">
         <div class="col-md-4 mb-4">
             <div class="feature-card">                 
                 <img src="imgs/12150869_4930161.jpg" alt="Task Management" class="feature-image">
                 <h4 class="feature-title">Task Management</h4>
                 <p class="feature-description">Efficiently add, update, and delete tasks. Keep track of your daily progress.</p>
             </div>
         </div>
         <div class="col-md-4 mb-4">
             <div class="feature-card">                 
                 <img src="imgs/1113467_293.jpg" alt="Deadline Tracking" class="feature-image">
                 <h4 class="feature-title">Deadline Tracking</h4>
                 <p class="feature-description">Set deadlines for your tasks to stay on track and meet important goals.</p>
             </div>
         </div>
         <div class="col-md-4 mb-4">
             <div class="feature-card">                 
                 <img src="imgs/4274116_2230172.jpg" alt="User Management" class="feature-image">
                 <h4 class="feature-title">User Management</h4>
                 <p class="feature-description">Manage users, assign tasks, and keep your team organized with ease.</p>
             </div>
         </div>
     </div>
     <div class="row text-center">
         <div class="col-md-4 mb-4">
             <div class="feature-card">                 
                 <img src="imgs/3199626_466063-PG0OYO-147.jpg" alt="Task Editing" class="feature-image">
                 <h4 class="feature-title">Edit & Update Tasks</h4>
                 <p class="feature-description">Edit any task on the go, and keep your task list up-to-date in real-time.</p>
             </div>
         </div>
         <div class="col-md-4 mb-4">
             <div class="feature-card">                 
                 <img src="imgs/5566766_2892186.jpg" alt="Task Archiving" class="feature-image">
                 <h4 class="feature-title">Task Archiving</h4>
                 <p class="feature-description">Archive completed tasks to keep your dashboard clean and focused.</p>
             </div>
         </div>
         <div class="col-md-4 mb-4">
             <div class="feature-card">                 
                 <img src="imgs/2400977_308606-P8GH4L-799.jpg" alt="Notifications" class="feature-image">
                 <h4 class="feature-title">Notifications</h4>
                 <p class="feature-description">Get notified of upcoming deadlines, task updates, and new assignments.</p>
             </div>
         </div>
     </div>
 </section>

  <!-- About Project and Team Section -->
 <section id="About" class="about-section text-center">
     <h2>About the Project</h2>
     <p>The Task Manager application is designed to help individuals and teams efficiently manage and organize their tasks. It provides a user-friendly interface with powerful features such as task creation, deadline tracking, and user management. Our mission is to make task management easier and more efficient for everyone.</p>
 </section>

 <!-- Team Section -->
 <section class="team-section text-center">
     <h2>Meet the Development Team</h2>
     <div class="container">
         <div class="row">
             <div class="col-md-4 team-member">
                 <img src="imgs/man400px.png" alt="Team Member 1">
                 <h4>Ahmed Babader</h4>
                 <p>Lead Developer</p>
             </div>
             <div class="col-md-4 team-member">
                 <img src="imgs/man400px.png" alt="Team Member 2">
                 <h4>Akram AbdelSamad</h4>
                 <p>Front-end Developer</p>
             </div>
             <div class="col-md-4 team-member">
                 <img src="imgs/man400px.png" alt="Team Member 3">
                 <h4>Emad Abdullah</h4>
                 <p>UI/UX Designer</p>
             </div>
                          <div class="col-md-4 team-member">
                 <img src="imgs/man400px.png" alt="Team Member 1">
                 <h4>Ammar Yasser</h4>
                 <p>Front-end Developer</p>
             </div>
             <div class="col-md-4 team-member">
                 <img src="imgs/man400px.png" alt="Team Member 3">
                 <h4>Yahya Hussain</h4>
                 <p>UI/UX Designer</p>
             </div>
             <div class="col-md-4 team-member">
                 <img src="imgs/man400px.png" alt="Team Member 2">
                 <h4>Mohammed Eafaq</h4>
                 <p>Back-end Developer</p>
             </div>
             <div class="col-md-4 team-member">
                 <img src="imgs/man400px.png" alt="Team Member 3">
                 <h4>Abdulrahman Kudash</h4>
                 <p>UI/UX Designer</p>
             </div>
         </div>
     </div>
 </section>
 

</asp:Content>
