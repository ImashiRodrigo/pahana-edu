<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in
    String username = (String) session.getAttribute("username");

    if (username == null || username.isEmpty()) {
        // Redirect to login page if not logged in
        response.sendRedirect("login.jsp");
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
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .logout-button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

<div class="dashboard">
    <h2>Welcome, <%= username %>!</h2>
    <p>This is your dashboard.</p>
    <form action="logout.jsp" method="post">
        <button type="submit" class="logout-button">Logout</button>
    </form>
</div>

</body>
</html>
