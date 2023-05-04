<%@page import="com.shoppingmall.vo.CartVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.shoppingmall.vo.ProductVO"%>
<%@page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.html" %> 
<%-- 장바구니(cart)에 있는 제품목록을 화면에 표시 --%>
<%-- <jsp:useBean id="cart" class="com.shoppingmall.vo.Cart" scope="session" />
<c:set var="list" value="${cart.getList()}" /> --%>


<%
// 현재 날짜 구하기
Date date = new Date();
SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
String strdate = simple.format(date);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니(cart)보기</title>

<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/data_table.css" rel="stylesheet" type="text/css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Gaegu:wght@700&family=Gowun+Batang:wght@700&display=swap"
	rel="stylesheet">



<!--스타일적용  -->

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

<!--
=============================================
-->
tfoot {
	font-size: 1.5em;
	color: #0099a4;
}

tr td, h2, h3 {
	text-align: center;
	vertical-align: middle;
}

.red {
	color: red;
}

.blue {
	color: blue;
}
</style>
</head>
<body>

	<table class="table">
		<thead>
			<tr class="table-primary">
				<td colspan="6"><h1>장바구니</h1></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td>제품명</td>
				<td>제품단가</td>
				<td>제품수량</td>
				<td>제품금액</td>
				<td>삭제</td>
			</tr>

		</thead>
		<tbody>
			<c:forEach var="vo" items="${cart_list}">
				<tr class="table-warning">
					<td>
					<img src="../img/${vo.oriName}" width="70px" height="70px">
					</td>
					<td>${vo.product }<br> <span class="blue"><%=strdate%> 도착 예정</span>
					</td>
					<td>정가 : ${vo.price }</td>
					<td>
						<form action="editQuant.jsp" method="get">
						
						
						<c:if test="${vo.quant eq 1}">
						
							<input type="button" id="minus" value="-" class="btn btn-secondary">
							
						
						</c:if>
						<c:if test="${vo.quant ne 1}">
						
							<input type="button" id="minus" value="-" class="btn btn-warning"
							onclick="location.href='plusMinusController?type=minus&pIdx=${vo.pIdx}&userIdx=${vo.userIdx}&cartIdx=${vo.cartIdx}'">
							
						
						</c:if>
						
						
							<span id="quant">${vo.quant }</span>
							
							<!--ajax 나중에!! <input type="button" id="plus" value="+" class="btn btn-warning"> -->
					
					
					 <input type="button" id="plus" value="+" class="btn btn-warning"
							onclick="location.href='plusMinusController?type=plus&pIdx=${vo.pIdx}&userIdx=${vo.userIdx}&cartIdx=${vo.cartIdx}'">
							
							
							<!--   <input type="hidden" name="cartIdx" value="${vo.cartIdx}"> -->
						</form>
					</td>
					<td><span id="totalPrice">${vo.totalPrice }</span></td>
					<td><button onclick="delProduct('${vo.pIdx}')"
							class="btn btn-danger btn-sm btn-block">삭제</button></td>
				</tr>


<!-- ============================================================================== -->
	 <script>
	//장바구니 삭제
		function delProduct(pnum) {
			let isDelete = confirm("정말 삭제하시겠습니까?");
			if (isDelete){
				location.href = "controller?type=deleteCart&cartIdx=" + ${vo.cartIdx};
				frm.submit();
			} else {
				history.go(0);  //삭제 취소하고 이전페이지(상세보기) 이동
			}
		}
	
	
		// 제품수량 변경 PLUS
/*  	    $("#plus").click(function(){
	    	//alert("클릭");
	    	  
	     	$.ajax({
				url: "http://localhost:8080/shoppingmall/cart/plusMinusController",
	            type: "POST",
	            dataType:'json',  
	            
	            data: {
	            	pIdx : ${vo.pIdx}, 
	            	userIdx :  ${vo.userIdx},
	            	cartIdx : ${vo.cartIdx}
	            },
	            success: function(data) {
	            	console.log(data);
	            	console.log(data[0]);
	            	console.log(data[1]);
	            	console.log(data[2]);
	            	
	            	$("#quant").html(data[0]);
	            	$("#totalPrice").html(data[1]);
	            	$("#cartTotal").html(data[2]);
	            	
	            },
	            error : function(){
					alert("Ajax 클릭 실패!!!");
				}
			})
	    	
	    });
*/	   
	    
	</script> 
<!-- ============================================================================== -->


 </c:forEach> 
 
 
 	<%
 	List<CartVO> cart_list = (List<CartVO>)request.getAttribute("cart_list");
	
	
	//int cartCount = (int)request.getAttribute("cartCount");
	
	int cartTotal = 0;
	
	System.out.println("test : "+cart_list);
	
	for(CartVO vo : cart_list){
		cartTotal += vo.getTotalPrice();
	}
	System.out.println(cartTotal); 
	
	request.setAttribute("cartTotal", cartTotal);
	
%>	


			<%-- 등록된 제품이 없는 경우 --%>
			<c:if test="${empty cart_list}">
				<tr>
					<td colspan="6" class="red">장바구니가 비었어유 ~</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6"><h3>
				
			
				
					** 총 결재금액 : <span class="red" id="cartTotal"><%=cartTotal %></span> 원 **
					</h3></td>
			</tr>
			<%-- </c:forEach> --%>
		</tfoot>
	</table>
	
</body>
</html>
<%@ include file="../footer.html" %> 
