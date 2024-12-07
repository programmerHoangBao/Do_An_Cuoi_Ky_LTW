<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<title>Followed Shops</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">

<div class="container">
    <h2 class="mt-5">Shops You Follow</h2>
    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th>Name</th>
                <th>Image</th>
                <th>Introduction</th>
                <th>Address</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="followShop" items="${followShops}">
                <tr>
                    <td>${followShop.shop.name}</td>
                    <td><img src="${followShop.shop.image}" alt="Shop Image" width="100" height="100"></td>
                    <td>${followShop.shop.introduce}</td>
                    <td>${followShop.shop.address}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>