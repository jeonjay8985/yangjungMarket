<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 상품 수정하기 -->
<html>
<head>

<title>장바구니</title>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-left">
		<h1 class="display-6">상품 목록</h1>
	</div>
	
<div class="container">
<div style="padding-top: 10px;">
<table class="table table-hover" style="width: 100%;">
	<tr>
		<th>상품ID</th>
		<th>상품명</th>
		<th>단가</th>
		<th>상세정보</th>
		<th>분류</th>
		<th>제조사</th>
		<th>재고</th>
		<th>관리</th>
	</tr>

<%@ include file = "dbconn.jsp" %>
<%

	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * from product23";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()) {
		String productId = rs.getString(1);
		String name = rs.getString(2);
		int price = rs.getInt(3);
		String description = rs.getString(4);
		String category = rs.getString(5);
		String manufacturer = rs.getString(6);
		int unitsInstock = rs.getInt(7);
%>
	<tr>
		<td><%=productId %></td>
		<td><%=name %></td>
		<td><%=price %></td>
		<td><%=description %></td>
		<td><%=category %></td>
		<td><%=manufacturer %></td>
		<td><%=unitsInstock %></td>
		<td><a href="updateProduct.jsp?productId=<%=productId %>" class="btn btn-primary" style="height:30px; font-size:0.7em;">수정</a></td>
		<!-- <input type="button" class="btn btn-primary" value="상품 등록" onclick="CheckAddProduct()"> -->
	</tr>
	
	<%
		}
	%>
</table> <!-- <table class="table table-hover" style="width: 100%;"> -->

</div> <!-- <div style="padding-top: 10px;"> -->

</div> <!-- <div class="container"> -->
</body>
</html>