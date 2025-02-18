<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" type="text/css">
<title>hyeong's shops</title>
</head>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
		
		<%-- Categories --%>
		<div class="categories my-5">
			<div class="small-container">
				<div class="row">
					<div class="col-3">
						<a href="./goods1.jsp">
							<img src="https://picsum.photos/250/250">
							<h6>상품 1 입니다</h6>
							<p>상품 1 가격</p>
						</a>
					</div>
					<div class="col-3">
						<a href="./goods2.jsp">
							<img src="https://picsum.photos/250/250">
							<h6>상품 2 입니다</h6>
							<p>상품 2 가격</p>
						</a>
					</div>
					<div class="col-3">
						<a href="./goods3.jsp">
							<img src="https://picsum.photos/250/250">
							<h6>상품 3 입니다</h6>
							<p>상품 3 가격</p>
						</a>
					</div>
				</div>
			</div>
		</div> <%-- Categories end --%>
		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>