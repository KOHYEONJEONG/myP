<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script><!--추가-->
       <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function() {
	$("#join").on("click", function() {
		location.href="join";
	});
});
</script>
<body>
<div class="wrap">
   <h1 class="logo">
      <a href="/test2/index.html">
      </a>
     </h1>
   <div class="title">로그인</div>
   <div class="input_box">
      <input type="text"  maxlength="20"  placeholder="아이디"/>
   </div>
   <div class="input_box">
      <input type="password"  maxlength="20"  placeholder="비밀번호"/>
   </div>
   <div  class="loginBtn_wrap">
      <input type="button" id="loginBtn"  value="로그인" />
   </div>
   <div class="btn_bottom">
      <div id="join">회원가입</div>
      <div>아이디 찾기</div>
      <div>비밀번호 찾기</div>
   </div>
   <hr/>
   <div class="kakao">
      <div class="kakao_i"></div>
      <div class="kakao_txt">카카오톡으로 간편로그인 </div>
   </div>
</div>
</body>
</html>