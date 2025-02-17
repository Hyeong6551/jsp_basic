<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	out.println("ID : "+id+"<br>"+"PW : "+pw);
%>
<br>
<form action="form.jsp">
	<input type="submit" value="홈 화면으로 돌아가기"/>
</form>
</body>
</html>