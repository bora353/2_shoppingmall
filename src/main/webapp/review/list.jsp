<%@page import="com.shoppingmall.http.dao.ReviewDAO"%>
<%@page import="com.shoppingmall.paging.Paging"%>
<%@page import="com.shoppingmall.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
System.out.println(request.getRequestURI());
%>

<%@ include file="header.html" %>




<!-- ============================================================================= -->
	<table class="table">
		<h3>총 상품평 : ${count }건</h3>

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
					onclick="location.href='write.jsp'"
					class="btn btn-danger btn-sm btn-block"> <input
					type="button" value="베스트순"
					onclick="location.href='controller?type=reviewList&order=1'"
					class="btn btn-info btn-sm"> <input type="button"
					value="최신순"
					onclick="location.href='controller?type=reviewList&order=2'"
					class="btn btn-info btn-sm"></td>
				<td></td>
			</tr>


			<c:forEach var="reviewVO" items="${list}">
				<tr class="table-warning">
					<th scope="row">${reviewVO.reviewIdx}</th>
					<td><img src="../img/${reviewVO.oriName}" width="150px"
						height="150px"></td>
					<td><a
						href="controller?type=view&reviewIdx=${reviewVO.reviewIdx }&cPage=${pvo.nowPage}">
							${sessionScope.user.userName}<br> <c:forEach begin="1"
								end="${reviewVO.star }">
								<i class="bi bi-star-fill red"></i>
							</c:forEach> <span class="blue">${reviewVO.writeDate}</span><br> 
							<span class="italic gray bold" >${vo.product}</span><br>
							${reviewVO.subject}<br> 내용${reviewVO.content}<br>
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


<%@ include file="footer.html" %>