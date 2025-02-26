<%@page import="com.company.dto.EmpDto"%>
<%@page import="com.company.dao.EmpDao"%>
<%@page import="com.company.dto.DeptDto"%>
<%@page import="com.company.dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DeptDao ddao = new DeptDao();
	ddao.dbConnection();	
	for(DeptDto dto : ddao.selectAll()){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=dto.getDeptno() %>
	<%=dto.getDname() %>
	<%=dto.getLoc() %>
	<br>
<%
	}
%>
<%-- <% 
	EmpDao edao = new EmpDao();
	edao.dbConnection();
	for(EmpDto dto : edao.selectAll()){
		%>
	<%=dto.getEmpno() %>
	<%=dto.getEname() %>
	<%=dto.getSal() %>
	
		<%
	}
%> --%>
</body>
</html>