<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop details</title>
<link rel="stylesheet" type="text/css"
	href="/templates/admin/css/shop-details-to-form-listProduct.css">
</head>
</head>
<body>
	<form id = "ShopDetails" action="/admin/shop-details?id=${shop.id_shop}" method = "get">
		<label for=nameShop>Tên: </label>
		<input type="text" id="nameShop" value="${shop.name}">
		<label for="vendorShop">Người đại diện: </label>
		<input type="text" id="vendorShop" value="${shop.vendor.fullName}">
		<label for="signUpDate">Ngày đăng ký</label>
		<p><fmt:formatDate value="${shop.signUpDate}" pattern="dd/MM/yyyy" /></p>
		<label for="address">Địa chỉ: </label>
		<input type="text" id="address" value="${shop.address}">
		<label for="introduce">Giới thiệu: </label>
		<input type="text" id="introduce" value="${shop.introduce}">
		<label for="image">Hình ảnh</label>
		<img id = "imageShopAdmin" src="${shop.image}" alt="Shop Image">
	</form>
</body>
</html>