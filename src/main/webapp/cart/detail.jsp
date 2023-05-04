<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<script>
	function cart_go(frm) {
		frm.action = "controller?type=cart";
		frm.submit();
	}
</script>
</head>
<body>
	<form method="post" name="detailPage">
		<input type="button" value="장바구니" onclick="cart_go(this.form)">
	</form>
</body>
</html>