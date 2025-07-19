package com.icbt.controller;

import com.icbt.model.Customer;
import com.icbt.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {

    private CustomerService customerService;

    @Override
    public void init() {
        customerService = new CustomerService();
    }

    //  Handle GET (e.g., get all customers or by ID)
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String idParam = req.getParameter("id");

        try {
            if (idParam != null) {
                int id = Integer.parseInt(idParam);
                Customer customer = customerService.getCustomerById(id);
                if (customer != null) {
                    out.println("<h3>Customer Details:</h3>");
                    out.println("Name: " + customer.getName() + "<br>");
                    out.println("Address: " + customer.getAddress() + "<br>");
                } else {
                    out.println("<p>No customer found with ID " + id + "</p>");
                }
            } else {
                List<Customer> customers = customerService.getAllCustomers();
                out.println("<h3>All Customers</h3>");
                for (Customer c : customers) {
                    out.println("ID: " + c.getId() + " | Name: " + c.getName() + "<br>");
                }
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }

    // Handle POST (Add new customer)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int accountNumber = Integer.parseInt(req.getParameter("accountNumber"));
            String name = req.getParameter("name");
            String address = req.getParameter("address");
            String telephone = req.getParameter("telephone");
            int unitsConsumed = Integer.parseInt(req.getParameter("unitsConsumed"));

            Customer customer = new Customer();
            customer.setAccountNumber(accountNumber);
            customer.setName(name);
            customer.setAddress(address);
            customer.setTelephone(telephone);
            customer.setUnitsConsumed(unitsConsumed);

            boolean success = customerService.addCustomer(customer);

            if (success) {
                resp.sendRedirect("customers.jsp");
            } else {
                req.setAttribute("error", "Failed to add customer.");
                req.getRequestDispatcher("add-customer.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Invalid input.");
            req.getRequestDispatcher("add-customer.jsp").forward(req, resp);
        }
    }

    //  Handle PUT (Update existing customer)
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            int accountNumber = Integer.parseInt(req.getParameter("accountNumber"));
            String name = req.getParameter("name");
            String address = req.getParameter("address");
            String telephone = req.getParameter("telephone");
            int unitsConsumed = Integer.parseInt(req.getParameter("unitsConsumed"));

            Customer customer = new Customer(id, accountNumber, name, address, telephone, unitsConsumed, null);

            boolean updated = customerService.updateCustomer(customer);

            resp.setContentType("text/plain");
            resp.getWriter().write(updated ? "Customer updated successfully." : "Update failed.");
        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/plain");
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }

    //  Handle DELETE (Delete customer by ID)
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean deleted = customerService.deleteCustomer(id);

            resp.setContentType("text/plain");
            resp.getWriter().write(deleted ? "Customer deleted." : "Deletion failed.");
        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/plain");
            resp.getWriter().write("Error: " + e.getMessage());
        }
    }
}
