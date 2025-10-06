<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới Thiệu - Phòng Khám Tai Mũi Họng</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>Về Phòng Khám</h1>
            <p>Tìm hiểu về chúng tôi và sứ mệnh của chúng tôi</p>
        </div>
    </section>

    <!-- About Content -->
    <section class="about">
        <div class="container">
            <div class="about-content">
                <div class="about-text">
                    <h2>Phòng Khám Tai Mũi Họng</h2>
                    <p>
                        Phòng khám Tai Mũi Họng của chúng tôi được thành lập với sứ mệnh cung cấp 
                        dịch vụ chăm sóc sức khỏe chuyên nghiệp và tận tâm cho cộng đồng.
                    </p>
                    <p>
                        Với đội ngũ bác sĩ giàu kinh nghiệm, được đào tạo bài bản trong và ngoài nước,
                        cùng trang thiết bị y tế hiện đại, chúng tôi cam kết mang đến dịch vụ y tế 
                        chất lượng cao, an toàn và hiệu quả.
                    </p>
                    <div class="about-features">
                        <div class="feature">
                            <i class="fas fa-award"></i>
                            <div>
                                <h4>Chất lượng cao</h4>
                                <p>Đạt tiêu chuẩn quốc tế</p>
                            </div>
                        </div>
                        <div class="feature">
                            <i class="fas fa-clock"></i>
                            <div>
                                <h4>Linh hoạt thời gian</h4>
                                <p>Làm việc 7 ngày/tuần</p>
                            </div>
                        </div>
                        <div class="feature">
                            <i class="fas fa-shield-alt"></i>
                            <div>
                                <h4>An toàn tuyệt đối</h4>
                                <p>Quy trình vô trùng nghiêm ngặt</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="about-stats">
                    <div class="stat">
                        <h3>5000+</h3>
                        <p>Bệnh nhân đã điều trị</p>
                    </div>
                    <div class="stat">
                        <h3>15+</h3>
                        <p>Năm kinh nghiệm</p>
                    </div>
                    <div class="stat">
                        <h3>98%</h3>
                        <p>Tỷ lệ hài lòng</p>
                    </div>
                    <div class="stat">
                        <h3>24/7</h3>
                        <p>Hỗ trợ khẩn cấp</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Mission & Vision -->
    <section class="mission-vision">
        <div class="container">
            <div class="mv-grid">
                <div class="mv-card">
                    <i class="fas fa-bullseye"></i>
                    <h3>Sứ Mệnh</h3>
                    <p>
                        Cung cấp dịch vụ y tế chất lượng cao, an toàn và hiệu quả cho mọi người dân,
                        với tinh thần tận tâm và trách nhiệm cao nhất.
                    </p>
                </div>
                <div class="mv-card">
                    <i class="fas fa-eye"></i>
                    <h3>Tầm Nhìn</h3>
                    <p>
                        Trở thành phòng khám Tai Mũi Họng hàng đầu tại khu vực, được tin tưởng
                        bởi chất lượng dịch vụ và sự chăm sóc tận tình.
                    </p>
                </div>
                <div class="mv-card">
                    <i class="fas fa-gem"></i>
                    <h3>Giá Trị Cốt Lõi</h3>
                    <p>
                        Chất lượng - Tận tâm - Chuyên nghiệp - An toàn - Đạo đức y khoa.
                        Luôn đặt lợi ích người bệnh lên hàng đầu.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Facilities -->
    <section class="facilities">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Cơ Sở Vật Chất</h2>
                <p class="section-description">
                    Trang thiết bị hiện đại, đạt tiêu chuẩn quốc tế
                </p>
            </div>
            <div class="facilities-grid">
                <div class="facility-item">
                    <i class="fas fa-microscope"></i>
                    <h4>Hệ thống nội soi HD</h4>
                    <p>Nội soi tai mũi họng độ nét cao</p>
                </div>
                <div class="facility-item">
                    <i class="fas fa-x-ray"></i>
                    <h4>Máy X-Quang kỹ thuật số</h4>
                    <p>Chẩn đoán hình ảnh chính xác</p>
                </div>
                <div class="facility-item">
                    <i class="fas fa-stethoscope"></i>
                    <h4>Máy đo thính lực</h4>
                    <p>Kiểm tra thính lực tổng quát</p>
                </div>
                <div class="facility-item">
                    <i class="fas fa-syringe"></i>
                    <h4>Phòng phẫu thuật vô trùng</h4>
                    <p>Đạt tiêu chuẩn quốc tế</p>
                </div>
                <div class="facility-item">
                    <i class="fas fa-bed"></i>
                    <h4>Phòng hồi sức</h4>
                    <p>Chăm sóc sau phẫu thuật</p>
                </div>
                <div class="facility-item">
                    <i class="fas fa-procedures"></i>
                    <h4>Phòng cấp cứu</h4>
                    <p>Xử lý cấp cứu 24/7</p>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/WEB-INF/views/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>