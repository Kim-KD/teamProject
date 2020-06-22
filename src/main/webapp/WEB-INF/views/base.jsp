<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
	<tiles:insertAttribute name="header"/>
<html>
<body>
	<tiles:insertAttribute name="topNav"/>
        <tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
</body>
</html>