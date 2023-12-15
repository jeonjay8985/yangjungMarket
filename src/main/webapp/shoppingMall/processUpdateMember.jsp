<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("birthyy");
	String month = request.getParameterValues("birthmm")[0];
	String day = request.getParameter("birthdd");
	String birth = year+ "/" +month+ "/" +day;
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1+ "@" +mail2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	try{
		String sql = "UPDATE MEMBER23 SET PASSWORD=?, NAME=?, GENDER=?, BIRTH=?, MAIL=?, PHONE=?, ADDRESS=? WHERE ID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, password);
		pstmt.setString(2, name);
		pstmt.setString(3, gender);
		pstmt.setString(4, birth);
		pstmt.setString(5, mail);
		pstmt.setString(6, phone);
		pstmt.setString(7, address);
		pstmt.setString(8, id);
		pstmt.executeUpdate();
		response.sendRedirect("resultMember.jsp?msg=0");
	}catch(Exception e){
		e.printStackTrace();
	}
%>