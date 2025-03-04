<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 목록</title>
</head>
<body>
    <h2>멤버 목록</h2>
	<table border="1">
       	<tr>
            <th>이름</th>
            <th>나이</th>
       	</tr>
        <c:forEach var="member" items="${mvclist}">
            <tr>
                <td>${member.username}</td>
                <td>${member.age}</td>
            </tr>
        </c:forEach>
	</table>
</body>
</html>
