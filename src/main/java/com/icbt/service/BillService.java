package com.icbt.service;

import com.icbt.dao.BillDAO;
import com.icbt.model.Bill;

import java.util.List;

public class BillService {

    private final BillDAO billDAO;

    public BillService() {
        this.billDAO = new BillDAO();
    }

    // Add a new bill
    public boolean addBill(Bill bill) {
        return billDAO.addBill(bill);
    }

    // Update existing bill
    public boolean updateBill(Bill bill) {
        return billDAO.updateBill(bill);
    }

    // Delete bill by ID
    public boolean deleteBill(int id) {
        return billDAO.deleteBill(id);
    }

    // Get bill by ID
    public Bill getBillById(int id) {
        return billDAO.getBillById(id);
    }

    // Get all bills
    public List<Bill> getAllBills() {
        return billDAO.getAllBills();
    }
}

