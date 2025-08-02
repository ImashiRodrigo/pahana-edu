package com.icbt.service;

import com.icbt.dao.UserDAO;
import com.icbt.model.User;

public class UserService {
    private final UserDAO userDAO;

    public UserService() {
     this.userDAO = new UserDAO();
    }
    public User login(String username, String password) {
        return userDAO.getUser(username, password);
    }
}
