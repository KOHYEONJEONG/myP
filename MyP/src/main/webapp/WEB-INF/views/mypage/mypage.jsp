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
    <link rel="stylesheet" href="resources/css/mypage.css">
    <link rel="stylesheet" href="resources/css/font.css">
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/header.js"></script>
    <script src="resources/js/mypage.js"></script>
  
</head>
    
<body>
	<c:import url="/header1"></c:import>

		<form action="#" id="sendForm" method="post">
			<input type="hidden" name="no" id="no" value="${data.MEM_NUM}"/>
		</form>
    
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
                    <hr class="line" />
                    <div class="top">
						
						<form action="fileUploadAjax" id="actionForm" method="post" enctype="multipart/form-data">
						 <input type="hidden" id="img" name="img"/>                     
	                       
	                        <div class="pic_top">
	                            <div id="imgRelod">
		                           <!--
		                            <c:choose>
		                            	<c:when test="${!empty data.IMG}">
		                            	
		                            	</c:when>
		                            	<c:otherwise>
		                            		<img src="resources/icons/person3.png" alt="이미지">
		                            	</c:otherwise>
		                            </c:choose>
		                              -->
	                            </div>
	                            <div class="filebox">
	                                <label for="file">사진선택</label>
	                                <input type="file" name="pic" id="pic"/>
	                                <input type="button" id="savefile" class="savefile" value="저장"/>
	                            </div>
	                        </div>  
	                        
                        </form>
                        
                        <div class="mypage_top">
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
                            <div class="my_btn1 myResignMembership">
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