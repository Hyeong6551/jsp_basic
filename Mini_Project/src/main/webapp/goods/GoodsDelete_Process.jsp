<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../dbConnection.jsp" />
<%
String goods_no = request.getParameter("goods_no");
if (goods_no == null || goods_no.trim().equals("")) {
    response.sendRedirect("GoodsList.jsp");
    return;
}
String uploadPath = "image/"; 

Connection conn = (Connection)session.getAttribute("conn");
PreparedStatement pstmt = null;
String sql = "DELETE FROM goods WHERE goods_no=?";
try {
    // 파일 삭제
    File file = new File(uploadPath + File.separator + goods_no);
    if (file.exists()) {	
        file.delete();
    }
    // DB에서 레코드 삭제
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, goods_no);
    pstmt.executeUpdate();
    out.println("<script>alert('상품이 삭제되었습니다.'); location.href='GoodsList.jsp';</script>");
} catch(Exception e) {
	e.printStackTrace();
} finally {
    if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
    if(conn != null) try { conn.close(); } catch(Exception e) {}
}
%> 