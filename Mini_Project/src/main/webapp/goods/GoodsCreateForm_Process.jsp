<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../dbConnection.jsp" />
<%
	String uploadPath = application.getRealPath("/image");
	int maxSize = 10 * 1024 * 1024;
	String encoding = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, encoding, new DefaultFileRenamePolicy());
	
	String goods_content = multi.getParameter("goods_content");
	String originalFileName = multi.getOriginalFileName("uploadFile");
	String goods_name = multi.getParameter("goods_name");
	String goods_price = multi.getParameter("goods_price");
	String filePath = "image/";
	
	Connection conn = (Connection)session.getAttribute("conn");
	PreparedStatement pstmt = null;
	
	try { 
	    String sql = "INSERT INTO goods (goods_no,goods_image, goods_name, goods_price, goods_content)"+
	            " VALUES (NULL, ?, ?, ?, ?)";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, filePath+originalFileName);
	    pstmt.setString(2, goods_name);
	    pstmt.setString(3, goods_price);
	    pstmt.setString(4, goods_content);
	    pstmt.executeUpdate();

	    out.println("<script>alert('상품이 추가되었습니다.'); location.href='GoodsList.jsp';</script>");

	} catch(Exception e) {
	    out.println("오류 발생: " + e.getMessage());
	} finally {
	    if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
	    if(conn != null) try { conn.close(); } catch(Exception e) {}
	}
%>