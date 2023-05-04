<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
  <title>Da IT Sso ShoppingMall</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/styles.min.css" type="text/css">

  <link rel="stylesheet" href="assets/css/header.css" type="text/css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gaegu:wght@700&family=Gowun+Batang:wght@700&display=swap');

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

    p {
      margin: 0px;
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

    .italic {
      font-style: italic;
    }

    .bold {
      font-weight: bold;
    }

    .right {
      margin-left: auto;
      float: right;
      position: absolute;
      top: 0;
      right: 0;
      padding: 20px;
    }

    .container-fluid {
      padding: 10px;
    }

    .navbar {
      margin: 0;
    }

    /* footer */
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media ( min-width: 768px) {
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

    #id_suffix {
      padding: 0px;
    }
  </style>
</head>
<body>
<nav class="navbar <!-- navbar-expand-lg --> "
     style="background-color: #e3f2fd;">
  <a class="navbar-brand fs-1" href="/main">Da IT Sso</a>
  <button class="navbar-toggler" type="button"
          data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false"
          aria-label="Toggle navigation">
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
                                   href="/register/controller?type=registerForm">Edit</a>
        </c:if>
      <li class="nav-item fs-5"><a class="nav-link pink"
                                   href="/register/controller?type=registerForm">SignUp</a>
      </li>
      <li class="nav-item fs-5"><a class="nav-link pink" href="#">Cart</a>
      </li>
      <li class="nav-item fs-5"><a class="nav-link pink"
                                   href="/services/controller?type=service">CS</a>
      </li>
    </ul>
  </div>
</nav>
<section class="py-4 py-xl-5">
  <div class="container">
    <div class="row mb-5">
      <div class="col-md-8 col-xl-6 text-center mx-auto">
        <h2 class="font-weight-bold">로그인</h2>
      </div>
    </div>
    <div class="row d-flex justify-content-center">
      <div class="col-md-6 col-xl-4">
        <div class="card">
          <div class="card-body text-center d-flex flex-column align-items-center">
            <div class="bs-icon-xl bs-icon-circle bs-icon-primary bs-icon my-4">
              <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16"
                   class="bi bi-person">
                <path
                  d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
              </svg>
            </div>
            <form action="/login/controller?type=loginCheck" method="post">
              <div class="mb-3"><input class="form-control" id="userId" name="userId" value="${empty cookie.id.value ? '' : cookie.id.value}" type="text" placeholder="아이디">
              </div>
              <div class="mb-3"><input class="form-control" id="password" name="password" type="password"
                                       placeholder="비밀번호"></div>
              <div class="mb-3">
                <button id="login_btn" class="btn btn-primary d-block w-100" type="submit" onclick="return loginCheck()">Log in
                </button>
              </div>
              <c:if test="${requestScope.result == '0'}">
              <div class="mb-3" id="login_warning">
                <span style="color: red;">아이디 비밀번호를 다시 한번 확인해주세요.</span>
              </div>
              </c:if>
              <div class="form-check text-center"><input name="rememberId" class="form-check-input" type="checkbox" id="rememberId"
                                                         value="true" ${empty cookie.id.value ? '' : 'checked'}><label
                class="form-check-label" for="rememberId">아이디 기억</label></div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container text-center d-flex float-none justify-content-sm-center align-items-sm-center"><a
    class="social-link" href="#" style="margin: 0px 5px;"><i class="fa fa-facebook social-link-icon"></i>
    <div class="social-link-effect"></div>
  </a><a class="social-link" href="#" style="margin: 0px 5px;"><i class="fa fa-twitter social-link-icon"></i>
    <div class="social-link-effect"></div>
  </a><a class="social-link" href="#" style="margin: 0px 5px;"><i class="fa fa-instagram social-link-icon"></i>
    <div class="social-link-effect"></div>
  </a><a class="social-link" href="#" style="margin: 0px 5px;"><i class="fa fa-github social-link-icon"></i>
    <div class="social-link-effect"></div>
  </a></div>
</section>

<script>
    $(document).ready(function () {
        $("#userId").focus();

        $("#login_btn").click(loginCheck);

    });

    function loginCheck() {
        if ($("#userId").val() == "") {
            alert("아이디를 입력해주세요.");
            $("#userId").focus();
            return false;
        }
        if ($("#password").val() == "") {
            alert("비밀번호를 입력해주세요.");
            $("#password").focus();
            return false;
        }
        return true;
        // const id = $("#userId").val();
        // const password = $("#password").val();
        //
        // $.ajax({
        //     type: 'POST',
        //     url: '/login/login',
        //     header: {
        //         'Content-Type': 'application/json'
        //     },
        //     dataType: 'text',
        //     data: {
        //         id: id,
        //         password: password
        //     },
        //     success: (data) => {
        //         console.log(data);
        //         if(data === 'Success') {
        //             $('#login_warning').attr('hidden', 'hidden');
        //             sessionStorage.setItem("id", id);
        //             location.href = '/home';
        //         } else {
        //             $('#login_warning').removeAttr('hidden');
        //             $('#login_warning').html('<b style="font-size: 14px; color:red">[아이디 비밀번호를 다시 확인해주세요.]</b>');
        //         }
        //     },
        //     error: (status, error) => {
        //         console.log('통신 실패');
        //         console.log(status, error);
        //     }
        // });
    }
</script>
</body>
</html>