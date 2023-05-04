<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 화면</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gaegu:wght@700&family=Gowun+Batang:wght@700&display=swap')
	;

* {
	font-family: 'Dongle', sans-serif;
	font-family: 'East Sea Dokdo', cursive;
	font-family: 'Gaegu', cursive;
	font-family: 'Gowun Batang', serif;
}
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

/* 별점구현 */
.rating_box {
	display: flex;
}

.rating {
	position: relative;
	color: #ddd;
	font-size: 30px;
	text-align: center;
}

.rating input {
	position: absolute;
	left: 0;
	right: 0;
	width: 100%;
	height: 100%;
	opacity: 0;
	cursor: pointer;
}

.rating_star {
	width: 0;
	color: #ffc107;
	position: absolute;
	left: 0;
	right: 0;
	overflow: hidden;
	pointer-events: none;
}

/* 별점구현========================= */
#star{
    display: inline-block;
    direction: rtl;
    border:0;
}
#star legend{
    text-align: right;
}
input[type=radio]{
    display: none;
}
#star label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#star label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#star label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#star input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.disable {
	background-color: darkgray;
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">수정하기</h4>
				<form class="validation-form"
					action="/product/controller?type=updateOK&reviewIdx=${vo_s.reviewIdx }&cPage=${pvo.nowPage}"
					method="post" enctype="multipart/form-data">
					<!--         <form class="validation-form" action="review/controller?type=writeOK" novalidate> -->
					<!-- 나중에 post로 변경하기 -->
					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="subject">제목</label> <input type="text" name="subject"
								title="제목" class="form-control" id="subject" placeholder=""
								value="${vo_s.subject }" required>
						</div>
						<div class="col-md-4 mb-3">
							<label for="writer">작성자</label>
							<!-- 세션에 있는 작성자 사용 -->
							<input type="text" name="writer" title="작성자" class="form-control disable"
								id="writer" placeholder="" value="${sessionScope.user.userName}" readonly required>
						</div>
					</div>

					<div class="mb-3">
						<label for="product">상품명</label>
						<!-- 세션에 있는 상품명 사용 -->
						<input type="text" name="product" title="상품명" class="form-control disable"
							id="product" placeholder="${vo.product}" readonly required>
					</div>

					<div class="mb-3">
						<label>내용</label>
						<textarea cols="50" name="content" title="내용" rows="10"
							class="form-control">${vo_s.content }</textarea>
					</div>

					<div class="mb-3">
						<label>파일<span class="text-muted"
							name="fileName">&nbsp;(선택사항)</span></label> <input type="file"
							name="filename" class="form-control" id="address2"
							placeholder="파일칸 변경" value="${vo_s.oriName}">
					</div>

					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="pwd">비밀번호</label> <input type="password"
								name="pwd" title="비밀번호" class="form-control" id="pwd"
								placeholder="비밀번호 작성하시오" required>
						</div>


<!-- =================================================================== -->
<div class="col-md-4 mb-3">
<span class="text-bold">제품 평가</span>
	<fieldset id="star">
		
		<input type="radio" name="star" value="5" id="rate1"><label
			for="rate1" >★</label>
		<input type="radio" name="star" value="4" id="rate2"><label
			for="rate2" >★</label>
		<input type="radio" name="star" value="3" id="rate3"><label
			for="rate3" >★</label>
		<input type="radio" name="star" value="2" id="rate4"><label
			for="rate4" >★</label>
		<input type="radio" name="star" value="1" id="rate5"><label
			for="rate5" >★</label>
	</fieldset>
</div>
<!-- =================================================================== -->


					</div>

					<button class="btn btn-primary btn-lg btn-block" type="button"
						onclick="sendData(this.form)">수정하기</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; shoppingmall</p>
		</footer>
	</div>




	<script>
	function sendData(frm){
		//location.href = "controller?type=updateOK&reviewIdx=${vo_s.reviewIdx }&cPage=${pvo.nowPage}";

		frm.submit(); 
	}
  
  
  
  
  /* 기본양식 */
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
    
	
  </script>
</body>
</html>