<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<link rel="stylesheet" href="resources/css/font.css">
<style type="text/css">

* {
	font-family: 'TmoneyRoundWindRegular';
	margin: 0;
	padding: 0;
}


html, body, main{
	width: 100%;
   	height: 100%;
}

.logo {
	width: 280px;
	height: 100px;
	background: url('resources/icons/logo8.png') no-repeat;
	background-size: 130%;
	background-position: 50%;
	position: absolute;
	top: -80px;
	left: 50%;
	transform: translate(-50%, -50%);
}

.wrap{
	width: 700px;
	height: 300px;
    padding: 40px 20px 20px 20px;
    background-color: #f5f6f7;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    border-radius: 30px;
    box-sizing: border-box;
    text-align: center;
    position: absolute;
   
}
.text {
	margin-bottom: 50px;
	font-size: 22px;
	line-height: 1.5;
}
.f { 
	display: flex;
	justify-content: space-evenly
}
.box {
	width: 130px;
    height: 80px;
    border: 1px solid #b4b1b1;
    line-height: 80px;
    text-align: center;
    cursor: pointer;
    background: #fff;
}

.box:hover {
font-weight: bold;
}


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script><!--추가-->
<script type="text/javascript">

$(document).ready(function() {
	$('#kakaoLogout').click(function() {
		$("#actionForm").submit();
	})
	
	$('#join').click(function() {
		$("#joinForm").submit();
	})


});
</script>
</head>
<body>
<form action="https://kauth.kakao.com/oauth/logout" id="actionForm" method="get">
	<input type="hidden" name="client_id" value="764066383a16f05dde4e4f4106cfdc9f" />
	<input type="hidden" name="logout_redirect_uri" value="http://localhost:8090/MyP/kakaoLogout" />
	<input type="hidden" name="code" value="${code}" />
</form>

<form action="join" id="joinForm" method="post">
</form>
<main>
<div class="wrap">
<h1 class="logo" id="logo"></h1>
<div class="text">간편로그인 회원정보가 존재하지 않습니다. <br /> 카카오톡 간편 로그인은 MyP 홈페이지 가입 후 이용이 가능합니다.</div>
	<div class="f">
		<div class="box" id="join">
			회원가입
		</div>
		<div class="box" id="kakaoLogout">
			카카오 로그아웃
		</div>
	</div>
</main>
</div>
</body>
</html>
