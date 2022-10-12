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
<script type="text/javascript">
$(document).ready(function() { 
	//별점
	$('.feeStar, .envStar, .cctvStar, .disStar').raty({ //cdn이 여기에 있다보니까 여기다가 작성해야 해 main.js에 작성하면 오류나서 다른 코드가 실행이 안돼요~
		readOnly: false,
		score : 1,
		path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"
	});
	
	
$("#sendBtn").on("click",function(){
	
	$("#send_car_num").val($(".review_wrap #carparknum").val());
	$("#cctv_star").val($("#cctvStar input").val());
	$("#env_star").val($("#envStar input").val());
	$("#fee_star").val($("#feeStar input").val());
	$("#dis_star").val($("#disStar input").val());
	
	action("insertreview");
});	
	
function action(flag){
	var params = $("#actionForm3").serialize();
		
		$.ajax({
			url : "HomeAction/insertreview", 
			type : "POST", 
			dataType: "json", 
			data: params, 
			success : function(res) { 
				if(res.msg == "success"){
					  makePopup({
				         title : "알림",
				         contents : "리뷰등록 성공하였습니다.",
				         // draggable : true
				         buttons : [{
				            name : "확인",
				            func:function() {
				            	document.getElementById("review_popup").style.display = "none";
				                $('main').css({"opacity" : "1","pointer-events":"auto"});
				                $('header').css({"opacity" : "1","pointer-events":"auto"});
				                closePopup();
				                 var data = {carparknum : $(".review_wrap #carparknum").val()}; 
				    			$.ajax({
				    				 type : "POST",
				    				   url : "ReviewAjax", 
				    				   dataType : "json",
				    				   data : data,
				    				   success : function(res){
				    					   mapReload();//지도 팝업창에 리뷰개수, 별 개수
				    					   
				    				       $('.review_wrap').addClass('on');
				    				       $('.review_wrap').siblings().removeClass('on');  
				    				      
				    					   reviewList(res.reviewlist);
				    					   $("#title").val("");
				    					   $("#con").val("");
				    					   $("#cctvStar,#envStar,#feeStar,#disStar").empty();//이전별점 결과를 비워준다
				    					   
				    					   $("#cctvStar,#envStar,#feeStar,#disStar").raty({ //다시 새로 별점을 그려준다.
				    							readOnly: false,
				    							score : 1,
				    							path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"
				    						});
				    					   
				    					
				    				   },
				    				  error : function(request, status, error){
				    						console.log(request.responseText); 
				    				  }
				    			})
				            }
				         }]
					});	 
				}else if(res.msg == "fail"){
					makeAlert("알림", "등록에 실패하였습니다.");
				}else{
					makeAlert("알림", "등록 중 문제가 발생하였습니다.");
				}
			},
			error : function(request, status, error) { 
				console.log(request.responseText); 
			}
			
		}); //Ajax End
	} // action Function End */
	
	
	
});
</script>
</head>
<body>
<!-- 리뷰 팝업 -->
<form action ="#" id="actionForm3" method="post">
	<input type="hidden" id="cctv_star" name="cctv_star"/>
	
		<input type="hidden" id="send_car_num" name="send_car_num"/>
		<input type="hidden" id="env_star" name="env_star"/>
		<input type="hidden" id="dis_star" name="dis_star"/>
		<input type="hidden" id="fee_star" name="fee_star"/>
		<input type="hidden" name="memno" id="memno" value="${sMemNo}" />
	<div id="review_popup">
  		<div class="close_i">
      		<img src="resources/icons/close.png" alt="">
  		</div>
  <div class="popup_top">
      <div class="txt_title">제목</div>
      <input type="text" name="title" id="title" class="title" maxlength="30">
  </div>

	<div class="popup_middle">
		<div class="txt_title">별점을 선택해주세요.</div>
		<div class="star_wrap">
		   <div class="group1">[시스템 별점]</div>
		 
		   <div class="star1">
		     <div class="cctv_wrap">
		         <div class="wrap_title" id="cctv">CCTV</div>
		         <div class="cctvStar" id="cctvStar"></div> 
		     </div>
		     
		     <div class="env_wrap">
		         <div class="wrap_title">환경</div>
		         <div class="envStar" id="envStar"></div>
		     </div>
		   </div>
		
		   <div class="group2">[가성비 별점]</div>
		   <div class="star2">
		       <div class="amo_wrap">
		           <div class="wrap_title">요금</div>
		          <div class="feeStar" id="feeStar"></div>
		       </div>
		       <div class="ticket_wrap">
		           <div class="wrap_title">할인정보 별점</div>
		           <div class="disStar" id="disStar"></div>
		       </div>
		   </div><!-- star2 -->
		</div><!--star_wrap-->
	</div><!-- popup_middle -->
	
    <div class="popup_content">
        <div class="txt_title">내용을 입력해주세요.</div>
        <textarea cols="" rows="" class="contents" name="con" id="con"></textarea>
    </div>
    <div class="sendBtn_wrap">
        <input type="button" value="등록" id="sendBtn">
    </div>
</div>
</form>
</body>
</html>