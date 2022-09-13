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
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/main.js"></script>
<style>
   .wrap {
   width: 490px;
   height: 350px;
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
    width: 250px;
    height: 100px;
    background: url(resources/icons/logo8.png) no-repeat;
    background-size: 140%;
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
<script>
window.onload = function(){
   document.getElementById("send");
   send.addEventListener("click",function(){
      var frm = document.form;
            
      if(frm.uname.value.trim().length<=6)
      {
         alert("아이디를 6글자이상 입력해주세요");
         return false(); 
      }
          
      if(frm.pwd.value.trim().length<=8)
      {
         alert("비밀번호를 8글자이상 입력해주세요");
         return false(); 
      }
      
      frm.submit();
   })
}       
</script>
</head>
<body>
    <div class="wrap">
        <h1 class="logo"></h1>
    <form class="was-validated" name="form" id="form">
        <div class="title">비밀번호 변경</div>
        <div class="input_box">
            <input type="password" name="password" for="password"  
                   placeholder="새 비밀번호" id="uname" required><br><br>
        </div> 
        <div class="input_box">
            <input type="password" name="passwordok" placeholder="새 비밀번호 재확인">
        </div>  
        <div>
            <button class="sign_up" type="submit" id="joinBtn">변경</button>
        </div>
    </form>
</div>
</body>
</html>