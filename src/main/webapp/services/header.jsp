<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<c:set var="loginOutLink"
       value="${sessionScope.id==null ? '/login/controller?type=loginForm' : '/login/controller?type=logOut'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? 'Login' : 'Logout'}"/>
<c:set var="cartLink"
       value="${empty sessionScope.id ? '/login/controller?type=loginForm' : '/cart/controller?type=cartList'}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<title>list.jsp</title>

<!-- 제이쿼리 사용 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

/*** 페이지 표시 영역 스타일(시작) ****/
.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	/* border: 1px solid #00B3DC; */
	font-weight: bold;
	color: black;
}

.paging .disable {
	color: #aaa;
}

.paging .now {
	background-color: pink;
	border-radius: 50%;
	padding: 3px 7px;
}

a {
	text-decoration-line: none;
	color: black;
}

h3 {
	text-align: center;
}

.red {
	color: tomato;
}
.blue {
	color: blue;
}
.pink {
	color: #FFAEBC;
}
.gray {
	color: gray;
}
.italic{
	font-style:italic;
}
.bold{
	font-weight: bold;
}
.right{
margin-left:auto;
	float:right;
	position: absolute;
	top: 0;
	right: 0;
	padding: 20px;
}
.container-fluid{
	padding : 10px;
}
.navbar{
	 margin-bottom : 35px; 
}

/* footer */
   .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }



</style>



</head>
<body>
<!-- ============================================================================= -->


<nav class="navbar <!-- navbar-expand-lg --> "  style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <a class="navbar-brand fs-1" href="/main">Da IT Sso</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

      <ul class="navbar-nav me-auto mb-2 mb-lg-0 right">
        <li class="nav-item fs-5"><a class="nav-link pink"
                                     aria-current="page" href="/main">Home</a></li>
        <li class="nav-item fs-5"><a class="nav-link pink" id="loginBtn"
                                     href="${loginOutLink}">${loginOut}</a>
        </li>
        <c:if test="${not empty sessionScope.id}">
        <li class="nav-item fs-5"><a class="nav-link pink"
                                     href="/register/controller?type=updateInfoForm">Edit</a>
          </c:if>
          <c:if test="${user.userType == 1}">
        <li class="nav-item fs-5"><a class="nav-link pink"
                                     href="/product/controller?type=productList">Admin</a>
          </c:if>
        <li class="nav-item fs-5"><a class="nav-link pink"
                                     href="/register/controller?type=registerForm">SignUp</a>
        </li>
        <li class="nav-item fs-5"><a class="nav-link pink" href="${cartLink}">Cart</a>
        </li>
        <li class="nav-item fs-5"><a class="nav-link pink"
                                     href="/services/controller?type=service">CS</a>
        </li>
      </ul>
    </div>
  </div>
</nav>


