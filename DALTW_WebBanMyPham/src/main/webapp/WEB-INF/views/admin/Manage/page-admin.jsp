<%@ include file="/common/taglib.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Nhân sự - Cửa hàng mỹ phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Background Gradient */

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Main Container Styling */
        .admin-container {
            background: rgba(47, 28, 53, 0.55);
            padding: 40px;

            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 93.4%;
            text-align: center;
            backdrop-filter: blur(10px);
            color: #ffffff;
        }

        h2 {
            font-size: 28px;
            color: #ec8493;
            margin-bottom: 20px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #e0e0e0;
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
            background-color: #00c853;
        }

        .btn-edit:hover {
            background-color: #00e676;
        }

        .btn-delete {
            background-color: #d32f2f;
        }

        .btn-delete:hover {
            background-color: #f44336;
        }

        /* Form Styling */
        .form-container {
            margin-top: 30px;
            text-align: left;
        }

        .form-container input, .form-container select {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            outline: none;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            margin-bottom: 15px;
        }

        .form-container button {
            padding: 12px;
            width: 100%;
            background-color: #ec8493;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }

    </style>
</head>
<body>

<div class="admin-container">
    <h2>Quản lý Người dùng</h2>

    <!-- Danh sách người dùng -->
    <table>
        <thead>
        <tr>
            <th>Họ Tên</th>
            <th>Email</th>
            <th>Chức Vụ</th>
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

<%--    <!-- Form thêm mới người dùng -->--%>
<%--    <div class="form-container">--%>
<%--        <h3>Thêm Mới Người Dùng</h3>--%>
<%--        <form action="/admin/addUser" method="post">--%>
<%--            <label for="fullName">Họ và Tên:</label>--%>
<%--            <input type="text" name="fullName" required />--%>

<%--            <label for="email">Email:</label>--%>
<%--            <input type="email" name="email" required />--%>

<%--            <label for="role">Chức Vụ:</label>--%>
<%--            <select name="role">--%>
<%--                <option value="USER">Người Dùng</option>--%>
<%--                <option value="VENDOR">Nhà Cung Cấp</option>--%>
<%--            </select>--%>

<%--            <label for="password">Mật khẩu:</label>--%>
<%--            <input type="password" name="password" required />--%>

<%--            <label for="phone">Số Điện Thoại:</label>--%>
<%--            <input type="text" name="phone" required />--%>

<%--            <label for="address">Địa Chỉ:</label>--%>
<%--            <input type="text" name="address" required />--%>

<%--            <button type="submit">Thêm Người Dùng</button>--%>
<%--        </form>--%>
<%--    </div>--%>
</div>

</body>
</html>
