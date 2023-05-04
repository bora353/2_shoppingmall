<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 화면 샘플 - Bootstrap</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
  <style>
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
    #id_area {
      margin-bottom: 0;
    }
  </style>
</head>

<body>
<div class="container">
  <div class="row input-form-backgroud">
    <div class="col-md-12 mx-auto input-form">
      <h4 class="mb-3">회원가입</h4>
      <form action="/register/controller?type=join" method="post" onsubmit="return allCheck();">
        <div class="form-row">
          <div class="col-md-6 mb-3" id="id_area"><label for="userId">아이디</label><input id="userId" name="userId"
                                                                           class="form-control form-control"
                                                                           type="text"/>

          </div>
          <div class="col-md-6 mb-3" style="align-self: self-end;">
            <button id="id_btn" class="btn btn-primary" type="button">중복확인</button>
          </div>
          <div class="col-md-6 mb-3" style="text-align: center"><span id="id_warning" hidden="hidden"></span></div>

        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3"><label for="password1">비밀번호</label><input id="password1"
                                                                               name="password1"
                                                                               class="form-control form-control"
                                                                               type="password"
                                                                               placeholder value
                                                                               required/>

          </div>
        </div>
        <div class="row">
          <div id="password1_warning" class="col-md-6 mb-3" style="text-align: center"><span></span>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3"><label for="password2">비밀번호 재확인</label><input id="password2"
                                                                                   class="form-control form-control"
                                                                                   type="password"
                                                                                   placeholder/>
          </div>
        </div>
        <div class="row">
          <div id="password2_warning" class="col-md-6 mb-3" style="text-align: center"><span></span>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3"><label for="userName">이름</label><input id="userName"
                                                                            name="userName"
                                                                            class="form-control form-control"
                                                                            type="text"
                                                                            placeholder/>
            </div>
          </div>
        <div class="row">
          <div id="userName_warning" class="col-md-6 mb-3" style="text-align: center" hidden="hidden"><span></span>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3 cellPhone"><label for="cellphone">전화번호</label><input id="cellphone"
                                                                               name="cellphone"
                                                                               class="form-control form-control"
                                                                               type="tel"
                                                                               placeholder/>
          </div>
          <div class="col-md-6 mb-3 cerNum" hidden="hidden"><label for="cerNum">전화번호</label><input id="cerNum"
                                                                               name="cerNum"
                                                                               class="form-control form-control"
                                                                               type="text"
                                                                               placeholder="인증번호를 입력해주세요."/>
          </div>
          <div class="col-md-6 mb-3 sendSms" style="align-self: self-end;" hidden="hidden">
            <button id="phoneNum_certification" class="btn btn-primary" type="button">전화번호 인증</button>
          </div>
          <div class="col-md-6 mb-3 btn_cerNum" style="align-self: self-end;" hidden="hidden">
            <button id="btn_certification" class="btn btn-primary" type="button">인증번호 입력</button>
          </div>
        </div>
        <div class="row">
          <div id="cellphone_warning" class="col-md-6 mb-3" style="text-align: center" hidden="hidden"><span></span>

          </div>
          <div id="certification_warning" class="col-md-6 mb-3" style="text-align: center" hidden="hidden"><span></span>
          </div>
        </div>
        <div class="mb-3"><label>성별</label>
          <div class="form-check"><input name="gender" id="man" class="form-check-input"
                                         type="radio" value="0"/><label
              class="form-check-label" for="man">남</label></div>
          <div class="form-check"><input name="gender" id="woman" class="form-check-input"
                                         type="radio"
                                         value="1"/><label class="form-check-label"
                                                           for="woman">여</label></div>
          <div id="gender_warning" hidden="hidden"><span></span></div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3" style="width: 50%;"><label for="Email">이메일</label><input
              id="email" name="email"
              class="form-control form-control"
              type="email"
              placeholder="you@example.com"
              required/>
          </div>
