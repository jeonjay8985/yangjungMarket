<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!-- 주문 완료 -->
<html>
<head>
<!--  <link rel="stylesheet" href="../css/bootstrap.min.css"/> -->

 <link rel="stylesheet" href="css/bootstrap.min.css"/> 
<title>주문 완료</title>
</head>
<body>
<% 
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	String cartId = session.getId();
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if(n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>

	<jsp:include page="menu.jsp"/>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-center">
		<h1 class="display-6">주문 완료</h1>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은 <% out.println(shipping_shippingDate); %>에 배송 될 예정입니다!
		<p>주문번호 : <% out.println(cartId); %>
	</div>

	<div class="container">
		<p><a href="./productList.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
		   <a href="./deleteCart.jsp" class="btn btn-secondary"
		   onclick="if(!confirm('장바구니를 비우시겠습니까?')) return false;">&laquo;장바구니 비우기</a>	
	</div>
</body>
</html>