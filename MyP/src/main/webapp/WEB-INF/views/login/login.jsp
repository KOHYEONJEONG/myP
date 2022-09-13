<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script><!--추가-->
       <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
       <script type="text/javascript"
		src="resources/script/common/popup.js"></script>
       <script type="text/javascript">
$(document).ready(function() {
	$("#join").on("click", function() {
		location.href="join";
	});
	
	$("#actionForm").on("keypress", "input", function(event){
		if(event.keyCode == 13){ //이벤트 코드가 엔터가들어오면
			//직접함수호출
			//login();
		
		//버튼 이벤트 발생
		$("#loginBtn").click();
			return false;
		}
	});
	$("#loginBtn").on("click",function(){
		if($.trim($("#id").val())==""){
			makeAlert("알림" , "아이디를 입력하세요.", function(){
				$("#id").focus();
			});
			
		}else if($.trim($("#pw").val())==""){
			makeAlert("알림" , "비밀번호를 입력하세요.", function(){
				$("#pw").focus();	
			});	
		}else{
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "loginAjax", //경로
				type : "POST", //전송방식(GET: 주소형태, Post : 주소 헤더형태)
				dataType : "json", //데이터 형태
				data : params, //보낼 데이터
				success : function(res){// 성공했을때 겨로가를 res에 받고 함수실행
					if(res.msg == "success"){
						location.href = "home"
					}else{
						makeAlert("알림", "아이디나 비밀번호가 틀립니다.")
					}
					
				},
				error : function(request, status, error){//실패했을때 함수실행
					console.log(request.responseText);//실패상세내역
				}
			});
		}
		
	});
	
});
</script>
</head>

<body>
<div class="wrap">
   <h1 class="logo">
      <a href="/test2/index.html">
      </a>
     </h1>
   <div class="title">로그인</div>
   <form action="#" id="actionForm" >
   <div class="input_box">
      <input type="text" name="id" id="id" maxlength="20"  placeholder="아이디"/>
   </div>
   <div class="input_box">
      <input type="password" name="pw" id="pw"  maxlength="20"  placeholder="비밀번호"/>
   </div>
   </form>
   <div  class="loginBtn_wrap">
      <input type="button" id="loginBtn"  value="로그인" />
   </div>
   <div class="btn_bottom">
      <div id="join">회원가입</div>
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