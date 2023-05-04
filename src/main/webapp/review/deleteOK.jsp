<%@ page import="com.shoppingmall.vo.ProductVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
				 pageEncoding="UTF-8"%>
<%
	System.out.println(request.getRequestURI());
	ProductVO productVO = (ProductVO) session.getAttribute("vo");
	int nowPage = (int)session.getAttribute("nPage");
	int pIdx = productVO.getpIdx();
	response.sendRedirect("/product/controller?type=productViewMain&pIdx=" + pIdx + "&nowPage=" + nowPage);
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