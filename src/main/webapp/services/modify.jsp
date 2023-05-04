<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
<script>
	let pass_check = "${pass_check}";
	if (pass_check == "fail") {
		alert("암호불일치, 암호를 확인하세요");
	}
	
	function sendData() {
		//alert("sendData() 실행");
		let firstForm = document.forms[0];
		console.log(firstForm.elements);
		//alert("firstForm.elements.length : " + firstForm.elements.length);
		for (let i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 4) continue; //첨부파일 제외
				alert(firstForm.elements[i].title + " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}

	function list_go() {
		location.href = "controller?type=service";
	}
</script>

</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">게시물 작성</h4>
				<form class="validation-form" action="controller?type=modifyOk"
					method="post" enctype="multipart/form-data" name="testForm"
					novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">제목</label> <input type="text"
								class="form-control" id="name" name="title" title="제목"
								value="${qvo.qTitle }" required>
							<div class="invalid-feedback">제목을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">작성자</label> <input type="text"
								class="form-control" id="nickname" name="writer" title="작성자"
								value="${qvo.qWriter }" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">내용</label> <input type="text"
							class="form-control" id="email" name="content" title="내용"
							value="${qvo.qContent }" required>
						<div class="invalid-feedback">내용을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="address">카테고리</label> <br> 
						<select name="category">
							<option value="select" disabled>선택하세요</option>
							<option value="배송">배송</option>
							<option value="환불">환불</option>
							<option value="교환">교환</option>
							<option value="회원서비스">회원서비스</option>
						</select> 
						<!-- <input type="text" name="category" title="카테고리" value="${qvo.qCategory }" required> -->
					</div>

					<div class="mb-3">
						<label for="address">첨부파일</label> <br> <input type="file"
							name="filename" title="첨부파일" required>
					</div>

					<div class="mb-3">
						<label for="address2">비밀번호</label> <br> <input
							type="password" name="pwd" title="암호" placeholder="비밀번호를 입력해주세요.">
					</div>

					<div class="mb-4"></div>
						<input type="button" value="수정" onclick="sendData()"
							class="btn btn-primary btn-lg btn-block">
						<input type="reset" value="초기화"
							class="btn btn-primary btn-lg btn-block">
						<input type="button" value="목록보기" onclick="list_go()"
							class="btn btn-primary btn-lg btn-block">
				</form>
			</div>
		</div>

	</div>
	<%@ include file="footer.html" %>
</body>
</html>