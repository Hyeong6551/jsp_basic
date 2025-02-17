<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<h1>first page</h1>
<%
	out.println("output<br>");
	out.println(LocalDate.now()+"<br>");
	out.println(LocalTime.now()+"<br>");
%>
<br>
<%=LocalDate.now() %>
<%=LocalTime.now() %>
<br>
</body>
</html>