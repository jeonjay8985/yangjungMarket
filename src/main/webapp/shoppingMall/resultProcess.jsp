<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>결과페이지(파일업로드)</h3>
<%
	String saveDir= "C:\\work202301\\yangjungMarket\\src\\main\\webapp\\shoppingMall\\upload";
	int maxSize= 5*1024*1024; //업로드 될 파일 크기제한, 단위 byte
	MultipartRequest mreq= new MultipartRequest(request, saveDir, maxSize,"utf-8", new DefaultFileRenamePolicy());
    //MultipartRequest호출 == 파일업로드!
    out.print("파일업로드 성공");
    String name = mreq.getParameter("username");
%>
	<br>
	이름: <%=name %> <br>
	원본파일명: <%=mreq.getOriginalFileName("myfile") %>
	저장파일명: <%=mreq.getFilesystemName("myfile") %>

</body>
</html>