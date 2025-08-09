package com.icbt.controller;

import com.icbt.model.Bill;
import com.icbt.model.BillItem;
import com.icbt.model.Customer;
import com.icbt.model.Item;
import com.icbt.service.BillItemService;
import com.icbt.service.BillService;
import com.icbt.service.CustomerService;
import com.icbt.service.ItemService;
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
    private CustomerService customerService;
    private ItemService itemService;


    @Override
    public void init() {
        billService = new BillService();
        billItemService = new BillItemService();
        customerService = new CustomerService();
        itemService = new ItemService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String idParam = req.getParameter("id");

        if (idParam != null) {
            String action = req.getParameter("action");
            int id = Integer.parseInt(idParam);
            if (action != null) {
                if(action.equals("edit")) {
                Bill bill = billService.getBillById(id);
                req.setAttribute("bill", bill);
                if (bill != null) {
                    List<BillItem> items = billItemService.getBillItemsByBillId(id);
                    List<Item> items2 = itemService.getAllItems();

                    req.setAttribute("billItems", items);
                    req.setAttribute("allItems", items2);
                    req.getRequestDispatcher("edit_bill.jsp").forward(req, resp);
                } else {
                    out.println("<p>No bill found with ID " + id + "</p>");
                }
            } else {
                billService.deleteBill(id);
                List<BillItem> items = billItemService.getBillItemsByBillId(id);
                for (BillItem item : items) {
                    billItemService.deleteBillItem(item.getId());
                }
                resp.sendRedirect("bill");
            }
        }
        } else {
            String action = req.getParameter("action");
            if (action != null && action.equals("new")) {
                List<Item> items = itemService.getAllItems();
                List<Customer> customers = customerService.getAllCustomers();
                req.setAttribute("customers", customers);
                req.setAttribute("items", items);
                req.getRequestDispatcher("add_bill.jsp").forward(req, resp);
            } else {
                List<Bill> bills = billService.getAllBills();
                req.setAttribute("billList", bills);
                req.getRequestDispatcher("list_bill.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String action = req.getParameter("action");

            int accountNumber = Integer.parseInt(req.getParameter("accountNumber"));
            String[] itemIds = req.getParameterValues("itemIds[]");
            String[] quantities = req.getParameterValues("quantities[]");
            String[] prices = req.getParameterValues("prices[]");

            Bill bill = new Bill();
            bill.setAccountNumber(accountNumber);
            double totalAmount = 0;

            List<BillItem> items = new ArrayList<>();
            for (int i = 0; i < itemIds.length; i++) {
                int itemId = Integer.parseInt(itemIds[i]);
                int qty = Integer.parseInt(quantities[i]);
                double price = Double.parseDouble(prices[i]);
                totalAmount += price * qty;

                BillItem item = new BillItem();
                item.setItemId(itemId);
                item.setQuantity(qty);
                item.setPrice(price);
                items.add(item);
            }
            bill.setItems(items);
            bill.setTotalAmount(totalAmount);

            boolean success;
            if ("edit".equalsIgnoreCase(action)) {
                int billId = Integer.parseInt(req.getParameter("billId"));
                bill.setId(billId);
                success = billService.updateBill(bill);
            } else {
                success = billService.addBill(bill);
            }

            if (success) {
                resp.sendRedirect("bill"); //  Redirect to bill list after save/update
            } else {
                req.setAttribute("error", "Failed to save bill.");
                if ("edit".equalsIgnoreCase(action)) {
                    req.getRequestDispatcher("edit_bill.jsp").forward(req, resp);
                } else {
                    req.getRequestDispatcher("add_bill.jsp").forward(req, resp);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Invalid input.");
            String action = req.getParameter("action");
            if ("edit".equalsIgnoreCase(action)) {
                req.getRequestDispatcher("edit_bill.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("add_bill.jsp").forward(req, resp);
            }
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
