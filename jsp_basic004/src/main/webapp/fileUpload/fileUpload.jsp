<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file upload</title>
</head>
<body>
	<h2>파일 업로드</h2>
	<form action="uploadProcess.jsp" method="post" enctype="multipart/form-data">
		파일 설명 : <input type="text" name="description" /><br>
		파일 선택 : <input type="file" name="uploadFile" /><br>
		<input type="submit" value="업로드" />
	</form>
</body>
</html>