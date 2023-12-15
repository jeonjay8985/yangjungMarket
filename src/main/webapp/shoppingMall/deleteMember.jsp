<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
	String sessionId = (String)session.getAttribute("sessionId");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		String sql = "DELETE FROM MEMBER23 WHERE ID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sessionId);
		pstmt.executeUpdate();
		response.sendRedirect("resultMember.jsp"); //웹브라우저 헤더에 어느 페이지로 리다이렉트하라는 정보만 설정(입력)
	}catch(Exception e){
		e.printStackTrace();
	}
%>