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
   	<style type="text/css">
   		.pw_ck_status{
   			padding-left: 125px;
   		}
   	</style>
    <script src="resources/jquery/jquery-1.12.4.js"></script>
<!--     <script src="resources/js/main.js"></script> -->
    <script type="text/javascript">
    $(document).ready(function () {
    	
    	// password 유효성 password input 밑에 문구 띄어줌
	    $("#pwd").keyup(function () {
	 	  var pwd = $("#pwd").val();
	 	  ckPwd(pwd);
	    });
    
    });
    
	// nickname 중복성 체크
	function ckPwd(pwd) {
		var pw_ck_status = $(".pw_ck_status");
		var memNo = $("#memNo").val();
		console.log(memNo);
	
		var data = {pwd : pwd, memNo : memNo};
		$.ajax({
			type:"post",
			url:"pwdChackAjax",
			data : data,
			success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
				if(res != 'success'){
					pw_ck_status.html("비밀번호가 일치하지 않습니다. 다시 확인해주세요");
					pw_ck_status.css("color","red");
					pw_ck_status.css("display", "inline-block");
				} else {
					pw_ck_status.html("비밀번호가 일치합니다");
					pw_ck_status.css("color","green");
					pw_ck_status.css("display", "inline-block");
				}
			},
			error : function(request, status, error) {// 실패했을 때 함수 실행
				console.log(request.responseText);    //실패 상세 내역
			}
		});//ajax
		return true;
	}

    
    </script>
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
             <form action="#" id="" method="post">
				<input type="hidden" name="memNo" id="memNo" value="${sMemNo}"/>
             <div class="right_area">
                <div class="content_wrap">
                    <div class="title">회원 탈퇴</div>
                    <hr class="line">
                    <div class="box"> 
                        <div class="row1">
                            <div class="box_title">탈퇴사유</div>
                            <div class="select">
                                <select name="reason">
                                    <option value="" disabled selected>무엇이 불편하셨나요?</option>
                                    <option value="이용 불편">이용 불편</option>
                                    <option value="사용빈도 낮음">사용빈도 낮음</option>
                                    <option value="기타">기타</option>
                                  </select>
                            </div>
                        </div>
                        <div class="row1" style="border-top: 0px">
                            <div class="box_title">비밀번호</div>
                            <div class="input">
                                <input type="password" name="pwd" id="pwd" required><br>
                            </div>
                        </div>
                         <span class="pw_ck_status" id="pw_ck_status"></span>
                    </div>
                    <div class="btn_wrap">
                        <input type="button" value="탈퇴" class="btn update">
                    </div>
                </div>
            </div>
                 </form>
        </div>
      </main>
<c:import url="/footer"></c:import>
</body>
</html>