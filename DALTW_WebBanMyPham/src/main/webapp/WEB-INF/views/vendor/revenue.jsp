<%--
  Created by IntelliJ IDEA.
  User: GIANG
  Date: 12/5/2024
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Doanh thu</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container mt-5">
  <h3>Biểu đồ doanh thu</h3>
  <form method="get" action="/revenue" class="mb-3">
    <!-- Chọn loại doanh thu -->
    <select name="type" class="form-select mb-3" id="typeSelect" onchange="updateInputs()">
      <option value="day" ${type == 'day' ? 'selected' : ''}>Doanh thu theo ngày</option>
      <option value="month" ${type == 'month' ? 'selected' : ''}>Doanh thu theo tháng</option>
      <option value="year" ${type == 'year' ? 'selected' : ''}>Doanh thu theo năm</option>
    </select>

    <!-- Chọn ngày/tháng/năm -->
    <div id="inputGroup" class="mb-3"></div>

    <button type="submit" class="btn btn-primary">Xem doanh thu</button>
  </form>

  <canvas id="revenueChart"></canvas>
</div>

<script>
  const labels = ${labels};
  const totals = ${totals};

  const ctx = document.getElementById('revenueChart').getContext('2d');
  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: labels,
      datasets: [{
        label: 'Doanh thu',
        data: totals,
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      scales: {
        y: { beginAtZero: true }
      }
    }
  });

  // Hiển thị ô nhập liệu dựa vào loại
  function updateInputs() {
    const type = document.getElementById('typeSelect').value;
    const inputGroup = document.getElementById('inputGroup');
    inputGroup.innerHTML = '';

    if (type === 'day') {
      inputGroup.innerHTML = `
                <label for="dayInput">Chọn ngày:</label>
                <input type="number" name="day" id="dayInput" class="form-control" min="1" max="31">
            `;
    } else if (type === 'month') {
      inputGroup.innerHTML = `
                <label for="monthInput">Chọn tháng:</label>
                <input type="number" name="month" id="monthInput" class="form-control" min="1" max="12">
            `;
    } else if (type === 'year') {
      inputGroup.innerHTML = `
                <label for="yearInput">Chọn năm:</label>
                <input type="number" name="year" id="yearInput" class="form-control" min="2000" max="2100">
            `;
    }
  }

  // Gọi hàm cập nhật input ban đầu
  updateInputs();
</script>
</body>
</html>
