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
   
	$("#id_input").on("propertychange change keyup paste input", function() {
		var id = $('#id_input').val();
		var data = {id : id};
		
		$.ajax({
			type:"post",
			url:"checkIdAjax",
			data : data,
			success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
				// console.log("성공 여부" + result);
				if(res != 'fail'){
					$('.id_input_re_1').show();
					$('.id_input_re_2').hide();			
				} else {
					$('.id_input_re_2').show();
					$('.id_input_re_1').hide();					
				}		
			},
			error : function(request, status, error) {// 실패했을 때 함수 실행
				console.log(request.responseText);    //실패 상세 내역
			}
		});//ajax
	});
	
   $('#mail-Check-Btn').click(function() {//가입하기 버튼
	   const email = $('#email').val()+ '@' + $('#email2').val(); //이메일 주소값 얻어오기
	   console.log('완성된 이메일 : ' + email); //이메일 오는지 확인
	   const checkInput = $('.inj') //인증번호 입력하는 곳
	   var data = {email : email};
	   $.ajax({
		   type : 'get',
		   url : 'mailCheck', //Get 방식이라 url뒤에 email을 묻힐수있다.
		   data : data,	   
	   	   success : function(result) {
	   		   console.log("result : " + result);
	   		   checkInput.attr('disabled', false);
	   		   code = result;
	   		   alert('인증번호가 전송되었습니다.');
	   	   }
	   }); //end ajax
   }); //end send email
   
   //인증번호 비교
   //blur -> focus가 벗어나는 경우 발생
   $('#inj').blur(function (){
	   const inputCode = $(this).val();
	   const $resultMsg = $('#mail-check-warn');
	   
	   if(inputCode === code) {
		   $resultMsg.html('인증번호가 일치합니다.');
		   $resultMsg.css('color', 'green');
		   $('#mail-Check-Btn').attr('disabled', true);
		   $('#email').attr('readonly', true);
		   $('#email2').attr('readonly', true);
		   $('#email2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		   $('#email2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	   } else {
		   $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요.');
		   $resultMsg.css('color', 'red');
	   }
   });
   
   $("#joinBtn").click(function() {
	   $("#join").attr("action", "/join/join");
	   $("#join").submit();
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
    <form action="" class="was-validated" name="form" id="form">
        <div class="title">회원가입</div>  
        <div class="input_box">
            
            <input type="text" name="id" 
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
                    <option>naver.com</option>
                    <option>gmail.com</option>
                    <option>hanmail.net</option>
                    <option>daum.net</option>
                </select>
            </div>
            <button class="join_btn" type="button" id="mail-Check-Btn">인증번호<br/>전송</button><br><br>  
        </div>
        
        <div class="df">
            <div class="input_box3">
                <input type="number" name="inj" id="inj" placeholder="인증번호" maxlength="6">
            </div>
            <button class="join_btn" type="button">확인</button><br><br>
        </div>
       	
       	<span id="mail-check-warn"></span>
        	
        <div>
            <button class="sign_up" type="submit" id="joinBtn">가입하기</button>
        </div>
    </form>
</div>
</body>
</html>