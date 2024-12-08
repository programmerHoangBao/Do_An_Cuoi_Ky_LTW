<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác thực OTP - Cửa hàng mỹ phẩm</title>
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

        .otp-container {
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

        .input-field i {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            color: #b0b0b0;
        }

        .otp-btn {
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

        .otp-btn:hover {
            background-color: #ec8493;
        }

        .error-message {
            color: #d32f2f;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }

        .otp-footer {
            margin-top: 20px;
        }

        .otp-footer a {
            color: #ec8493;
            text-decoration: none;
            font-weight: bold;
        }

        .otp-footer a:hover {
            text-decoration: underline;
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

<div class="otp-container">
    <div class="brand-logo">
        <img src="${pageContext.request.contextPath}/templates/images/logo1.jpg" alt="Logo"/>
    </div>
    <h2>Xác thực mã OTP</h2>
    <form action="${pageContext.request.contextPath}/register/register-verify-otp" method="post">
        <div class="input-field">
            <input type="email" name="email" value="${param.email}" placeholder="Email đã đăng ký" readonly />
            <i class="fas fa-envelope"></i>
        </div>
        <div class="input-field">
            <input type="text" name="otp" placeholder="Mã OTP đã gửi qua Email" required />
            <i class="fas fa-key"></i>
        </div>
        <button type="submit" class="otp-btn">Xác thực</button>
        <div class="error-message" style="${param.error != null && param.error == 'true' ? 'display: block;' : 'display: none;'}">
            <p style="color: red;">Mã OTP không đúng. Vui lòng thử lại.</p>
        </div>
    </form>
    <div class="otp-footer">
<%--        <p>Chưa nhận được mã? <a href="${pageContext.request.contextPath}/resend-otp">Gửi lại mã OTP</a></p>--%>
        <p><a href="${pageContext.request.contextPath}/login">Quay lại đăng nhập</a></p>
    </div>
</div>

</body>
</html>
