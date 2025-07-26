package com.icbt.model;

import java.sql.Timestamp;
import java.util.List;

public class Bill {
    private int id;
    private int accountNumber;
    private double totalAmount;
    private Timestamp billDate;
    private List<BillItem> items;

    public Bill() {
    }

    public Bill(int id, int accountNumber, double totalAmount, Timestamp billDate) {
        this.id = id;
        this.accountNumber = accountNumber;
        this.totalAmount = totalAmount;
        this.billDate = billDate;
    }

    public  Bill(int id, int accountNumber, double totalAmount ,  Timestamp billDate, List<BillItem> items) {
        this.id = id;
        this.accountNumber = accountNumber;
        this.totalAmount = totalAmount;
        this.billDate = billDate;
        this.items = items;
    }

    // Getters and Setters

    public List<BillItem> getItems() {
        return items;
    }

    public void setItems(List<BillItem> items) {
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(int accountNumber) {
        this.accountNumber = accountNumber;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Timestamp getBillDate() {
        return billDate;
    }

    public void setBillDate(Timestamp billDate) {
        this.billDate = billDate;
    }
}

