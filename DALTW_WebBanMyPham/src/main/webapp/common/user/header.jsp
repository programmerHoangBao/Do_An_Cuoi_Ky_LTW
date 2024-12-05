<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Header</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/templates/user/css/styles-header.css"/>
    <script src="${pageContext.request.contextPath}/templates/user/js/scripts-header.js" defer></script>
</head>
<body>
<!-- header section start -->
<div class="header_section">
    <div class="logo_and_name">
        <img src="${pageContext.request.contextPath}/templates/images/logo.png"/>
        <label id="name">Cosmetics</label>
    </div>
    <div class="header-container-fluid">
        <nav class="header-navbar navbar-light header-bg-light">
            <div class="navbar-links">
                <a href="${pageContext.request.contextPath}/index.html">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/products.html">Cửa hàng</a>
                <a href="${pageContext.request.contextPath}/login">Tài khoản của tôi</a>
                <a href="${pageContext.request.contextPath}/contact.html">Hoạt động</a>
            </div>
            <div class="login_text">
                <ul>
                    <li>
                        <c:choose>
                            <c:when test="${not empty username}">
                                <!-- Nếu người dùng đã đăng nhập, hiển thị icon logout -->
                                <a href="/logout">
                                    <i class='bx bx-door-open' style="font-size: 36px; color: black;"></i>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <!-- Nếu chưa đăng nhập, hiển thị icon người dùng -->
                                <a href="${pageContext.request.contextPath}/login">
                                    <i class='bx bxs-user-account' style="font-size: 36px; color: black;"></i>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li>
                        <a href="#">
                            <i class='bx bx-shopping-bag' style="font-size: 36px; color: black;"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
</body>
</html>
