package com.icbt.dao;

import com.icbt.model.User;
import com.icbt.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public User getUser(String username, String password) {
        String sql = "select * from users where username=? and password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)){
             stmt.setString(1,username);
             stmt.setString(2,password);
             try(ResultSet rs = stmt.executeQuery()){
                 if (rs.next()){
                     return new User(
                             rs.getInt("id"),
                             rs.getString("username"),
                             rs.getString("password")
                     );
                 }
             }
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;


    }
}
