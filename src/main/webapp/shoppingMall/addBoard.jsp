<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 게시판 글쓰기 -->
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<!-- js -->
<script src="js/bootstrap.min.js"></script>
<script src="js/query-3.7.0.min.js"></script>
<script>
	function checkForm() {
		if(!document.newWrite.name.value) {
			alert("성명을 입력하세요");
			return false;
		}
		if(!document.newWrite.password.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(!document.newWrite.subject.value) {
			alert("제목을 입력하세요");
			return false;
		}
		if(!document.newWrite.content.value) {
			alert("내용을 입력하세요");
			return false;
		}
	}
</script>
</head>

<body>
	<%@ include file="menu.jsp" %>
	<%
		sessionId = (String)session.getAttribute("sessionId");
		String sessionName = (String)session.getAttribute("sessionName");
		if(sessionId == null) {
		 	%>
		 	<script>
		 		alert("먼저 로그인 하세요");
		 		history.back(-1);
		 	</script>
		 	<%			
		}
	%>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-center">
		<h1 class="display-6">게시판</h1>
	</div>
	
	<div class="container">
		<form name="newMember" class="form-horizontal" action="processAddBoard.jsp" method="post" onsubmit="return checkForm()">
			<input name="id" type="hidden" class="form-control" value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2 control-labe">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=sessionName%>" placeholder="name">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control label">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control" placeholder="name"> <!-- placeholder="password"아님? -->
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control" placeholder="subject">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control" placeholder="content"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="reset" class="btn btn-primary" value="취소">
				</div>
			</div>
		</form>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>