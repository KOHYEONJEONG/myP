<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/font.css">
<style type="text/css">
*{
        font-family: 'TmoneyRoundWindRegular';
    }
   
.wrap {
   width: 490px;
   height: 480px;
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
        background: url(./icons/logo8.png) no-repeat;
        background-size: 100%;
        background-position: 50%;
        position: absolute;
      top: -80px;
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
.input_box {
   position: relative;
   height: 60px;
    border: solid 1px #dadada;
    background: #fff;
    border-radius: 10px;
   padding: 10px;
   margin: 5px 0;
   box-sizing: border-box;
   
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

.loginBtn_wrap {
   font-size: 0;
    margin-top: 10px;
   text-align: center;
    
}
#loginBtn {
    margin-top: 10px;
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
.btn_bottom{
    margin: 20px 0;
    text-align: center;
   font-size: 12px;
   cursor: pointer;
   display: flex;
   justify-content: center;
}
.btn_bottom div{
   position: relative;
}
.btn_bottom div:nth-child(1){
   position: relative;
   width: 60px;
}
.btn_bottom div:nth-child(2){
   position: relative;
   width: 80px;
}
.btn_bottom div:nth-child(3){
   position: relative;
   width: 85px;
}
.btn_bottom div:nth-child(n+2)::before{
   content: '';
    display: block;
    position: absolute;
    left: -1px;
    right: auto;
    top: 1px;
    bottom: auto;
    width: 2px;
    height: 12px;
    background: #707070;
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
   background: url(./icons/kakao.png) no-repeat;
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

</style>
</head>
<body>
<div class="wrap">
   <h1 class="logo">
      <a href="/test2/index.html">
      </a>
     </h1>
   <div class="title">로그인</div>
   <div class="input_box">
      <input type="text"  maxlength="20"  placeholder="아이디"/>
   </div>
   <div class="input_box">
      <input type="password"  maxlength="20"  placeholder="비밀번호"/>
   </div>
   <div  class="loginBtn_wrap">
      <input type="button" id="loginBtn"  value="로그인" />
   </div>
   <div class="btn_bottom">
      <div>회원가입</div>
      <div>아이디 찾기</div>
      <div>비밀번호 찾기</div>
   </div>
   <hr/>
   <div class="kakao">
      <div class="kakao_i"></div>
      <div class="kakao_txt">카카오톡으로 간편로그인 </div>
   </div>
</div>
</body>
</html>