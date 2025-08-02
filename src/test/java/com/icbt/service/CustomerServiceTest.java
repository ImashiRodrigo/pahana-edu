package com.icbt.service;

import com.icbt.model.Customer;
import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CustomerServiceTest {

    private static CustomerService customerService;
    private static int testCustomerId;

    @BeforeAll
    public static void setup() {
        customerService = new CustomerService();
    }

    @Test
    @Order(1)
    public void testAddCustomer() {
        Customer customer = new Customer();
        customer.setAccountNumber(1234);
        customer.setName("Test User");
        customer.setAddress("123 Main Street");
        customer.setTelephone("0771234567");
        customer.setUnitsConsumed(50);

        boolean added = customerService.addCustomer(customer);
        assertTrue(added, "Customer should be added successfully");

        // Retrieve ID for later tests
        Customer saved = customerService.getCustomerByAccountNumber(1234);
        assertNotNull(saved, "Customer should be retrieved after add");
        testCustomerId = saved.getId();
    }

    @Test
    @Order(2)
    public void testGetCustomerById() {
        Customer customer = customerService.getCustomerById(testCustomerId);
        assertNotNull(customer, "Customer should exist");
        assertEquals("Test User", customer.getName(), "Name should match");
    }

    @Test
    @Order(3)
    public void testUpdateCustomer() {
        Customer customer = customerService.getCustomerById(testCustomerId);
        assertNotNull(customer);

        customer.setUnitsConsumed(75);
        boolean updated = customerService.updateCustomer(customer);
        assertTrue(updated, "Customer should be updated");

        Customer updatedCustomer = customerService.getCustomerById(testCustomerId);
        assertEquals(75, updatedCustomer.getUnitsConsumed(), "Units should be updated");
    }

    @Test
    @Order(4)
    public void testDeleteCustomer() {
        boolean deleted = customerService.deleteCustomer(testCustomerId);
        assertTrue(deleted, "Customer should be deleted");

        Customer customer2 = customerService.getCustomerById(testCustomerId);
        assertNull(customer2, "Customer should no longer exist");
    }
}

