package com.icbt.dao;

import com.icbt.model.Bill;
import com.icbt.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {

    // Add new bill
    public boolean addBill(Bill bill) {
        String sql = "INSERT INTO bills (account_number, total_amount) VALUES (?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, bill.getAccountNumber());
            stmt.setDouble(2, bill.getTotalAmount());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Get bill by ID
    public Bill getBillById(int id) {
        String sql = "SELECT * FROM bills WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Bill(
                        rs.getInt("id"),
                        rs.getInt("account_number"),
                        rs.getDouble("total_amount"),
                        rs.getTimestamp("bill_date")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Get all bills
    public List<Bill> getAllBills() {
        List<Bill> bills = new ArrayList<>();
        String sql = "SELECT * FROM bills ORDER BY bill_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Bill bill = new Bill(
                        rs.getInt("id"),
                        rs.getInt("account_number"),
                        rs.getDouble("total_amount"),
                        rs.getTimestamp("bill_date")
                );
                bills.add(bill);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bills;
    }

    // Delete a bill
    public boolean deleteBill(int id) {
        String sql = "DELETE FROM bills WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Update a bill (optional - depending on system rules)
    public boolean updateBill(Bill bill) {
        String sql = "UPDATE bills SET account_number = ?, total_amount = ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, bill.getAccountNumber());
            stmt.setDouble(2, bill.getTotalAmount());
            stmt.setInt(3, bill.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public Bill getLatestBill() {
        String sql = "SELECT * FROM bills ORDER BY bill_date DESC LIMIT 1";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return new Bill(
                        rs.getInt("id"),
                        rs.getInt("account_number"),
                        rs.getDouble("total_amount"),
                        rs.getTimestamp("bill_date")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}

