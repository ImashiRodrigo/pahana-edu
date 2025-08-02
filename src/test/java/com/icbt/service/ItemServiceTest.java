package com.icbt.service;

import com.icbt.model.Item;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ItemServiceTest {

    private static ItemService itemService;
    private static int testItemId;

    @BeforeAll
    public static void setup() {
        itemService = new ItemService();
    }

    @Test
    @Order(1)
    public void testAddItem() {
        Item item = new Item();
        item.setItemName("Notebook");
        item.setDescription("200-page ruled notebook");
        item.setPricePerUnit(350.00);
        item.setStockQuantity(100);

        boolean added = itemService.addItem(item);
        assertTrue(added, "Item should be added successfully");

        // Retrieve to get generated ID
        Item savedItem = new Item();
        List<Item> items = itemService.getAllItems();
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getItemName().equals(item.getItemName())) {
                 savedItem = items.get(i);
            }
        }


        assertNotNull(savedItem);
        testItemId = savedItem.getItemId();
    }

    @Test
    @Order(2)
    public void testGetItemById() {
        Item item = itemService.getItemById(testItemId);
        assertNotNull(item, "Item should exist");
        assertEquals("Notebook", item.getItemName(), "Item name should match");
    }

    @Test
    @Order(3)
    public void testUpdateItem() {
        Item item = itemService.getItemById(testItemId);
        assertNotNull(item);

        item.setStockQuantity(150);
        boolean updated = itemService.updateItem(item);
        assertTrue(updated, "Item should be updated");

        Item updatedItem = itemService.getItemById(testItemId);
        assertEquals(150, updatedItem.getStockQuantity(), "Stock quantity should be updated");
    }

    @Test
    @Order(4)
    public void testDeleteItem() {
        boolean deleted = itemService.deleteItem(testItemId);
        assertTrue(deleted, "Item should be deleted");

        Item item = itemService.getItemById(testItemId);
        assertNull(item, "Item should no longer exist");
    }
}

