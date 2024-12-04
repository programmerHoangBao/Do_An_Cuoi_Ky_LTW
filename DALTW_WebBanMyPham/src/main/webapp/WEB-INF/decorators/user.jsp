<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cosmetics</title>
    <sitemesh:write property="head" />
    <!-- Boxicons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/boxicons/css/boxicons.min.css" rel="stylesheet">
</head>
<header>
    <div>
        <%@include file="/common/user/header.jsp"%>
    </div>
</header>
<html>

	<main>
		<div class="container">
			<sitemesh:write property='body'></sitemesh:write>
		</div>
	</main>

</html>
<footer>
    <div>
        <%@include file="/common/admin/footer.jsp"%>
    </div>
</footer>
</html>