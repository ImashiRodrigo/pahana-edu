package com.icbt.service;

import com.icbt.dao.BillDAO;
import com.icbt.dao.BillItemDAO;
import com.icbt.model.Bill;
import com.icbt.model.BillItem;

import java.util.List;

public class BillService {

    private final BillDAO billDAO;
    private final BillItemService billItemService =  new BillItemService();

    public BillService() {
        this.billDAO = new BillDAO();
    }

    // Add a new bill
    public boolean addBill(Bill bill) {
        billDAO.addBill(bill);
        Bill addedBill = billDAO.getLatestBill();
        if (addedBill != null && bill.getItems()!= null){
            for (BillItem item : bill.getItems()) {
                item.setBillId(addedBill.getId());
                billItemService.addBillItem(item);
            }
        }
        return true;
    }

    // Update existing bill
    public boolean updateBill(Bill bill) {

         boolean updated = billDAO.updateBill(bill);
         if(updated){
             List<BillItem> items = billItemService.getBillItemsByBillId(bill.getId());
             for (int i=0; i < items.size(); i++){
                 BillItem item = items.get(i);
                 item.setQuantity(bill.getItems().get(i).getQuantity());
                 billItemService.updateBillItem(item);
             }
             }
         return updated;
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

