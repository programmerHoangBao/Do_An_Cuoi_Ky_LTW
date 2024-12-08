<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop List</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templates/admin/css/list-shop.css" />
</head>
<body>
	<h1>Shop List</h1>
	<form action="/admin/search-shop" method="get">
		<div class="search-container">
			<input type="text" name="name" class="search-input"
				placeholder="Nhập chuỗi tìm kiếm...">
			<button type="submit" class="search-button">Tìm kiếm</button>
		</div>
	</form>
	<form class = "listShopAdmin" action="/admin/list-shop" method="get">
		<table id = "tableShopAdmin">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên Shop</th>
					<th>Người đại diện</th>
					<th>Ngày tạo</th>
					<th>Địa chỉ</th>
					<th>Giới thiệu</th>
					<th>Hình ảnh</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty shops}">
					<c:forEach items="${shops}" var="shop">
						<tr>
							<td>${shop.id_shop}</td>
							<td>${shop.name}</td>
							<td>${shop.vendor.fullName}</td>
							<td>${shop.signUpDate}</td>
							<td>${shop.address}</td>
							<td>${shop.introduce}</td>
							<td><img id = "imageShopAdmin" src="${shop.image}" alt="Shop Image" width="100"></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty shops}">
					<tr>
						<td colspan="7" style="text-align: center;">Không có cửa hàng
							nào để hiển thị.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<c:if test="${not empty shops}">
			<div class="pagination">
				<c:if test="${currentPage > 0}">
					<a href="?page=${currentPage - 1}&size=${shopPage.size}">Previous</a>
				</c:if>
				<c:forEach begin="0" end="${totalPages - 1}" var="pageIndex">
					<a href="?page=${pageIndex}&size=${shopPage.size}"
						class="${pageIndex == currentPage ? 'active' : ''}">
						${pageIndex + 1} </a>
				</c:forEach>
				<c:if test="${currentPage < totalPages - 1}">
					<a href="?page=${currentPage + 1}&size=${shopPage.size}">Next</a>
				</c:if>
			</div>
		</c:if>
	</form>
</body>
</html>
