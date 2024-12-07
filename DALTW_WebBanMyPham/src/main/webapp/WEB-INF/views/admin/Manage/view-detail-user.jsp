<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/admin/css/view-detail.css"/>
<%@ include file="/common/taglib.jsp" %>

<%-- Kiểm tra xem user có tồn tại không --%>
<c:if test="${not empty user}">
    <form id="editUserModal" method="post" action="${pageContext.request.contextPath}/admin/view-detail-user/update">
        <label for="editUserId"></label>
        <input type="hidden" id="editUserId" name="id_user" value="${user.id_user}" required>

        <label for="editUserName"></label>
        <input type="hidden" id="editUserName" name="username" value="${user.username}" required>

        <label for="editUserPassword"></label>
        <input type="hidden" id="editUserPassword" name="password" value="${user.password}" required>

        <label for="editFullName">Tên Người Dùng:</label>
        <input type="text" id="editFullName" name="fullName" value="${user.fullName}" required>

        <label for="editEmail">Email:</label>
        <input type="email" id="editEmail" name="email" value="${user.email}" readonly>

        <label for="editPhone">Số Điện Thoại:</label>
        <input type="text" id="editPhone" name="phone" value="${user.phone}" required>

        <label for="editBirthDate"></label>
        <input type="hidden" id="editBirthDate" name="birthDate" value="${user.birthDate}" required>

        <label for="editSignUpDate"></label>
        <input type="hidden" id="editSignUpDate" name="signUpDate" value="${user.signUpDate}" required>

        <label for="editAddress">Địa Chỉ:</label>
        <input type="text" id="editAddress" name="address" value="${user.address}" required>

        <label for="editRole"></label>
        <input type="hidden" id="editRole" name="role" value="${user.role}" required>


        <label for="editStatus">Trạng Thái:</label>
        <select id="editStatus" name="status" required>
            <option value="1" ${user.status == 1 ? 'selected' : ''}>Active</option>
            <option value="0" ${user.status == 0 ? 'selected' : ''}>Inactive</option>
        </select>

        <button type="submit" class="btn">Lưu</button>
    </form>
</c:if>
<c:if test="${empty user}">
    <p>User not found</p>
</c:if>


