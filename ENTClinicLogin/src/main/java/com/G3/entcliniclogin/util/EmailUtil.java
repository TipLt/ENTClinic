/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.G3.entcliniclogin.util;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtil {
    
    // Cấu hình email - Thay đổi theo thông tin email của bạn
    private static final String FROM_EMAIL = "your-email@gmail.com";
    private static final String PASSWORD = "your-app-password"; // Sử dụng App Password cho Gmail
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    
    public static void sendPasswordResetEmail(String toEmail, String resetToken, String userName) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Đặt lại mật khẩu - Phòng Khám Tai Mũi Họng");
            
            String resetLink = "http://localhost:8080/ent-clinic/reset-password?token=" + resetToken;
            
            String htmlContent = "<!DOCTYPE html>" +
                    "<html lang='vi'>" +
                    "<head><meta charset='UTF-8'></head>" +
                    "<body style='font-family: Arial, sans-serif; line-height: 1.6; color: #333;'>" +
                    "<div style='max-width: 600px; margin: 0 auto; padding: 20px;'>" +
                    "<div style='background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 30px; text-align: center; border-radius: 10px 10px 0 0;'>" +
                    "<h1 style='color: white; margin: 0;'>Phòng Khám Tai Mũi Họng</h1>" +
                    "</div>" +
                    "<div style='background: #f8f9fa; padding: 30px; border-radius: 0 0 10px 10px;'>" +
                    "<h2 style='color: #2563eb;'>Xin chào " + userName + ",</h2>" +
                    "<p>Bạn đã yêu cầu đặt lại mật khẩu cho tài khoản của mình.</p>" +
                    "<p>Vui lòng nhấp vào nút bên dưới để đặt lại mật khẩu:</p>" +
                    "<div style='text-align: center; margin: 30px 0;'>" +
                    "<a href='" + resetLink + "' style='background: #2563eb; color: white; padding: 15px 30px; text-decoration: none; border-radius: 5px; display: inline-block;'>Đặt lại mật khẩu</a>" +
                    "</div>" +
                    "<p style='color: #666; font-size: 14px;'>Hoặc copy link sau vào trình duyệt:</p>" +
                    "<p style='background: #fff; padding: 10px; border-radius: 5px; word-break: break-all;'>" + resetLink + "</p>" +
                    "<p style='color: #666; font-size: 14px; margin-top: 30px;'>Link này sẽ hết hạn sau 30 phút.</p>" +
                    "<p style='color: #666; font-size: 14px;'>Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>" +
                    "<hr style='border: none; border-top: 1px solid #ddd; margin: 30px 0;'>" +
                    "<p style='color: #999; font-size: 12px; text-align: center;'>© 2024 Phòng Khám Tai Mũi Họng. All rights reserved.</p>" +
                    "</div>" +
                    "</div>" +
                    "</body>" +
                    "</html>";
            
            message.setContent(htmlContent, "text/html; charset=UTF-8");
            
            Transport.send(message);
            System.out.println("Password reset email sent successfully to: " + toEmail);
            
        } catch (MessagingException e) {
            System.err.println("Failed to send email: " + e.getMessage());
            throw new RuntimeException("Failed to send email", e);
        }
    }
    
    public static void sendWelcomeEmail(String toEmail, String userName) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Chào mừng đến với Phòng Khám Tai Mũi Họng");
            
            String htmlContent = "<!DOCTYPE html>" +
                    "<html lang='vi'>" +
                    "<head><meta charset='UTF-8'></head>" +
                    "<body style='font-family: Arial, sans-serif;'>" +
                    "<div style='max-width: 600px; margin: 0 auto; padding: 20px;'>" +
                    "<h2 style='color: #2563eb;'>Xin chào " + userName + "!</h2>" +
                    "<p>Cảm ơn bạn đã đăng ký tài khoản tại Phòng Khám Tai Mũi Họng.</p>" +
                    "<p>Chúng tôi rất vui được phục vụ bạn.</p>" +
                    "<p>Trân trọng,<br>Đội ngũ Phòng Khám Tai Mũi Họng</p>" +
                    "</div>" +
                    "</body>" +
                    "</html>";
            
            message.setContent(htmlContent, "text/html; charset=UTF-8");
            Transport.send(message);
            
        } catch (MessagingException e) {
            System.err.println("Failed to send welcome email: " + e.getMessage());
        }
    }
}
