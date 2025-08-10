package com.icbt.controller;

import com.icbt.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard")

public class  DashboardServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false); // Avoid creating a new session

        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user != null) {
            req.setAttribute("user", user); // Optional: pass user to JSP
            req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("login.jsp"); // Redirect if not logged in
        }
    }
}

