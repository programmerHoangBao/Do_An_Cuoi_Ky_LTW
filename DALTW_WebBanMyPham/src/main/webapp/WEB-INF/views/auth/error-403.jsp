<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 Forbidden</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .error-container {
            text-align: center;
        }
        .error-container h1 {
            font-size: 6em;
            color: #dc3545;
            margin: 0;
        }
        .error-container h2 {
            font-size: 2em;
            margin: 0.5em 0;
        }
        .error-container p {
            font-size: 1.2em;
            color: #666;
        }
        .error-container a {
            display: inline-block;
            margin-top: 1em;
            padding: 0.75em 1.5em;
            font-size: 1em;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
        }
        .error-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>403</h1>
    <h2>Access Denied / Forbidden</h2>
    <p>You don't have permission to access this page or resource.</p>
    <a href="${pageContext.request.contextPath}/">Go Back to Home</a>
</div>
</body>
</html>
