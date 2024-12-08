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
<form method="GET" action="/vendor/myorder" style="margin-bottom: 20px;">
    <label for="status">Trạng thái:</label>
    <select id="status" name="status">
        <option value="">Tất cả</option>
        <option value="Chờ xác nhận" ${param.status == 'Chờ xác nhận' ? 'selected' : ''}>Chờ xác nhận</option>
        <option value="Đang giao hàng" ${param.status == 'Đang giao hàng' ? 'selected' : ''}>Đang giao hàng</option>
        <option value="Đã nhận" ${param.status == 'Đã nhận' ? 'selected' : ''}>Đã nhận</option>
        <option value="Chờ phản hồi" ${param.status == 'Chờ phản hồi' ? 'selected' : ''}>Chờ phản hồi</option>
        <option value="Đã trả hàng" ${param.status == 'Đã trả hàng' ? 'selected' : ''}>Đã trả hàng</option>
        <option value="Đã hủy" ${param.status == 'Đã hủy' ? 'selected' : ''}>Đã hủy</option> <!-- Thêm trạng thái "Đã hủy" -->
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
                    <c:if test="${order.statusOrder == 'Chờ xác nhận'}">
                        <form method="POST" action="/vendor/update-order-status">
                            <input type="hidden" name="orderId" value="${order.id_order}">
                            <button type="submit" name="action" value="Đang giao hàng" class="action-button">Giao hàng</button>
                            <button type="submit" name="action" value="Đã hủy" class="action-button">Hủy</button>
                        </form>
                    </c:if>
                    <c:if test="${order.statusOrder == 'Chờ phản hồi'}">
                        <form method="POST" action="/vendor/update-order-status">
                            <input type="hidden" name="orderId" value="${order.id_order}"> <!-- Only pass the ID -->
                            <button type="submit" name="action" value="Đã trả hàng" class="action-button">Xác nhận trả hàng</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
