package com.icbt.controller;

import com.icbt.model.Customer;
import com.icbt.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/add-customer")
public class CustomerServlet extends HttpServlet {

    private CustomerService customerService;

    @Override
    public void init() {
        customerService = new CustomerService();
    }

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
                resp.sendRedirect("customers.jsp"); // show all customers
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
}

