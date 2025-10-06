<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký - Phòng Khám Tai Mũi Họng</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .register-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 500px;
            overflow: hidden;
        }
        
        .register-header {
            background: linear-gradient(135deg, #2563eb, #3b82f6);
            color: white;
            padding: 2rem;
            text-align: center;
        }
        
        .register-header h1 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }
        
        .register-header p {
            opacity: 0.9;
        }
        
        .register-body {
            padding: 2rem;
        }
        
        .alert {
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1.5rem;
        }
        
        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #374151;
            font-weight: 500;
        }
        
        .form-group input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #2563eb;
        }
        
        .btn {
            width: 100%;
            padding: 1rem;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .btn:hover {
            background: #1d4ed8;
        }
        
        .links {
            margin-top: 1.5rem;
            text-align: center;
        }
        
        .links a {
            color: #2563eb;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .links a:hover {
            color: #1d4ed8;
        }
        
        .divider {
            text-align: center;
            margin: 1.5rem 0;
            color: #6b7280;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h1><i class="fas fa-user-plus"></i> Đăng ký tài khoản</h1>
            <p>Tạo tài khoản mới để sử dụng dịch vụ</p>
        </div>
        
        <div class="register-body">
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-circle"></i> ${error}
                </div>
            </c:if>
            
            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-group">
                    <label for="name">Họ và tên</label>
                    <input type="text" id="name" name="name" value="${name}" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${email}" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input type="tel" id="phone" name="phone" value="${phone}" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword">Xác nhận mật khẩu</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                
                <button type="submit" class="btn">
                    <i class="fas fa-user-plus"></i> Đăng ký
                </button>
            </form>
            
            <div class="divider">hoặc</div>
            
            <div class="links">
                Đã có tài khoản? 
                <a href="${pageContext.request.contextPath}/login">Đăng nhập ngay</a>
            </div>
            
            <div class="divider" style="margin-top: 2rem;">
                <a href="${pageContext.request.contextPath}/" style="color: #6b7280;">
                    <i class="fas fa-home"></i> Về trang chủ
                </a>
            </div>
        </div>
    </div>
</body>
</html>