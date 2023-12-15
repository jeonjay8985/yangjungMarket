<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ include file="dbconn.jsp"%>
<!-- 상품 삭제하기 -->
<%
	request.setCharacterEncoding("UTF-8");
	String productId = request.getParameter("productId");
	
	PreparedStatement pstmt = null;
	String sql = "DELETE from product23 WHERE productId=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.executeUpdate();
	
	response.sendRedirect("resultProduct.jsp");
%>