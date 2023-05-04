<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- 구글 글씨체 -->
<style>
  @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gaegu:wght@700&family=Gowun+Batang:wght@700&display=swap');
*{
font-family: 'Dongle', sans-serif;
font-family: 'East Sea Dokdo', cursive;
font-family: 'Gaegu', cursive;
font-family: 'Gowun Batang', serif;
}


    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    /* 별점구현 */

.rating_box {
  display: flex;
}

.rating {
  position: relative;
  color: #ddd;
  font-size: 30px;
  text-align: center;
}

.rating input {
  position: absolute;
  left: 0;
  right: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  cursor: pointer;
}

.rating_star {
  width: 0;
  color: #ffc107;
  position: absolute;
  left: 0;
  right: 0;
  overflow: hidden;
  pointer-events: none;
}

</style>
</head>
<script>
	function all_search(frm) {
		frm.action = "services/controller?type=service"
		frm.submit();
	}
</script>
<body>
	<h1>고객센터</h1>
	<h1>작업선택[ center.jsp ]</h1>
	<form method="post" name="testForm">
		<input type="button" value="게시판보기" onclick="all_search(this.form)">
	</form>
</body>
</html>