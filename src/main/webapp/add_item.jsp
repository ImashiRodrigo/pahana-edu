<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
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
            color: #333;
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
    <h2>Add Item</h2>
    <div class="top-actions">
        <a href="dashboard">Back</a>
    </div>
    <form action="item" method="post">
        <label>Item Name</label>
        <input type="text" name="itemName" required>

        <label>Description</label>
        <textarea name="description" rows="3"></textarea>

        <label>Price per Unit</label>
        <input type="number" step="0.01" name="pricePerUnit" required>

        <label>Stock Quantity</label>
        <input type="number" name="stockQuantity" value="0" required>

        <button type="submit">Add Item</button>
    </form>
</div>
</body>
</html>
