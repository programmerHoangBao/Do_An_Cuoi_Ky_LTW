<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    img {
        width: 100px; /* Giới hạn kích thước hình ảnh */
        height: auto;
    }
</style>

<h2>Products You've Viewed</h2>
<!-- Kiểm tra nếu có sản phẩm đã xem -->
<c:if test="${not empty productsViewed}">
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Price</th>
                <th>Shop Name</th>
                <th>Shop Address</th>
            </tr>
        </thead>
        <tbody>
            <!-- Lặp qua danh sách sản phẩm đã xem -->
            <c:forEach var="product" items="${productsViewed}">
                <tr>
                    <!-- Hiển thị tên sản phẩm -->
                    <td><a href="/product/${product.id_product}">${product.name}</a></td>

                    <!-- Hiển thị hình ảnh sản phẩm -->
                    <td><img src="${product.productColors[0].imageProduct}" alt="${product.name}"></td>

                    <!-- Hiển thị giá sản phẩm -->
                    <td>${product.price}</td>

                    <!-- Hiển thị tên shop -->
                    <td>${product.shop.name}</td>

                    <!-- Hiển thị địa chỉ shop -->
                    <td>${product.shop.address}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<!-- Nếu không có sản phẩm đã xem -->
<c:if test="${empty productsViewed}">
    <p>You haven't viewed any products yet.</p>
</c:if>
