<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyP</title>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/font.css">
<script src="resources/jquery/jquery-1.12.4.js"></script>
    
<style>
* {
	font-family: 'TmoneyRoundWindRegular';
}

.wrap {
	width: 490px;
	height: 340px; /* 공통 X */
	padding: 40px 20px 20px 20px;
	background-color: #f5f6f7;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 30px;
	box-sizing: border-box;
}

.logo {
	width: 280px;
	height: 110px;
	background: url('resources/icons/logo8.png') no-repeat;
	background-size: 100%;
	background-position: 50%;
	position: absolute;
	top: -80px;
	left: 50%;
	transform: translate(-50%, -50%);
}

a {
	width: 280px;
	height: 110px;
	display: block;
}

.title {
	margin: 0 auto;
	width: 240px;
	height: 44px;
	text-align: center;
	font-size: 25px;
	background-repeat: no-repeat;
	background-position: 0 0;
	background-size: 240px auto;
	margin-bottom: 20px;
}

.result_text {
	margin: 50px 0 20px 0;
	padding: 10px;
	text-align: center;
}

#loginBtn {
	margin-top: 15px;
	height: 60px;
	border: solid 1px #00af80;
	text-align: center;
	background: #00af80;
	color: white;
	font-size: 18px;
	box-sizing: border-box;
	border-radius: 5px;
	cursor: pointer;
	width: 450px;
}

.btn_bottom {
	margin-top: 20px;
	text-align: center;
	font-size: 14px;
	cursor: pointer;
}

.btn_bottom:hover {
	text-decoration: underline;
}
</style>
<script type="text/javascript">
$("#loginBtn").on("click", function(){
	location.href = "login";
});
$("#pwFind").on("click", function(){
	location.href = "pwFind";
});
</script>
</head>
<body>
<input type="hidden" name="email" id="email" value="${param.email}"/>
	<div class="wrap">
		<h1 class="logo">
			<a href="/test2/index.html"> </a>
		</h1>
		<div class="title">아이디 찾기 완료</div>
		<div class="result_text">
			고객님의 아이디 <span class="result"><c:out value="${fn:substring(data.ID, 0, fn:length(data.ID) - 3)}" />***</span> 입니다.
		</div>
		<div>
			<button type="submit" id="loginBtn">로그인하기</button>
		</div>
		<div class="btn_bottom" id="pwFind">
			<span>비밀번호 찾기</span>
		</div>
	</div>
</body>
</html>