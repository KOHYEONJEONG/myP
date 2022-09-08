<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script><!--추가-->
       <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

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
        <h1 class="logo">
            <a href="/test2/index.html">
            </a>
          </h1>
    <form class="was-validated" name="form" id="form">
        <div class="title">회원가입</div>  
        <div class="input_box">
            <input type="text" name="uname" for="uname"  
                   placeholder="아이디" id="uname" required><br><br>
        </div>
        <div class="input_box">
            <input type="password" name="pwd" for="pwd"
                   placeholder="비밀번호" id="pwd" required><br><br>
        </div>
        <div class="input_box">
            <input type="password" name="PW" placeholder="비밀번호 재확인"><br><br>
        </div>
        <div class="input_box">
            <input type="nickname" name="nickname" placeholder="닉네임"><br><br>
        </div>
        <div class="df">
            <div class="input_box2">
                <input  type="text" name="email" placeholder="이메일"> 
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
            <button class="join_btn" type="button">인증번호<br/>전송</button><br><br>  
        </div>
        <div class="df">
            <div class="input_box3">
                <input type="inj" name="inj" placeholder="인증번호">
            </div>
            <button class="join_btn" type="button">확인</button><br><br>
        </div>
        <div>
            <button class="sign_up" type="submit" id="joinBtn">가입하기</button>
        </div>
    </form>
</div>
</body>
</html>