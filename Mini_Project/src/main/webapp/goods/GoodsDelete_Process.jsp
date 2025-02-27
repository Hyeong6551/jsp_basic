<%@page import="com.company.dto.GoodsDto"%>
<%@page import="com.company.dao.GoodsDao"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int goods_no = Integer.parseInt(request.getParameter("goods_no"));
	String uploadPath = "image/"; 
	
	File file = new File(uploadPath + File.separator + goods_no);
	if (file.exists()) {	
	    file.delete();
	}
	
	GoodsDao dao = new GoodsDao();
    boolean success = dao.deleteGoods(goods_no);
    
    if(success) {
        response.sendRedirect("GoodsList.jsp");
    } else {
%>
    <script>
        alert("삭제 실패");
        history.back();
    </script>
<%
    }
%> 