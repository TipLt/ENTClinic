<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header">
    <nav class="navbar">
        <div class="nav-container">
            <a href="${pageContext.request.contextPath}/" class="nav-logo">
                <i class="fas fa-stethoscope"></i>
                <span>Phòng Khám Tai Mũi Họng</span>
            </a>
            
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/" class="nav-link">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/services.jsp" class="nav-link">Dịch vụ</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/doctors.jsp" class="nav-link">Bác sĩ</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/about.jsp" class="nav-link">Giới thiệu</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/#contact" class="nav-link">Liên hệ</a>
                </li>
            </ul>
            
            <div class="nav-auth">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <div class="user-menu">
                            <div class="user-dropdown">
                                <button class="user-btn" type="button">
                                    <i class="fas fa-user-circle"></i>
                                    <span>${sessionScope.user.name}</span>
                                    <i class="fas fa-chevron-down"></i>
                                </button>
                                <div class="dropdown-content">
                                    <a href="${pageContext.request.contextPath}/profile">
                                        <i class="fas fa-user"></i> Thông tin cá nhân
                                    </a>
                                    <c:if test="${sessionScope.user.role == 'ADMIN'}">
                                        <a href="${pageContext.request.contextPath}/admin/dashboard">
                                            <i class="fas fa-tachometer-alt"></i> Quản trị
                                        </a>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role == 'DOCTOR'}">
                                        <a href="${pageContext.request.contextPath}/doctor/dashboard">
                                            <i class="fas fa-stethoscope"></i> Bảng điều khiển
                                        </a>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role == 'RECEPTIONIST'}">
                                        <a href="${pageContext.request.contextPath}/receptionist/dashboard">
                                            <i class="fas fa-calendar"></i> Quản lý lịch hẹn
                                        </a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/logout">
                                        <i class="fas fa-sign-out-alt"></i> Đăng xuất
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-login">
                            <i class="fas fa-sign-in-alt"></i> Đăng nhập
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="nav-toggle">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>
        </div>
    </nav>
</header>