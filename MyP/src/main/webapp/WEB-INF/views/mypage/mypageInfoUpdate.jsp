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
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/main.js"></script>
    <script type="text/javascript" src="resources/script/common/popup.js"></script>
	<script src="resources/js/join.js"></script>
	<style type="text/css">
		#nickname{
			width: 100%;
			height: 40x;
			box-sizing: border-box;
		}
		/*닉네임 중복성검사 체크 문구*/
		.nickname_status {
			display : none;
			padding-left: 125px;
			font-size: 14px;
		}
	</style>
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
             <form action="#" id="infoUpdateForm" method="post">
				<input type="hidden" name="memNo" id="memNo" value="${sMemNo}"/>
	             <div class="right_area">            
	                <div class="content_wrap">
	                    <div class="title">기본정보 수정</div>
	                    <hr class="line">
	                    <div class="box1" style="height: 150px"> 
	                        <div class="row1">
	                            <div class="box_title">닉네임</div>
	                            <div class="input">
	                                <input type="text" name="nickname" id="nickname"/>
	                            </div>
	                        </div>
	                        <span class="nickname_status"></span>
	                    </div>
	                    <div class="btn_wrap">
	                        <input type="button" value="수정" class="btn update" id="infoUpdateBtn">
	                    </div>
	                </div>
	            </div>
            </form>
        </div>
      </main>
      <c:import url="/footer"></c:import>
</body>
</html>