<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<link rel="stylesheet" href="../css/logRg.css" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<jsp:include page="../Header.jsp"/>
	<form action="RegisterForm_Process.jsp" method="post">
		<div class="register-container my-4">
			<div class="mb-3 mt-3">
			  <label for="id" class="form-label">아이디</label>
			  <input type="text" class="form-control" name="user_id">
			</div>
			<div class="mb-3">
			  <label for="pwd" class="form-label">비밀번호</label>
			  <input type="password" class="form-control" name="user_password">
			</div>
			<div class="mb-3">
			  <label for="name" class="form-label">이름</label>
			  <input type="text" class="form-control" name="user_name">
			</div>
			<div class="b-3">
				<label for="address" class="form-label">주소</label>
				<div class="row">
					<div class="col">	
						<input type="text" class="form-control" id="sample6_postcode" name="user_postcode" placeholder="우편번호">
					</div>
					<div class="col">	
						<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</div>
				</div>
				<input type="text" class="form-control mt-2" id="sample6_address" name="user_address" placeholder="주소">
				<input type="text" class="form-control mt-2" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
				<input type="text" class="form-control mt-2" id="sample6_extraAddress" name="extraAddress" placeholder="참고항목">
			</div>
			<button type="submit" class="btn btn-primary mt-5">회원가입</button>
		</div>
	</form>
	<jsp:include page="../Footer.jsp"/>
</body>
</html>