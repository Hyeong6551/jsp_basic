<%@page import="com.company.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    
    MemberDAO dao = new MemberDAO();
    boolean success = dao.deleteMember(id);
    
    if(success) {
        response.sendRedirect("memberList.jsp");
    } else {
%>
    <script>
        alert("회원 삭제 실패");
        history.back();
    </script>
<%
    }
%> 