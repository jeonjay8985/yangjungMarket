<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 게시판 글 상세보기 -->
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<title>Board</title>
<script>
	function checkForm() {
		if(!document.newUpdate.name.value) {
			alert("성명을 입력하세요");
			return false;
		}
		if(!document.newUpdate.password.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(!document.newUpdate.subject.value) {
			alert("제목을 입력하세요");
			return false;
		}
		if(!document.newUpdate.content.value) {
			alert("내용을 입력하세요");
			return false;
		}
	}
	
	function check() {
		if(!document.newUpdate.password.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
	}
</script>
</head>

<body>
<jsp:include page="menu.jsp"/>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-center">
		<h1 class="display-6">게시판</h1>	
	</div>
	
	<div class="container">
		<div class="row" align="center">
		<%@ include file="dbconn.jsp" %>
	<%
		String sessionId = (String)session.getAttribute("sessionId"); 
		String sessionName = (String)session.getAttribute("sessionName");
		String num = request.getParameter("num");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int hit=0;
		String sql = "SELECT hit FROM board23 WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				hit=rs.getInt(1)+1;
			}else{
				hit=1;
			}
		sql = "update board23 set hit=? WHERE num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, hit);
		pstmt.setString(2, num);
		pstmt.executeUpdate();
		try{
			sql = "SELECT*FROM board23 WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String name = rs.getString("name");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				/*hit = rs.getInt("hit");*/
				//System.out.println("hit : "+hit);
	%>
	<div class="container">
		<form name="newUpdate" action="processUpdateBoard.jsp?num=<%=num%>" class="form-horizontal" method="post">
		<div class="form-group row">
			<label class="col-sm-2 control-label">성명</label>
			<div class="col-sm-3">
				<input name="name" class="form-control" value="<%=name%>">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2 control-label">비밀번호</label>
			<div class="col-sm-3">
				<input name="password" type="password" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-5">
				<input name="subject" class="form-control" value="<%=subject %>">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-8" style="word-break: break-all;">
				<textarea name="content" class="form-control" cols="50" rows="5"><%=content %></textarea>
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
			<a href="deleteBoard.jsp?num=<%=num %>" class="btn btn-danger" onclick="check()">삭제</a>
			<input type="submit" class="btn btn-success" value="수정">
			<a href="list.jsp" class="btn btn-primary"> 목록</a>
			</div>
		</div>
		
		</form>
	</div>
	
	<%
	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	%>
		<hr>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>