<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String sessionId=(String)session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-3.7.1.min.js"></script> 
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container-fluid"><!-- fluid는 가로 해상도에 상관없이 100%의 width를 갖는다 -->
    		<div class="navbar-header">
      			<a class="navbar-brand" href="index.jsp">Home</a>
    		</div>
    		
		<div>
    		<ul class="navbar-nav mr-auto">
    		<% 
    			if(sessionId == null) {%>
    				<li class="nav-item">
    				<a class="nav-link" href="login.jsp">로그인</a>
  					</li>
  					<li class="nav-item">
    				<a class="nav-link" href="addMember.jsp">회원가입</a>
  					</li>
  				<%}else{%>
    				<li style="padding-top:7px; color:white">[<%=sessionId %>님 환영합니다]</li>
    				<li class="nav-item"><a class="nav-link" href="logout.jsp">로그아웃</a></li>
    				<li class="nav-item"><a class="nav-link" href="updateMember.jsp">회원 수정</a></li>
    			<%}
    		%>
    	
  				
  				<li class="nav-item">
    			<a class="nav-link" href="productList.jsp">상품목록</a>
  				</li>
  				<li class="nav-item">
    			<a class="nav-link" href="addProduct.jsp">상품등록</a>
  				</li>
  				<li class="nav-item">
    			<a class="nav-link" href="editProduct.jsp">상품수정</a>
  				</li>
  				<li class="nav-item">
    			<a class="nav-link" href="deleteProduct.jsp">상품삭제</a>
  				</li>
  				<li class="nav-item">
    			<a class="nav-link" href="list.jsp">게시판</a>
  				</li>
  			</ul>
		</div>
    	
      </div>
	</nav>
</body>
</html>