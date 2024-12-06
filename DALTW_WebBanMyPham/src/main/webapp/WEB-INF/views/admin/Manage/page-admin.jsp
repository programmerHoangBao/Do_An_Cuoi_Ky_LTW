<%@ include file="/common/taglib.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Người Dùng và Shop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Phong cách chung cho các bảng */
        .container {
            background: #f4eeee;
            padding: 40px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 93%;
            margin: 20px auto;
            text-align: center;
            backdrop-filter: blur(10px);
            color: #ec8493;
        }

        h2 {
            font-size: 28px;
            color: #ec8493;
            margin-bottom: 20px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 2px solid #d32f2f;
        }

        th {
            background-color: #ec8493;
            color: white;
        }

        td {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .btn {
            padding: 10px 15px;
            background-color: #ec8493;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 14px;
            margin: 5px;
        }

        .btn:hover {
            background-color: #e91e63;
        }

        .btn-edit {
            background-color: #e5c9d7;
        }

        .btn-edit:hover {
            background-color: #00e676;
        }

        .btn-delete {
            background-color: #83a6ce;
        }

        .btn-delete:hover {
            background-color: #f44336;
        }

    </style>
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
        <input type="text" id="searchUserInput" placeholder="Tìm kiếm theo tên người dùng..." oninput="searchUsers()" style="width: 200px; padding: 8px; margin-top: 5px;">
    </div>

    <div style="margin-bottom: 20px; text-align: left;">
        <label for="roleFilter" style="font-weight: bold; color: #ec8493;">Lọc theo vai trò:</label>
        <select id="roleFilter" onchange="filterByRole()">
            <option value="all">Tất cả</option>
            <option value="ROLE_USER">Người Dùng</option>
            <option value="ROLE_VENDOR">Vendor</option>
        </select>
    </div>

    <script>
        // Hàm để thay đổi trạng thái hiển thị bảng
        function toggleTable(tableId) {
            const userTable = document.getElementById("userTable");
            const shopTable = document.getElementById("shopTable");

            if (tableId === 'userTable') {
                userTable.style.display = (userTable.style.display === "none" || userTable.style.display === "") ? "block" : "none";
                shopTable.style.display = "none";  // Ẩn bảng shop
            } else {
                shopTable.style.display = (shopTable.style.display === "none" || shopTable.style.display === "") ? "block" : "none";
                userTable.style.display = "none";  // Ẩn bảng người dùng
            }
        }

        // Hàm tìm kiếm trong bảng Người Dùng
        function searchUsers() {
            const searchTerm = document.getElementById("searchUserInput").value.toLowerCase();
            const rows = document.querySelectorAll("#userTable table tbody tr");

            rows.forEach(row => {
                const userName = row.querySelector("td:nth-child(1)").textContent.toLowerCase();
                const userEmail = row.querySelector("td:nth-child(2)").textContent.toLowerCase();

                if (userName.includes(searchTerm) || userEmail.includes(searchTerm)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }

        // Hàm lọc theo vai trò người dùng
        function filterByRole() {
            const selectedRole = document.getElementById("roleFilter").value.toLowerCase();
            const rows = document.querySelectorAll("#userTable table tbody tr");

            rows.forEach(row => {
                const role = row.querySelector("td:nth-child(3)").textContent.toLowerCase();

                if (selectedRole === "all" || role === selectedRole) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }
    </script>

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
                        <button class="btn btn-edit">Sửa</button>
                        <button class="btn btn-delete">Xóa</button>
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
        <input type="text" id="searchShopInput" placeholder="Tìm kiếm theo tên shop..." oninput="searchShops()" style="width: 200px; padding: 8px; margin-top: 5px;">
    </div>

    <script>
        // Hàm tìm kiếm trong bảng Shop
        function searchShops() {
            const searchTerm = document.getElementById("searchShopInput").value.toLowerCase();
            const rows = document.querySelectorAll("#shopTable table tbody tr");

            rows.forEach(row => {
                const shopName = row.querySelector("td:nth-child(1)").textContent.toLowerCase();
                const shopAddress = row.querySelector("td:nth-child(2)").textContent.toLowerCase();

                if (shopName.includes(searchTerm) || shopAddress.includes(searchTerm)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }
    </script>

    <table>
        <thead>
            <tr>
                <th>Tên Shop</th>
                <th>Địa Chỉ</th>
                <th>Số Điện Thoại</th>
                <th>Hành Động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${shopList}" var="s">
                <tr>
                    <td>${s.shopName}</td>
                    <td>${s.address}</td>
                    <td>${s.phone}</td>
                    <td>
                        <button class="btn btn-edit">Sửa</button>
                        <button class="btn btn-delete">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
