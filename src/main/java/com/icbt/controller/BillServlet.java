package com.icbt.controller;

import com.icbt.model.Bill;
import com.icbt.model.BillItem;
import com.icbt.service.BillItemService;
import com.icbt.service.BillService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {

    private BillService billService;
    private BillItemService billItemService;


    @Override
    public void init() {
        billService = new BillService();
        billItemService = new BillItemService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String idParam = req.getParameter("id");

        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            Bill bill = billService.getBillById(id);
            if (bill != null) {
                List<BillItem> items = billItemService.getBillItemsByBillId(id);
                req.setAttribute("bill", bill);
                req.setAttribute("billItems", items);
                req.getRequestDispatcher("view_bill.jsp").forward(req, resp);
            } else {
                out.println("<p>No bill found with ID " + id + "</p>");
            }
        } else {
            List<Bill> bills = billService.getAllBills();
            req.setAttribute("billList", bills);
            req.getRequestDispatcher("list_bills.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int accountNumber = Integer.parseInt(req.getParameter("accountNumber"));
            String[] itemIds = req.getParameterValues("itemId");
            String[] quantities = req.getParameterValues("quantity");
            String[] prices = req.getParameterValues("price");

            Bill bill = new Bill();
            bill.setAccountNumber(accountNumber);

            List<BillItem> items = new ArrayList<>();
            for (int i = 0; i < itemIds.length; i++) {
                int itemId = Integer.parseInt(itemIds[i]);
                int qty = Integer.parseInt(quantities[i]);
                double price = Double.parseDouble(prices[i]);

                BillItem item = new BillItem();
                item.setItemId(itemId);
                item.setQuantity(qty);
                item.setPrice(price);
                items.add(item);
            }
            bill.setItems(items);

            boolean success = billService.addBill(bill);
            if (success) {
                resp.sendRedirect("bill");
            } else {
                req.setAttribute("error", "Failed to add bill.");
                req.getRequestDispatcher("add_bill.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Invalid input.");
            req.getRequestDispatcher("add_bill.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean deleted = billService.deleteBill(id);
            resp.setContentType("text/plain");
            resp.getWriter().write(deleted ? "Bill deleted." : "Deletion failed.");
        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/plain");
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }
}
