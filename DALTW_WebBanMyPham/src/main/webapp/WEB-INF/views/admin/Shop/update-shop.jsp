<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update shop</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templates/admin/css/update-shop.css" />
</head>
<body>
	<form class = "updateShop_" action="/admin/update-shop?id=${shop.id_shop}" method = "post" enctype="multipart/form-data">
		<label for=nameShop>Tên: </label>
		<input type="text" id="nameShop" name="nameShop" value="${shop.name}">
		<label for="idVendor">Người đại diện: </label>
		<select id="idVendor" name="idVendor">
			<c:if test="${not empty vendors}">
				<c:forEach var="vendor" items="${vendors}">
					<option value="${vendor.id_user}" 
                		<c:if test="${vendor.id_user == shop.vendor.id_user}">selected</c:if>>
               				${vendor.fullName}
            		</option>
				</c:forEach>
			</c:if>
		</select> 
		<label for="signUpDate">Ngày đăng ký</label>
		<p id = "signUpDate"><fmt:formatDate value="${shop.signUpDate}" pattern="dd/MM/yyyy" /></p>
		<label for="address">Địa chỉ: </label>
		<input type="text" id="address" name="address" value="${shop.address}">
		<label for="introduce">Giới thiệu: </label>
		<input type="text" id="introduce" name="introduce" value="${shop.introduce}">
		<label for="image">Hình ảnh</label>
		<img alt="Logo shop" src="${shop.image}" id="imageShop">
		<input type="file" id="uploadImage" name="uploadImage" accept="image/*" required />
		<button type="submit" id="btnUpdateShop">Cập Nhật Shop</button>
	</form>
		<div id="message">
		<c:if test="${not empty message}">
			<p>${message}</p>
		</c:if>
	</div>
</body>
</html>