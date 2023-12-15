<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%
	String num = request.getParameter("num");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		String sql = "DELETE from board23 WHERE num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		pstmt.executeUpdate();
		response.sendRedirect("resultBoard.jsp");
	}catch(Exception e) {
		e.printStackTrace();
	}

%>