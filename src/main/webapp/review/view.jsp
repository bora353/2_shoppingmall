<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
System.out.println(request.getRequestURI());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>

<!-- 제이쿼리 사용 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- 구글 글씨체 -->
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

.red {
	color: tomato;
}
.blue {
	color: blue;
}
.gray {
	color: gray;
}
.italic{
	font-style:italic;
}
.bold{
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">${vo_s.reviewIdx}.${vo_s.subject}</h4>
				<div class="row">
					<div class="col-md-4 mb-3">
						<img src="../img/${vo_s.oriName}" width="150px" height="150px">
					</div>
					<div class="col-md-8 mb-3">
						<br> ${vo_s.writer} <br>

						<c:forEach begin="1" end="${vo_s.star }">
							<i class="bi bi-star-fill red"></i>
						</c:forEach>

						<span class="blue">${vo_s.writeDate}</span>
						<br><span class="gray bold italic">${vo.product}</span> <br> 조회수 ${vo_s.hit} <br> <i
							class="bi bi-hand-thumbs-up-fill red" id="good"></i> <span
							class="rec_count">${likeCount }</span> &nbsp;&nbsp; 
							<!--<i class="bi bi-hand-thumbs-down" id="bad"></i>  -->
					</div>
				</div>

				<div class="mb-3">${vo_s.content}</div>




				<button class="btn btn-success btn-sm btn-block" type="button"
					onclick="location.href='/product/controller?type=update&reviewIdx=${vo_s.reviewIdx }&cPage=${pvo.nowPage}'">
					수정</button>
				<button class="btn btn-danger btn-sm btn-block" type="button"
					onclick="review_delete(this.form)">
					삭제</button>
				<button class="btn btn-primary btn-sm btn-block" type="button"
					onclick="location.href='/product/controller?type=productViewMain&pIdx=${vo.pIdx}&nowPage=${pvo.nowPage}'">목록보기</button>


				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; shoppingmall</p>
		</footer>
	</div>


	<script>
  
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
  
  
  /* likehate 구현 */
  // 추천버튼 클릭시
    $("#good").click(function(){
    	//alert("클릭");
    	$.ajax({
			url: "/review/likehateController",
            type: "POST",
            //contentType : "charset:UTF-8",
            data: {
                no: ${vo_s.reviewIdx},
                id: ${vo_s.userIdx}
            },
            success: function(data) {
            	//alert("성공 : "+ data);
            	$(".rec_count").html(data);
		       // recCount();
            },
            error : function(){
				alert("Ajax 클릭 실패!!!");
			}
		})
    });
  
  //delete script
  	function review_delete(frm){
		let isDelete = confirm("정말 삭제하시겠습니까?");
		if (isDelete){
			location.href="/product/controller?type=delete&reviewIdx=${vo_s.reviewIdx }&cPage=${pvo.nowPage}";
			frm.submit();
		} else {
			history.go(0);  //삭제 취소하고 이전페이지(상세보기) 이동
		}
	}
  
  
  </script>




</body>
</html>