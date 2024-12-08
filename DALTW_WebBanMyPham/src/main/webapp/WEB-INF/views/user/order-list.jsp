<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn hàng</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f5f5f5;
        }
        .message {
            color: red;
            font-weight: bold;
            margin: 20px 0;
        }
        .action-button {
            padding: 5px 10px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        .action-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Danh sách đơn hàng</h1>

<c:if test="${not empty message}">
    <div class="message">${message}</div>
</c:if>
<form method="GET" action="/user/orders" style="margin-bottom: 20px;">
    <label for="status">Trạng thái:</label>
    <select id="status" name="status">
        <option value="">Tất cả</option>
        <option value="Chờ xác nhận" ${param.status == 'Chờ xác nhận' ? 'selected' : ''}>Chờ xác nhận</option>
        <option value="Đang giao hàng" ${param.status == 'Đang giao hàng' ? 'selected' : ''}>Đang giao hàng</option>
        <option value="Đã nhận hàng" ${param.status == 'Đã nhận hàng' ? 'selected' : ''}>Đã nhận hàng</option>
        <option value="Chờ phản hồi" ${param.status == 'Chờ phản hồi' ? 'selected' : ''}>Chờ phản hồi</option>
        <option value="Đã trả hàng" ${param.status == 'Đã trả hàng' ? 'selected' : ''}>Đã trả hàng</option>
    </select>

    <label for="sort">Sắp xếp:</label>
    <select id="sort" name="sort">
        <option value="newest" ${param.sort == 'newest' ? 'selected' : ''}>Mới nhất</option>
        <option value="oldest" ${param.sort == 'oldest' ? 'selected' : ''}>Cũ nhất</option>
    </select>

    <button type="submit" class="action-button">Tìm kiếm</button>
</form>
<c:if test="${not empty orders}">
    <table>
        <thead>
        <tr>
            <th>Mã đơn hàng</th>
            <th>Sản phẩm</th>
            <th>Màu sắc</th>
            <th>Số lượng</th>
            <th>Ngày tạo</th>
            <th>Trạng thái</th>
            <th>Tổng tiền</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.id_order}</td>
                <td>${order.product.name}</td>
                <td>${order.productColor.color}</td>
                <td>${order.quantity}</td>
                <td><fmt:formatDate value="${order.creationTime}" pattern="dd-MM-yyyy HH:mm:ss"/></td>
                <td>${order.statusOrder}</td>
                <td>${order.total} VND</td>
                <td>
                    <!-- Nút Xác nhận khi trạng thái là Đang giao hàng -->
                    <c:if test="${order.statusOrder == 'Đang giao hàng'}">
                        <form method="POST" action="/user/orders/confirm-status">
                            <input type="hidden" name="orderId" value="${order.id_order}">
                            <button type="submit" class="action-button">Xác nhận</button>
                        </form>
                    </c:if>
                    <!-- Nút Trả hàng khi trạng thái là Đã nhận hàng và thời gian dưới 30 ngày -->
                    <c:if test="${order.statusOrder == 'Đã nhận hàng'}">
                        <c:set var="currentDate" value="<%= new java.util.Date() %>" />
                        <fmt:parseDate value="${order.creationTime}" var="creationDate" pattern="yyyy-MM-dd HH:mm:ss" />
                        <c:if test="${(currentDate.time - creationDate.time) / (1000 * 60 * 60 * 24) <= 30}">
                            <form method="POST" action="/user/orders/return-status">
                                <input type="hidden" name="orderId" value="${order.id_order}">
                                <button type="submit" class="action-button">Trả hàng</button>
                            </form>
                        </c:if>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
