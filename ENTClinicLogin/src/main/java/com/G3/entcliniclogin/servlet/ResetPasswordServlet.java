/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.G3.entcliniclogin.servlet;


import com.G3.entcliniclogin.dao.PasswordResetTokenDAO;
import com.G3.entcliniclogin.dao.UserDAO;
import com.G3.entcliniclogin.entity.PasswordResetToken;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
    
    private UserDAO userDAO = new UserDAO();
    private PasswordResetTokenDAO tokenDAO = new PasswordResetTokenDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String token = request.getParameter("token");
        
        if (token == null || token.trim().isEmpty()) {
            request.setAttribute("error", "Token không hợp lệ");
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }
        
        // Validate token
        if (!tokenDAO.validateToken(token)) {
            request.setAttribute("error", "Link đặt lại mật khẩu đã hết hạn hoặc không hợp lệ");
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }
        
        request.setAttribute("token", token);
        request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validation
        if (token == null || token.trim().isEmpty()) {
            request.setAttribute("error", "Token không hợp lệ");
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }
        
        if (newPassword == null || newPassword.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }
        
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }
        
        if (newPassword.length() < 6) {
            request.setAttribute("error", "Mật khẩu phải có ít nhất 6 ký tự");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
            return;
        }
        
        try {
            // Validate token again
            PasswordResetToken resetToken = tokenDAO.findByToken(token);
            
            if (resetToken == null || resetToken.isUsed() || resetToken.isExpired()) {
                request.setAttribute("error", "Link đặt lại mật khẩu đã hết hạn hoặc không hợp lệ");
                request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
                return;
            }
            
            // Update password
            userDAO.updatePassword(resetToken.getUser().getId(), newPassword);
            
            // Mark token as used
            tokenDAO.markTokenAsUsed(token);
            
            // Redirect to login with success message
            request.getSession().setAttribute("success", "Đặt lại mật khẩu thành công! Vui lòng đăng nhập");
            response.sendRedirect(request.getContextPath() + "/login");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại sau");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/WEB-INF/views/reset-password.jsp").forward(request, response);
        }
    }
}