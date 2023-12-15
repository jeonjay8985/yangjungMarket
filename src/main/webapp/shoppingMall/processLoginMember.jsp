<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	String PASS="";
	String NAME="";
	try{
		String sql="SELECT password, name FROM MEMBER23 WHERE ID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			PASS = rs.getString(1);
			NAME = rs.getString(2);
			if(password.equals(PASS)){
				session.setAttribute("sessionId", id);
				session.setAttribute("sessionName", NAME);
				response.sendRedirect("resultMember.jsp?msg=2");
			}else{
				response.sendRedirect("login.jsp?error=1");
			}
		}else{
			response.sendRedirect("login.jsp?error=1");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>


<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
-->