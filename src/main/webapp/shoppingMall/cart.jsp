<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 장바구니 만들기 -->
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<title>장바구니</title>
</head>
<body>
<%@include file="menu.jsp" %>
<div class="jumbotron">
<!-- <div class="container">   -->
<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-left">
	<h1 class="display-6">장바구니</h1>
</div>
</div>

<div class="container">
<div class="row">
	<table width="100%">
		<tr>
			<td align="left"><a href="./deleteCart.jsp" class="btn btn-danger"
					onclick="if(!confirm('정말로 장바구니를 비우시겠습니까?')) return false;">삭제</a></td>
			<td align="right"><a href="./shippingInfo.jsp"
					class="btn btn-success">주문하기</a></td>
		</tr>
	</table>
</div>

	<div style="padding-top: 50px">
	<table class="table table-hover">
		<tr>
			<th>상품</th>
			<th>가격</th>
			<th>수량</th>
			<th>소계</th>
			<th>비고</th>
		</tr>
	
<%@include file="dbconn.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Integer price = 0;
	Integer Qty = 0;
	Integer total = 0;
	Integer sum = 0;
	String productId = "";
	String name = "";
	int cart_id = 0;
	String sql = "select c.productId, p.name, c.unitprice, sum(c.Qty) FROM cart23 c, product23 p where c.productId = p.productId group by c.productId, p.name, c.unitprice";

	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
		productId = rs.getString(1);
		name = rs.getString(2);
		price = rs.getInt(3);
		Qty = rs.getInt(4);
		
		total = Qty * price;
		sum = sum + total;
%>
	<tr>
		<td><%=productId %> - <%=name %></td>
		<td><%=price %></td>
		<td><%=Qty %></td>
		<td><%=total %></td>
		<td><a href="removeCart.jsp?productId=<%=productId %>" class="btn btn-danger">삭제</a></td>
	</tr>
	
	<%
		}
	%>
	
	<tr>
		<th></th>
		<th></th>
		<th>총액</th>
		<th><%=sum %></th>
		<th></th>
	</tr>
	
	</table>
	<a href="./productlist.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
	
	</div>
<hr>
</div>

<%@include file="footer.jsp" %>
</body>
</html>