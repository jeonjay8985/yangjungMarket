<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 장바구니 삭제 -->
<%@include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String productId = request.getParameter("productId");
	String sql = "DELETE FROM cart23 WHERE productId=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.executeUpdate();
		
	response.sendRedirect("cart.jsp");
%>