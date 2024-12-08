<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List product</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templates/admin/css/list-product.css" />
</head>
<body>
	<form action="/vendor/search-product" method="get">
		<div class="search-container">
			<input type="text" name="name" class="search-input"
				placeholder="Nhập chuỗi tìm kiếm...">
			<button type="submit" class="search-button">Tìm kiếm</button>
		</div>
	</form>
	<form action="/vendor/list-product" method="get">
		<div class="contain">
			<div class=div_InsertProduct>
				<button id=btnInsertProduct type="button">Thêm</button>
			</div>
			<script>
				document.getElementById("btnInsertProduct").addEventListener(
						"click", function() {
							window.open("/vendor/insert-product", "_blank");
						});
			</script>
			<div class="table_product">
				<table>
					<thead>
						<tr>
							<th>Stt</th>
							<th>Tên</th>
							<th>Cửa hàng</th>
							<th>Phân loại</th>
							<th>Gía trị</th>
							<th>Số lượng</th>
							<th>Hình ảnh</th>
							<th>Trạng thái</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty products}">
							<c:forEach items="${products}" var="product" varStatus="stt">
								<tr>
									<td>${stt.index + 1}</td>
									<td>${product.name}</td>
									<td><a href="#">${product.shop.name}</a></td>
									<td><a href="#">${product.category.name}</a></td>
									<td id="price_product">${product.price}</td>
									<td>${product.quantity}</td>
									<td id="image_product">
										<div class="list_image">
											<button id="btnLeft">
												<i class='bx bxs-caret-left-circle'></i>
											</button>
											<img id="image_product_color" alt="Hình ảnh sản phẩm"
												src="${product.productColors[0].imageProduct}"> <label
												id="color_product">${product.productColors[0].color}</label>
											<button id="btnRight">
												<i class='bx bxs-caret-right-circle'></i>
											</button>
										</div>
									</td>
									<td><c:if test='${product.status_product}'>
											<p>Hiển thị</p>
										</c:if> <c:if test='${!product.status_product}'>
											<p>Ẩn</p>
										</c:if></td>
									<td><a href="#">Cập nhật</a></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty products}">
							<tr>
								<td colspan="9" style="text-align: center;">Không có sản
									phẩm nào để hiển thị.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<div class="pagination">
				<c:if test="${not empty products}">
					<c:forEach var="i" begin="0" end="${totalPages - 1}">
						<a
							href="${pageContext.request.contextPath}/admin/list-product?page=${i}&size=20"
							class="${i == currentPage ? 'active' : ''}">${i + 1}</a>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</form>
</body>
</html>
