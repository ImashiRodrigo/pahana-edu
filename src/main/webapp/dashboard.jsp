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
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            text-align: center;
        }
        .dashboard h2 {
            margin-bottom: 10px;
        }
        .dashboard p {
            margin-bottom: 25px;
            color: #666;
        }
        .button-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        .dashboard-button, .logout-button {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            color: white;
            text-decoration: none;
        }
        .dashboard-button {
            background-color: #16e2e8;
        }
        .dashboard-button:hover {
            background-color: #278fbc;
        }
        .logout-button {
            background-color: #e6677d;
        }
        .logout-button:hover {
            background-color: #f41d44;
        }
    </style>
</head>
<body>

<div class="dashboard">
    <h2>Welcome, <%= user.getName() %>!</h2>
    <p>This is your dashboard.</p>

    <div class="button-group">
        <a href="customer?action=new" class="dashboard-button">Add Customer</a>
        <a href="customer" class="dashboard-button">Customer List</a>
        <a href="item?action=new" class="dashboard-button">Add Items</a>
        <a href="item" class="dashboard-button">Item List</a>
        <a href="bill?action=new" class="dashboard-button">Add Bill</a>
        <a href="bill" class="dashboard-button">Bill List</a>
        <a href="help" class="dashboard-button">Help Section</a>
        <form action="logout" method="post">
            <button type="submit" class="logout-button">Logout</button>
        </form>
    </div>
</div>

</body>
</html>
