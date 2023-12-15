<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--업로드 할 파일 선택화면--%>
<body>
	<h3>입력폼, COS를 사용한 MultipartRequest 객체 사용</h3>
	<hr>
	<form action="resultProcess.jsp" method="post" enctype="multipart/form-data">
		이름: <input type="text" name="username"> <br>
		파일: <input type="file" name="myfile"> <br>
		<button>전송</button><br>
	</form>
</body>
</html>