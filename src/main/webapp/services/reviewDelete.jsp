<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제작업(암호)</title>
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
	let pwd_chk = "${pwd_chk }";
	if (pwd_chk == "fail") {
		alert("암호불일치, 암호를 확인하세요");
	}
	
	function comm_del(frm) {
		let isDelete = confirm("정말 삭제하시겠습니까?");
		if (isDelete) {
			frm.action = "controller?type=reviewDeleteOk";
			frm.submit();
		} else {
			history.back(); //삭제취소하고 이전페이지로(상세보기) 이동
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form method="post" name="testForm">
					비밀번호 : <input type="password" name="pwd"> 
					<input type="button" class="btn btn-danger btn-sm" value="삭제" onclick="comm_del(this.form)">
					<input type="hidden" name="rNo" value="${rNo }">
				</form>
			</div>
		</div>
	</div>
</body>
</html>