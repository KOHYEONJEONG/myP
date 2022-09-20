<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!-- jstl의 functions : el tag 추가 옵션 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyP</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/mypage.css">
    <link rel="stylesheet" href="resources/css/font.css">
<!-- Popup CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/header.js"></script>
    <script src="resources/js/mypage.js"></script>
    <script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
	<script type="text/javascript"
	      src="resources/script/common/popup.js"></script> 
</head>
    
<body>
	<c:import url="/header1"></c:import>

	<!-- nm, email과 domain을 보내줘야함. -->
          <main class="main1">
            <div class="main_wrap">
              <div class="side_bar">
                <div class="title">마이페이지</div>
                <div class="inner">
                    <div class="on">마이페이지</div>
                </div> 
             </div>
            <div class="right_area">
                <div class="bg">
                    <h2>MYPAGE</h2>
                    	<div class="mypage_top">
                    		<div class="my_pic">
								<form action="fileUploadAjax" id="actionForm" method="post" enctype="multipart/form-data">
								 <input type="hidden" id="img" name="img"/><!-- 올라갈 파일명 -->                     
			                       <input type="hidden" name="no" id="no" value="${data.MEM_NUM}"/>
			                        <div class="pic_top">
			                            <div id="imgRelod">
				                       
			                            </div>
			                            <div class="filebox2">
			                                <label for="vPic">사진선택</label> <!-- type=file에 id와 같아야함. -->
			                                <input type="file" name="vPic" id="vPic"/>
			                                <input type="button" id="savefile" class="savefile" value="저장"/>
			                            </div>
			                        </div>  
		                        </form>
                        	</div>
	                        <form name="#" id="sendForm" method="post">
	                       		<input type="hidden" name="no" id="no" value="${data.MEM_NUM}"/>
	                       		<input type="hidden" name="nm" id="nm" value="${data.NM}">
	                       		<c:set var="emailS" value="${fn:split(data.EMAIL,'@')}" />
	                            <input type="hidden" name="account" id="account" value="${emailS[0]}">
	                            <input type="hidden" name="domain" id="domain" value="${emailS[1]}">
	                       	</form> 	
                       	
                        
                            <div class="my_info">
                                <div class="info_first">
                                    <div>아이디</div>
                                    <div>${data.ID}</div>
                                    <div>닉네임</div>
                                    <div>${data.NM}</div>
                                </div>
                                <div class="info_second">
                                    <div>경고수</div>
                                    <div>${data.WARNING}</div>
                                    <div>이메일</div>
                                    <div>${data.EMAIL}</div>
                                </div>
                            </div>
                        </div>
                        
                              
                    <!--하단 버튼's-->
                    <div class="mypage_bottom">
                        <!--bottom1-->
                        <div class="bottom1" style="text-align: center;">
                            <input type="button" class="my_btn info" id="mypage_modify" value="기본정보 수정하기">
                            <input type="button" class="my_btn password" id="password_modify"  value="비밀번호 수정하기">
                        </div>
                        <!--bottom2-->
                        <div class="bottom2">
                            <div class="my_btn1 myReview">
                                <img class="myReviewImg" src="resources/icons/reviewmypage.png">
                                <div class="txt">주차장리뷰</div>
                            </div>
                            <div class="my_btn1 myQna">
                                    <img class="qnaImg" src="resources/icons/qna.png">
                                <div class="txt">
                                    게시글
                                </div>
                            </div>
                            <div class="my_btn1 myResignMembership" id="btn_memWit">
                                <img class="resignMembershipImg" src="resources/icons/logout.png">
                                <div class="txt">회원탈퇴</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </main>
<c:import url="/footer"></c:import>      
</body>

    

</body>
</html>