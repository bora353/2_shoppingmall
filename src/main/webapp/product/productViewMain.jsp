<%@page import="com.shoppingmall.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="reviewLink"
			 value="${empty sessionScope.id ? '/login/controller?type=loginForm' : '/review/write.jsp'}"/>
<c:set var="cartLink"
			 value="${empty sessionScope.id ? '/login/controller?type=loginForm' : '/cart/controller?type=cartInsert'}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

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

/*** 페이지 표시 영역 스타일(시작) ****/
.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	/* border: 1px solid #00B3DC; */
	font-weight: bold;
	color: black;
}

.paging .disable {
	color: #aaa;
}

.paging .now {
	background-color: pink;
	border-radius: 50%;
	padding: 3px 7px;
}

a {
	text-decoration-line: none;
	color: black;
}

h3 {
	text-align: center;
}

.red {
	color: tomato;
}

.blue {
	color: blue;
}

.pink {
	color: #FFAEBC;
}

.gray {
	color: gray;
}

.italic {
	font-style: italic;
}

.bold {
	font-weight: bold;
}

.right {
	margin-left: auto;
	float: right;
	position: absolute;
	top: 0;
	right: 0;
	padding: 20px;
}

.container-fluid {
	padding: 10px;
}

.navbar {
	margin-bottom: 35px;
}

/* footer */
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>
<%@ include file="../include/onclickEvent.jspf"%>
</head>
<body>
	<%@ include file="../include/header.html"%>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<form action="/shoppingmall/main?currentPage=${nPage }">
					<h4 class="mb-3">${vo.product }</h4>
					<div class="row">
						<div class="col-md-4 mb-3">
							<img src="../img/${vo.reName }" width="150px" height="150px">
						</div>
						<div class="col-md-8 mb-3">
							<span class="blue">${vo.category }</span><br> <span
								class="gray bold italic"><fmt:formatNumber
									value="${vo.price }" pattern="#,###" />원</span><br> <i
								class="bi red">작성자: ${vo.pId }</i>
						</div>
						<div class="col-md-8 mb-3">
							<input type="button" class="btn btn-success btn-sm btn-block"
								value="장바구니 담기"
								onclick="location.href = '${cartLink}'">
						</div>
					</div>
					<textarea id="textarea" name="pIntroduce"
						class="form-control col-md-8 mb-3" rows="8" title="제품소개"
						readonly="readonly"><%=((ProductVO)session.getAttribute("vo")).getpIntroduce().replaceAll("<br>", "\r\n")%>
						</textarea>
					<br>
					<%--
				<div>
					<input type="hidden" name="nowPage" value="${nPage }">
	  				<input type="hidden" name="pIdx" value="${vo.pIdx }">
				</div>
				--%>
					<input type="button" class="btn btn-outline-info btn-sm" value="목록"
								 onclick="location.href = '/main?currentPage=${nPage }'"
					>
				</form>
			</div>
		</div>
	</div>
	<%--            댓글 시작                           --%>
	<br>
	<br>
	<table class="table">
		<%--<h3>총 상품평 : ${count }건</h3>--%>

		<thead>
		<tr class="table-primary">
			<th scope="col" width="5%">#</th>
			<th scope="col" width="15%">상품사진</th>
			<th scope="col" width="70%">리뷰</th>
			<th width="20%"></th>
		</tr>
		</thead>
		<tbody>

		<tr class="table-warning">
			<td></td>
			<td></td>
			<td><input type="button" value="리뷰작성"
								 onclick="location.href='${reviewLink}'"
								 class="btn btn-success btn-sm"></td>
			<td></td>
		</tr>


		<c:forEach var="reviewVO" items="${list}">
			<tr class="table-warning">
				<th scope="row">${reviewVO.reviewIdx}</th>
				<td><img src="../img/${reviewVO.oriName}" width="150px"
								 height="150px"></td>
				<td><a
						href="/product/controller?type=view&reviewIdx=${reviewVO.reviewIdx }&cPage=${pvo.nowPage}">
						${reviewVO.writer}<br>
					<c:forEach begin="1" end="${reviewVO.star }">
						<i class="bi bi-star-fill red"></i>
					</c:forEach>
					<span class="blue">${reviewVO.writeDate}</span><br>
					<span class="italic gray bold" >${vo.product}</span><br>
						${reviewVO.subject}<br> ${reviewVO.content}<br>
				</a> <!-- 	<i class="bi bi-hand-thumbs-up-fill red"></i><span class="red"> ${reviewVO.likeCheck }</span>&nbsp;&nbsp;
		<i class="bi bi-hand-thumbs-down"></i>  <!-- 여기에 싫어요! --> <i
						class="bi bi-hand-thumbs-up-fill red" id="good"></i> <span
						class="rec_count"> ${reviewVO.likeCheck }</span> &nbsp;&nbsp;
					<!--  <i class="bi bi-hand-thumbs-down red" id="bad"> 여기에 싫어요! </i> -->



				</td>

				<td>조회수 ${reviewVO.hit}</td>
			</tr>
		</c:forEach>


		</tbody>

		<c:if test="${empty list}">
			<tr>
				<td colspan="4" class="red table-warning" style="text-align: center">첫 리뷰를 작성해보세요 ~ </td>
			</tr>
		</c:if>

		<tfoot>
		<tr >
			<td colspan="4" style="text-align:center">
				<ol class="paging">
					<%-- [이전으로]에 대한 사용가능 여부 처리 --%>
					<c:if test="${pvo.beginPage == 1 }">
						<li>
							<button class="btn btn-primary btn-sm btn-block disable">이전</button>
						</li>
					</c:if>
					<c:if test="${pvo.beginPage != 1 }">
						<li><a
								href="controller?type=reviewList&cPage=${pvo.beginPage - 1 }&order=${order }">
							<button class="btn btn-primary btn-sm btn-block">이전</button>
						</a></li>
					</c:if>

					<%--블록내에 표시할 페이지 태그 작성(시작~끝 페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }"
										 end="${pvo.endPage }">
						<c:if test="${pageNo == pvo.nowPage}">
							<li class="now">${pageNo }</li>
						</c:if>
						<c:if test="${pageNo != pvo.nowPage}">
							<li><a href="controller?type=reviewList&cPage=${pageNo }&order=${order }">${pageNo }</a></li>
						</c:if>

					</c:forEach>

					<%-- [다음으로]에 대한 사용가능 여부 처리 --%>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li><a
								href="controller?type=reviewList&cPage=${pvo.endPage + 1 }&order=${order }">
							<button class="btn btn-primary btn-sm btn-block">다음</button>
						</a></li>
					</c:if>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li>
							<button class="btn btn-primary btn-sm btn-block disable">다음</button>
						</li>
					</c:if>
				</ol>
			</td>
		</tr>
		</tfoot>
	</table>
	<%----%>
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
	</script>
	<%@ include file="../include/footer.html" %>
</body>
</html>