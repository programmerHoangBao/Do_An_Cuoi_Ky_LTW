<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/admin/css/view-detail.css"/>
<%@ include file="/common/taglib.jsp" %>

<%-- Kiểm tra xem shop có tồn tại không --%>
<c:if test="${not empty shop}">
    <form id="editUserModal" method="post" action="${pageContext.request.contextPath}/admin/view-detail-shop/update">
        <label for="editShopId"></label>
        <input type="hidden" id="editShopId" name="id_shop" value="${shop.id_shop}" required>

        <label for="editShopName">Tên Cửa Hàng:</label>
        <input type="text" id="editShopName" name="name" value="${shop.name}" required>

        <label for="editSignUpDate"></label>
        <input type="hidden" id="editSignUpDate" name="signUpDate" value="${shop.signUpDate}" required>

        <label for="editAddress">Địa Chỉ:</label>
        <input type="text" id="editAddress" name="address" value="${shop.address}" required>

        <label for="editIntro">Giới Thiệu:</label>
        <input type="text" id="editIntro" name="introduce" value="${shop.introduce}" required>

        <button type="submit" class="btn">Lưu</button>
    </form>
</c:if>
<c:if test="${empty shop}">
    <p>Shop not found</p>
</c:if>



