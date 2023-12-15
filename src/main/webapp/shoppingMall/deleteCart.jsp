<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<!-- 장바구니 비우기 -->
<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "DELETE from cart23";
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
	response.sendRedirect("cart.jsp");
		
%>