package com.icbt.model;

import java.sql.Timestamp;

public class Item {
    private int itemId;
    private String itemName;
    private String description;
    private double pricePerUnit;
    private int stockQuantity;
    private Timestamp createdAt;

    public Item() {
    }

    public Item(int itemId, String itemName, String description, double pricePerUnit, int stockQuantity, Timestamp createdAt) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.description = description;
        this.pricePerUnit = pricePerUnit;
        this.stockQuantity = stockQuantity;
        this.createdAt = createdAt;
    }

    // Getters and Setters

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPricePerUnit() {
        return pricePerUnit;
    }

    public void setPricePerUnit(double pricePerUnit) {
        this.pricePerUnit = pricePerUnit;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}

