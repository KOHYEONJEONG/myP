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
   	<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
   	<script type="text/javascript" src="resources/script/common/popup.js"></script>
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
    	
	    $("#withdrawBtn").on("click", function(){
	    	var params = $("#withdrawForm").serialize();
			
	    	$.ajax({
				url : "memAction/delete",
				type : "POST", 
				dataType: "json", 
				data: params, 
				success : function(res) { 
					switch(res.msg){
					case "success" : 
						 makePopup({
					         title : "알림",
					         contents : "탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.",
					         // draggable : true,
					         buttons : [{
					            name : "확인",
					            func:function() {
					            	location.href = "home";
					            }
					         }]
						})
						break;
					case "fail" :
						makeAlert("알림" , "탈퇴에 실패하였습니다.");
						break;
					case "error" :
						makeAlert("알림" , "탈퇴 중 문제가 발생하였습니다.");
						break;
					}
				},
				error : function(request, status, error) { 
					console.log(request.responseText); 
				}
			});
		});
	    
	  //사이드바 개인정보 수정하기로 이동
		$("#sidebar_mypage_modify").click(function(){
			$("#withdrawForm").attr("action", "memInfoUpdate");
	        $("#withdrawForm").submit();   
		});
		
		//사이드바 비밀번호 수정하기로 이동
		$("#sidebar_password_modify").click(function(){
			$("#withdrawForm").attr("action", "memPwUpdate");
	        $("#withdrawForm").submit();   
		});
		
    
    });
    
	// pwd 중복성 체크
	function ckPwd(pwd) {
		var pw_ck_status = $(".pw_ck_status");
		
		var params = $("#withdrawForm").serialize();
		
		$.ajax({
			type:"post",
			url:"pwdChackAjax",
			data : params,
			success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
				console.log(res);
				if(res == 'fail'){
					pw_ck_status.html("비밀번호가 일치하지 않습니다. 다시 확인해주세요");
					pw_ck_status.css("color","red");
					pw_ck_status.css("display", "inline-block");
					pw_ck_status.css("font-size", "14px");
				} else {
					pw_ck_status.html("비밀번호가 일치합니다");
					pw_ck_status.css("color","green");
					pw_ck_status.css("display", "inline-block");
					pw_ck_status.css("font-size", "14px");
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
                <c:import url="/mypageSidebar"></c:import> 
             <form action="#" id="withdrawForm" method="post">
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
                        <input type="button" value="탈퇴" class="btn update" id="withdrawBtn">
                    </div>
                </div>
            </div>
                 </form>
        </div>
      </main>
<c:import url="/footer"></c:import>
</body>
</html>