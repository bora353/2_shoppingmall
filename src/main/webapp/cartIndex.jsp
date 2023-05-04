<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="com.shoppingmall.dao.ProductDAO" scope="session"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세정보</title>

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

</style>
</head>
<body>


	<table>
	
		<tfoot>
			<tr>
				<td colspan="2">
					<div>
						<button class="btn btn-primary btn-sm btn-block" onclick="add()">장바구니
							담기</button>
						<button class="btn btn-primary btn-sm btn-block"
							onclick="cart_go()">장바구니 보기</button>
					</div>
				</td>
			</tr>
		</tfoot>
		


	</table>

	<script>
	//장바구니 담기
		function add() {
			location.href = "/cart/controller?type=cartInsert" ;//수정필요
		}
	
	//장바구니 보기
		function cart_go() {
			location.href = "/cart/controller?type=cartList"; //데이터 같이넣어줘야함
		}
	</script>
</body>
</html>