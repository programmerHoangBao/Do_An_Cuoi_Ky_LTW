<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Link CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/user/css/shopping-cart.css">
<script src="${pageContext.request.contextPath}/templates/user/js/shopping-cart.js"></script>

<h1>Giỏ hàng của bạn</h1>
<div class="shopping-cart-container">
    <!-- Phần Giỏ hàng -->
    <div class="shopping-cart-table">
        <table>
            <thead>
            <tr>
                <th>Hình ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá tiền</th>
                <th>Tổng tiền</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody id="cart-items-body">
            <!-- Lặp qua danh sách sản phẩm -->
            <c:forEach var="item" items="${cartItems}">
                <tr id="item-${item.productId}">
                    <td class="product-image">
                        <img src="${item.productImage}" alt="${item.productName}">
                    </td>
                    <td>${item.productName}</td>
                    <td>${item.shoppingCartQuantity}</td>
                    <td>${item.productPrice} VNĐ</td>
                    <td>${item.shoppingCartQuantity * item.productPrice} VNĐ</td>
                    <td>
                        <button class="delete-btn" onclick="deleteCartItem(${userId}, ${item.productId})">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- Phần Tổng tiền và thanh toán -->
    <div class="shopping-cart-summary">
        <h3>Tổng tiền: <span id="total-price">0 VNĐ</span></h3>
        <div class="checkout-container">
            <a href="${pageContext.request.contextPath}/user/order/${userId}" class="checkout-btn">
                Tiến hành thanh toán
            </a>
        </div>
    </div>


</div>
