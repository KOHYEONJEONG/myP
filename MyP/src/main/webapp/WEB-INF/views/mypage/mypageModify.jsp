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
<script src="resources/jquery/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/font.css">
<style>
input {
	font-family: 'TmoneyRoundWindRegular';
}

.bg {
	width: 800px;
	margin: 0 auto;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.bg .title {
	font-size: 22px;
	margin-bottom: 5px;
}

.line {
	width: 800px;
	border: solid 2px #9e9e9e;
	box-sizing: border-box;
	margin: 3px 0;
}

.box {
	width: 800px;
	height: 240px;
	background-color: #f5f5f5;
	border: solid 1px #fbfbfb;
	box-sizing: border-box;
	padding: 40px 100px;
}

.row1, .row2, .row3 {
	width: 600px;
	height: 50px;
	display: flex;
	margin: auto;
	line-height: 50px;
	box-sizing: border-box;
	margin-bottom: 8px;
}

.row2 .input {
	display: flex;
}

.box_title {
	font-size: 16px;
	width: 120px;
	text-align: center;
	box-sizing: border-box;
}

.input {
	width: 470px;
	/* box-sizing: border-box; */
	border: 1px solid #b2b2b2;
}

.right_area  .input input {
	border: 0px;
	padding: 5px;
	height: 40px;
	outline-color: #1155cc;/*선택하면 파란색*/
}

.row1 .input {
	background: #fff;
	font-size: 0px; /*꽉차게 해주려고*/
}

.row1 .input input[type=text] {
	border: 0;
	width: 100%;
	height: 100%;
	box-sizing: border-box;
}

.row2 .input {
	font-size: 0px;/*꽉차게 해주려고*/
}

.row2 .input input[type=text] {
    box-sizing: border-box;
    height: 100%;
}

.row2 .input input[type=text] .eamil1{
	width: 100%;
}

.row2 .input .a {
	margin: 0 3px;
	font-size: 16px;
}

.row2 .input select{
height: 100%;
    width: 100%;
    border: 0;
    background: #fff;
    font-size: 15px;
    outline: 0;
}

.email1{
    width: 100%;
}

.input_box2.left{
 	border-right: solid 1px #dadada;
}
.input_box2.right{
	border-left: solid 1px #dadada;
	border-right: solid 1px #dadada;
}

.row3 .input input[type=text] {
    box-sizing: border-box;
    height: 100%;
    width: 84%;
    margin-right: 4px;
}

.row3 .input {
	font-size: 0px;/*꽉차게 해주려고*/
	background: #fff;
}

.btn_wrap {
	display: flex;
	justify-content: flex-end;
	margin-top: 10px;
}

.btn {
	width: 70px;
	height: 35px;
	font-size: 14px;
	box-sizing: border-box;
	cursor: pointer;
	color: #fff;
}

.btn.email {
	border: solid 1px #595959;
	background-color: #595959;
    margin: 4px auto;
	
}

.btn.confirm {
	border: solid 1px #595959;
	background-color: #595959;
	margin: 4px auto;
}

.btn.update {
	border: solid 1px #00af80;
	background-color: #00af80;
}

.input_box2 {
	height: 100%;
	width: 40%;
	background: #fff;
	box-sizing: border-box;
}
</style>
<script src="resources/jquery/jquery-1.12.4.js"></script>
</head>
<body>
	<c:import url="/header1"></c:import>
	<main class="main1">
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">마이페이지</div>
				<div class="inner">
					<div class="on">마이페이지</div>
				</div>
			</div>
			
			<form action="#" id="actionForm" name="actionForm">
				<input type="hidden" id="no" name="no" value="${param.no}">
				<input type="hidden" id="email" name="email">
				<div class="right_area">
					<!-- 여기 -->
					<div class="bg">
						<div class="title">기본정보 수정</div>
						<hr class="line">
						<div class="box">
							<div class="row1">
								<div class="box_title">닉네임</div>
								<div class="input">
									<input type="text" value="${param.NM}" />
								</div>
							</div>

							<div class="row2">
								<div class="box_title">이메일</div>
								<div class="input">
									<div class="input_box2 left">
										<input type="text" id="email1" class="email1"/>
									</div>
									<div class="a">@</div>
									<div class="input_box2 right">
										<select id="emailGbn" name="emailGbn">
											<option>직접입력</option>
											<option>naver.com</option>
											<option>gmail.com</option>
											<option>hanmail.net</option>
										</select>
									</div>
									<input type="button" value="인증번호" class="btn email">
								</div>
							</div>
							<div class="row3">
								<div class="box_title">인증번호</div>
								<div class="input">
									<input type="text" placeholder="인증번호" /> <input type="button"
										value="확인" class="btn confirm">
								</div>
							</div>
						</div>
						<div class="btn_wrap">
							<input type="button" value="수정" class="btn update">
						</div>
					</div>
				</div>
			</form>
		</div>
	</main>
	<c:import url="/footer"></c:import>

</body>
</html>