<%@page import="com.shoppingmall.http.dao.ShoppingmallDAO"%>
<%@page import="com.shoppingmall.vo.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script>
	function cart_delete(frm) {
		frm.action = "controller?type=cartDelete";
		frm.submit();
	}
	if (pNum == 0) {
		location.href = "controller?type=cartDelete";
	}
</script>
<style>
	#list table td { padding: 25px; }
	tfoot { text-align: center; }
</style>
</head>
<body>
	<div id="list">
	<form method="post">
	<table>
		<caption>장바구니 목록</caption>
		<thead>
		<tr>
			<th colspan="2">상품</th>
			<th>가격</th>
			<th colspan="3">개수</th>
			<th>주문금액</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${list }">
		<tr>
			<td>
				<img src="./images/product.png" width="130" height="150">
			</td>
			<td>${vo.product }</td>
			<td>${vo.price }</td>
			<td>
				<input type="button" name="minus" value="-" onclick="numEdit(this.form)">
			</td>
			<td>${vo.pNum }</td>
			<td>
				<input type="button" name="plus" value="+" onclick="numEdit(this.form)">
			</td>
			<td>${vo.orderprice }</td>
			<td>
				<input type="button" name="cartDelete" value="상품 삭제" onclick="cart_delete(this.form)">
			</td>
			<td>
				<input type="hidden" name="cartIdx" value="${vo.cartIdx }">
				<input type="hidden" name="pNum" value="${vo.pNum }">
			</td>
		</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td>
					<input type="button" name="order" value="구매하기">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
	</div>
</body>
</html>