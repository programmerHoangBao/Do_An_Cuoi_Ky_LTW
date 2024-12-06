<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Top Shops</title>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Top 10 Shops by Revenue</h1>--%>

<%--<form action="/admin/top-shops" method="get">--%>
<%--    <label for="monthSelector">Month:</label>--%>
<%--    <select id="monthSelector" name="month">--%>
<%--        <option value="" ${selectedMonth == null ? 'selected' : ''}>-- Select Month --</option>--%>
<%--        <c:forEach var="i" begin="1" end="12">--%>
<%--            <option value="${i}" ${i == selectedMonth ? 'selected' : ''}>${i}</option>--%>
<%--        </c:forEach>--%>
<%--    </select>--%>

<%--    <label for="yearSelector">Year:</label>--%>
<%--    <select id="yearSelector" name="year">--%>
<%--        <option value="" ${selectedYear == null ? 'selected' : ''}>-- Select Year --</option>--%>
<%--        <c:forEach var="i" begin="2023" end="2024">--%>
<%--            <option value="${i}" ${i == selectedYear ? 'selected' : ''}>${i}</option>--%>
<%--        </c:forEach>--%>
<%--    </select>--%>

<%--    <button type="submit">Filter</button>--%>
<%--</form>--%>

<%--<canvas id="topShopsChart"></canvas>--%>

<%--<script>--%>
<%--    // Dữ liệu được lấy từ JSP--%>
<%--    const labels = [];--%>
<%--    const revenues = [];--%>

<%--    <c:forEach var="shop" items="${topShops}">--%>
<%--    labels.push("Shop ID: ${shop.id_shop}");--%>
<%--    revenues.push(${shop.totalRevenue});--%>
<%--    </c:forEach>--%>

<%--    const ctx = document.getElementById('topShopsChart').getContext('2d');--%>
<%--    new Chart(ctx, {--%>
<%--        type: 'bar',--%>
<%--        data: {--%>
<%--            labels: labels,--%>
<%--            datasets: [{--%>
<%--                label: 'Total Revenue',--%>
<%--                data: revenues,--%>
<%--                backgroundColor: 'rgba(75, 192, 192, 0.2)',--%>
<%--                borderColor: 'rgba(75, 192, 192, 1)',--%>
<%--                borderWidth: 1--%>
<%--            }]--%>
<%--        },--%>
<%--        options: {--%>
<%--            responsive: true,--%>
<%--            plugins: {--%>
<%--                legend: {--%>
<%--                    position: 'top',--%>
<%--                },--%>
<%--                title: {--%>
<%--                    display: true,--%>
<%--                    text: 'Top 10 Shops by Revenue'--%>
<%--                }--%>
<%--            },--%>
<%--            scales: {--%>
<%--                y: {--%>
<%--                    beginAtZero: true--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Shops</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<h1>Top 10 Shops by Revenue</h1>

<form action="/admin/top-shops" method="get">
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

<canvas id="topShopsChart"></canvas>

<script>
    // Dữ liệu được lấy từ JSP
    const labels = [];
    const revenues = [];

    <c:forEach var="shop" items="${topShops}">
    labels.push("${shop.shopName}"); // Tên shop
    revenues.push(${shop.totalRevenue});
    </c:forEach>

    const ctx = document.getElementById('topShopsChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Total Revenue',
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
                    text: 'Top 10 Shops by Revenue'
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

<%--<html>--%>
<%--<head>--%>
<%--    <title>Top 10 Shops by Revenue</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<h2>Top 10 Shops by Revenue</h2>--%>

<%--<form method="get" action="/admin/shops-revenue">--%>
<%--    <label for="timePeriod">Select Time Period: </label>--%>
<%--    <select name="timePeriod" id="timePeriod">--%>
<%--        <option value="month">This Month</option>--%>
<%--        <option value="year">This Year</option>--%>
<%--    </select>--%>
<%--    <button type="submit">Filter</button>--%>
<%--</form>--%>

<%--<table border="1">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>Shop Name</th>--%>
<%--        <th>Total Revenue</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="shop" items="${topShops}">--%>
<%--        <tr>--%>
<%--            <td>${shop.shopName}</td>--%>
<%--            <td>${shop.totalRevenue}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>

<%--</body>--%>
<%--</html>--%>