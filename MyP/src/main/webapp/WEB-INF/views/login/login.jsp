<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<link rel="stylesheet" href="resources/css/font.css">
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script><!--추가-->
<script src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<script src="resources/js/login.js"></script>
</head>

<body>
<div class="wrap">
   <h1 class="logo" id="logo"></h1>
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
       <a id="kakaBtn" class="kakao p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=764066383a16f05dde4e4f4106cfdc9f&redirect_uri=http://localhost:8090/MyP/kakaoLogin&response_type=code">
      <div class="kakao_i"></div>
      <div class="kakao_txt">카카오톡으로 간편로그인 </div>
   </a>
</div>
</body>
</html>