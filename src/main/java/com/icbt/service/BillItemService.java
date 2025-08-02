package com.icbt.service;

import com.icbt.dao.BillItemDAO;
import com.icbt.model.BillItem;

import java.util.List;

public class BillItemService {

    private final BillItemDAO billItemDAO;

    public BillItemService() {
        this.billItemDAO = new BillItemDAO();
    }

    // Add a bill item
    public boolean addBillItem(BillItem billItem) {
        return billItemDAO.addBillItem(billItem);
    }

    // Update a bill item
    public boolean updateBillItem(BillItem billItem) {
        return billItemDAO.updateBillItem(billItem);
    }

    // Delete a bill item by ID
    public boolean deleteBillItem(int id) {
        return billItemDAO.deleteBillItem(id);
    }

    // Get a bill item by ID
    public BillItem getBillItemById(int id) {
        return billItemDAO.getBillItemById(id);
    }

    // Get all bill items
    public List<BillItem> getAllBillItems() {
        return billItemDAO.getAllBillItems();
    }

    // Get all bill items for a specific bill
    public List<BillItem> getBillItemsByBillId(int billId) {
        return billItemDAO.getBillItemsByBillId(billId);
    }
}

