<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<link rel="stylesheet"
	href="resources/css/font.css">
<style type="text/css">
  *{
       font-family: 'TmoneyRoundWindRegular';
   }

.logo {
    width: 280px;
    height: 110px;
    background: url('resources/icons/logo8.png') no-repeat;
    background-size: 130%;
    background-position: 50%;
    position: absolute;
    top: -90px;
    left: 50%;
    transform: translate(-50%,-50%);
    cursor: pointer;
}
a{
    width: 280px;
    height: 110px;
    display: block;
}

.title {
   	margin: 0 auto;
    width: 100%;
    height: 44px;
    text-align: center;
    font-size: 22px;
    margin-bottom: 20px;
}

.nm_input{
    height: 60px;
    border: solid 1px #dadada;
    background: #fff;
    border-radius: 10px;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
}

input{
   height: 100%;
   width: 100%;
   border: 0;
   background: #fff;
   font-size: 15px;
   outline: 0;

}
.wrap {
   width: 490px;
   height: 300px;
   padding: 40px 20px 20px 20px;
   background-color: #f5f6f7;
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%,-60%);
   border-radius: 30px;
   box-sizing: border-box;
}

input::placeholder {
  font-size: 14px;
}

.kakao{
   margin-top: 15px;
   height: 60px;
   border: solid 1px #FEE500;
   background: #FEE500;
   color: #3c1d1e;
   font-size: 18px; 
   box-sizing: border-box;
   border-radius: 5px;
   cursor: pointer;
   width: 450px;
   display: flex;
}
.kakao_i{
   background: url(resources/icons/kakao.png) no-repeat;
   width: 40px;
   height: 100%;
   background-size: 90%;
   background-position: 50%;
   margin: 0 20px;
}
.kakao_txt{
   width: 100%;
   display: flex;
   justify-content: center;
   align-items: center;
   font-size: 16px;
   padding-right: 60px;
}

/*닉네임 중복성검사 체크 문구*/
.nickname_status {
	display : none;
}
</style>
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script src="resources/js/join.js"></script>
<script type="text/javascript">
	console.log(email);

</script>
</head>
<body>
	<div class="wrap">
		<h1 class="logo" id="logo"></h1>
		<form action="#" class="" name="form" id="KakaoJoinform" method="post">
			<input type="hidden" name="email" id="email" value="${param.email}">			
			<div class="title">카카오톡ID로 간편 회원가입</div>
			<div class="nm_input">
				<input type="text" name="nickname" id="nickname" placeholder="닉네임" required><br>
			</div>
			<span class="nickname_status"></span>			
			<div class="kakao" id="kakaoJoinBtn">
			  <div class="kakao_i"></div>
      		  <div class="kakao_txt">카카오톡으로 간편로그인 </div>
			</div>
		</form>
	</div>
</body>
</html>