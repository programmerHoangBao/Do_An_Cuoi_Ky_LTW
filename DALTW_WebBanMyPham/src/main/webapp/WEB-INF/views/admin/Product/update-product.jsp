<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inser Product</title>
<link rel="stylesheet" type="text/css"
	href="/templates/admin/css/insert-product.css">
</head>
<body>
	<form class="form_insert_product_admin" enctype="multipart/form-data"
		action="/admin/update-product?id=${product.id_product}" method="POST">
		<label for="nameProduct">Tên sản phẩm:</label> 
		<input type="text" id="nameProduct" name="nameProduct" value="${product.name}" required> 
		<label for="shop">Cửa hàng:</label> 
		<select id="idShop" name="idShop">
			<c:if test="${not empty shops}">
				<c:forEach var="shop" items="${shops}">
					<option value="${shop.id_shop}" 
                		<c:if test="${shop.id_shop == product.shop.id_shop}">selected</c:if>>
               				${shop.name}
            		</option>
				</c:forEach>
			</c:if>
		</select> 
		<label for="category">Danh mục:</label> 
		<select id="idCategory" name="idCategory">
			<c:if test="${not empty categories}">
				<c:forEach var="category" items="${categories}">
					<option value="${category.id_category}"
						<c:if test="${category.id_category == product.category.id_category}">selected</c:if>>
					${category.name}
					</option>
				</c:forEach>
			</c:if>
		</select> 
		<label for="price">Giá sản phẩm:</label> 
		<input type="text" id="price" name="price" pattern="^\d+(\.\d{1,2})?$" value = "${product.price}" required>

		<label for="quantity">Số lượng:</label> 
		<input type="number" id="quantity" name="quantity" value = "${product.quantity}" required> 
		<label for="statusProduct">Trạng thái sản phẩm:</label>
		<select id="statusProduct" name="statusProduct">
			<option value="true" 
				<c:if test="${product.status_product == true}">selected</c:if>
				>Hiển thị
				</option>
			<option value="false" 
				<c:if test="${product.status_product == false}">selected</c:if>
				>Ẩn
				</option>
		</select>

<!-- Combobox chọn màu -->
    	<label for="colorList">Chọn màu:</label>
    	<select id="colorList">
        	<option value="Đỏ">Đỏ</option>
        	<option value="Xanh">Xanh</option>
        	<option value="Vàng">Vàng</option>
       	 	<option value="Hồng">Hồng</option>
    	</select>

		<table id="colorTable">
			<thead>
				<tr>
					<th>Màu</th>
					<th>Hình ảnh</th>
					<th>Xóa</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach items="${product.productColors}" var="productColor">
						<tr>
							<td>${productColor.color}</td>
							<td>
								<img id="image_product_color" alt="Hình ảnh sản phẩm"
												src="${productColor.imageProduct}"> <br>
								<input type="file" name="images[]">
							</td>
							<td><button type="button">Xóa</button></td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
		
		<button type="button" id="addColorButton">Thêm màu</button>
		
		<button type="submit" id="btnUpdate">Cập nhật sản phẩm</button>
		
		<script>
    document.addEventListener("DOMContentLoaded", function () {
        const addColorButton = document.getElementById("addColorButton");
        const colorTable = document.getElementById("colorTable").querySelector("tbody");
        const colorList = document.getElementById("colorList");

        addColorButton.addEventListener("click", function () {
            const selectedColor = colorList.value;

            // Kiểm tra nếu màu đã được thêm trước đó
            const existingColors = Array.from(colorTable.querySelectorAll("tr td:first-child"));
            if (existingColors.some(cell => cell.textContent === selectedColor)) {
                alert("Màu này đã được thêm!");
                return;
            }

            // Tạo hàng mới
            const newRow = document.createElement("tr");

            // Cột màu
            const colorCell = document.createElement("td");
            colorCell.innerText = selectedColor;
            newRow.appendChild(colorCell);
            
            // Tạo input ẩn để lưu màu
            const colorInput = document.createElement("input");
            colorInput.type = "hidden";
            colorInput.name = "colors[]";
            colorInput.value = selectedColor;
            
            colorCell.appendChild(colorInput);
            newRow.appendChild(colorCell);

            // Cột hình ảnh
            const imageCell = document.createElement("td");
            const imageInput = document.createElement("input");
            imageInput.type = "file";
            imageInput.name = "images[]";
            imageCell.appendChild(imageInput);
            newRow.appendChild(imageCell);

            // Cột xóa
            const deleteCell = document.createElement("td");
            const deleteButton = document.createElement("button");
            deleteButton.type = "button";
            deleteButton.innerText = "Xóa";
            deleteButton.addEventListener("click", function () {
                colorTable.removeChild(newRow);
            });
            deleteCell.appendChild(deleteButton);
            newRow.appendChild(deleteCell);

            // Thêm hàng vào bảng
            colorTable.appendChild(newRow);
        });
    });
</script>
		
	</form>
	<div id="message">
		<c:if test="${not empty message}">
			<p>${message}</p>
		</c:if>
	</div>
</body>
</html>
