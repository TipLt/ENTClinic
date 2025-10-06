<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lại mật khẩu - Phòng Khám Tai Mũi Họng</title>
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
        
        .reset-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 450px;
            overflow: hidden;
        }
        
        .reset-header {
            background: linear-gradient(135deg, #2563eb, #3b82f6);
            color: white;
            padding: 2rem;
            text-align: center;
        }
        
        .reset-header h1 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }
        
        .reset-header p {
            opacity: 0.9;
        }
        
        .reset-body {
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
        
        .password-strength {
            margin-top: 0.5rem;
            font-size: 0.875rem;
            color: #6b7280;
        }
    </style>
</head>
<body>
    <div class="reset-container">
        <div class="reset-header">
            <h1><i class="fas fa-lock"></i> Đặt lại mật khẩu</h1>
            <p>Nhập mật khẩu mới của bạn</p>
        </div>
        
        <div class="reset-body">
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-circle"></i> ${error}
                </div>
            </c:if>
            
            <c:choose>
                <c:when test="${not empty token}">
                    <form action="${pageContext.request.contextPath}/reset-password" method="post">
                        <input type="hidden" name="token" value="${token}">
                        
                        <div class="form-group">
                            <label for="newPassword">Mật khẩu mới</label>
                            <input type="password" id="newPassword" name="newPassword" required>
                            <div class="password-strength">Mật khẩu phải có ít nhất 6 ký tự</div>
                        </div>
                        
                        <div class="form-group">
                            <label for="confirmPassword">Xác nhận mật khẩu</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required>
                        </div>
                        
                        <button type="submit" class="btn">
                            <i class="fas fa-check"></i> Đặt lại mật khẩu
                        </button>
                    </form>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-error">
                        Link đặt lại mật khẩu không hợp lệ hoặc đã hết hạn.
                    </div>
                    <a href="${pageContext.request.contextPath}/forgot-password" class="btn" style="display: block; text-align: center; text-decoration: none;">
                        Yêu cầu link mới
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>