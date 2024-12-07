<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--  <title>Doanh thu</title>--%>
<%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container mt-5">--%>
<%--  <h3>Biểu đồ doanh thu</h3>--%>

<%--  <!-- Form chọn kiểu doanh thu -->--%>
<%--  <form method="get" action="/vendor/revenue" class="mb-3">--%>
<%--    <!-- Combobox chọn ngày/tháng/năm -->--%>
<%--    <select name="type" class="form-select mb-3" id="typeSelect" onchange="updateInputs()">--%>
<%--      <option value="day" ${type == 'day' ? 'selected' : ''}>Doanh thu theo ngày</option>--%>
<%--      <option value="month" ${type == 'month' ? 'selected' : ''}>Doanh thu theo tháng</option>--%>
<%--      <option value="year" ${type == 'year' ? 'selected' : ''}>Doanh thu theo năm</option>--%>
<%--    </select>--%>

<%--    <!-- Thêm ô nhập liệu cho ngày/tháng/năm -->--%>
<%--    <div id="inputGroup" class="mb-3"></div>--%>

<%--    <button type="submit" class="btn btn-primary">Xem doanh thu</button>--%>
<%--  </form>--%>

<%--  <!-- Biểu đồ doanh thu -->--%>
<%--  <canvas id="revenueChart"></canvas>--%>
<%--</div>--%>

<%--<script>--%>
<%--  const labels = ${labels}; // Dữ liệu từ model--%>
<%--  const totals = ${totals}; // Dữ liệu từ model--%>

<%--  const ctx = document.getElementById('revenueChart').getContext('2d');--%>
<%--  new Chart(ctx, {--%>
<%--    type: 'bar',--%>
<%--    data: {--%>
<%--      labels: labels,--%>
<%--      datasets: [{--%>
<%--        label: 'Doanh thu',--%>
<%--        data: totals,--%>
<%--        backgroundColor: 'rgba(75, 192, 192, 0.2)',--%>
<%--        borderColor: 'rgba(75, 192, 192, 1)',--%>
<%--        borderWidth: 1--%>
<%--      }]--%>
<%--    },--%>
<%--    options: {--%>
<%--      responsive: true,--%>
<%--      scales: {--%>
<%--        y: { beginAtZero: true }--%>
<%--      }--%>
<%--    }--%>
<%--  });--%>

<%--  // Cập nhật các ô nhập liệu tùy theo loại doanh thu--%>
<%--  function updateInputs() {--%>
<%--    const type = document.getElementById('typeSelect').value;--%>
<%--    const inputGroup = document.getElementById('inputGroup');--%>
<%--    inputGroup.innerHTML = '';--%>

<%--    if (type === 'day') {--%>
<%--      inputGroup.innerHTML = `--%>
<%--                <label for="dayInput">Chọn ngày:</label>--%>
<%--                <input type="number" name="day" id="dayInput" class="form-control" min="1" max="31">--%>
<%--            `;--%>
<%--    } else if (type === 'month') {--%>
<%--      inputGroup.innerHTML = `--%>
<%--                <label for="monthInput">Chọn tháng:</label>--%>
<%--                <input type="number" name="month" id="monthInput" class="form-control" min="1" max="12">--%>
<%--            `;--%>
<%--    } else if (type === 'year') {--%>
<%--      inputGroup.innerHTML = `--%>
<%--                <label for="yearInput">Chọn năm:</label>--%>
<%--                <input type="number" name="year" id="yearInput" class="form-control" min="2000" max="2100">--%>
<%--            `;--%>
<%--    }--%>
<%--  }--%>

<%--  // Gọi hàm cập nhật input khi trang được tải--%>
<%--  updateInputs();--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Doanh thu</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    /* Tối ưu giao diện với màu sắc và hiệu ứng */
    body {
      background-color: #f4f4f9;
      font-family: 'Arial', sans-serif;
    }

    .container {
      max-width: 800px;
      padding: 30px;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h3 {
      color: #333;
      text-align: center;
      margin-bottom: 30px;
    }

    /* Nút "Xem doanh thu" */
    .btn-custom {
      background-color: #ec8493 !important;
      color: white !important;
      border-radius: 5px;
      padding: 8px 15px;
      font-size: 0.875rem;
      width: 100%;
      transition: background-color 0.3s ease;
    }

    .btn-custom:hover {
      background-color: #d27381 !important;
    }

    .btn-custom:focus {
      outline: none;
      box-shadow: 0 0 5px rgba(236, 132, 147, 0.8);
    }

    /* Cải thiện các ô nhập liệu với kích thước gọn */
    .form-select, .form-control {
      border-radius: 5px;
      font-size: 0.875rem; /* Giảm kích thước font */
      padding: 8px 10px; /* Giảm padding */
      margin-bottom: 15px; /* Giảm khoảng cách */
      border: 1px solid #ddd;
      transition: border-color 0.3s ease;
    }

    .form-select:focus, .form-control:focus {
      border-color: #ec8493;
      box-shadow: 0 0 5px rgba(236, 132, 147, 0.8);
    }
    /* Biểu đồ */
    canvas {
      margin-top: 30px;
      height: 400px; /* Tăng chiều cao của biểu đồ */
    }

    /* Các hiệu ứng hover cho input */
    label {
      font-size: 0.75rem; /* Giảm kích thước font label */
      font-weight: 600;
      margin-bottom: 5px;
      display: block;
      color: #555;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h3>Biểu đồ doanh thu</h3>

  <!-- Form chọn kiểu doanh thu -->
  <form method="get" action="/vendor/revenue" class="mb-3">
    <!-- Combobox chọn ngày/tháng/năm -->
    <select name="type" class="form-select mb-3" id="typeSelect" onchange="updateInputs()">
      <option value="day" ${type == 'day' ? 'selected' : ''}>Doanh thu theo ngày</option>
      <option value="month" ${type == 'month' ? 'selected' : ''}>Doanh thu theo tháng</option>
      <option value="year" ${type == 'year' ? 'selected' : ''}>Doanh thu theo năm</option>
    </select>

    <!-- Thêm ô nhập liệu cho ngày/tháng/năm -->
    <div id="inputGroup" class="mb-3"></div>

    <!-- Thêm class 'btn-custom' cho nút để thay đổi màu -->
    <button type="submit" class="btn btn-custom">Xem doanh thu</button>
  </form>

  <!-- Biểu đồ doanh thu -->
  <canvas id="revenueChart"></canvas>
</div>

<script>
  const labels = ${labels}; // Dữ liệu từ model
  const totals = ${totals}; // Dữ liệu từ model

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

  // Cập nhật các ô nhập liệu tùy theo loại doanh thu
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

  // Gọi hàm cập nhật input khi trang được tải
  updateInputs();
</script>
</body>
</html>
