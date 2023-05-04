<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 전달받은 데이터(pnum)을 사용해서 장바구니(cart)에 삭제처리 후 
	장바구니(cart)에서 제외(삭제)하고 장바구니보기 페이지로 이동   --%>


	
<%
	response.sendRedirect("controller?type=cartList");
%>

