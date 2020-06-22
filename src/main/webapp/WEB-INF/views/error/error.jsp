<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Page Error</title>
</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div align="center">
				<c:out value='${msg}'/>
			</div>
		</div>
	</div>
</body>
</html>