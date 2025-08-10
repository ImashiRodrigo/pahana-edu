<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.model.Item" %>
<%
    Item item = (Item) request.getAttribute("item");
    if (item == null) {
        response.sendRedirect("list_item.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 30px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }
        h2 {
            text-align: center;
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[readonly] {
            background-color: #eee;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #16e2e8;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        button:hover {
            background-color: #278fbc;
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
    <h2>Edit Item</h2>
    <div class="top-actions">
        <a href="dashboard">Back</a>
    </div>
    <form action="item" method="post">
        <input type="hidden" name="_method" value="PUT">
        <input type="hidden" name="itemId" value="<%=item.getItemId()%>">

        <label>Item Name</label>
        <input type="text" name="itemName" value="<%= item.getItemName() %>" required>

        <label>Description</label>
        <textarea name="description" rows="3"><%= item.getDescription() %></textarea>

        <label>Price per Unit</label>
        <input type="number" step="0.01" name="pricePerUnit" value="<%= item.getPricePerUnit() %>" required>

        <label>Stock Quantity</label>
        <input type="number" name="stockQuantity" value="<%= item.getStockQuantity() %>" required>

        <button type="submit">Update Item</button>
    </form>
</div>
</body>
</html>
