<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Header</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templates/admin/css/styles-header.css" />
    <script src="${pageContext.request.contextPath}/templates/admin/js/scripts-header.js" defer></script>
</head>
<body>
    <!-- header section start -->
    <div class="header_section">
        <div class="container-fluid">
            <nav class="navbar navbar-light bg-light justify-content-between">
                <div id="mySidenav" class="sidenav">
                	<div class = "logo">
                		<img src="${pageContext.request.contextPath}/templates/images/logo.png" />
                	</div>
                    <div class="select-item">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="${pageContext.request.contextPath}/index.html">Trang chủ</a>
                        <a href="${pageContext.request.contextPath}/products.html">Cửa hàng</a>
                        <a href="${pageContext.request.contextPath}/about.html">Sản phẩm</a>
                        <a href="${pageContext.request.contextPath}/login">Tài khoản của tôi</a>
                        <a href="${pageContext.request.contextPath}/client.html">Tài khoản người dùng</a>
                        <a href="${pageContext.request.contextPath}/contact.html">Hoạt động</a>
                    </div>
                </div>
                <span class="toggle_icon" onclick="openNav()">
                    <img src="${pageContext.request.contextPath}/templates/images/toggle-icon.png" />
                </span>
                <label id="name">Cosmetics</label>
                <form class="form-inline">
                    <div class="login_text">
                        <ul>
                            <li>
                                <a href="#"><img src="${pageContext.request.contextPath}/templates/images/user-regular-24.png" /></a>
                            </li>
                            <li>
                                <a href="#"><img src="${pageContext.request.contextPath}/templates/images/shopping-bag-regular-24.png" /></a>
                            </li>
                        </ul>
                    </div>
                </form>
            </nav>
        </div>
    </div>
</body>
</html>
