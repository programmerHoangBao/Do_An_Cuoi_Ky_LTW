<%@ include file="/common/taglib.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <style>
        /* CSS như bạn đã viết */
        .search-bar {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f5f5f5;
            display: flex;
            justify-content: space-around;
            align-items: center;
            z-index: 1000;
        }
        .product-container {
            margin-left: 15%;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }
        .product-item {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            text-align: center;
        }
        .product-image img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
        .product-detail {
            padding: 10px;
            font-family: Arial, sans-serif;
        }
        .product-name {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .product-price {
            color: #e74c3c;
            margin-bottom: 5px;
        }
        .product-shop {
            color: #7f8c8d;
            font-size: 14px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            padding: 10px 0;
        }
        .pagination a {
            width: 30px;
            height: 30px;
            margin: 0 5px;
            text-align: center;
            line-height: 30px;
            font-size: 14px;
            text-decoration: none;
            color: #333;
            border: 1px solid #ddd;
            border-radius: 3px;
            transition: background-color 0.2s, color 0.2s;
        }
        .pagination a.active {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
        .pagination a:hover {
            background-color: #f0f0f0;
            color: #000;
        }
        .pagination a.prev, .pagination a.next {
            width: auto;
            padding: 0 10px;
            font-size: 14px;
            line-height: 30px;
        }
        .sidebar {
            position: fixed;
            margin-top: 41px;
            width: 15%;
            background-color: #f5f5f5;
            border-right: 1px solid #ddd;

        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar: Danh mục sản phẩm -->
        <div class="sidebar">
            <h3>Danh mục sản phẩm</h3>
            <ul>
                <!-- Mục "Tất cả" để quay lại tìm tất cả sản phẩm -->
                <li>
                    <a href="/products?keyword=${keyword}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}">Tất cả</a>
                </li>
                <!-- Các mục danh mục sản phẩm -->
                <c:forEach var="category" items="${categories}">
                    <li>
                        <a href="/products?categoryId=${category.id_category}&keyword=${keyword}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}">${category.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <!-- Thanh tìm kiếm -->
        <form class="search-bar" method="GET" action="/products">
            <input type="hidden" name="categoryId" value="${categoryId}" />
            <input type="text" name="keyword" value="${keyword}" placeholder="Nhập từ khóa tìm kiếm" />
            <input type="number" name="minPrice" value="${minPrice}" placeholder="Giá thấp nhất" min="0" />
            <input type="number" name="maxPrice" value="${maxPrice}" placeholder="Giá cao nhất" min="0" />
            <select name="sortBy">
                <option value="priceAsc" ${sortBy == 'priceAsc' ? 'selected' : ''}>Giá tăng dần</option>
                <option value="priceDesc" ${sortBy == 'priceDesc' ? 'selected' : ''}>Giá giảm dần</option>
            </select>
            <button type="submit">Tìm kiếm</button>
        </form>

        <!-- Danh sách sản phẩm -->
        <div class="product-container">
            <c:choose>
                <c:when test="${empty products}">
                    <!-- Hiển thị thông báo nếu không có sản phẩm -->
                    <p>Không có sản phẩm nào phù hợp với tiêu chí tìm kiếm của bạn.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="product" items="${products}">
                        <a href="/product/${product.id_product}" class="product-link">
                            <div class="product-item">
                                <div class="product-image">
                                    <c:choose>
                                        <c:when test="${not empty product.productColors}">
                                            <img src="${product.productColors[0].imageProduct}" alt="${product.name}" />
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/templates/images/logo.png" alt="Default Image" />
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="product-detail">
                                    <div class="product-name">${product.name}</div>
                                    <div class="product-category">${product.category.name}</div>
                                    <div class="product-price">${product.price} VND</div>
                                    <div class="product-shop">${product.shop.name}</div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Phân trang -->
        <c:if test="${totalPages > 0}">
            <div class="pagination">
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage - 1}&keyword=${keyword}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}" class="prev">Previous</a>
                </c:if>

                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                    <a href="?page=${i}&keyword=${keyword}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}" class="${currentPage == i ? 'active' : ''}">${i + 1}</a>
                </c:forEach>

                <c:if test="${currentPage < totalPages - 1}">
                    <a href="?page=${currentPage + 1}&keyword=${keyword}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}" class="next">Next</a>
                </c:if>
            </div>
        </c:if>
    </div>
</body>
</html>
