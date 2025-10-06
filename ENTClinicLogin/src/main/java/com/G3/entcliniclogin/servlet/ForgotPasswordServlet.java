/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.G3.entcliniclogin.servlet;

import com.G3.entcliniclogin.dao.PasswordResetTokenDAO;
import com.G3.entcliniclogin.dao.UserDAO;
import com.G3.entcliniclogin.entity.PasswordResetToken;
import com.G3.entcliniclogin.entity.User;
import com.G3.entcliniclogin.util.EmailUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    
    private UserDAO userDAO = new UserDAO();
    private PasswordResetTokenDAO tokenDAO = new PasswordResetTokenDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập email");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
            return;
        }
        
        try {
            User user = userDAO.findByEmail(email);
            
            if (user != null) {
                // Tạo reset token (hết hạn sau 30 phút)
                PasswordResetToken resetToken = tokenDAO.createToken(user, 30);
                
                // Gửi email reset password (async)
                new Thread(() -> {
                    try {
                        EmailUtil.sendPasswordResetEmail(email, resetToken.getToken(), user.getName());
                    } catch (Exception e) {
                        System.err.println("Failed to send reset email: " + e.getMessage());
                    }
                }).start();
            }
            
            // Luôn hiển thị thông báo thành công để tránh lộ thông tin user
            request.setAttribute("success", 
                "Nếu email tồn tại trong hệ thống, link đặt lại mật khẩu đã được gửi đến email của bạn");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại sau");
            request.getRequestDispatcher("/WEB-INF/views/forgot-password.jsp").forward(request, response);
        }
    }
}
