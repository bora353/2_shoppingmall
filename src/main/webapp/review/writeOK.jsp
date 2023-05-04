<%@page import="com.shoppingmall.vo.ReviewVO, com.shoppingmall.vo.ProductVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	System.out.println(request.getRequestURI());
	ProductVO productVO = (ProductVO) session.getAttribute("vo");
	int nPage = (int) session.getAttribute("nPage");
	System.out.println("productVO = " + productVO);
	response.sendRedirect("/product/controller?type=productViewMain&pIdx="+productVO.getpIdx()+"&nowPage="+nPage);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>