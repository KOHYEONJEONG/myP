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
    <link rel="stylesheet" type="text/css" href="resources/css/common/popup.css">
    <script type="text/javascript" src="resources/script/common/popup.js"></script>
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/main.js"></script>
<!--     <script src="resources/js/mypage.js"></script> -->
	<script src="resources/js/join.js"></script>
    <style type="text/css">
    	/*비밀번호 확인 일치 유효성 검사*/
    	#pw_ck_status{
    		padding-left: 125px;
    	}
		.pwck_input_re_1 {
			color : green;
			display : none;
			font-size: 14px;
			padding-left: 125px;
		}
		.pwck_input_re_2{
			color : red;
			display : none;
			font-size: 14px;
			padding-left: 125px;
		}
		.btn.update{
			line-height: 40px;
    		text-align: center;
		}
    
    </style>
</head>
<body>
    <c:import url="/header1"></c:import>
    
      <main class="main1">
        <div class="main_wrap">
            
                <c:import url="/mypageSidebar"></c:import> 
             
             <form action="#" id="pwChangeform" method="post">
				<input type="hidden" name="memNo" id="memNo" value="${sMemNo}"/>
	             <div class="right_area">            
	                <div class="content_wrap">
	                    <div class="title">비밀번호 수정</div>
	                    <hr class="line">
	                    <div class="box1"> 
	                        <div class="row1">
	                            <div class="box_title">비밀번호</div>
	                            <div class="input">
	                            	<input type="password" name="pwd" id="pwd" required><br>
	                            </div>
	                        </div>
	                        <span class="" id="pw_ck_status" style="font-size: 14px"></span>
	                        <div class="row1" style="border-top: 0px">
	                            <div class="box_title">비밀번호 확인</div>
	                            <div class="input">
	                               <input type="password" name="pwd" id="rePw"><br>
	                            </div>
	                        </div>
	                         <span class="pwck_input_re_1">비밀번호가 일치합니다.</span> 
							<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
	                    </div>
	                    <div class="btn_wrap">
	                    	<div class="btn update" id="changeBtn">수정</div>
	                    </div>
	                </div>
	            </div>
            </form>
        </div>
      </main>
      <c:import url="/footer"></c:import>
</body>
</html>