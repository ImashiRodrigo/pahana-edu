<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.model.Customer" %>
<%
    Customer customer = (Customer) request.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("listCustomer.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 30px;
        }
        .container {
            background-color: #fff;
            padding: 25px;
            max-width: 600px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
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
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
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
            border: none;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #278fbc;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit Customer</h2>
    <div class="top-actions">

        <a href="dashboard">Back</a>
    </div>
    <form action="customer" method="post">
        <input type="hidden" name="_method" value="PUT">
        <input type="hidden" name="id" value="<%= customer.getId()%>">

        <label>Account Number</label>
        <input type="number" name="accountNumber" value="<%= customer.getAccountNumber() %>" readonly>

        <label>Name</label>
        <input type="text" name="name" value="<%= customer.getName() %>" required>

        <label>Address</label>
        <input type="text" name="address" value="<%= customer.getAddress() %>" required>

        <label>Telephone</label>
        <input type="text" name="telephone" value="<%= customer.getTelephone() %>">

        <label>Units Consumed</label>
        <input type="number" name="unitsConsumed" value="<%= customer.getUnitsConsumed() %>">

        <button type="submit">Update Customer</button>
    </form>
</div>
</body>
</html>

