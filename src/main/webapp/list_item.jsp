<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Item" %>
<%
    List<Item> itemList = (List<Item>) request.getAttribute("itemList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Item List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ecf0f1;
            padding: 30px;
        }
        .container {
            max-width: 1000px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            margin-top: 25px;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
        }
        th {
            background-color: #16e2e8;
            color: white;
        }
        .action-links a {
            margin-right: 10px;
            text-decoration: none;
            color: #2980b9;
            font-weight: bold;
        }
        .action-links a:hover {
            text-decoration: underline;
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
    <h2>Item List</h2>
    <div class="top-actions">

        <a href="dashboard">Back</a>

    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price/Unit</th>
            <th>Stock</th>
            <th>Created</th>
            <th>Actions</th>
        </tr>
        <%
            if (itemList != null && !itemList.isEmpty()) {
                for (Item item : itemList) {
        %>
        <tr>
            <td><%= item.getItemId() %></td>
            <td><%= item.getItemName() %></td>
            <td><%= item.getDescription() %></td>
            <td>Rs. <%= item.getPricePerUnit() %></td>
            <td><%= item.getStockQuantity() %></td>
            <td><%= item.getCreatedAt() %></td>
            <td class="action-links">
                <a href="item?action=edit&id=<%= item.getItemId() %>">Edit</a>
                <a href="item?action=delete&id=<%= item.getItemId() %>">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr><td colspan="7">No items found.</td></tr>
        <% } %>
    </table>
</div>
</body>
</html>
