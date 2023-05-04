<%@page import="com.shoppingmall.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	System.out.println(request.getRequestURI());

	ReviewVO vo_s = (ReviewVO)session.getAttribute("vo_s");
			System.out.println(vo_s);
	response.sendRedirect("/product/controller?type=view&reviewIdx="+vo_s.getReviewIdx());
	//response.sendRedirect("controller?type=view&reviewIdx="+vo_s.getReviewIdx()+"&cPage=${pvo.nowPage}");
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