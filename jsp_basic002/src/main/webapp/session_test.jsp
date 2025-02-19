<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 저장된 값을 불러옴
// 모든 브라우저를 닫으면 세션 종료
String name = (String)session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=name %>
</body>
</html>