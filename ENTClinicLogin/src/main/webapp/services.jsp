<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dịch Vụ - Phòng Khám Tai Mũi Họng</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>Dịch Vụ Chuyên Khoa</h1>
            <p>Chúng tôi cung cấp đầy đủ các dịch vụ chăm sóc sức khỏe tai mũi họng</p>
        </div>
    </section>

    <!-- Services Section -->
    <section class="services">
        <div class="container">
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-ear-listen"></i>
                    </div>
                    <h3>Khám Tai</h3>
                    <p>Chẩn đoán và điều trị các bệnh lý về tai, thính giác</p>
                    <ul class="service-features">
                        <li>Viêm tai giữa cấp và mạn tính</li>
                        <li>Ù tai, nghe kém, điếc đột ngột</li>
                        <li>Thủng màng nhĩ</li>
                        <li>U màng nhĩ, polyp tai</li>
                        <li>Rối loạn tiền đình</li>
                    </ul>
                    <div class="service-price">
                        <span class="price-label">Chi phí khám từ:</span>
                        <span class="price">200.000đ</span>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-wind"></i>
                    </div>
                    <h3>Khám Mũi</h3>
                    <p>Điều trị các vấn đề về mũi và xoang</p>
                    <ul class="service-features">
                        <li>Viêm xoang cấp và mạn tính</li>
                        <li>Viêm mũi dị ứng</li>
                        <li>Polyp mũi xoang</li>
                        <li>Lệch vách ngăn mũi</li>
                        <li>Chảy máu mũi</li>
                    </ul>
                    <div class="service-price">
                        <span class="price-label">Chi phí khám từ:</span>
                        <span class="price">200.000đ</span>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-lungs"></i>
                    </div>
                    <h3>Khám Họng</h3>
                    <p>Chăm sóc sức khỏe họng và thanh quản</p>
                    <ul class="service-features">
                        <li>Viêm họng cấp và mạn tính</li>
                        <li>Viêm amidan, áp xe quanh amidan</li>
                        <li>Khàn tiếng, rối loạn thanh âm</li>
                        <li>Polyp thanh quản</li>
                        <li>Khó nuốt, nuốt nghẹn</li>
                    </ul>
                    <div class="service-price">
                        <span class="price-label">Chi phí khám từ:</span>
                        <span class="price">200.000đ</span>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-syringe"></i>
                    </div>
                    <h3>Phẫu Thuật</h3>
                    <p>Phẫu thuật nội soi tai mũi họng</p>
                    <ul class="service-features">
                        <li>Phẫu thuật amidan, VA</li>
                        <li>Phẫu thuật xoang nội soi</li>
                        <li>Phẫu thuật polyp mũi</li>
                        <li>Phẫu thuật vách ngăn mũi</li>
                        <li>Phẫu thuật tai</li>
                    </ul>
                    <div class="service-price">
                        <span class="price-label">Chi phí từ:</span>
                        <span class="price">5.000.000đ</span>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-microscope"></i>
                    </div>
                    <h3>Nội Soi TMH</h3>
                    <p>Nội soi chẩn đoán tai mũi họng</p>
                    <ul class="service-features">
                        <li>Nội soi tai</li>
                        <li>Nội soi mũi xoang</li>
                        <li>Nội soi thanh quản</li>
                        <li>Chụp ảnh, ghi hình</li>
                        <li>Sinh thiết nếu cần</li>
                    </ul>
                    <div class="service-price">
                        <span class="price-label">Chi phí từ:</span>
                        <span class="price">300.000đ</span>
                    </div>
                </div>

                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-heartbeat"></i>
                    </div>
                    <h3>Kiểm Tra Thính Lực</h3>
                    <p>Đo thính lực và tư vấn máy trợ thính</p>
                    <ul class="service-features">
                        <li>Đo thính lực đồ âm</li>
                        <li>Đo trở kháng âm</li>
                        <li>Kiểm tra phản xạ nhĩ</li>
                        <li>Tư vấn máy trợ thính</li>
                        <li>Lắp đặt và điều chỉnh</li>
                    </ul>
                    <div class="service-price">
                        <span class="price-label">Chi phí từ:</span>
                        <span class="price">250.000đ</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-content">
                <h2>Cần Tư Vấn Thêm?</h2>
                <p>Liên hệ với chúng tôi để được tư vấn miễn phí về dịch vụ phù hợp</p>
                <div class="cta-buttons">
                    <a href="${pageContext.request.contextPath}/#contact" class="btn btn-primary">
                        <i class="fas fa-calendar-check"></i> Đặt lịch khám
                    </a>
                    <a href="tel:0123456789" class="btn btn-secondary">
                        <i class="fas fa-phone"></i> Gọi ngay: 0123 456 789
                    </a>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/WEB-INF/views/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>