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
alert("��ٱ��� ��� �Ϸ�!");
location.href = "/product/controller?type=productViewMain&pIdx=<%=pIdx%>&nowPage=<%=nPage%>";
</script>
</head>
<body>

</body>
</html>