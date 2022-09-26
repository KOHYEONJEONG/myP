<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyP</title>
<link rel="stylesheet" href="resources/css/font.css">
<link rel="stylesheet" href="resources/css/join.css?after">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script> <!-- jquery사용하면 이 아래에다가 넣기!! -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<script src="resources/js/main.js"></script>
<script src="resources/js/join.js"></script>

</head>
<body>
	<div class="wrap">
		<h1 class="logo" id="logo"></h1>
		<form action="#" class="was-validated" name="form" id="joinform" method="post">
			<input type="hidden" name="cert" id="cert" >
			
			<div class="title">회원가입</div>
			<div class="id_input">
				<input type="text" name="id" placeholder="아이디" id="id" required><br>
			</div>
			<span id="id_status"></span> 
			<div class="pwd_input">
				<input type="password" name="pwd" placeholder="비밀번호" id="pwd" required  autocomplete="off"><br>
			</div>
			<span id="pw_ck_status"></span>
				
			<div class="rePw_input">
				<input type="password" id="rePw" placeholder="비밀번호 재확인"  autocomplete="off"><br>
			</div>
			<span id="repw_ck_status" style="font-size: 14px"></span>
			
			<div class="nm_input">
				<input type="text" name="nickname" id="nickname" placeholder="닉네임"><br>
			</div>
			
			<span class="nickname_status"></span>
			
			<div class="df">
				<div class="input_box2">
					<input type="text" name="account" id="account" placeholder="이메일">
				</div>
				<div class="a">@</div>
				<div class="input_box2">
					<select class="form-control" name="domain" id="domain">
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>hanmail.net</option>
						<option>daum.net</option>
						<option>nate.com</option>
					</select>
				</div>
				<button class="join_btn" type="button" id="mail-Check-Btn">
					인증번호<br/>전송
				</button>
				<br>
				<br>
			</div>
			<span class="mail_input_box_warn" style="font-size: 14px"></span>
			<div class="df">
				<div class="input_box3">
					<input type="number" name="inj" id="inj" placeholder="인증번호" maxlength="6">
				</div>
				<button class="join_btn" type="button">확인</button>
			</div>

			<span class="mail-check-warn" style="font-size: 14px"></span>

			<div>
				<div class="sign_up" id="joinBtn">가입하기</div>
			</div>
		</form>
	</div>
</body>
</html>