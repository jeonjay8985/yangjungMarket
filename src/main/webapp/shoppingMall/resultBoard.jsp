<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<!-- 게시판 Message 파일 -->
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<!-- js -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.7.0.min.js"></script>
<title>게시판 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<!-- <div class="jumbotron"> -->
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-center">
		<div class="container">
			<h1 class="display-6">게시판 정보</h1>
		</div>
	</div>
	
	<div class="container" align="center">
	
		<%
			String msg = request.getParameter("msg");
			if(msg != null) {
				if(msg.equals("0"))
					out.println("<h2 class='alert alert-danger'>게시판 정보가 수정되었습니다</h2>");
				else if(msg.equals("1"))
					out.println("<h2 class='alert alert-danger'>게시판 정보가 등록되었습니다</h2>");
				else if(msg.equals("3"))
					out.println("<h2 class='alert alert-danger'>비밀번호가 일치하지 않습니다</h2>");
			}else {
				out.println("<h2 class='alert alert-danger'>게시판 정보가 삭제되었습니다</h2>");
			}
		%>
	</div>
	
</body>
</html>