<%@ page import="com.shoppingmall.vo.QnaVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    QnaVO qvo = (QnaVO) session.getAttribute("qvo");
    response.sendRedirect("controller?type=view&qNo=" + qvo.getqNo());
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