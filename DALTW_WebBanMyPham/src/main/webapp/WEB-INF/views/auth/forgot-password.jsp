<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu - Cửa hàng mỹ phẩm</title>
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

        .forgot-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            font-size: 26px;
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
            background-color: #d94e62;
        }

        .message {
            margin-top: 10px;
            color: blue;
            font-size: 14px;
        }

        .brand-logo {
            margin-bottom: 20px;
        }

        .brand-logo img {
            width: 170px;
            height: auto;
        }
    </style>
</head>
<body>

<div class="forgot-container">
    <div class="brand-logo">
        <img src="${pageContext.request.contextPath}/templates/images/logo1.jpg" alt="Logo" />
    </div>
    <h2>Quên mật khẩu</h2>
    <form action="/forgotPassword/verifyMail" method="post">
        <div class="input-field">
            <input type="email" id="email" name="email" placeholder="Nhập email của bạn" required />
        </div>
        <button type="submit" class="submit-btn">Gửi email</button>
        <p class="message">${message}</p>
    </form>
</div>

</body>
</html>

