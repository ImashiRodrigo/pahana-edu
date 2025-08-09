<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Bill" %>
<%@ page import="com.icbt.model.BillItem" %>
<%@ page import="com.icbt.model.Item" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
    List<BillItem> billItems = (List<BillItem>) request.getAttribute("billItems");
    List<Item> allItems = (List<Item>) request.getAttribute("allItems");

    if (bill == null) {
        response.sendRedirect("list_bill.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Bill</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 30px;
        }
        .container {
            max-width: 800px;
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
        select {
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
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #ccc;
        }
        th {
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
    <h2>Edit Bill</h2>
    <div class="top-actions">
        <a href="dashboard">Back</a>
    </div>
    <form action="bill?action=edit" method="post">
        <input type="hidden" name="_method" value="PUT">

        <!-- Bill Info -->
        <label>Bill ID</label>
        <input type="text" name="billId" value="<%= bill.getId() %>" readonly>

        <label>Account Number</label>
        <input type="number" name="accountNumber" value="<%= bill.getAccountNumber() %>" required>

        <label>Total Amount (LKR)</label>
        <input type="number" step="0.01" name="totalAmount" value="<%= bill.getTotalAmount() %>" required readonly>

        <!-- Edit Bill Items -->
        <label>Bill Items</label>
        <table>
            <tr>
                <th>Item</th>
                <th>Quantity</th>
                <th>Price (LKR)</th>
            </tr>
            <%
                if (billItems != null && !billItems.isEmpty()) {
                    for (BillItem bi : billItems) {
                        Item matchedItem = null;
                        for (Item i : allItems) {
                            if (i.getItemId() == bi.getItemId()) {
                                matchedItem = i;
                                break;
                            }
                        }
            %>
            <tr>
                <td>
                    <input type="hidden" name="itemIds[]" value="<%= bi.getItemId() %>">
                    <%= matchedItem != null ? matchedItem.getItemName() : "Unknown Item" %>
                </td>
                <td>
                    <input type="number" name="quantities[]" value="<%= bi.getQuantity() %>" min="0">
                </td>
                <td>
                    <input type="number" name="prices[]" value="<%= bi.getPrice() %>" step="0.01">
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="3">No bill items found.</td>
            </tr>
            <% } %>
        </table>

        <button type="submit">Update Bill</button>
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
