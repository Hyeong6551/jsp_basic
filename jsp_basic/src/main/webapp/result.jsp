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
	String hb[] = request.getParameterValues("hobby");	// 여러개의 값을 받을때는 배열로 선언 후 getPrameterValues
	String mj = request.getParameter("major");
	String email = request.getParameter("email");
	String sumEmail = id+"@"+email;
	
	String str ="";
	if(hb != null){
		for(String temp : hb){
			str += temp+" ";
		}
	}
%>
<form action="form.jsp">
	<div>
		<h3>회원가입이 완료되었습니다</h3>
		<label>ID : </label><%=id %><br>
		<label>PW : </label><%=pw %><br>
		<label>HOBBY : </label><%=str %><br>
		<label>MAJOR : </label><%=mj %><br>
		<label>EMAIL : </label><%=sumEmail %><br>
		<input type="submit" value="홈 화면으로 돌아가기"/>
	</div>
</form>
</body>
</html>