<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký làm người bán</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Tối ưu giao diện với màu sắc và hiệu ứng */
        body {
            background-color: #f7f7f7;
            font-family: 'Arial', sans-serif;
            padding-top: 30px;
        }

        .container {
            max-width: 800px;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 2rem;
            font-weight: 600;
            color: #2C3E50;
        }

        .fieldset-legend {
            font-weight: 600;
            font-size: 1.1rem;
            color: #2C3E50;
        }

        .form-control, .form-select, .form-control-file {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 10px;
        }

        .form-control:focus, .form-select:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
        }

        .btn-primary {
            background-color: #3498db;
            border-color: #3498db;
            padding: 10px 20px;
            font-size: 1.1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }

        /* Cải thiện các ô nhập liệu với kích thước gọn */
        .row label {
            font-size: 0.95rem;
            font-weight: 600;
            color: #34495e;
        }

        /* Giới thiệu cửa hàng và logo */
        .form-group textarea {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 10px;
            font-size: 0.9rem;
            height: 150px;
            resize: vertical;
        }

        .form-group input[type="file"] {
            padding: 5px;
        }

        .text-center {
            margin-top: 20px;
        }

        /* Tinh chỉnh các khoảng cách */
        .row.mb-3 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="text-center">
        <h2 class="mb-4 text-primary">Đăng ký làm người bán</h2>
    </div>

    <%--    <form action="/user/register" method="post" enctype="multipart/form-data">--%>
    <form action="/user/vendor-register" method="post">
        <!-- Thông tin người dùng -->
        <fieldset class="border rounded-3 p-4 mb-5">
            <legend class="fieldset-legend w-auto px-3">Thông tin người dùng</legend>
            <div class="row mb-3">
                <label for="username" class="col-sm-3 col-form-label fw-semibold">Tên đăng nhập:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="username" name="username" value="${user.username}" readonly>
                </div>
            </div>
            <div class="row mb-3">
                <label for="fullName" class="col-sm-3 col-form-label fw-semibold">Tên đầy đủ:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" readonly>
                </div>
            </div>
        </fieldset>

        <!-- Thông tin cửa hàng -->
        <fieldset class="border rounded-3 p-4 mb-5">
            <legend class="fieldset-legend w-auto px-3">Thông tin cửa hàng</legend>
            <div class="row mb-3">
                <label for="name_shop" class="col-sm-3 col-form-label fw-semibold">Tên cửa hàng:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="name_shop" name="name" placeholder="Nhập tên cửa hàng" required>
                </div>
            </div>
            <div class="row mb-3">
                <label for="address" class="col-sm-3 col-form-label fw-semibold">Địa chỉ:</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="address" name="address" value="${user.address}" placeholder="Nhập địa chỉ" required>
                </div>
            </div>
            <div class="row mb-3">
                <label for="introduce" class="col-sm-3 col-form-label fw-semibold">Giới thiệu cửa hàng:</label>
                <div class="col-sm-9">
                    <textarea class="form-control" id="introduce" name="introduce" rows="4" placeholder="Giới thiệu ngắn về cửa hàng..."></textarea>
                </div>
            </div>
            <div class="row mb-3">
                <label for="image" class="col-sm-3 col-form-label fw-semibold">Logo cửa hàng:</label>
                <div class="col-sm-9">
                    <%--                    <input type="file" class="form-control" id="image" name="image" accept="image/*">--%>
                    <input type="file" id="image" name="image"><br>
                </div>
            </div>
        </fieldset>

        <!-- Nút Submit -->
        <div class="text-center">
            <button type="submit" class="btn btn-primary btn-lg px-5">Đăng ký</button>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
