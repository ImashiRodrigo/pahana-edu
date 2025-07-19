<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.icbt.model.User" %>
<%
    // Check if user is logged in
    User user = (User) session.getAttribute("user");

    if (user == null) {
        // Redirect to login page if not logged in
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f5f5f5;
        }
        .dashboard {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            text-align: center;
        }
        .logout-button {
            margin-top: 20px;
            padding: 8px 20px;
            background-color: #16e2e8;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .logout-button:hover {
            background-color: #16e2e8;
        }
    </style>
</head>
<body>

<div class="dashboard">
    <h2>Welcome, <%= user.getName() %>!</h2>
    <p>This is your dashboard.</p>
    <form action="logout" method="post">
        <button type="submit" class="logout-button">Logout</button>
    </form>
</div>

</body>
</html>
