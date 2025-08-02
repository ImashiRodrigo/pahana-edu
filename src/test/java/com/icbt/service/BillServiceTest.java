package com.icbt.service;

import com.icbt.model.Bill;
import com.icbt.model.BillItem;
import org.junit.jupiter.api.*;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class BillServiceTest {

    private static BillService billService;
    private static int testBillId;

    @BeforeAll
    public static void setup() {
        billService = new BillService();
    }

    @Test
    @Order(1)
    public void testAddBill() {
        Bill bill = new Bill();
        bill.setAccountNumber(123456);
        bill.setTotalAmount(1200.00);
        bill.setBillDate(new Timestamp(System.currentTimeMillis()));

        boolean added = billService.addBill(bill);
        assertTrue(added, "Bill should be added successfully");

        List<Bill> bills = billService.getAllBills();
        Bill savedBill = null;
        for (Bill b : bills) {
            if (b.getAccountNumber() == 123456) {
                savedBill = b;
                break;
            }
        }

        assertNotNull(savedBill, "Saved bill should be found");
        testBillId = savedBill.getId();
    }

    @Test
    @Order(2)
    public void testGetBillById() {
        Bill bill = billService.getBillById(testBillId);
        assertNotNull(bill, "Bill should exist");
        assertEquals(123456, bill.getAccountNumber(), "Account number should match");
    }

    @Test
    @Order(3)
    public void testUpdateBill() {
        Bill bill = billService.getBillById(testBillId);
        assertNotNull(bill);

        bill.setTotalAmount(1450.00);
        boolean updated = billService.updateBill(bill);
        assertTrue(updated, "Bill should be updated");

        Bill updatedBill = billService.getBillById(testBillId);
        assertEquals(1450.00, updatedBill.getTotalAmount(), "Total amount should be updated");
    }

    @Test
    @Order(4)
    public void testDeleteBill() {
        boolean deleted = billService.deleteBill(testBillId);
        assertTrue(deleted, "Bill should be deleted");

        Bill bill = billService.getBillById(testBillId);
        assertNull(bill, "Bill should no longer exist");
    }
}

