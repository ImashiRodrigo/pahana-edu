package com.icbt.controller;

import com.icbt.model.User;
import com.icbt.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
private UserService userService;

@Override
public void init() {
userService = new UserService();
}
@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException {
String username = req.getParameter("username");
String password = req.getParameter("password");
User user = userService.login(username, password);
if (user != null) {
    HttpSession session = req.getSession();
    session.setAttribute("user", user);
    resp.sendRedirect("dashboard.jsp");

}else  {
resp.sendRedirect("login.jsp");
}
}
}
