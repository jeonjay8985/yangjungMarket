<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.net.URLEncoder" %>
<!-- 주문하기(배송정보) -->
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<title>주문 정보</title>
</head>

<body>
	<jsp:include page="menu.jsp"/>
<%
	request.setCharacterEncoding("utf-8");
	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate",URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
	
	cartId.setMaxAge(365 * 24 * 60 * 60);
	response.addCookie(cartId);
	response.addCookie(shippingDate);
	
	String name = request.getParameter("name");
	String zipCode = request.getParameter("zipCode");
	String addressName = request.getParameter("addressName");
	String country = request.getParameter("country");
	System.out.println("cartId 1 :"+cartId+ ""+shippingDate);
%>

	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-center">
		<h1 class="display-6">주문 정보</h1>
	</div>
	
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		
		<div class="row justify-content-between">
			<div class="col-4" align="left">
			<strong>배송 주소</strong>
			<br>성명: <% out.println(name); %>
			<br>우편번호: <% out.println(zipCode); %>
			<br>주소: <% out.println(addressName); %>
			<br>(<% out.println(country); %>)
			</div>
			
			<div class="col-4" align="right">
				<p><em>배송일: <% out.println(request.getParameter("shippingDate")); %></em>
			</div>
		</div>
		
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Integer price = 0;
		Integer Qty = 0;
		Integer total = 0;
		Integer sum = 0;
		String productId = "";
		String productName = "";
		int cart_id = 0;
		String sql = "SELECT c.productId, p.name, c.unitprice, sum(c.Qty) FROM cart23 c, product23 p WHERE c.productId = p.productId group by c.productId, p.name, c.unitprice";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			productId = rs.getString(1);
			productName = rs.getString(2);
			price = rs.getInt(3);
			Qty = rs.getInt(4);
			
			total = Qty*price;
			sum = sum+total;
	%>
			<tr>		
				<td class="text-center"><em><%=productName %></em></td>
				<td class="text-center"><%=Qty%></td>
				<td class="text-center"><%=price %>원</td>
				<td class="text-center"><%=total %>원</td>	
			</tr>	
		
	<%
		}
	%>
				
			<tr>		
				<td></td>
				<td></td>
				<td class="text-right"><strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum %>원</strong></td>	
			</tr>			
				
			</table>
				<a href="./shippingInfo.jsp" class="btn btn-secondary" role="button">이전</a>
				<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>

</body>
</html>