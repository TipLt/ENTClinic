<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đội Ngũ Bác Sĩ - Phòng Khám Tai Mũi Họng</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>Đội Ngũ Bác Sĩ</h1>
            <p>Các chuyên gia hàng đầu trong lĩnh vực Tai Mũi Họng</p>
        </div>
    </section>

    <!-- Doctors Section -->
    <section class="doctors">
        <div class="container">
            <div class="doctors-grid">
                <div class="doctor-card">
                    <div class="doctor-image">
                        <i class="fas fa-user-md" style="font-size: 4rem; color: white;"></i>
                    </div>
                    <div class="doctor-info">
                        <h3>BS.CK2 Nguyễn Văn A</h3>
                        <p class="doctor-specialty">Trưởng Khoa Tai Mũi Họng</p>
                        <p class="doctor-experience">20+ năm kinh nghiệm</p>
                        <div class="doctor-achievements">
                            <span class="achievement">Tiến sĩ Y khoa</span>
                            <span class="achievement">Chứng chỉ quốc tế</span>
                        </div>
                        <div class="doctor-details">
                            <h4>Chuyên môn:</h4>
                            <ul>
                                <li>Phẫu thuật nội soi xoang</li>
                                <li>Phẫu thuật tai giữa</li>
                                <li>Điều trị ung thư đầu cổ</li>
                            </ul>
                            <h4>Lịch khám:</h4>
                            <p>Thứ 2, 4, 6: 8:00 - 17:00</p>
                        </div>
                    </div>
                </div>

                <div class="doctor-card">
                    <div class="doctor-image">
                        <i class="fas fa-user-md" style="font-size: 4rem; color: white;"></i>
                    </div>
                    <div class="doctor-info">
                        <h3>BS.CK1 Trần Thị B</h3>
                        <p class="doctor-specialty">Chuyên Khoa Tai Mũi Họng</p>
                        <p class="doctor-experience">15+ năm kinh nghiệm</p>
                        <div class="doctor-achievements">
                            <span class="achievement">Thạc sĩ Y khoa</span>
                            <span class="achievement">Chuyên gia nội soi</span>
                        </div>
                        <div class="doctor-details">
                            <h4>Chuyên môn:</h4>
                            <ul>
                                <li>Nội soi tai mũi họng</li>
                                <li>Điều trị viêm xoang mạn</li>
                                <li>Phẫu thuật amidan, VA</li>
                            </ul>
                            <h4>Lịch khám:</h4>
                            <p>Thứ 3, 5, 7: 8:00 - 17:00</p>
                        </div>
                    </div>
                </div>

                <div class="doctor-card">
                    <div class="doctor-image">
                        <i class="fas fa-user-md" style="font-size: 4rem; color: white;"></i>
                    </div>
                    <div class="doctor-info">
                        <h3>BS. Lê Văn C</h3>
                        <p class="doctor-specialty">Chuyên Khoa Tai Mũi Họng</p>
                        <p class="doctor-experience">12+ năm kinh nghiệm</p>
                        <div class="doctor-achievements">
                            <span class="achievement">Bác sĩ chuyên khoa</span>
                            <span class="achievement">Chuyên gia phẫu thuật</span>
                        </div>
                        <div class="doctor-details">
                            <h4>Chuyên môn:</h4>
                            <ul>
                                <li>Phẫu thuật chỉnh hình mũi</li>
                                <li>Điều trị rối loạn giọng nói</li>
                                <li>Phẫu thuật thanh quản</li>
                            </ul>
                            <h4>Lịch khám:</h4>
                            <p>Thứ 2, 3, 4: 13:00 - 20:00</p>
                        </div>
                    </div>
                </div>

                <div class="doctor-card">
                    <div class="doctor-image">
                        <i class="fas fa-user-md" style="font-size: 4rem; color: white;"></i>
                    </div>
                    <div class="doctor-info">
                        <h3>BS. Phạm Thị D</h3>
                        <p class="doctor-specialty">Bác Sĩ Tai Mũi Họng</p>
                        <p class="doctor-experience">8+ năm kinh nghiệm</p>
                        <div class="doctor-achievements">
                            <span class="achievement">Bác sĩ đa khoa</span>
                            <span class="achievement">Chuyên khoa TMH</span>
                        </div>
                        <div class="doctor-details">
                            <h4>Chuyên môn:</h4>
                            <ul>
                                <li>Khám và điều trị nhi</li>
                                <li>Viêm tai giữa trẻ em</li>
                                <li>Dị ứng mũi họng</li>
                            </ul>
                            <h4>Lịch khám:</h4>
                            <p>Thứ 5, 6, 7: 8:00 - 17:00</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose Us -->
    <section class="why-choose">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Tại Sao Chọn Chúng Tôi?</h2>
            </div>
            <div class="features-grid">
                <div class="feature-item">
                    <i class="fas fa-graduation-cap"></i>
                    <h3>Chuyên Môn Cao</h3>
                    <p>Đội ngũ bác sĩ được đào tạo bài bản, có chuyên môn cao và kinh nghiệm dày dặn</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-hospital"></i>
                    <h3>Thiết Bị Hiện Đại</h3>
                    <p>Trang thiết bị y tế hiện đại, đáp ứng tiêu chuẩn quốc tế</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-heart"></i>
                    <h3>Tận Tâm Chu Đáo</h3>
                    <p>Phục vụ tận tình, chu đáo, luôn đặt lợi ích người bệnh lên hàng đầu</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-shield-alt"></i>
                    <h3>An Toàn Tuyệt Đối</h3>
                    <p>Quy trình vô trùng nghiêm ngặt, đảm bảo an toàn tuyệt đối cho người bệnh</p>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/WEB-INF/views/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>