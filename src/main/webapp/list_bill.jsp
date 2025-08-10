<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.model.Bill" %>
<%@ page import="com.icbt.model.BillItem" %>
<%@ page import="com.icbt.model.Item" %>
<%@ page import="com.icbt.service.BillService" %>
<%@ page import="com.icbt.service.BillItemService" %>
<%@ page import="com.icbt.service.ItemService" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            vertical-align: top;
        }

        th {
            background-color: #16e2e8;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .action-links a {
            margin: 0 8px;
            text-decoration: none;
            color: #f41d44;
            font-weight: bold;
        }

        .action-links a:hover {
            text-decoration: underline;
        }

        .add-button {
            display: inline-block;
            margin-top: 15px;
            background-color: #e6677d;
            color: white;
            padding: 10px 18px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 15px;
        }

        .add-button:hover {
            background-color: #f41d44;
        }

        .top-actions {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 15px;
            margin-right: 10px;
        }

        .top-actions a {
            color: #f41d44;
            text-decoration: none;
            font-weight: bold;
        }

        .nested-table {
            width: 100%;
            border: 1px solid #ddd;
            margin-top: 5px;
        }

        .nested-table th, .nested-table td {
            padding: 6px;
            font-size: 13px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .nested-table th {
            background-color: #f9f9f9;
            color: #555;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Bill List</h2>
    <div class="top-actions">

        <a href="dashboard">Back</a>
    </div>

    <a href="bill?action=new" class="add-button">+ Add New Bill</a>

    <%
        BillService billService = new BillService();
        BillItemService billItemService = new BillItemService();
        ItemService itemService = new ItemService();
        List<Bill> bills = billService.getAllBills();
    %>

    <table>
        <thead>
        <tr>
            <th>Bill ID</th>
            <th>Account Number</th>
            <th>Total Amount (Rs)</th>
            <th>Bill Date</th>
            <th>Items</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (bills != null && !bills.isEmpty()) {
                for (Bill bill : bills) {
                    List<BillItem> billItems = billItemService.getBillItemsByBillId(bill.getId());
        %>
        <tr>
            <td><%= bill.getId() %></td>
            <td><%= bill.getAccountNumber() %></td>
            <td><%= String.format("%.2f", bill.getTotalAmount()) %></td>
            <td><%= bill.getBillDate() %></td>
            <td>
                <table class="nested-table">
                    <thead>
                    <tr>
                        <th>Item</th>
                        <th>Qty</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (BillItem bi : billItems) {
                            String itemName = itemService.getItemById(bi.getItemId()).getItemName();
                    %>
                    <tr>
                        <td><%= itemName %></td>
                        <td><%= bi.getQuantity() %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </td>
            <td class="action-links">
                <a href="bill?action=edit&id=<%= bill.getId() %>">Edit</a>
                <a href="bill?action=delete&id=<%= bill.getId() %>" onclick="return confirm('Are you sure you want to delete this bill?')">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No bills found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
