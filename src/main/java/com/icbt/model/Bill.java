package com.icbt.model;

import java.sql.Timestamp;

public class Bill {
    private int id;
    private int accountNumber;
    private double totalAmount;
    private Timestamp billDate;

    public Bill() {
    }

    public Bill(int id, int accountNumber, double totalAmount, Timestamp billDate) {
        this.id = id;
        this.accountNumber = accountNumber;
        this.totalAmount = totalAmount;
        this.billDate = billDate;
    }

    // Getters and Setters

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

