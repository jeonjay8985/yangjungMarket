<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>

<body>
<%@include file="menu.jsp" %>  
	
	<%!String greeting = "쇼핑몰에 오신것을 환영합니다";
	String tagline ="Welcome to yangjung Market!";%>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-center"><%=greeting %></div>
	<div class="text-center">
	<h1><%=tagline %></h1>
	</div>
	
<%@include file="footer.jsp" %>
</body>
</html>