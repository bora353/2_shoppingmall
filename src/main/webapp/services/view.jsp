<%@page import="com.shoppingmall.vo.Qna_ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingmall.dao.QnaDAO"%>
<%@page import="com.shoppingmall.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<%-- 전달받은 데이터 사용해서 DB데이터 조회 후 화면표시 
	전달받은 파라미터 값(bbsIdx, cPage)
	1. 게시글 조회수 1 증가(개인별 실습)
	2. 게시글(bbsIdx) 데이터 조회 후 화면 표시
	3. 게시글(bbsIdx)에 연결된 댓글이 있으면 화면 표시
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글상세</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- 구글 글씨체 -->
<style>
  @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gaegu:wght@700&family=Gowun+Batang:wght@700&display=swap');
*{
font-family: 'Dongle', sans-serif;
font-family: 'East Sea Dokdo', cursive;
font-family: 'Gaegu', cursive;
font-family: 'Gowun Batang', serif;
}


    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
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

</style>
</head>
<script>
	function modify_go(frm) { //수정화면(폼) 이동
		frm.action = "controller?type=modify";
		frm.submit();
	}
	function delete_go(frm) { //삭제화면(폼) 이동
		frm.action = "controller?type=delete";
		frm.submit();
	}
	function list_go(frm) {
		frm.action = "controller?type=service";
		frm.submit();
	}
	function review_delete(frm) {
		frm.action = "controller?type=reviewDelete";
		frm.submit();
	}
	function review_write(frm) {
		frm.action = "controller?type=reviewWrite";
		frm.submit();
	}
</script>
<body>
	<%@ include file="header.jsp" %>
	<table class="table">
		<thead>
			<tr class="table-primary">
			</tr>
		</thead>
		<tbody>
			<tr class="table-warning">
			</tr>
		</tbody>
	</table>



	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">${qvo.qTitle}</h4>
				<div class="row">
					<div class="col-md-3 mb-3">
						<img src="../img/${qvo.qOriname}" width="150px" height="150px">
					</div>
					<div class="col-md-9 mb-3">
						작성자 : ${qvo.qWriter} <br>
						카테고리 : ${qvo.qCategory } <br>
						<span class="blue"> 날짜 : ${qvo.qDate} </span> <br>
						조회수 ${qvo.qHit} <br>
					</div>
					<div class="col-md-9 mb-3">
						<div class="mb-3">${qvo.qContent}</div>
					</div>
				</div>



				<form method="post" name="testForm">
				<c:if test="${sessionScope.userList.userIdx == qvo.userNo || sessionScope.userList.userType == 1 }">
					<button class="btn btn-success btn-sm btn-block" type="button"
						value="수정" onclick="modify_go(this.form)">수정</button>
					<button class="btn btn-danger btn-sm btn-block" type="button"
						value="삭제" onclick="delete_go(this.form)">삭제</button>
				</c:if>
					<button class="btn btn-primary btn-sm btn-block" type="button"
						value="목록보기" onclick="list_go(this.form)">목록보기</button>
				</form>
			</div>
		</div>
		<br>
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<!-- 관리자만 댓글달기 가능 -->
				<c:if test="${sessionScope.userList.userType == 1 }">
				<form method="post" name="testForm">
					<p>
						작성자 &nbsp;&nbsp; : <input type="text" name="writer"> <br><br> 
						비밀번호 &nbsp;: <input type="password" name="pwd">
					</p>
					<p>
						내용 : <br>
						<textarea name="content" rows="4" cols="50"></textarea>
					</p>
					<input class="btn btn-success btn-sm btn-block" type="submit"
						value="댓글저장" onclick="review_write(this.form)"> 
						<input type="hidden" name="qNo" value="${qvo.qNo }">
				</form>
				</c:if>

				<%-- 게시글에 연결된 댓글 표시(출력) --%>
				<c:forEach var="Qna_ReviewVo" items="${c_list }">
					<hr>
					<div class="comment">
						<form method="post" name="testForm">
							<p>작성자 : ${Qna_ReviewVo.rWriter }</p>
							<p>작성일: ${Qna_ReviewVo.rDate }</p>
							<p>내용 : ${Qna_ReviewVo.rContent }</p>
							<!-- 관리자만 댓글삭제 가능 -->
							<c:if test="${sessionScope.userList.userType == 1 }">
							<input class="btn btn-danger btn-sm btn-block" type="submit" value="댓글삭제" onclick="review_delete(this.form)"> 
								<input type="hidden" name="rNo" value="${Qna_ReviewVo.rNo }">
							</c:if>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<footer class="my-3 text-center text-small">
		<p class="mb-1">&copy; shoppingmall</p>
	</footer>
	<%@ include file="footer.html" %>


</body>
</html>