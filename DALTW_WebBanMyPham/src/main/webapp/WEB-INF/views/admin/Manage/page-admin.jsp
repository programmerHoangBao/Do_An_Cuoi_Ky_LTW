<%@ include file="/common/taglib.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Người Dùng và Shop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templates/admin/css/table-user-shop.css"/>
    <script src="${pageContext.request.contextPath}/templates/admin/js/table-user-shop.js" defer></script>
    <script src="${pageContext.request.contextPath}/templates/admin/js/view-detail.js" defer></script>

</head>
<body>

<!-- Nút để hiển thị bảng Quản lý Người Dùng -->
<div style="text-align: center;">
    <button class="btn" onclick="toggleTable('userTable')">Quản lý Người Dùng</button>
    <button class="btn" onclick="toggleTable('shopTable')">Quản lý Shop</button>
</div>

<!-- Bảng Quản lý Người Dùng -->
<div class="container" id="userTable" style="display: block;"> <!-- Đảm bảo hiển thị bảng người dùng mặc định -->
    <h2>Quản lý Người Dùng</h2>

    <!-- Bộ lọc người dùng -->
    <div style="margin-bottom: 20px; text-align: left;">
        <label for="searchUserInput" style="font-weight: bold; color: #ec8493;">Tìm kiếm:</label>
        <input type="text" id="searchUserInput" placeholder="Tìm kiếm theo tên người dùng..." oninput="searchUsers()"
               style="width: 200px; padding: 8px; margin-top: 5px;">
    </div>

    <div style="margin-bottom: 20px; text-align: left;">
        <label for="roleFilter" style="font-weight: bold; color: #ec8493;">Lọc theo vai trò:</label>
        <select id="roleFilter" onchange="filterByRole()">
            <option value="all">Tất cả</option>
            <option value="ROLE_USER">Người Dùng</option>
            <option value="ROLE_VENDOR">Vendor</option>
        </select>
    </div>
    <table>
        <thead>
        <tr>
            <th>Tên Người Dùng</th>
            <th>Email</th>
            <th>Vai Trò</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="u">
            <tr>
                <td>${u.fullName}</td>
                <td>${u.email}</td>
                <td>${u.role}</td>
                <td>
                    <!-- Nút để chuyển đến trang chi tiết người dùng -->
                    <a href="${pageContext.request.contextPath}/admin/view-detail-user/${u.email}">
                        <button class="btn btn-edit">Sửa</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bảng Quản lý Shop -->
<div class="container" id="shopTable" style="display: none;">
    <h2>Quản lý Shop</h2>

    <div style="margin-bottom: 20px; text-align: left;">
        <label for="searchShopInput" style="font-weight: bold; color: #ec8493;">Tìm kiếm:</label>
        <input type="text" id="searchShopInput" placeholder="Tìm kiếm theo tên shop..." oninput="searchShops()"
               style="width: 200px; padding: 8px; margin-top: 5px;">
    </div>
    <table>
        <thead>
        <tr>
            <th>Tên Shop</th>
            <th>Địa Chỉ</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${shopList}" var="s">
            <tr>
                <td>${s.name}</td>
                <td>${s.address}</td>
                <td>
                    <!-- Nút để chuyển đến trang chi tiết shop -->
                    <a href="${pageContext.request.contextPath}/admin/view-detail-shop/${s.id_shop}">
                        <button class="btn btn-edit">Sửa</button>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/view-detail-shop/revenue/${s.id_shop}">
                        <button class="btn btn-revenue">Doanh thu</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
