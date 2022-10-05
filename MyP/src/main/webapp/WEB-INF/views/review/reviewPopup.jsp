<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<script type="text/javascript" src="resources/rety/jquery.raty.js"></script><!-- 별 -->
<link rel="stylesheet" href="resources/rety/jquery.raty.css"><!-- 별 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<style type="text/css">

.wrap_title{
	font-size: 13px;
}

.env_wrap, .ticket_wrap{
	margin-left: 20px;
}


</style>
</head>
<body>
<!-- 리뷰 팝업 -->
<div id="review_popup">
  <div class="close_i">
      <img src="resources/icons/close.png" alt="">
  </div>
  <div class="popup_top">
      <div class="txt_title">제목</div>
      <input type="text" class="title" maxlength="30">
  </div>

	<div class="popup_middle">
		<div class="txt_title">별점을 선택해주세요.</div>
		<div class="star_wrap">
		   <div class="group1">[시스템 별점]</div>
		 
		   <div class="star1">
		     <div class="cctv_wrap">
		         <div class="wrap_title">CCTV</div>
		         <div class="cctvStar"></div> 
		     </div>
		     
		     <div class="env_wrap">
		         <div class="wrap_title">환경</div>
		         <div class="envStar"></div>
		     </div>
		   </div>
		
		   <div class="group2">[가성비 별점]</div>
		   <div class="star2">
		       <div class="amo_wrap">
		           <div class="wrap_title">요금</div>
		          <div class="feeStar"></div>
		       </div>
		       <div class="ticket_wrap">
		           <div class="wrap_title">할인정보 별점</div>
		           <div class="disStar"></div>
		       </div>
		   </div><!-- star2 -->
		</div><!--star_wrap-->
	</div><!-- popup_middle -->
	
    <div class="popup_content">
        <div class="txt_title">내용을 입력해주세요.</div>
        <textarea cols="" rows="" class="contents"></textarea>
    </div>
    <div class="sendBtn_wrap">
        <input type="button" value="등록" id="sendBtn">
    </div>
</div>
</body>
</html>