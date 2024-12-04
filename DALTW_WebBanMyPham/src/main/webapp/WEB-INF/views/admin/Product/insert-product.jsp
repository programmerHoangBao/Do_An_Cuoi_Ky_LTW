<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inser Product</title>
</head>
<body>
	<form class="contain" action="/admin/insert-product" method="POST">
		<h3 id="title_insert_product">Thêm sản phảm mới</h3>
		<div class="input_insert">
			<label id="nameProduct">Tên: </label> <input type="text"
				id="textNameProduct" name="textNameProduct"
				placeholder="Nhập nội dung ở đây"> <label id="labelShop">Cửa
				hàng: </label>
			<c:if test="${not empty shops}">
				<select id="selectShop">
					<c:forEach items="${shops}" var="${shop}">
						<option value="${shop}">${shop.name}</option>
					</c:forEach>
				</select>
			</c:if>
			<c:if test="${not empty categories}">
				<select id="selectShop">
					<c:forEach items="${categories}" var="${category}">
						<option value="${shop}">${shop.name}</option>
					</c:forEach>
				</select>
			</c:if>
		</div>
	</form>
</body>
</html>