<%@ page contentType="text/html; charset=UTF-8"%>
<!--<!DOCTYPE html>  -->
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-left">
		<h1 class="display-6">상품 목록</h1>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String sql = "select*from product23";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
			%>
			<div class="col-md-3">
				<%=request.getContextPath() %>
				<img src="<%=request.getContextPath() %>/shoppingMall/upload/<%=rs.getString("fileName")%>" style="width:100%">  
			
				<h3><%=rs.getString("name") %></h3>
				<p><%=rs.getString("description") %>
				<p><%=rs.getString("unitPrice") %>
				<p><%=rs.getString("filename") %>
				<p><a href="product.jsp?id=<%=rs.getString("productId") %>" class="btn btn-secondary"
						role="button">상세정보&raquo;</a>
			</div>
			<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>