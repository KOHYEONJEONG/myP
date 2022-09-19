<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyP</title>
  <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/font.css">
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

#joinBtn {
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

</head>
<body>
	<div class="wrap">
		<h1 class="logo">
			<a href="/test2/index.html"> </a>
		</h1>
		<div class="title">아이디 찾기 완료</div>

		<div class="result_text">
			고객님의 아이디는 <span class="result">saehee***</span> 입니다.
		</div>
		<div>
			<button type="submit" id="joinBtn">로그인하기</button>
		</div>
		<div class="btn_bottom">
			<span>비밀번호 찾기</span>
		</div>
	</div>
</body>
</html>