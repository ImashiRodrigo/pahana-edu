package com.icbt.service;

import com.icbt.dao.ItemDAO;
import com.icbt.model.Item;

import java.util.List;

public class ItemService {

    private final ItemDAO itemDAO;

    public ItemService() {
        this.itemDAO = new ItemDAO();
    }

    // Add new item
    public boolean addItem(Item item) {
        return itemDAO.addItem(item);
    }

    // Update existing item
    public boolean updateItem(Item item) {
        return itemDAO.updateItem(item);
    }

    // Delete item by ID
    public boolean deleteItem(int itemId) {
        return itemDAO.deleteItem(itemId);
    }

    // Get item by ID
    public Item getItemById(int itemId) {
        return itemDAO.getItemById(itemId);
    }

    // Get all items
    public List<Item> getAllItems() {
        return itemDAO.getAllItems();
    }
}

