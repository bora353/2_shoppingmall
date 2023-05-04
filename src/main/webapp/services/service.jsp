<%@page import="com.shoppingmall.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingmall.paging.Paging, com.shoppingmall.dao.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="writeLoginLink" value="${empty sessionScope.id ? '/login/controller?type=loginForm' : 'controller?type=write'}"/>
<%

String pvo = request.getParameter("cPage");

//0. 페이징 처리를 위한 객체(Paging) 생성
Paging p = new Paging();

//1. 전체 게시물 수량 구하기
p.setTotalRecord(QnaDAO.getTotalCount());
p.setTotalPage();

System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
System.out.println("> 전체 페이지 수 : " + p.getTotalPage());

//2. 현재 페이지 구하기
String cPage = request.getParameter("cPage");
if (cPage != null) {
	p.setNowPage(Integer.parseInt(cPage));
}
System.out.println("> cPage : " + cPage);
System.out.println("> Paging nowPage : " + p.getNowPage());

//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
p.setEnd(p.getNowPage() * p.getNumPerPage());
p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

//3-1. (선택적) 끝번호가 데이터 건수보다 크면 데이터 건수와 동일하게 처리
if (p.getEnd() > p.getTotalRecord()) {
	p.setEnd(p.getTotalRecord());
}
System.out.println(">> 시작번호(begin) : " + p.getBegin());
System.out.println(">> 끝번호(end) : " + p.getEnd());

//------- 블록(Block) 계산하기 ---------
//4. 블록 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
//4-1. 시작페이지, 끝페이지 구하기
int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
p.setBeginPage(beginPage);
p.setEndPage(beginPage + p.getPagePerBlock() - 1);

//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
// 끝페이지를 전체페이지 수로 변경 처리
if (p.getEndPage() > p.getTotalPage()) {
	p.setEndPage(p.getTotalPage());
}

System.out.println(">> beginPage : " + p.getBeginPage());
System.out.println(">> endPage : " + p.getEndPage());

//=========================
// 현재 페이지 기준으로 DB 데이터(게시글) 가져오기

// 데이터를 화면에 표시(출력)
pageContext.setAttribute("pvo", p); //페이지 관련 데이터
pageContext.setAttribute("cPage", cPage);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<script>
	function qna_write(frm) {
		frm.action = '${writeLoginLink}';
		frm.submit();
	}
</script>
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

	
	/*** 페이지 표시 영역 스타일(시작) ****/
 	.paging { list-style: none; }
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
		border-radius : 50%;
		padding: 3px 7px;
	} 
	a { text-decoration-line: none; color:black;}
	h3 {text-align:center;}
	.red{color:tomato;}
	.blue{color:blue;}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<table class="table">
		<thead>
			<tr class="table-primary">
				<th scope="col" width="5%">No</th>
				<th scope="col" width="15%">게시판</th>
				<th scope="col" width="70%">내용</th>
				<th width="20%"></th>
				<th width="20%"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr class="table-warning">
					<th scope="row">${vo.qNo }</th>
					<td><img src="../img/${vo.qOriname}" width="150px"
						height="150px"></td>
					<td>
				<a href="controller?type=view&qNo=${vo.qNo }&cPage=${pvo.nowPage}">
						${vo.qTitle } <br>
						${vo.qWriter } <br>
						${vo.qContent} <br>
					<span class="blue">	${vo.qDate} </span> <br>
				</a>
					</td>
					<td>조회수 ${vo.qHit}  </td>
					<td width="20%"></td>
					<td width="20%"></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<ol class="paging">
						<%-- [이전으로]에 대한 사용가능 여부 처리 --%>
						<c:if test="${pvo.beginPage == 1 }">
							<li class="disable">이전으로</li>
						</c:if>
						<c:if test="${pvo.beginPage != 1 }">
							<li><a
								href="controller?type=service&cPage=${pvo.beginPage - 1 }">이전으로</a>
							</li>
						</c:if>

						<%--블록내에 표시할 페이지 태그 작성(시작~끝 페이지) --%>
						<c:forEach var="pageNo" begin="${pvo.beginPage }"
							end="${pvo.endPage }">
							<c:if test="${pageNo == pvo.nowPage}">
								<li class="now">${pageNo }</li>
							</c:if>
							<c:if test="${pageNo != pvo.nowPage}">
								<li><a href="controller?type=service&cPage=${pageNo }">${pageNo }</a></li>
							</c:if>

						</c:forEach>

						<%-- [다음으로]에 대한 사용가능 여부 처리 --%>
						<c:if test="${pvo.endPage < pvo.totalPage }">
							<li><a
								href="controller?type=service&cPage=${pvo.endPage + 1 }">다음으로</a>
							</li>
						</c:if>
						<c:if test="${pvo.endPage >= pvo.totalPage }">
							<li class="disable">다음으로</li>
						</c:if>
					</ol>
				</td>
				<td>
					<form method="post" name="testForm">
						<input class="btn btn-success btn-sm btn-block" type="button" value="글쓰기" onclick="qna_write(this.form)">
					</form>
				</td>
			</tr>
		</tfoot>
	</table>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; shoppingmall</p>
		</footer>
	<%@ include file="footer.html" %>
</body>
</html>