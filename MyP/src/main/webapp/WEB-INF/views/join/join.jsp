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
var code = ""; //이메일전송 인증번호 저장위한 코드
window.onload = function(){   
   $('#mail_btn').click(function() {//가입하기 버튼
	   
   var email = $("#email").val() + $('#email2').val(); //입력한 이메일
   var checkBox = $("#inj");
   
   
   $.ajax({
		type:"GET",   
   		url:"mailCheck?email=" + email,
   		success : function(data) {
   			//console.log("data :" + data);
   			checkBox.attr("disabled", false);
   			code = data;
   		}
   });
});     
   
$("#inj").blur(function() {
	
	var inputCode = $("#inj").val(); //입력코드
	var checkResult = $("#mail-check-warn"); //비교 결과
	
	if(inputCode == code) {
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class", "correct");
	} else {
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class", "incorrect");
	}
});
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
            <input type="text" name="uname"  
                   placeholder="아이디" id="uname" required><br><br>
            
            <input type="text" name="uname" for="uname" 
                   placeholder="아이디" id="id_input" required><br><br>
        </div>
        
         <span class="id_input_re_1">멋진 아이디네요!</span>
         <span class="id_input_re_2">아이디가 이미 존재하거나 삭제된 아이디입니다.</span>
        
        <div class="input_box">
            <input type="password" name="pwd" 
                   placeholder="비밀번호" id="pwd" required><br><br>
        </div>
        <div class="input_box">
            <input type="password" name="PW" placeholder="비밀번호 재확인"><br><br>
        </div>
        <div class="input_box">
            <input type="text" name="nickname" placeholder="닉네임"><br><br>
        </div>
        <div class="df">
            <div class="input_box2">
                <input  type="text" name="email" id="email" placeholder="이메일"> 
            </div>
            <div class="a">@</div> 
            <div class="input_box2">
                <select class="form-control" name="email2" id="email2">
                    <option>직접입력</option>
                    <option>@naver.com</option>
                    <option>@gmail.com</option>
                    <option>@hanmail.net</option>
                    <option>@daum.net</option>
                </select>
            </div>
            <button class="join_btn" type="button" id="mail_btn">인증번호<br/>전송</button><br><br>  
        </div>
        
        <div class="df">
            <div class="input_box3">
                <input type="number" id="inj"  placeholder="인증번호" maxlength="6">
            </div>
            <button class="join_btn" type="button" id="check_btn">확인</button><br><br>
        </div>
       	
       	<span id="mail-check-warn"></span>
        	
        <div>
            <button class="sign_up" type="submit" id="sign_up">가입하기</button>
        </div>
    </form>
</div>
</body>
</html>