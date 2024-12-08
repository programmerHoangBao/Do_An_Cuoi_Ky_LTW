<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Shops</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* CSS cho toàn trang */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            color: #333;
            font-size: 2rem;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Form */
        .form-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            align-items: center;
            margin-bottom: 30px;
        }

        label {
            font-size: 1rem;
            color: #333;
            font-weight: 600;
        }

        select, button {
            padding: 8px;
            font-size: 1rem;
            border-radius: 4px;
            border: 1px solid #ccc;
            outline: none;
            transition: border-color 0.3s;
        }

        select:focus, button:hover {
            border-color: #ec8493;
        }

        button {
            background-color: #ec8493;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Biểu đồ */
        canvas {
            max-width: 100%;
            height: auto;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<!-- Container chính chứa nội dung -->
<div class="container">
    <!-- Tiêu đề -->
    <h1>Revenue</h1>

    <!-- Form lọc -->
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/admin/view-detail-shop/revenue/${id}" method="get">
            <label for="editShopId"></label>
            <input type="text" id="editShopId" name="id_shop" value="${id}" disabled>

            <label for="editShopname"></label>
            <input type="text" id="editShopName" name="shopName" value="${shopName}" disabled>

            <label for="editShopRevenue"></label>
            <input type="text" id="editShopRevenue" name="shopRevenue" value="${shopRevenue}" disabled>

            <select id="daySelector" name="day">
                <option value="" ${selectedDay == null ? 'selected' : ''}>-- Select Day --</option>
                <c:forEach var="i" begin="1" end="31">
                    <option value="${i}" ${i == selectedDay ? 'selected' : ''}>${i}</option>
                </c:forEach>
            </select>


            <label for="monthSelector">Month:</label>
            <select id="monthSelector" name="month">
                <option value="" ${selectedMonth == null ? 'selected' : ''}>-- Select Month --</option>
                <c:forEach var="i" begin="1" end="12">
                    <option value="${i}" ${i == selectedMonth ? 'selected' : ''}>${i}</option>
                </c:forEach>
            </select>

            <label for="yearSelector">Year:</label>
            <select id="yearSelector" name="year">
                <option value="" ${selectedYear == null ? 'selected' : ''}>-- Select Year --</option>
                <c:forEach var="i" begin="2023" end="2024">
                    <option value="${i}" ${i == selectedYear ? 'selected' : ''}>${i}</option>
                </c:forEach>
            </select>

            <button type="submit">Filter</button>
        </form>
    </div>

    <!-- Biểu đồ cột -->
    <canvas id="topShopsChart"></canvas>
</div>

<script>
    // Lấy dữ liệu từ server (truyền từ Java Controller qua model)
    const labels = [<c:out value="${shopName}" />]; // Tên của shop
    const revenues = [<c:out value="${shopRevenue}" />]; // Tổng doanh thu

    const ctx = document.getElementById('topShopsChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Revenue',
                data: revenues,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Revenue Chart'
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>


</body>
</html>
