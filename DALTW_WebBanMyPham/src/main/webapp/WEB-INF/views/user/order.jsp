<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- Link CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/user/css/order.css">

<h1>Thanh toán đơn hàng</h1>

<form action="${pageContext.request.contextPath}/user/confirm-order?userId=${userId}" method="post">
    <!-- Chọn địa chỉ giao hàng, lấy từ session -->
    <div class="form-group">
        <label for="shipping-address">Địa chỉ giao hàng:</label>
        <textarea id="shipping-address" name="shippingAddress" rows="4" required>${sessionScope.user.address}</textarea>
    </div>

    <!-- Chọn phương thức thanh toán -->
    <div class="form-group">
        <label for="payment-method">Phương thức thanh toán:</label><br>
        <input type="radio" id="cod" name="paymentMethod" value="COD" checked onclick="togglePaymentMethod()">
        <label for="cod" class="payment-label">COD (Thanh toán khi nhận hàng)</label>
        <br>
        <input type="radio" id="momo" name="paymentMethod" value="MOMO" onclick="togglePaymentMethod()">
        <label for="momo" class="payment-label">Chuyển khoản qua MOMO</label>
    </div>

    <!-- Khung thông tin chuyển khoản MOMO (ẩn mặc định) -->
    <div id="momo-details" class="payment-details" style="display:none;">
        <h3>Thông tin chuyển khoản MOMO:</h3>
        <p><strong>Ngân hàng:</strong> MOMO</p>
        <p><strong>Tên tài khoản:</strong> ONESHOP</p>
        <p><strong>Số tài khoản:</strong> 0333333333</p>
        <p><strong>QR Code chuyển khoản:</strong></p>
        <img src="${pageContext.request.contextPath}/templates/images/QR-momo.png" alt="QR Code MOMO" />
    </div>

    <!-- Hiển thị tổng tiền -->
    <div class="form-group">
        <h3>Tổng tiền: <span id="total-price">${totalPrice} VNĐ</span></h3>
    </div>

    <!-- Danh sách sản phẩm -->
    <div class="order-items">
        <h3>Danh sách sản phẩm trong đơn hàng</h3>
        <table>
            <thead>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.shoppingCartQuantity}</td>
                        <td>${item.productPrice} VNĐ</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Nút thanh toán -->
    <div class="form-group">
        <button type="submit" class="btn-pay">Thanh toán</button>
    </div>
</form>

<script>
    // Hàm xử lý hiển thị thông tin chuyển khoản MOMO khi chọn phương thức thanh toán MOMO
    function togglePaymentMethod() {
        var momoDetails = document.getElementById("momo-details");
        var paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;

        if (paymentMethod === "MOMO") {
            momoDetails.style.display = "block"; // Hiển thị thông tin MOMO
        } else {
            momoDetails.style.display = "none"; // Ẩn thông tin MOMO
        }
    }

    // Gọi hàm để hiển thị đúng trạng thái ban đầu
    togglePaymentMethod();
</script>
