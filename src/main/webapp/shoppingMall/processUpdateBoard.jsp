<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	try{
		String sql="select password from board23 where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String PASS = rs.getString(1);
			if(password.equals(PASS)) {
				sql="UPDATE board23 SET name=?, subject=?, content=? where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setString(4, num);
				pstmt.executeUpdate();
				response.sendRedirect("resultBoard.jsp?msg=0");
			}else {
				response.sendRedirect("resultBoard.jsp?msg=3");
			}
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
%>