<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ include file="/common/tablib.jsp" %>--%>

<div style="max-width: 360px; margin: 60px auto; padding: 30px; background-color: #f9f9f9; border-radius: 12px; box-shadow: 0 6px 15px rgba(0,0,0,0.1);">
  <h2 style="text-align: center; font-size: 24px; color: #333; margin-bottom: 25px;">Welcome Back</h2>

  <c:if test="${not empty alert}">
    <div style="color: #d9534f; font-weight: bold; text-align: center; margin-bottom: 20px;">${alert}</div>
  </c:if>

  <form action="${pageContext.request.contextPath}/login" method="post">
    <div style="margin-bottom: 20px;">
      <label for="email" style="display: block; font-weight: 600; color: #555;">Email</label>
      <input type="text" id="email" name="email" value="${cookie_user}" placeholder="you@example.com" required
             style="width: 100%; padding: 12px; margin-top: 8px; border: 1px solid #ddd; border-radius: 8px; font-size: 14px;">
    </div>

    <div style="margin-bottom: 20px;">
      <label for="password" style="display: block; font-weight: 600; color: #555;">Password</label>
      <input type="password" id="password" name="password" placeholder="••••••••" required
             style="width: 100%; padding: 12px; margin-top: 8px; border: 1px solid #ddd; border-radius: 8px; font-size: 14px;">
    </div>

    <div style="display: flex; align-items: center; margin-bottom: 20px;">
      <input type="checkbox" id="rememberMe" name="remember" value="on" style="margin-right: 8px;">
      <label for="rememberMe" style="font-size: 14px; color: #555;">Remember me</label>
    </div>

    <button type="submit" style="width: 100%; padding: 12px; background-color: #4CAF50; color: #fff; font-weight: bold; border: none; border-radius: 8px; cursor: pointer; transition: background-color 0.3s;">
      Log In
    </button>

    <div style="text-align: center; margin-top: 20px;">
      <a href="${pageContext.request.contextPath}/forgotpass" style="color: #888; text-decoration: none; font-size: 14px;">Forgot Password?</a>
      <span style="color: #ccc; margin: 0 10px;">|</span>
      <a href="${pageContext.request.contextPath}/signup" style="color: #4CAF50; text-decoration: none; font-size: 14px; font-weight: bold;">Create an account</a>
    </div>
  </form>
</div>

