<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <div class="footer-logo">
                    <i class="fas fa-stethoscope"></i>
                    <span>Phòng Khám Tai Mũi Họng</span>
                </div>
                <p>Chăm sóc sức khỏe chuyên nghiệp, tận tâm và hiệu quả.</p>
                <div class="social-links">
                    <a href="#" aria-label="Facebook"><i class="fab fa-facebook"></i></a>
                    <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                    <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div class="footer-section">
                <h4>Dịch vụ</h4>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/services.jsp#ear">Khám tai</a></li>
                    <li><a href="${pageContext.request.contextPath}/services.jsp#nose">Khám mũi</a></li>
                    <li><a href="${pageContext.request.contextPath}/services.jsp#throat">Khám họng</a></li>
                    <li><a href="${pageContext.request.contextPath}/services.jsp#surgery">Phẫu thuật</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Thông tin</h4>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/about.jsp">Giới thiệu</a></li>
                    <li><a href="${pageContext.request.contextPath}/doctors.jsp">Bác sĩ</a></li>
                    <li><a href="${pageContext.request.contextPath}/#contact">Liên hệ</a></li>
                    <li><a href="${pageContext.request.contextPath}/privacy-policy.jsp">Chính sách</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Liên hệ</h4>
                <div class="footer-contact-info">
                    <p><i class="fas fa-map-marker-alt"></i> 123 Đường ABC, Quận 1, TP.HCM</p>
                    <p><i class="fas fa-phone"></i> 0123 456 789</p>
                    <p><i class="fas fa-envelope"></i> info@phongkhamtai.com</p>
                    <p><i class="fas fa-clock"></i> T2-CN: 7:00 - 20:00</p>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Phòng Khám Tai Mũi Họng. Tất cả quyền được bảo lưu.</p>
        </div>
    </div>
</footer>