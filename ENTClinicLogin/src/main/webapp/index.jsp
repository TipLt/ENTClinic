<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phòng Khám Tai Mũi Họng - Chăm Sóc Sức Khỏe Chuyên Nghiệp</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Hero Section -->
    <section id="home" class="hero">
        <div class="hero-container">
            <div class="hero-content">
                <h1 class="hero-title">
                    Chăm Sóc Sức Khỏe <span class="highlight">Tai Mũi Họng</span> Chuyên Nghiệp
                </h1>
                <p class="hero-description">
                    Phòng khám chuyên khoa Tai Mũi Họng với đội ngũ bác sĩ giàu kinh nghiệm, 
                    trang thiết bị hiện đại và dịch vụ chăm sóc tận tâm.
                </p>
                <div class="hero-buttons">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <a href="#contact" class="btn btn-primary">
                                <i class="fas fa-calendar-check"></i>
                                Đặt lịch khám
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">
                                <i class="fas fa-calendar-check"></i>
                                Đăng nhập để đặt lịch
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <a href="${pageContext.request.contextPath}/services.jsp" class="btn btn-secondary">
                        <i class="fas fa-info-circle"></i>
                        Tìm hiểu thêm
                    </a>
                </div>
            </div>
            <div class="hero-image">
                <div class="hero-card">
                    <i class="fas fa-user-md"></i>
                    <h3>Bác sĩ chuyên khoa</h3>
                    <p>15+ năm kinh nghiệm</p>
                </div>
                <div class="hero-card">
                    <i class="fas fa-microscope"></i>
                    <h3>Thiết bị hiện đại</h3>
                    <p>Chẩn đoán chính xác</p>
                </div>
                <div class="hero-card">
                    <i class="fas fa-heart"></i>
                    <h3>Chăm sóc tận tâm</h3>
                    <p>Phục vụ 24/7</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Quick Stats -->
    <section class="stats-section">
        <div class="container">
            <div class="stats-grid">
                <div class="stat-item">
                    <i class="fas fa-users"></i>
                    <h3>5000+</h3>
                    <p>Bệnh nhân đã điều trị</p>
                </div>
                <div class="stat-item">
                    <i class="fas fa-calendar-check"></i>
                    <h3>15+</h3>
                    <p>Năm kinh nghiệm</p>
                </div>
                <div class="stat-item">
                    <i class="fas fa-smile"></i>
                    <h3>98%</h3>
                    <p>Tỷ lệ hài lòng</p>
                </div>
                <div class="stat-item">
                    <i class="fas fa-clock"></i>
                    <h3>24/7</h3>
                    <p>Hỗ trợ khẩn cấp</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Liên Hệ Với Chúng Tôi</h2>
                <p class="section-description">
                    Đặt lịch khám hoặc tư vấn miễn phí
                </p>
            </div>
            <div class="contact-content">
                <div class="contact-info">
                    <div class="contact-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <div>
                            <h4>Địa chỉ</h4>
                            <p>123 Đường ABC, Quận 1, TP.HCM</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-phone"></i>
                        <div>
                            <h4>Điện thoại</h4>
                            <p>0123 456 789</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-envelope"></i>
                        <div>
                            <h4>Email</h4>
                            <p>info@phongkhamtai.com</p>
                        </div>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-clock"></i>
                        <div>
                            <h4>Giờ làm việc</h4>
                            <p>Thứ 2 - CN: 7:00 - 20:00</p>
                        </div>
                    </div>
                </div>
                <div class="contact-form">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <form action="${pageContext.request.contextPath}/appointment" method="post">
                                <div class="form-group">
                                    <input type="text" name="name" value="${sessionScope.user.name}" readonly>
                                </div>
                                <div class="form-group">
                                    <input type="tel" name="phone" value="${sessionScope.user.phone}" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" value="${sessionScope.user.email}" readonly>
                                </div>
                                <div class="form-group">
                                    <select name="service" required>
                                        <option value="">Chọn dịch vụ</option>
                                        <option value="kham-tai">Khám tai</option>
                                        <option value="kham-mui">Khám mũi</option>
                                        <option value="kham-hong">Khám họng</option>
                                        <option value="phau-thuat">Phẫu thuật</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <textarea name="message" placeholder="Mô tả triệu chứng" rows="4"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-paper-plane"></i>
                                    Đặt lịch khám
                                </button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <div class="login-prompt">
                                <i class="fas fa-info-circle" style="font-size: 3rem; color: #2563eb;"></i>
                                <h3>Vui lòng đăng nhập</h3>
                                <p>Bạn cần đăng nhập để đặt lịch khám</p>
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">
                                    <i class="fas fa-sign-in-alt"></i> Đăng nhập ngay
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/WEB-INF/views/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>