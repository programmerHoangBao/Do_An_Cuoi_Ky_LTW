<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cosmetics</title>
</head>
<body>
	<header>
		<div>
			<%@include file="/common/saler/header.jsp"%>
		</div>
	</header>

	<main>
		<div>
			<sitemesh:write property='body'></sitemesh:write>
		</div>
	</main>

	<footer>
		<div>
			<%@include file="/common/saler/footer.jsp"%>
		</div>
	</footer>
</body>
</html>