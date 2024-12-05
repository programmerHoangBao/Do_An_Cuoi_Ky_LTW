<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhập Mật Khẩu Mới - Cửa hàng mỹ phẩm</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #fff4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h1 {
            font-size: 24px;
            color: #ec8493;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .input-field {
            margin-bottom: 20px;
            position: relative;
        }

        .input-field input {
            width: 100%;
            padding: 12px 15px;
            font-size: 16px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            outline: none;
            transition: all 0.3s ease;
        }

        .input-field input:focus {
            border-color: #ec8493;
            box-shadow: 0 0 5px rgba(216, 27, 96, 0.5);
        }

        .input-field input::placeholder {
            color: #b0b0b0;
        }

        .input-field i {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            color: #b0b0b0;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #ec8493;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #d4626b;
        }

        .error-message {
            color: #d32f2f;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }

        .footer-links {
            margin-top: 20px;
        }

        .footer-links a {
            color: #ec8493;
            text-decoration: none;
            font-weight: bold;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Nhập Mật Khẩu Mới</h1>
    <form action="/forgotPassword/changePassword" method="post">
        <div class="input-field">
            <input type="text" name="email" value="${param.email}" readonly>
            <i class="fas fa-envelope"></i>
        </div>
        <div class="input-field">
            <input type="password" id="password" name="password" placeholder="Mật khẩu mới" required>
            <i class="fas fa-lock"></i>
        </div>
        <div class="input-field">
            <input type="password" id="repeatPassword" name="repeatPassword" placeholder="Xác nhận mật khẩu" required>
            <i class="fas fa-lock"></i>
        </div>
        <button type="submit" class="submit-btn">Xác Nhận</button>
        <div class="error-message" style="${error != null ? 'display: block;' : 'display: none;'}">
            <span>${error}</span>
        </div>
    </form>
    <div class="footer-links">
        <p><a href="/login">Quay lại đăng nhập</a></p>
    </div>
</div>

</body>
</html>

