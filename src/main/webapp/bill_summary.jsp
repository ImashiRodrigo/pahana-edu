<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>
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

    DecimalFormat df = new DecimalFormat("#,##0.00");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Bill Summary - Pahana Edu Bookshop</title>
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
        h1, h2 {
            text-align: center;
            color: #333;
        }
        p {
            font-weight: bold;
            margin: 10px 0 5px 0;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #16e2e8;
            color: white;
        }
        .total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            padding: 15px 0;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #16e2e8;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 20px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #278fbc;
        }
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Pahana Edu Bookshop</h1>
    <h2>Bill Summary</h2>

    <p>Bill Number: <span><%= bill.getId() %></span></p>
    <p>Account Number: <span><%= bill.getAccountNumber() %></span></p>
    <p>Bill Date: <span><%= bill.getBillDate() != null ? bill.getBillDate() : "N/A" %></span></p>

    <table>
        <thead>
        <tr>
            <th>Item Name</th>
            <th>Quantity</th>
            <th>Unit Price (Rs.)</th>
            <th>Total (Rs.)</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (billItems != null && !billItems.isEmpty()) {
                for (BillItem bi : billItems) {
                    Item matchedItem = null;
                    if (allItems != null) {
                        for (Item i : allItems) {
                            if (i.getItemId() == bi.getItemId()) {
                                matchedItem = i;
                                break;
                            }
                        }
                    }
                    String itemName = (matchedItem != null) ? matchedItem.getItemName() : "Unknown Item";
                    int qty = bi.getQuantity();
                    double price = bi.getPrice();
                    double total = qty * price;
        %>
        <tr>
            <td><%= itemName %></td>
            <td><%= qty %></td>
            <td><%= df.format(price) %></td>
            <td><%= df.format(total) %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="4">No bill items found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="total">Grand Total: Rs. <%= df.format(bill.getTotalAmount()) %></div>

    <div class="btn-container">
        <a href="dashboard" class="btn">Back to Dashboard</a>
        <button class="btn" onclick="window.print()">Print Bill</button>
    </div>
</div>
</body>
</html>
