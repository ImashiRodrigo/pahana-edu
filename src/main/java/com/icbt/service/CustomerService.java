package com.icbt.service;

import com.icbt.dao.CustomerDAO;
import com.icbt.model.Customer;

import java.util.List;

public class CustomerService {

    private final CustomerDAO customerDAO;

    public CustomerService() {
        this.customerDAO = new CustomerDAO();
    }

    // POST
    public boolean addCustomer(Customer customer) {
        return customerDAO.addCustomer(customer);
    }

    // GET (by ID)
    public Customer getCustomerById(int id) {
        return customerDAO.getCustomerById(id);
    }

    // GET (all)
    public List<Customer> getAllCustomers() {
        return customerDAO.getAllCustomers();
    }

    // PUT
    public boolean updateCustomer(Customer customer) {
        return customerDAO.updateCustomer(customer);
    }

    // DELETE
    public boolean deleteCustomer(int id) {
        return customerDAO.deleteCustomer(id);
    }

    public Customer getCustomerByAccountNumber(int accountNumber) {
        return customerDAO.getCustomerByAccountNumber(accountNumber);
    }
}
