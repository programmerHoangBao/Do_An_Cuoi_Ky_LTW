<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List product</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templates/admin/css/list-product.css" />
</head>
<body>
	<form action="/admin/search-product" method="get">
		<div class="search-container">
			<input type="text" name="name" class="search-input"
				placeholder="Nhập chuỗi tìm kiếm...">
			<button type="submit" class="search-button">Tìm kiếm</button>
		</div>
	</form>
	<form action="/admin/list-product" method="get">
		<div class="contain">
			<div class=div_InsertProduct>
				<button id=btnInsertProduct>Thêm</button>
			</div>
			<script>
				document.getElementById("btnInsertProduct").addEventListener(
						"click", function() {
							window.open("/admin/insert-product", "_blank");
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
									<td><a href="/admin/shop-details?id=${product.shop.id_shop}">${product.shop.name}</a></td>
									<td><a href="#">${product.category.name}</a></td>
									<td id="price_product">${product.price}</td>
									<td>${product.quantity}</td>
									<td id="image_product">
										<script>
    											// Biến index bắt đầu từ 0, bạn có thể đặt giá trị mặc định là 0
    											let index = 0;

    											// Hàm chuyển đến hình ảnh màu sắc trước (btnLeft)
    											function prevValue() {
        											// Giảm index. Nếu index < 0, gán giá trị bằng product.productColors.size() - 1
    												if (index < 0) {
        												index = ${product.productColors.size()} - 1; // Gán index cho phần tử cuối cùng
        												} else {
            												index--;
            												}
    												updateImageAndColor();
    											}

    											// Hàm chuyển đến hình ảnh màu sắc sau (btnRight)
    											function nextValue() {
        											// Tăng index. Nếu index vượt quá kích thước mảng, gán index = 0
    												if (index > ${product.productColors.size()} - 1) {
        												index = 0; // Quay lại phần tử đầu tiên
        												} else {
            												index++;
            												}
    												updateImageAndColor();
    											}

    											// Hàm cập nhật hình ảnh và màu sắc dựa trên index
    											function updateImageAndColor() {
        											// Cập nhật hình ảnh
    												let imageProduct = document.getElementById("image_product_color");
    												imageProduct.src = "${product.productColors[index].imageProduct}"; // Cập nhật đường dẫn hình ảnh
												
    											
    												// Cập nhật màu sắc
    												let colorProduct = document.getElementById("color_product");
    												colorProduct.textContent = '${product.productColors[index].color}'; // Cập nhật tên màu
    												console.log("index=", index);
    												console.log("color=", colorProduct.textContent);
    											} 

    											</script>
										<div class="list_image">
<!-- 											<button type = "button" id="btnLeft" onclick="prevValue()">
												<i class='bx bxs-caret-left-circle'></i>
											</button> -->
											<img id="image_product_color" alt="Hình ảnh sản phẩm"
												src="${product.productColors[index].imageProduct}"> <label
												id="color_product">${product.productColors[index].color}</label>
<!-- 											<button type = "button" id="btnRight" onclick="nextValue()">
												<i class='bx bxs-caret-right-circle'></i>
											</button> -->


										</div>
									</td>
									<td><c:if test='${product.status_product}'>
											<p>Hiển thị</p>
										</c:if> <c:if test='${!product.status_product}'>
											<p>Ẩn</p>
										</c:if></td>
									<td><a href="/admin/update-product?id=${product.id_product}">Chi tiết</a></td>
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
