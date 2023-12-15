<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ include file="dbconn.jsp"%>

<!-- 상품 수정하기 -->

<% 
	request.setCharacterEncoding("UTF-8");

	String filename= "";
	String realFolder= "C:\\work202301\\yangjungMarket\\src\\main\\webapp\\shoppingMall\\upload"; //project가 있는 workspace 경로
	String encType= "utf-8"; //인코딩 타입
	int maxSize= 5*1024*1024; //최대 업로드될 파일크기 5Mb
	//System.out.println("read folder :" +realFolder);
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	if(unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	
	long stock;
	if(unitsInStock.isEmpty())
		stock=0;
	else
		stock=Long.valueOf(unitsInStock);
	
	@SuppressWarnings("rawtypes")
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	
	String sql = "SELECT * from product23 WHERE productId=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);

    rs = pstmt.executeQuery();
    
    if(rs.next()){
    	if(fileName != null){
    		sql = "UPDATE product23 set name=?, unitprice=?, description=?, category=?, manufacturer=?, unitsInStock=?, condition=?, filename=? WHERE productId=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, name);
    		pstmt.setInt(2, price);
    		pstmt.setString(3, description);
    		pstmt.setString(4, category);
    		pstmt.setString(5, manufacturer);
    		pstmt.setLong(6, stock);
    		pstmt.setString(7, condition);
    		pstmt.setString(8, fileName);
    		pstmt.setString(9, productId);
    		pstmt.executeUpdate();
    	}else {
    		sql = "UPDATE product23 set name=?, unitprice=?, description=?, category=?, manufacturer=?, unitsInStock=?, condition=? WHERE productId=?";
			pstmt = conn.prepareStatement(sql);    	
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, name);
    		pstmt.setInt(2, price);
    		pstmt.setString(3, description);
    		pstmt.setString(4, category);
    		pstmt.setString(5, manufacturer);
    		pstmt.setLong(6, stock);
    		pstmt.setString(7, condition);

    		pstmt.setString(8, productId);
    		pstmt.executeUpdate();
    	}
    }
	
	response.sendRedirect("resultProduct.jsp?msg=2");
	
%>
