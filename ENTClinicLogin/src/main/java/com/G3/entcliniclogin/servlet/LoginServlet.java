/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.G3.entcliniclogin.servlet;

import com.G3.entcliniclogin.dao.UserDAO;
import com.G3.entcliniclogin.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    private UserDAO userDAO = new UserDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu đã đăng nhập, redirect về trang chủ
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Validation
        if (email == null || email.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Email và mật khẩu không được để trống");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            return;
        }
        
        try {
            // Authenticate user
            if (userDAO.authenticate(email, password)) {
                User user = userDAO.findByEmail(email);
                
                if (!user.isActive()) {
                    request.setAttribute("error", "Tài khoản của bạn đã bị khóa");
                    request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
                    return;
                }
                
                // Tạo session
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getId());
                session.setAttribute("userName", user.getName());
                session.setAttribute("userRole", user.getRole());
                session.setMaxInactiveInterval(30 * 60); // 30 minutes
                
                // Redirect theo role
                String redirectUrl = getRedirectUrlByRole(user.getRole(), request.getContextPath());
                response.sendRedirect(redirectUrl);
                
            } else {
                request.setAttribute("error", "Email hoặc mật khẩu không đúng");
                request.setAttribute("email", email);
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại sau");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
    
    private String getRedirectUrlByRole(User.Role role, String contextPath) {
        switch (role) {
            case ADMIN:
                return contextPath + "/admin/dashboard";
            case DOCTOR:
                return contextPath + "/doctor/dashboard";
            case RECEPTIONIST:
                return contextPath + "/receptionist/dashboard";
            case PATIENT:
            default:
                return contextPath + "/";
        }
    }
}
