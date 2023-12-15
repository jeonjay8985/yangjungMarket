<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<title>Login</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-center">
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="processLoginMember.jsp" method="post">
				<div class="mb-3 row">
					<label for="inputUserName" class="visually-hidden">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name="id">
				</div>
				<div class="mb-3 row">
					<label for="inputPassword" class="visually-hidden">User Name</label>
					<input type="password" class="form-control" placeholder="Password" name="password">
				</div>
					<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>	
	</div>
</body>
</html>