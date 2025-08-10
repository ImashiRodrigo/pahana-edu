package com.icbt.controller;

import com.icbt.model.Item;
import com.icbt.service.ItemService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/item")
public class ItemServlet extends HttpServlet {

    private ItemService itemService;

    @Override
    public void init() {
        itemService = new ItemService();
    }

    // Handle GET requests
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String idParam = req.getParameter("id");
        String action = req.getParameter("action");
        if ("new".equalsIgnoreCase(action)) {
            req.getRequestDispatcher("add_item.jsp").forward(req, resp);
        }

        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            if ("edit".equalsIgnoreCase(action)) {
                Item item = itemService.getItemById(id);
                req.setAttribute("item", item);
                req.getRequestDispatcher("edit_item.jsp").forward(req, resp);
            } else if ("delete".equalsIgnoreCase(action)) {
                itemService.deleteItem(id);
                resp.sendRedirect("item");
            } else {
                Item item = itemService.getItemById(id);
                if (item != null) {
                    out.println("<h3>Item Details:</h3>");
                    out.println("Name: " + item.getItemName() + "<br>");
                    out.println("Price: Rs." + item.getPricePerUnit() + "<br>");
                    out.println("Stock: " + item.getStockQuantity() + "<br>");
                } else {
                    out.println("<p>No item found with ID " + id + "</p>");
                }
            }
        } else {
            List<Item> items = itemService.getAllItems();
            req.setAttribute("itemList", items);
            req.getRequestDispatcher("list_item.jsp").forward(req, resp);
        }
    }

    // Handle POST (Add new item or redirect to PUT/DELETE)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String method = req.getParameter("_method");

        if (method != null) {
            if ("PUT".equalsIgnoreCase(method)) {
                doPut(req, resp);
                return;
            } else if ("DELETE".equalsIgnoreCase(method)) {
                doDelete(req, resp);
                return;
            }
        }

        try {
            String name = req.getParameter("itemName");
            String description = req.getParameter("description");
            double price = Double.parseDouble(req.getParameter("pricePerUnit"));
            int stock = Integer.parseInt(req.getParameter("stockQuantity"));

            Item item = new Item();
            item.setItemName(name);
            item.setDescription(description);
            item.setPricePerUnit(price);
            item.setStockQuantity(stock);

            boolean success = itemService.addItem(item);

            if (success) {
                resp.sendRedirect("item");
            } else {
                req.setAttribute("error", "Failed to add item.");
                req.getRequestDispatcher("add_item.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Invalid input.");
            req.getRequestDispatcher("add_item.jsp").forward(req, resp);
        }
    }

    // Handle PUT (Update item)
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("itemId"));
            String name = req.getParameter("itemName");
            String description = req.getParameter("description");
            double price = Double.parseDouble(req.getParameter("pricePerUnit"));
            int stock = Integer.parseInt(req.getParameter("stockQuantity"));

            Item item = new Item(id, name, description, price, stock, null);
            boolean updated = itemService.updateItem(item);

            resp.setContentType("text/plain");
            resp.getWriter().write(updated ? "Item updated successfully." : "Update failed.");
            resp.sendRedirect("item");
        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/plain");
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }

    // Handle DELETE (Delete item by ID)
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean deleted = itemService.deleteItem(id);

            resp.setContentType("text/plain");
            resp.getWriter().write(deleted ? "Item deleted." : "Deletion failed.");
        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/plain");
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }
}

