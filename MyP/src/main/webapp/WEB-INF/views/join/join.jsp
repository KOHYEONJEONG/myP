<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/join.css?after">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!--추가-->
<script src="resources/js/main.js"></script>
<script src="resources/js/join.js"></script>

</head>
<body>
	<div class="wrap">
		<h1 class="logo">
			<a href="/test2/index.html"> </a>
		</h1>
		<form action="#" class="was-validated" name="form" id="joinform" method="post">
			<input type="hidden" name="cert" id="cert" >
			
			<div class="title">회원가입</div>
			<div class="id_input">
				<input type="text" name="id" placeholder="아이디" id="id" required><br>
				<br>
			</div>

			<span class="id_status"></span> 


			<div class="pwd_input">
				<input type="password" name="pwd" placeholder="비밀번호" id="pwd" required><br>
				<br> 
			</div>
			
			<span class="" id="pw_ck_status"></span>
				
			<div class="rePw_input">
				<input type="password" id="rePw" placeholder="비밀번호 재확인"><br>
				<br> 
			</div>
			
			<span class="pwck_input_re_1">비밀번호가 일치합니다.</span> 
			<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			
			<div class="nm_input">
				<input type="text" name="nickname" id="nickname" placeholder="닉네임"><br>
				<br>
			</div>
			<div class="df">
				<div class="input_box2">
					<input type="text" name="account" id="account">
				</div>
				<div class="a">@</div>
				<div class="input_box2">
					<select class="form-control" name="domain" id="domain">
						<option>직접입력</option>
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>hanmail.net</option>
						<option>daum.net</option>
					</select>
				</div>
				<button class="join_btn" type="button" id="mail-Check-Btn">
					인증번호<br/>전송
				</button>
				<br>
				<br>
			</div>
			<span class="mail_input_box_warn"></span>
			<div class="df">
				<div class="input_box3">
					<input type="number" name="inj" id="inj" placeholder="인증번호" maxlength="6">
				</div>
				<button class="join_btn" type="button">확인</button>
				<br>
				<br>
			</div>

			<span class="mail-check-warn"></span>

			<div>
				<div class="sign_up" id="joinBtn">가입하기</div>
			</div>
		</form>
	</div>
</body>
</html>