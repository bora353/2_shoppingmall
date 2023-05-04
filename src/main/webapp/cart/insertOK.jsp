<%@ page import="com.shoppingmall.vo.ProductVO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%
  ProductVO productVO = (ProductVO) session.getAttribute("vo");
  int pIdx = productVO.getpIdx();
  int nPage = (int)session.getAttribute("nPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>InsertOK</title>
<script>
alert("장바구니 담기 완료!");
location.href = "/product/controller?type=productViewMain&pIdx=<%=pIdx%>&nowPage=<%=nPage%>";
</script>
</head>
<body>

</body>
</html>