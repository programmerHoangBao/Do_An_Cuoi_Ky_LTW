<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<form id="editUserModal" method="post" action="${pageContext.request.contextPath}/admin/user/update">
    <label for="editFullName">Tên Người Dùng:</label>
    <input type="text" id="editFullName" name="fullName" value="${user.fullName}" required>

    <label for="editEmail">Email:</label>
    <input type="email" id="editEmail" name="email" value="${user.email}" required>

    <label for="editRole">Vai Trò:</label>
    <select id="editRole" name="role" required>
        <option value="Admin" ${user.role == 'Admin' ? 'selected' : ''}>Admin</option>
        <option value="User" ${user.role == 'User' ? 'selected' : ''}>User</option>
    </select>

    <button type="submit" class="btn">Lưu</button>
</form>
