<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--&lt;%&ndash;<%@ include file="/common/tablib.jsp" %>&ndash;%&gt;--%>

<%--<div style="max-width: 360px; margin: 60px auto; padding: 30px; background-color: #f9f9f9; border-radius: 12px; box-shadow: 0 6px 15px rgba(0,0,0,0.1);">--%>
<%--  <h2 style="text-align: center; font-size: 24px; color: #333; margin-bottom: 25px;">Welcome Back</h2>--%>

<%--  <c:if test="${not empty alert}">--%>
<%--    <div style="color: #d9534f; font-weight: bold; text-align: center; margin-bottom: 20px;">${alert}</div>--%>
<%--  </c:if>--%>

<%--  <form th:action="@{/login}" method="post">--%>
<%--    <div style="margin-bottom: 20px;">--%>
<%--      <label for="email" style="display: block; font-weight: 600; color: #555;">Email</label>--%>
<%--      <input type="text" id="email" name="email" value="${cookie_user}" placeholder="you@example.com" required--%>
<%--             style="width: 100%; padding: 12px; margin-top: 8px; border: 1px solid #ddd; border-radius: 8px; font-size: 14px;">--%>
<%--    </div>--%>

<%--    <div style="margin-bottom: 20px;">--%>
<%--      <label for="password" style="display: block; font-weight: 600; color: #555;">Password</label>--%>
<%--      <input type="password" id="password" name="password" placeholder="••••••••" required--%>
<%--             style="width: 100%; padding: 12px; margin-top: 8px; border: 1px solid #ddd; border-radius: 8px; font-size: 14px;">--%>
<%--    </div>--%>

<%--    <div style="display: flex; align-items: center; margin-bottom: 20px;">--%>
<%--      <input type="checkbox" id="rememberMe" name="remember" value="on" style="margin-right: 8px;">--%>
<%--      <label for="rememberMe" style="font-size: 14px; color: #555;">Remember me</label>--%>
<%--    </div>--%>

<%--    <button type="submit" style="width: 100%; padding: 12px; background-color: #4CAF50; color: #fff; font-weight: bold; border: none; border-radius: 8px; cursor: pointer; transition: background-color 0.3s;">--%>
<%--      Log In--%>
<%--    </button>--%>

<%--    <div style="text-align: center; margin-top: 20px;">--%>
<%--      <a href="${pageContext.request.contextPath}/forgotpass" style="color: #888; text-decoration: none; font-size: 14px;">Forgot Password?</a>--%>
<%--      <span style="color: #ccc; margin: 0 10px;">|</span>--%>
<%--      <a href="${pageContext.request.contextPath}/signup" style="color: #4CAF50; text-decoration: none; font-size: 14px; font-weight: bold;">Create an account</a>--%>
<%--    </div>--%>
<%--  </form>--%>
<%--</div>--%>


<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng nhập</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f7fc;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .login-container {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      font-size: 24px;
      color: #333;
    }

    .input-field {
      margin-bottom: 15px;
      position: relative;
    }

    .input-field input {
      width: 90%;
      padding: 12px 15px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
      outline: none;
      transition: all 0.3s ease;
    }

    .input-field input:focus {
      border-color: #4CAF50;
    }

    .input-field input::placeholder {
      color: #aaa;
    }

    .input-field i {
      position: absolute;
      top: 50%;
      right: 10px;
      transform: translateY(-50%);
      color: #aaa;
    }

    .login-btn {
      width: 100%;
      padding: 12px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .login-btn:hover {
      background-color: #45a049;
    }

    .error-message {
      color: red;
      text-align: center;
      margin-top: 10px;
      font-size: 14px;
    }

    .login-footer {
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>
<body>

<div class="login-container">
  <h2>Đăng nhập</h2>
  <form action="/login" method="post">
    <div class="input-field">
      <input type="text" name="username" placeholder="Tên người dùng" required />
    </div>
    <div class="input-field">
      <input type="password" name="password" placeholder="Mật khẩu" required />
    </div>
    <button type="submit" class="login-btn">Đăng nhập</button>
    <div class="error-message" th:if="${param.error}">
      <p>Tên người dùng hoặc mật khẩu không đúng. Vui lòng thử lại.</p>
    </div>
  </form>
  <div class="login-footer">
    <p>Bạn chưa có tài khoản? <a href="/signup">Đăng ký ngay</a></p>
  </div>
</div>

</body>
</html>

