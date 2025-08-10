<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <style>
        /* ... same styles as before ... */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 30px;
        }
        .container {
            background-color: #fff;
            padding: 25px;
            max-width: 500px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
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
    <h2>Add Customer</h2>
    <div class="top-actions">

        <a href="dashboard">Back</a>
    </div>
    <form action="customer" method="post">
        <label>Account Number</label>
        <input type="number" name="accountNumber" required>

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Address</label>
        <input type="text" name="address" required>

        <label>Telephone</label>
        <input type="text" name="telephone">

        <label>Units Consumed</label>
        <input type="number" name="unitsConsumed" value="0">

        <button type="submit">Add Customer</button>
    </form>
</div>
</body>
</html>

