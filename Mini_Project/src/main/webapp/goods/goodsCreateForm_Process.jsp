<%@page import="com.company.dto.GoodsDto"%>
<%@page import="com.company.dao.GoodsDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uploadPath = application.getRealPath("/image");
	int maxSize = 10 * 1024 * 1024;
	String encoding = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, encoding, new DefaultFileRenamePolicy());
	
	String goods_uploadFile = multi.getOriginalFileName("goods_uploadFile");
	String goods_name = multi.getParameter("goods_name");
	int goods_price = Integer.parseInt(multi.getParameter("goods_price"));
	String goods_content = multi.getParameter("goods_content");
	String filePath = "image/";
	
	GoodsDto goods = new GoodsDto();
	goods.setGoods_image(filePath+goods_uploadFile);
	goods.setGoods_name(goods_name);
	goods.setGoods_price(goods_price);
	goods.setGoods_content(goods_content);
	
	GoodsDao dao = new GoodsDao();
	boolean success = dao.insertGoods(goods);
	
    if(success) {
        response.sendRedirect("goodsList.jsp");
    } else {
%>
    <script>
        alert("등록 실패");
        history.back();
    </script>
<%
    }
%> 