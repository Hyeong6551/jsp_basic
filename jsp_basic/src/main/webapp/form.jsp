<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form.jsp</title>
</head>
<body>
<form action="result.jsp">
	<div>
		<h3>회원가입 페이지</h3>
		<label style="padding-bottom: 10px">아이디 </label><input type="text" placeholder="input your id" name="id"/><br>
		<label>비밀번호 </label><input type="password" placeholder="input your password" name="pw"/><br><br>
		<label>취미 </label><br>
		<input type="checkbox" value="음악감상" name="hobby"/>음악감상<br>
		<input type="checkbox" value="게임" name="hobby"/>게임<br>
		<input type="checkbox" value="노래부르기" name="hobby"/>노래부르기<br>
		<input type="checkbox" value="운동" name="hobby"/>운동<br><br>
		<label>전공</label><br>
		<input type="radio" name="major" value="컴퓨터 소프트웨어" />컴퓨터 소프트웨어
		<input type="radio" name="major" value="컴퓨터 정보보안" />컴퓨터 정보보안
		<input type="radio" name="major" value="컴퓨터 통신" />컴퓨터 통신
		<input type="radio" name="major" value="없음" />없음<br><br>
		
		<label>이메일 형식</label>
		<select name="email">
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="outlook.com">outlook.com</option>
		</select><br><br>
		<input type="submit" value="회원가입"/>
	</div>
</form>
</body>
</html>