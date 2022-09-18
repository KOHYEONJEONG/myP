<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyP</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
	<div class="wrap">
		<h1 class="logo">
			<a href="/"></a>
		</h1>
		<form class="was-validated" name="form" id="form">
			<div class="title">아이디 찾기</div>
			<div class="df">
				<div class="input_box2">
					<input type="text" name="email" placeholder="이메일">
				</div>
				<div class="a">@</div>
				<div class="input_box2">
					<select>
						<option>직접입력</option>
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>hanmail.net</option>
					</select>
				</div>
				<button class="join_btn" type="button">
					인증번호<br />전송
				</button>
				<br>
				<br>
			</div>
			<div class="df">
				<div class="input_box3">
					<input type="inj" name="inj" placeholder="인증번호">
				</div>
				<button class="join_btn" type="button">확인</button>
				<br>
				<br>
			</div>
			<div>
				<button class="sign_up" type="submit" id="joinBtn">아이디 찾기</button>
			</div>
		</form>
	</div>
</body>
</html>