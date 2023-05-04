<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품등록 리스트</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
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
	
	td img { width: 100px; }
	.container {
	width: 90%;
	padding: 30px; }
	
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
	.italic{
		font-style:italic;
	}
	.bold{
		font-weight: bold;
	}
	.right{
	margin-left:auto;
		float:right;
		position: absolute;
		top: 0;
		right: 0;
		padding: 20px;
	}
	.container-fluid{
		padding : 10px;
	}
	.navbar{
		 margin-bottom : 35px; 
	}
	
	/* footer */
   .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
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
<%@ include file="/include/onclickEvent.jspf" %>
</head>
<body>
<%@ include file="/include/header.html" %>
<div class="container">
	<table class="table table-hover">
 	<h2>제품등록 페이지</h2><br>
 		<thead>
			<tr class="title">
				<th class="no">제품번호</th>
				<th class="cate">카테고리</th>
				<th class="subject">제품</th>
				<th class="price">가격</th>
				<th class="regdate">등록날짜</th>
			</tr>
		</thead>

		<tbody>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.pIdx }</td>
				<td>${vo.category }</td>
				<td>
					<a href="/product/controller?type=productView&pIdx=${vo.pIdx }&nowPage=${pvo.nowPage}">
						<img src="/img/${vo.reName }" class="img-thumbnail" alt="${vo.oriName }"><br>
						${vo.product }
					</a>
				</td>
				<td><fmt:formatNumber value="${vo.price }" pattern="#,###"/>원</td>
				<td>${vo.pDate }</td>
			</tr>
		</c:forEach>
		<c:if test="${empty list }">
			<tr>
				<td colspan="5">등록된 제품이 없습니다.</td>
			</tr>
		</c:if>
		</tbody>
		<tfoot>
			
 			<tr>
 				<td colspan="4">
					<ol class="paging">
					<c:if test="${pvo.beginPage == 1 }">
						<li class="btn btn-info disabled">이전</li>
					</c:if>
					<c:if test="${pvo.beginPage != 1 }">
						<li class="btn btn-primary btn-sm">
						<a href="/product/controller?type=productList&nowPage=${pvo.beginPage - 1 }">이전</a>
						</li>
					</c:if>
					
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:if test="${pageNo == pvo.nowPage}">
							<li class="btn btn-primary disabled">${pageNo }</li>
						</c:if>
						<c:if test="${pageNo != pvo.nowPage}">
							<li class="btn btn-outline-info btn-sm"><a href="/product/controller?type=productList&nowPage=${pageNo}">${pageNo }</a></li>
						</c:if>
					</c:forEach>
					
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li class="btn btn-primary btn-sm">
							<a href="/product/controller?type=productList&nowPage=${pvo.endPage + 1 }">다음</a>
						</li>
					</c:if>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="btn btn-info disabled">다음</li>
					</c:if>
					</ol>
				</td>
				<td>
				<form method="post">
					<input type="button" class="btn btn-warning" value="제품등록" onclick="productAdd(this.form)">
				</form>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
<%@ include file="/include/footer.html" %>
</body>
</html>