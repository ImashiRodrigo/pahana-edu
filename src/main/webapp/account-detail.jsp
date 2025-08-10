<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Customer Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0px 3px 10px rgba(0,0,0,0.1);
        }
        .top-actions {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 15px;
            margin-right: 10px;
        }
        h2 {
            margin-bottom: 20px;
            color: #2d3436;
            text-align: center;
        }
        form {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 25px;
        }
        input[type="text"] {
            padding: 8px;
            width: 280px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            padding: 8px 15px;
            background: #16e2e8;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background: #278fbc;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table th, table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        table th {
            background-color: #16e2e8;
            color: white;
        }
        .no-data {
            text-align: center;
            color: #636e72;
            padding: 15px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>🔍 Search Customer Account Details</h2>
    <div class="top-actions">
        <a href="dashboard">Back</a>
    </div>

    <!-- Search Form -->
    <form action="customer" method="get">
        <input type="text" name="accountNumber" placeholder="Enter Account Number " required>
        <input type="hidden" name="action" value="search" required>
        <button type="submit">Search</button>

    </form>

    <!-- Search Results -->
    <%
        List<Customer> customers = (List<Customer>) request.getAttribute("customers");
        if (customers != null) {
            if (customers.isEmpty()) {
    %>
    <div class="no-data">No matching customer accounts found.</div>
    <%
    } else {
    %>
    <table>
        <thead>
        <tr>
            <th>Account Number</th>
            <th>Name</th>
            <th>Address</th>
            <th>Unit Consumed</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Customer c : customers) {
        %>
        <tr>
            <td><%= c.getAccountNumber() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getAddress() %></td>
            <td><%= c.getUnitsConsumed() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
            }
        }
    %>
</div>

</body>
</html>

