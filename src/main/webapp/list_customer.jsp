<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Customer" %>
<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customerList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <style>
        /* ... same styles as before ... */
        body {
            font-family: Arial, sans-serif;
            background-color: #ecf0f1;
            padding: 30px;
        }
        .container {
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            max-width: 1000px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }
        h2 {
            text-align: center;
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }
        table, th, td {
            border: 1px solid #bdc3c7;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #16e2e8;
            color: white;
        }
        .top-actions {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 15px;
            color: #f41d44;
            text-decoration: none;
            margin-right: 10px;
            font-weight: bold;


        }
        .action-links a {
            color: #f41d44;
            text-decoration: none;
            margin-right: 10px;
            font-weight: bold;
        }

        .action-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Customer List</h2>
    <div class="top-actions">

        <a href="dashboard">Back</a>
    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>Account #</th>
            <th>Name</th>
            <th>Address</th>
            <th>Telephone</th>
            <th>Units</th>
            <th>Created At</th>
            <th>Actions</th>
        </tr>
        <%
            if (customers != null && !customers.isEmpty()) {
                for (Customer c : customers) {
        %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getAccountNumber() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getAddress() %></td>
            <td><%= c.getTelephone() %></td>
            <td><%= c.getUnitsConsumed() %></td>
            <td><%= c.getCreatedAt() %></td>
            <td class="action-links">
                <a href="customer?action=edit&id=<%= c.getId()%>">Edit</a>
                <a href="customer?action=delete&id=<%= c.getId() %>">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr><td colspan="8">No customers found.</td></tr>
        <% } %>
    </table>
</div>
</body>
</html>


