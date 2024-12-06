
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inser Product</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templates/admin/css/insert-product.css">
<script
	src="${pageContext.request.contextPath}/templates/admin/js/insert-product.js"></script>
</head>
<body>
	<form class=form_insert_product_admin action="/admin/insert-product"
		method="POST">
		<label for="nameProduct">Tên sản phẩm:</label> <input type="text"
			id="nameProduct" name="nameProduct" required> <label
			for="shop">Cửa hàng:</label> <select id="shop" name="idShop">
			<c:if test="${not empty shops}">
				<c:forEach var="shop" items="${shops}">
					<option value="${shop.id_shop}">${shop.name}</option>
				</c:forEach>
			</c:if>
		</select> <label for="category">Danh mục:</label> <select id="category"
			name="idCategory">
			<c:if test="${not empty categories}">
				<c:forEach var="category" items="${categories}">
					<option value="${category.id_category}">${category.name}</option>
				</c:forEach>
			</c:if>
		</select> <label for="price">Giá sản phẩm:</label> <input type="text"
			id="price" name="price" pattern="^\d+(\.\d{1,2})?$" required>

		<label for="quantity">Số lượng:</label> <input type="number"
			id="quantity" name="quantity" required> <label
			for="statusProduct">Trạng thái sản phẩm:</label> <select
			id="statusProduct" name="statusProduct">
			<option value="true">Hiển thị</option>
			<option value="false">Ẩn</option>
		</select> <label for="colorList">Màu sắc:</label> <select id="colorList"
			name="colorList">
			<option value="Đỏ">Đỏ</option>
			<option value="Hồng">Hồng</option>
			<option value="Xanh">Xanh</option>
			<option value="Vàng">Vàng</option>
		</select> <label for="imageUrlList">Hình ảnh:</label> <input type="text"
			id="imageUrlList" name="imageUrlList">

		<button type="button" id="addColorButton" onclick="addColor()">Thêm
			màu</button>
		<table id="colorTable">
			<thead>
				<tr>
					<th>Màu</th>
					<th>Hình ảnh</th>
					<th>Xóa</th>
				</tr>
			</thead>
			<tbody>
				<!-- Rows will be added dynamically here -->
			</tbody>
		</table>
		<button type="submit">Thêm sản phẩm</button>
	</form>

	<div id="message">
		<c:if test="${not empty message}">
			<p>${message}</p>
		</c:if>
	</div>

</body>
</html>