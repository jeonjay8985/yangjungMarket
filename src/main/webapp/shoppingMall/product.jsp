<%@ page contentType="text/html; charset=UTF-8"%>
<!-- <!DOCTYPE html> -->
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<title>상품 상세 정보</title>
<script>
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		}else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-left">
		<h1 class="display-6">상품 정보</h1>
	</div>

	<%@ include file="dbconn.jsp" %>
	<%
		String id = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs=null;
	try{
		String sql = "select*from product23 where productId=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
	
	%>
	<div class="container">
		<%=rs.getString(9) %>
	  <div class="row">
		<div class="col-md-5">
		<img src="<%=request.getContextPath() %>/shoppingMall/upload/<%=rs.getString(9) %>" style="width:100%">
		</div>
		<div class="col-md-6">
			<h3><%=rs.getString(2) %></h3>
			<p><%=rs.getString(4) %>
			<p><b>상품코드:</b><span class="badge badge-danger"><%=rs.getString(1) %></span>
			<p><b>제조사</b> <%=rs.getString(6) %>
			<p><b>분류</b> <%=rs.getString(5) %>
			<p><b>재고수</b> <%=rs.getString(7) %>
			
			<h4><%=rs.getString(3) %>원</h4>
			<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString(1)%>" method="post">
				<a href="#" class="btn btn-info" onclick="addToCart()">상품주문 &raquo;</a>
				<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
				<a href="./productList.jsp" class="btn btn-secondary">상품목록 &raquo;</a>
			</form>
			
		</div>
	  </div>
	<hr>
	</div>
	
	<%
	}
}catch(Exception e) {
	e.printStackTrace();
}
	%>
	<jsp:include page="footer.jsp"/>
</body>
</html>