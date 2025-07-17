package com.icbt.service;

import com.icbt.dao.CustomerDAO;
import com.icbt.model.Customer;

public class CustomerService {

    private final CustomerDAO customerDAO;

    public CustomerService() {
        this.customerDAO = new CustomerDAO();
    }

    public boolean addCustomer(Customer customer) {
        return customerDAO.addCustomer(customer);
    }

    // You can add more methods later like:
    // getCustomerById(), updateCustomer(), deleteCustomer(), getAllCustomers()
}

