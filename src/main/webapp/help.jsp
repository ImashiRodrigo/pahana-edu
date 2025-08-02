<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Help Section - Pahana Edu Billing System</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f6f8;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 80%;
      margin: 40px auto;
      background-color: #fff;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      color: #333;
    }

    h3 {
      color: #f41d44;
      margin-top: 20px;
    }

    p {
      line-height: 1.6;
      color: #555;
    }

    ul {
      list-style-type: square;
      padding-left: 20px;
    }

    .back-button {
      display: inline-block;
      margin-top: 20px;
      background-color: #16e2e8;
      color: white;
      padding: 10px 16px;
      border-radius: 6px;
      text-decoration: none;
      font-size: 15px;
    }

    .back-button:hover {
      background-color: #0db5b8;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>Help & User Guide</h2>
  <p>Welcome to the <b>Pahana Edu Bookshop Billing System</b> Help Section.
    This guide will help you understand how to use the system efficiently.</p>

  <h3>1. Login</h3>
  <p>Enter your <b>Username</b> and <b>Password</b> to access the system.
    If login fails, check your credentials or contact the administrator.</p>

  <h3>2. Add New Customer Account</h3>
  <ul>
    <li>Go to <b>Customer Management</b> → <b>Add Customer</b>.</li>
    <li>Fill in account number, name, address, and contact details.</li>
    <li>Click <b>Save</b> to store customer information.</li>
  </ul>

  <h3>3. Edit Customer Information</h3>
  <ul>
    <li>Select a customer from the list.</li>
    <li>Click <b>Edit</b>, modify details, and save changes.</li>
  </ul>

  <h3>4. Manage Items</h3>
  <ul>
    <li>Go to <b>Item Management</b> to add, edit, or delete items.</li>
    <li>Provide item name, description, price, and stock quantity.</li>
  </ul>

  <h3>5. Create & Print Bill</h3>
  <ul>
    <li>Go to <b>Billing</b> → <b>Create Bill</b>.</li>
    <li>Select the customer and add purchased items with quantity.</li>
    <li>System automatically calculates total bill amount.</li>
    <li>Click <b>Print</b> to generate a printable bill receipt.</li>
  </ul>

  <h3>6. View Account Details</h3>
  <ul>
    <li>Go to <b>Customer Management</b> → <b>View Accounts</b>.</li>
    <li>Search and view complete customer details.</li>
  </ul>

  <h3>7. Help Section</h3>
  <p>This page provides information about how to use the system.</p>

  <h3>8. Exit System</h3>
  <p>Click <b>Logout</b> or close your browser to exit the system.</p>

  <a href="dashboard.jsp" class="back-button">Back to Dashboard</a>
</div>

</body>
</html>

