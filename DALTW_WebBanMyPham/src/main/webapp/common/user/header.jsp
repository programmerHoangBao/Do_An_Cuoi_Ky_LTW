<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Header</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templates/user/css/styles-header.css" />
    <script src="${pageContext.request.contextPath}/templates/user/js/scripts-header.js" defer></script>
</head>
<body>
    <!-- header section start -->
    <div class="header_section">
        <div class="logo_and_name">
            <img src="${pageContext.request.contextPath}/templates/images/logo.png" />
            <label id="name">Cosmetics</label>
        </div>
        <div class="header-container-fluid">
            <nav class="header-navbar navbar-light header-bg-light">
                <div class="navbar-links">
                    <a href="${pageContext.request.contextPath}/index.html">Trang chủ</a>
                    <a href="${pageContext.request.contextPath}/products.html">Cửa hàng</a>
                    <a href="${pageContext.request.contextPath}/client.html">Tài khoản của tôi</a>
                    <a href="${pageContext.request.contextPath}/contact.html">Hoạt động</a>
                </div>
                <div class="login_text">
                    <ul>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/templates/images/user-regular-24.png" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/templates/images/shopping-bag-regular-24.png" /></a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</body>
</html>
