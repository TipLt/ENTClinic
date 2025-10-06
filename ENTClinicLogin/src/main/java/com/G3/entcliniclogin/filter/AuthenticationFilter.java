/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.G3.entcliniclogin.filter;


import com.G3.entcliniclogin.entity.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    
    // Các URL không cần đăng nhập
    private static final List<String> PUBLIC_URLS = Arrays.asList(
        "/login",
        "/register",
        "/forgot-password",
        "/reset-password",
        "/index.jsp",
        "/services.jsp",
        "/doctors.jsp",
        "/about.jsp",
        "/css/",
        "/js/",
        "/images/"
    );
    
    // Các URL cần quyền Admin
    private static final List<String> ADMIN_URLS = Arrays.asList(
        "/admin/"
    );
    
    // Các URL cần quyền Doctor
    private static final List<String> DOCTOR_URLS = Arrays.asList(
        "/doctor/"
    );
    
    // Các URL cần quyền Receptionist
    private static final List<String> RECEPTIONIST_URLS = Arrays.asList(
        "/receptionist/"
    );
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String uri = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();
        String path = uri.substring(contextPath.length());
        
        // Kiểm tra nếu là static resource hoặc public URL
        if (isPublicResource(path)) {
            chain.doFilter(request, response);
            return;
        }
        
        HttpSession session = httpRequest.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;
        
        // Nếu chưa đăng nhập và không phải public URL
        if (currentUser == null) {
            httpResponse.sendRedirect(contextPath + "/login");
            return;
        }
        
        // Kiểm tra quyền truy cập theo role
        if (!hasAccess(path, currentUser.getRole())) {
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, 
                "Bạn không có quyền truy cập vào trang này");
            return;
        }
        
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        // Cleanup code if needed
    }
    
    private boolean isPublicResource(String path) {
        // Cho phép truy cập root
        if (path.equals("/") || path.isEmpty()) {
            return true;
        }
        
        // Kiểm tra các public URLs
        for (String publicUrl : PUBLIC_URLS) {
            if (path.startsWith(publicUrl)) {
                return true;
            }
        }
        
        return false;
    }
    
    private boolean hasAccess(String path, User.Role role) {
        // Admin có quyền truy cập tất cả
        if (role == User.Role.ADMIN) {
            return true;
        }
        
        // Kiểm tra quyền Doctor
        if (startsWithAny(path, DOCTOR_URLS)) {
            return role == User.Role.DOCTOR;
        }
        
        // Kiểm tra quyền Receptionist
        if (startsWithAny(path, RECEPTIONIST_URLS)) {
            return role == User.Role.RECEPTIONIST;
        }
        
        // Kiểm tra quyền Admin
        if (startsWithAny(path, ADMIN_URLS)) {
            return role == User.Role.ADMIN;
        }
        
        // Các URL khác, user đã đăng nhập đều có thể truy cập
        return true;
    }
    
    private boolean startsWithAny(String path, List<String> prefixes) {
        for (String prefix : prefixes) {
            if (path.startsWith(prefix)) {
                return true;
            }
        }
        return false;
    }
}