<%--          <div class="col-md-6 mb-3" style="align-self: self-end;">--%>
<%--            <button class="btn btn-primary" type="button">이메일 인증</button>--%>
<%--          </div>--%>
        </div>
        <div class="row">
          <div id="email_warning" class="col-md-6 mb-3" style="text-align: center" hidden="hidden"><span></span>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3"><label>생년월일</label>
            <div class="d-flex">
              <select class="form-control" id="year" name="year">
              </select>
              <select class="form-control" id="month" name="month">
              </select>
              <select class="form-control" id="day" name="day">
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div id="birth-warning" class="col-md-6 mb-3" style="text-align: center" hidden="hidden"><span></span>
          </div>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3"><label for="introduction">자기소개</label>
            <textarea
                class="form-control" id="introduction" name="introduction"></textarea>
          </div>
        </div>
        <div class="row">
          <div id="introduction_warning" class="col-md-6 mb-3" style="text-align: center" hidden="hidden"><span></span>
          </div>
        </div>
        <div class="mb-3"><label for="member_post">우편번호</label><input id="member_post"
                                                                      name="address"
                                                                      class="form-control form-control"
                                                                      type="text"
                                                                      placeholder="우편번호"/>
        </div>
        <div class="form-row">
          <div class="col-md-6 mb-3"><label for="member_addr">주소</label><input id="member_addr"
                                                                               name="address"
                                                                               class="form-control form-control"
                                                                               type="text"
                                                                               placeholder
                                                                               value/>
          </div>
        </div>
        <div class="mb-3">
          <label>상세주소<span
              class="text-muted"></span></label>
          <input
              id="detailed_address" class="form-control form-control" type="text"
              name="address"
              placeholder="상세주소를 입력해주세요."/></div>
        <div class="email_warning" id="address_warning" hidden="hidden"><span></span></div>
        <hr class="mb-4"/>
        <div class="custom-control custom-checkbox"><input id="gether_agree"
                                                           name="gether_agree"
                                                           class="custom-control-input"
                                                           type="checkbox" required/><label
            class="custom-control-label" for="gether_agree">개인정보 수집 및 이용에 동의합니다.</label></div>
        <div class="mb-4"></div>
        <button class="btn btn-primary btn-block btn-lg" type="submit" id="submit_btn">가입 완료
        </button>
      </form>
    </div>
  </div>
  <footer class="text-center my-3 text-small">
    <p class="mb-1">© 2021 YD</p>
  </footer>
