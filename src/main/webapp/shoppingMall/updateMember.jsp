<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! String month=""; %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
<%@ include file = "dbconn.jsp" %>
<%
	try{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT*FROM MEMBER23 WHERE ID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sessionId);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String password= rs.getString("password");
			String name= rs.getString("name");
			String gender= rs.getString("gender");
			String Birth= rs.getString("Birth");
			String mail= rs.getString("mail");
			String phone= rs.getString("phone");
			String address= rs.getString("address");
			System.out.println("gender : " +gender);
			String mail1= mail.split("@")[0];
			String mail2= mail.split("@")[1];
			System.out.println("mail2 : " +mail2);
			String year= Birth.split("/")[0];
				   month= Birth.split("/")[1];
		    String day= Birth.split("/")[2];
%>
<title>회원 수정</title>
</head>
<body onload="init()">
	<jsp:include page="menu.jsp"/>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-center">
		<h1 class="display-6">회원수정</h1>
	</div>
	
	<div class="container">
		<form name="newMember" class="form-horizontal"
		      action="processUpdateMember.jsp" method="post"
		      onsubmit="return checkForm()">
		      
		        <div class="row mb-2">
	 				<label class="col-sm-2 col-form-label">아이디</label>
	 				<div class="col-sm-3">
	 					<input name="id" type="text" class="form-control" placeholder="id" value="<%=sessionId %>">
	 				</div>
	 		    </div>
	 			
	 			<div class="row mb-2">
	 				<label class="col-sm-2 col-form-label">비밀번호</label>
	 				<div class="col-sm-3">
	 					<input name="password" type="password" class="form-control" placeholder="password" value="<%=password %>">
	 				</div>
	 			</div>
	 			<div class="row mb-2">
	 				<label class="col-sm-2 col-form-label">비밀번호 확인</label>
	 				<div class="col-sm-3">
	 					<input name="password_confirm" type="password" class="form-control" placeholder="password confirm">
	 				</div>
	 			</div>
	 			
	 			<div class="row mb-2">
	 				<label class="col-sm-2 col-form-label">성명</label>
	 				<div class="col-sm-3">
	 					<input name="name" type="text" class="form-control" placeholder="name" value="<%=name %>">
	 				</div>
	 			</div>
	 			
	 			<div class="row mb-2">
	 				<label class="col-sm-2 col-form-label">성별</label>
	 				<div class="col-sm-10">
	 					<input name="gender" type="radio" value="남" <%= gender.equals("남") ? "checked" : "" %>>남
	 					<input name="gender" type="radio" value="여" <%= gender.equals("여") ? "checked" : "" %>>여
	 				</div>
	 			</div>
	 			
	 			<div class="row mb-2">
	 				<label class="col-sm-2 col-form-label">생일</label>
	 				<div class="col-sm-4">
	 					<input name="birthyy" type="text" maxlength="4" placeholder="년(4자)" size="6" value="<%=year %>">
	 					<select name="birthmm">
	 						<option value="">월</option>
	 						<option value="01" <%if(month.equals("01")) {%>selected<%} %>>01</option>
	 						<option value="02"<%if(month.equals("02")) {%>selected<%} %>>02</option>
	 						<option value="03"<%if(month.equals("03")) {%>selected<%} %>>03</option>
	 						<option value="04"<%if(month.equals("04")) {%>selected<%} %>>04</option>
	 						<option value="05"<%if(month.equals("05")) {%>selected<%} %>>05</option>
	 						<option value="06"<%if(month.equals("06")) {%>selected<%} %>>06</option>
	 						<option value="07"<%if(month.equals("07")) {%>selected<%} %>>07</option>
	 						<option value="08"<%if(month.equals("08")) {%>selected<%} %>>08</option>
	 						<option value="09"<%if(month.equals("09")) {%>selected<%} %>>09</option>
	 						<option value="10"<%if(month.equals("10")) {%>selected<%} %>>10</option>
	 						<option value="11"<%if(month.equals("11")) {%>selected<%} %>>11</option>
	 						<option value="12"<%if(month.equals("12")) {%>selected<%} %>>12</option>
	 					</select>
	 					<input name="birthdd" type="text" maxlength="2" placeholder="일" size="4" value="<%=day %>">
	 				</div>
	 			</div>
	 			
	 			<div class="form-group row">
	 				<label class="col-sm-2 col-form-label">이메일</label>
	 				<div class="col-sm-10">
	 					<input name="mail1" type="text" maxlength="50" value="<%=mail1 %>">@
	 					<select name="mail2">
	 						<option value="naver.com" <%if(mail2.equals("naver.com")) {%>selected<%} %>>naver.com</option>
	 						<option value="daum.net" <%if(mail2.equals("daum.net")) {%>selected<%} %>>daum.net</option>
	 						<option value="gmail.com" <%if(mail2.equals("gmail.com")) {%>selected<%} %>>gmail.com</option>
	 						<option value="nate.com" <%if(mail2.equals("nate.com")) {%>selected<%} %>>nate.com</option>
	 					</select>
	 				</div>
	 			</div>
	 			
	 			<div class="row mb-2">
	 				<label class="col-sm-2 col-form-label">전화번호</label>
	 				<div class="col-sm-3">
	 					<input name="phone" type="text" class="form-control" placeholder="phone" value="<%=phone %>">
	 				</div>
	 			</div>
	 			
	 			<div class="row mb-2">
	 				<label class="col-sm-2 col-form-label">주소</label>
	 				<div class="col-sm-5">
	 					<input name="address" type="text" class="form-control" placeholder="address" value="<%=address %>">
	 				</div>
	 			</div>
	 			
	 			<div class="form-group row">
	 				<div class="col-sm-offset-2 col-sm-10">
	 					<input type="submit" class="btn btn-primary" value="회원수정">
	 					<a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
	 				</div>
	 			</div>
 		
			<%
		}//if문의 끝
	}catch(Exception e){
		e.printStackTrace();
	}
%>

		</form>
	</div>

</body>
</html>
<script>
	function checkForm() {
		if(!document.newMember.id.value) {
			alert("아이디를 입력하세요");
			return false;
		}
		if(!document.newMember.password.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(document.newMember.password.value != document.newMember.password_confirm.value){
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
	}
</script>