<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Item" %>
<%@ page import="com.icbt.model.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Bill</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            padding: 30px;
        }
        .container {
            max-width: 700px;
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
        select, input[type="number"], input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;

        }
        table th {
            background-color: #16e2e8;
            color: white;
        }
        button {
            width: 100%;
            padding: 12px;
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
    <h2>Create New Bill</h2>
    <form action="bill" method="post">
        <div class="top-actions">

            <a href="dashboard">Back</a>

        </div>
        <!-- Select Customer -->
        <label for="accountNumber">Select Customer (Account Number)</label>
        <select name="accountNumber" required>
            <option value="">-- Select Customer --</option>
            <%
                List<Customer> customers = (List<Customer>) request.getAttribute("customers");
                if (customers != null) {
                    for (Customer customer : customers) {
            %>
            <option value="<%= customer.getAccountNumber() %>">
                <%= customer.getAccountNumber() %> - <%= customer.getName() %>
            </option>
            <%
                    }
                }
            %>
        </select>

        <!-- Add Bill Items -->
        <label>Bill Items</label>
        <table>
            <thead>
            <tr>
                <th>Item</th>
                <th>Quantity</th>
                <th>Price (LKR)</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Item> items = (List<Item>) request.getAttribute("items");
                if (items != null) {
                    for (Item item : items) {
            %>
            <tr>
                <td>
                    <%= item.getItemName() %>
                    <input type="hidden" name="itemIds[]" value="<%= item.getItemId() %>">
                    <input type="hidden" name="itemNames[]" value="<%= item.getItemName() %>">
                </td>
                <td>
                    <input type="number" name="quantities[]" min="0" value="0">
                </td>
                <td>
                    <input type="number" step="0.01" name="prices[]" value="<%= item.getPricePerUnit() %>">
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="3">No items available.</td></tr>
            <% } %>
            </tbody>
        </table>
        <!-- Total (Optional, could be auto-calculated in backend) -->
        <label>Total Amount (LKR)</label>

        <input type="number" name="totalAmount" step="0.01" required readonly>

        <!-- Submit -->
        <button type="submit">Generate Bill</button>
    </form>
</div>
</body>

<!-- Add this script at the bottom of your HTML before </body> -->
<script>
    function calculateTotal() {
        let quantities = document.getElementsByName('quantities[]');
        let prices = document.getElementsByName('prices[]');
        let totalField = document.querySelector('input[name="totalAmount"]');

        let total = 0;
        for (let i = 0; i < quantities.length; i++) {
            let qty = parseFloat(quantities[i].value) || 0;
            let price = parseFloat(prices[i].value) || 0;
            total += qty * price;
        }
        totalField.value = total.toFixed(2);
    }

    // Add event listeners to quantities and prices
    document.addEventListener('DOMContentLoaded', function () {
        let qtyFields = document.getElementsByName('quantities[]');
        let priceFields = document.getElementsByName('prices[]');

        qtyFields.forEach(field => field.addEventListener('input', calculateTotal));
        priceFields.forEach(field => field.addEventListener('input', calculateTotal));
    });
</script>
</html>
