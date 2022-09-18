<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/popup.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script><!--추가-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<script src="resources/js/login.js"></script>
</head>

<body>
<div class="wrap">
   <h1 class="logo">
      <a href="/test2/index.html">
      </a>
     </h1>
   <div class="title">로그인</div>
   <form action="#" id="actionForm" >
   <div class="input_box">
      <input type="text" name="id" id="id" maxlength="20"  placeholder="아이디"/>
   </div>
   <div class="input_box">
      <input type="password" name="pw" id="pw"  maxlength="20"  placeholder="비밀번호"/>
   </div>
   </form>
   <div  class="loginBtn_wrap">
      <input type="button" id="loginBtn"  value="로그인" />
   </div>
   <div class="btn_bottom">
      <div id="join">회원가입</div>
      <div id="idFind">아이디 찾기</div>
      <div id="pwFind">비밀번호 찾기</div>
   </div>
   <hr/>
   <div class="kakao">
      <div class="kakao_i"></div>
      <div class="kakao_txt">카카오톡으로 간편로그인 </div>
   </div>
</div>
</body>
</html>