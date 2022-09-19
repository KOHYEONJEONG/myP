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
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/font.css">
<script src="/resources/js/join.js"></script>
<style>
    *{
        font-family: 'TmoneyRoundWindRegular';
    }
   .wrap {
	width: 490px;
	height: 360px;
	padding: 40px 20px 20px 20px;
	background-color: #f5f6f7;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%,-50%);
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
    top: -70px;
    left: 50%;
    transform: translate(-50%,-50%);
}
a{
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

input {
	height: 100%;
	width: 100%;
    border: 0;
    background: #fff;
	font-size: 15px;
	outline: 0;

}

input::placeholder {
  font-size: 14px;
}


.input_box2{
    height: 60px;
    width: 36%;
    border: solid 1px #dadada;
    background: #fff;
    border-radius: 10px;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
}
.a{
    width: 7%;
    height: 60px;
    line-height: 60px;
    text-align: center;
}
.input_box3{
    height: 60px;
    border: solid 1px #dadada;
    background: #fff;
    border-radius: 10px;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
    width: 350px;
}

input, select{
	height: 100%;
	width: 100%;
    border: 0;
    background: #fff;
	font-size: 15px;
	outline: 0;

}

.df{
    display: flex;
}
.join_btn{
    width: 100px;
    height: 60px;
    background: #FD9A29;
    border: solid 1px #dadada;
    border-radius: 10px;
    color: #fff;
    font-size: 14px;
    margin: 5px 0;
    cursor: pointer;
}

#joinBtn{
    margin-top: 15px;
	height: 60px;
    border: solid 1px #00af80;
    text-align: center;
    background: #00af80;
    color:white;
    font-size: 18px; 
	box-sizing: border-box;
	border-radius: 5px;
	cursor: pointer;
    width: 450px;
}

</style>
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
				<button class="join_btn" type="button" id="mail-Check-Btn">
					인증번호<br />전송
				</button>
				<br>
				<br>
			</div>
			<div class="df">
				<div class="input_box3">
					<input type="number" name="inj" placeholder="인증번호">
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