</div>
<script>
  //각 입력값들의 유효성 검증을 위한 정규표현식을 변수로 선언.
  // [허용문자], {최소문자길이, 최대 문자길이}
  const idRegExp = RegExp(/^[a-zA-Z0-9]{4,14}$/);

  // 숫자가 먼저오고 뒤에 특수문자가 옴 or 특수문자가 먼저오고 숫자가 옴 2가지 방법으로 제약 사항 설정
  const pwdRegExp = RegExp(
      /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);

  // 한글만 허용
  const nameRegExp = RegExp(/^[가-힣]+$/);

  const cellPhoneRegExp = RegExp(/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/);

  // 계정@도메인.최상위도메인' 형식의 데이터를 찾는 정규표현식
  const emailRegExp = RegExp(/^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/);

  let idChk = false, pwd1Chk = false, pwd2Chk = false, nameChk = false, cellphoneChk = false,
      genderChk = false, emailChk = false, birthChk = false, introductionChk = false,
      addressChk = false, getherChk = false;

  let timer = null;
  let isRunning = false;

  $(document).ready(() => {
    setDateBox();

    $("#id_btn").click(check_id);
    $("#userId").keyup(() => {
      idChk = false;
    });

    $('#password1').change(check_pwd1);
    $('#password1').keyup(check_pwd1);

    $('#password2').change(check_pwd2);
    $('#password2').keyup(check_pwd2);

    $('#userName').keyup(check_userName);

    $('#cellphone').keyup(check_cellphone);

    $('input[name=gender]').click(() => {
      genderChk = true;
    });
    $('#email').change(check_email);

    $('#year,#month,#day').change(check_date);

    $('#introduction').keyup(check_introduction);

    $('#member_post, #member_addr').click(findArr);

    $('#member_post, #member_addr, #detailed_address').change(checkAddr);

    // $('#phoneNum_certification').click(sendSms)

    $('#gether_agree').change(() => {
      if ($('#gether_agree').is(':checked')) {
        getherChk = true;
        $('#submit_btn').attr('disabled', false);
      } else {
        $('#submit_btn').attr('disabled', true);
        getherChk = false;
      }
    });

    function setDateBox() {
      let dt = new Date();
      let month = dt.getMonth();

      $("#year").append("<option value=''>년</option>");
      for (let i = dt.getFullYear(); i >= dt.getFullYear() - 120; i--) {
        $("#year").append("<option value='" + i + "'>" + i + " 년" + "</option>");
      }

      $("#month").append("<option value=''>월</option>");
      for (let i = 1; i <= 12; i++) {
        $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
      }

      $("#day").append("<option value=''>일</option>");
    }

    $("#month").change(() => {
      let dt = new Date();
      let month = $("#month").val();
      let year = $('#year').val();

      let lastDate = new Date(year, month, 0).getDate();

      for (let i = 1; i <= lastDate; i++) {
        $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
      }
    });

    function check_id() {
      if ($("#userId").val() === '') {
        $('#id_warning').removeAttr('hidden');
        $('#id_warning').html('<b style="font-size: 14px; color:red">[아이디는 필수 정보입니다.]</b>');

        idChk = false;
      } else if (!idRegExp.test($("#userId").val())) {
        $('#id_warning').removeAttr('hidden');
        $('#id_warning').html(
            '<b style="font-size: 14px; color: red">[영문과 숫자 조합으로 4~14자 조합해주세요.]</b>')

        idChk = false;
      } else {
        const checkId = $("#userId").val();

        $.ajax({
          type: 'POST',
          url: '/register/checkId',
          header: {
            'Content-Type': 'application/json'
          },
          dataType: 'text', // 서버로 부터 응답받을 데이터의 형태
          data: {checkId: checkId}, // 사용자가 입력한 id 데이터를 서버로 전송
          success: (data) => {

            if (data === 'Available') {
              $('#id_warning').removeAttr("hidden");
              $('#id_warning').html(
                  '<b style="font-size: 14px; color: blue">[사용 가능합니다.]</b>');

              idChk = true;
            } else {
              $('#id_warning').html('<b style="font-size: 14px; color: red">[아이디가 중복되었습니다.]</b>');
              idChk = false;
            }
          },
          error: (status, error) => {
            console.log('통신 실패');
            console.log(status, error);
          }
        });
      }
    }

    function check_pwd1() {
      if ($('#password1').val() === '') {
        $('#password1_warning').removeAttr('hidden', 'hidden');
        $('#password1_warning').html('<b style="font-size: 14px; color:red">[비밀번호는 필수 정보입니다.]</b>');
        pwd1Chk = false;
      } else if (!pwdRegExp.test($('#password1').val()) || $('#password1').val().length < 8) {
        $('#password1_warning').removeAttr('hidden');
        $('#password1_warning').html(
            '<b style="font-size: 14px; color:red">[비밀번호는 특수문자 포함 8자 이상입니다.]</b>');
        pwd1Chk = false;
      } else {
        $('#password1_warning').attr('hidden', 'hidden');
        pwd1Chk = true;
      }
    }

    function check_pwd2() {
      if ($('#password2').val() === '') {
        $('#password2_warning').removeAttr('hidden', 'hidden');
        $('#password2_warning').html('<b style="font-size: 14px; color:red">[비밀번호는 필수 정보입니다.]</b>');
        pwd2Chk = false;
      } else if ($('#password2').val() !== $('#password1').val()) {
        $('#password2_warning').removeAttr('hidden', 'hidden');
        $('#password2_warning').html(
            '<b style="font-size: 14px; color:red">[입력한 비밀번호가 일치하지 않습니다.]</b>');
      } else {
        $('#password2_warning').attr('hidden', 'hidden');
        pwd2Chk = true;
      }
    }

    function check_userName() {
      console.log($('#userName').val());
      if ($('#userName').val() === '') {
        $('#userName_warning').removeAttr('hidden', 'hidden');
        $('#userName_warning').html('<b style="font-size: 14px; color:red">[이름은 필수 정보입니다.]</b>');
      } else if (!nameRegExp.test($('#userName').val())) {
        $('#userName_warning').removeAttr('hidden', 'hidden');
        $('#userName_warning').html('<b style="font-size: 14px; color:red">[한글 이름을 입력해주세요.]</b>');
      } else {
        $('#userName_warning').attr('hidden', 'hidden');
        nameChk = true;
      }
    }

    function check_cellphone() {
      if ($('#cellphone').val() === '') {
        $('#cellphone_warning').removeAttr('hidden', 'hidden');
        $('#cellphone_warning').html('<b style="font-size: 14px; color:red">[휴대전화는 필수 정보입니다.]</b>');
        cellphoneChk = false;
        $('.sendSms').attr('hidden', 'hidden');
      } else if (!cellPhoneRegExp.test($("#cellphone").val())) {
        $('#cellphone_warning').removeAttr('hidden', 'hidden');
        $('#cellphone_warning').html(
            '<b style="font-size: 14px; color: red">[올바른 형식의 휴대폰 번호를 입력해주세요.]</b>')
        let text = $('#cellphone').val();
        text = text.replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g,
            "$1-$2-$3").replace(/(\-{1,2})$/g, "");
        $('#cellphone').val(text);
        cellphoneChk = false;
        // $('.sendSms').attr('hidden', 'hidden');
      } else {
        $('#cellphone_warning').attr('hidden', 'hidden');
        // $('.sendSms').removeAttr('hidden');
        cellphoneChk = true;
      }
    }

    function check_email() {
      if ($('#email').val() === '') {
        $('#email_warning').removeAttr('hidden', 'hidden');
        $('#email_warning').html('<b style="font-size: 14px; color:red">[이메일은 필수 정보입니다.]</b>');
        emailChk = false;
      } else if (!emailRegExp.test($("#email").val())) {
        $('#email_warning').removeAttr('hidden', 'hidden');
        $('#email_warning').html(
            '<b style="font-size: 14px; color: red">[올바른 형식의 이메일을 입력해주세요.]</b>')
        emailChk = false;
      } else {
        $('#email_warning').attr('hidden', 'hidden');
        emailChk = true;
      }
    }

    function check_date() {
      if ($('#year').val() === '') {
        $('#birth-warning').removeAttr('hidden', 'hidden');
        $('#birth-warning').html('<b style="font-size: 14px; color:red">[태어난 년도를 선택해주세요.]</b>');
        birthChk = false;
      }

      if ($('#month').val() === '') {
        $('#birth-warning').removeAttr('hidden', 'hidden');
        $('#birth-warning').html('<b style="font-size: 14px; color:red">[태어난 월을 선택해주세요.]</b>');
        birthChk = false;
      }

      if ($('#day').val() === '') {
        $('birth-warning').html('<b style="font-size: 14px; color:red">[태어난 날짜를 선택해주세요.]</b>');
        $('#birth-warning').removeAttr('hidden', 'hidden');
        birthChk = false;
      }

      if ($('#year').val() !== '' && $('#month').val() !== '' && $('#day').val() !== '') {
        $('#birth-warning').attr('hidden', 'hidden');

        birthChk = true;
      }
    }

    function check_introduction() {
      if ($('#introduction').val() === '') {
        $('#introduction_warning').removeAttr('hidden', 'hidden');
        $('#introduction_warning').html('<b style="font-size: 14px; color:red">[자기소개를 입력해주세요]</b>');
        introductionChk = false;
      } else {
        $('#introduction_warning').attr('hidden', 'hidden');
        introductionChk = true;
      }
    }

    function findArr() {
      new daum.Postcode({
        oncomplete: function (data) {
          console.log(data);
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var jibunAddr = data.jibunAddress; // 지번 주소 변수
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('member_post').value = data.zonecode;
          if (roadAddr !== '') {
            document.getElementById("member_addr").value = roadAddr;
          } else if (jibunAddr !== '') {
            document.getElementById("member_addr").value = jibunAddr;
          }
        }
      }).open();
    }

    function checkAddr() {
      if ($('#member_post').val() === '') {
        $('#address_warning').html('<b style="font-size: 14px; color:red">[주소는 필수항목입니다.]</b>');
        addressChk = false;
      } else if ($('#member_addr').val() === '') {
        $('#address_warning').html('<b style="font-size: 14px; color:red">[주소는 필수항목입니다.]</b>');
        addressChk = false;
      } else if ($('#detailed_address').val() === '') {
        $('#address_warning').html('<b style="font-size: 14px; color:red">[주소는 필수항목입니다.]</b>');
        addressChk = false;
      } else {
        $('#address_warning').attr('hidden', 'hidden');
        addressChk = true;
      }
    }

    // 타이머 시작
    // function startTimer(count, display) {
    //   let minutes, seconds;
    //
    //   timer = setInterval(function() {
    //     minutes = parseInt(count / 60, 10);
    //     seconds = parseInt(count % 60, 10);
    //
    //     minutes = minutes < 10 ? "0" + minutes : minutes;
    //     seconds = seconds < 10 ? "0" + seconds : seconds;
    //
    //
    //     $('#certification_warning').html('<b style="font-size: 14px; color:red">' + minutes + ":" + seconds + '</b>');
    //
    //
    //     if(--count < 0) {
    //       clearInterval(timer);
    //       alert('시간초과');
    //       $("#btn_certification").attr("disabled", true);
    //       isRunning(false);
    //     }
    //   }, 1000);
    //   isRunning = true;
    // } // 타이머

    //핸드폰 인증 문자 보내기
    //
    //   function sendSms() {
    //     const phoneNumber = $('#cellphone').val().replaceAll('-', '');
    //
    //     $.ajax({
    //       type: 'POST',
    //       url: '/check/sendSMS',
    //       header: {
    //         'Content-Type': 'application/json'
    //       },
    //       dataType: 'application/json', // 서버로 부터 응답받을 데이터의 형태
    //       data: JSON.stringify(
    //           {phoneNumber: phoneNumber}
    //       ), // 사용자가 입력한 id 데이터를 서버로 전송
    //       success: (data) => {
    //
    //         console.log(data);
    //         $('.cellPhone').attr('hidden', 'hidden');
    //         $('.cerNum').removeAttr('hidden');
    //         $('.sendSms').attr('hidden', 'hidden');
    //         $('.btn_cerNum').removeAttr('hidden');
    //
    //         let display = $('#certification_warning');
    //         let leftSec = 180;
    //
    //         if(isRunning) {
    //         } else {
    //           startTimer(leftSec, display);
    //           $('#certification_warning').removeAttr('hidden');
    //         }
    //
    //       },
    //       error: (status, error) => {
    //         console.log('통신 실패');
    //         console.log(status, error);
    //       }
    //     });
    //   }


  });

  function allCheck() {
    if (idChk === false) {
      alert('아이디를 확인해주세요.');
      return false;
    }
    if (pwd1Chk === false) {
      alert('비밀번호를 입력해주세요.');
      return false;
    }
    if (pwd2Chk === false) {
      alert('재확인 비밀번호를 입력해주세요.');
      return false;
    }
    if (nameChk === false) {
      alert('이름을 입력해주세요.');
      return false;
    }
    if (cellphoneChk === false) {
      alert('올바른 형식의 전화번호를 입력해주세요.');
      return false;
    }

    if (genderChk === false) {
      alert('성별을 선택해주세요.');
      return false;
    }

    if (emailChk === false) {
      alert('이메일을 입력해주세요.');
      return false;
    }

    if (birthChk === false) {
      alert('생년월일을 입력해주세요.');
      return false;
    }
    if (introductionChk === false) {
      alert('자기소개를 입력해주세요.');
      return false;
    }

    if (addressChk === false) {
      alert('주소를 입력해주세요.');
      return false;
    }

    if (getherChk === false) {
      alert('약관에 동의해주세요.');
      return false;
    }
  };
</script>
</body>
</html>