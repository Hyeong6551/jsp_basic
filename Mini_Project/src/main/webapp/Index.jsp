<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="dbConnection.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>hyeong's shops</title>
</head>
<body>
	<div>
	<jsp:include page="Header.jsp" />
		<%-- Categories --%>
		<div class="categories my-5">
			<div class="small-container">
				<div class="row">
<%
	Connection conn = (Connection)session.getAttribute("conn");
	PreparedStatement pstmt = null; ResultSet rs = null;
	String sql = "SELECT * FROM goods";
	try {		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
%>
		<div class="col-3">
			<a href="./Goods.jsp?goods_no=<%=rs.getInt("goods_no") %>">
				<img src="<%=rs.getString("goods_image") %>">
				<h6> <%=rs.getString("goods_name") %></h6>	
				<p><%=rs.getInt("goods_price") %> ₩</p>
			</a>
		</div>
<%	
		}
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		try { if (rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
		try { if (conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
	}
%>
				</div>
			</div>
		</div> <%-- Categories end --%>
		<jsp:include page="Footer.jsp" />
	</div>
</body>
</html>