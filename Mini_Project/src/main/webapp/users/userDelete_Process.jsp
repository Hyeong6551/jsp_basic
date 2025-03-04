<%@page import="com.company.dto.UsersDto"%>
<%@page import="com.company.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");

	UsersDao udao = new UsersDao();
	boolean success = udao.deleteUser(user_id);
	
    if(success) {
    	session.invalidate();
%>
    <script>
        alert("정상적으로 탈퇴처리 되었습니다.");
		location.href = "../index.jsp";
    </script>
<%
    } else {
%>
    <script>
        alert("탈퇴 실패");
        history.back();
    </script>
<%
    }
%>