<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 상품 수정하기 -->
<html>
<head>

<title>상품 등록</title>
<script>
function CheckAddProduct(){
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	//상품 아이디 체크
	if(!check(/^P[0-9]{4,11}$/, productId,
			"[상품코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요"))
		return false;
	
	//상품명 체크
	if(name.value.length<4 || name.value.length>50){
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	
	//상품가격 체크
	if(unitPrice.value.length==0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	if(unitPrice.value<0){
		alert("[가격]\n음수를 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,
			"[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;
	
	//재고수 체크
	if(isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}

/*	document.updateProduct.submit();
}
*/
function check(regExp, e, msg) {
		
	if(regExp.test(e.value)) {
		return true;
	}
	alert(msg);
	e.select();
	e.focus();
	return false;
}

	document.updateProduct.submit();
}	

</script>
</head>

<body>
	<%@ include file="menu.jsp"%>
	<div class="p-3 mb-2 bg-secondary-subtle text-emphasis-secondary display-3 text-left">
		<h1 class="display-6">상품 수정</h1>
	</div>
	<%@ include file="dbconn.jsp"%>
<%
	String fileName="";
	try{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String productId = request.getParameter("productId");
		String sql = "SELECT * from product23 WHERE productId=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs  = pstmt.executeQuery();
	
		if(rs.next()){
			String name = rs.getString("name");
			String unitPrice = rs.getString("unitPrice");
			String description = rs.getString("description");
			String manufacturer = rs.getString("manufacturer");
			String category = rs.getString("category");
			String unitsInStock = rs.getString("unitsInStock");
			String condition = rs.getString("condition");

			fileName = rs.getString("filename");
%>


<div class="container">
<form name="updateProduct" action="processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
	<div class="form-group row">
		<label class="col-sm-2">상품코드</label>
		<div class="col-sm-3">
			<input type="text" id="productId" name="productId" class="form-control" value="<%=productId%>">
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">상품명</label>
		<div class="col-sm-3">
			<input type="text" id="name" name="name" class="form-control" value="<%=name%>">
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">가격</label>
		<div class="col-sm-3">
			<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=unitPrice%>">
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">상세정보</label>
		<div class="col-sm-5">
			<textarea name="description" cols="50" rows="2" class="form-control" value="<%=description%>"> </textarea>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">제조사</label>
		<div class="col-sm-3">
			<input type="text" name="manufacturer" class="form-control" value="<%=manufacturer%>">
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">분류</label>
		<div class="col-sm-3">
			<input type="text" name="category" class="form-control" value="<%=category%>">
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">재고수</label>
		<div class="col-sm-3">
			<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=unitsInStock%>">
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">상태</label>
		<div class="col-sm-5">
			<input type="radio" name="condition" value="New" <%=condition.equals("New") ? "checked" : "" %>>신규 제품
			<input type="radio" name="condition" value="Old" <%=condition.equals("Old") ? "checked" : "" %>>중고 제품
			<input type="radio" name="condition" value="Refurbished" <%=condition.equals("Refurbished") ? "checked" : "" %>>재생 제품
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">이미지</label>
		<div class="col-sm-5">
			<input type="file" name="fileName" id="fileName" class="form-control" title="첨부파일"><%=fileName %>
		</div>
	</div>
	
	<div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10">
			<input type="button" class="btn btn-primary" value="수정" onclick="CheckAddProduct()">
		</div>	
	</div>
	
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>

</form>
</div>

</body>
</html>