<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="resources/css/mypage.css">
<script type="text/javascript">
$(document).ready(function() {
var rotate = 0;
	

	  $("#mmenu").click(function() {
		 //$("#myArrow").css("transform","rotate(270deg)");
		 
		 rotate += 180;
		 $("#myArrow").css({'transform': 'rotate('+rotate+'deg)'});
	  });
	
	  $('.menu1').click(function(){
	      $('.menu2').slideUp();
	      if ($(this).children('.menu2').is(':hidden')){
	         $(this).children('.menu2').slideDown();
	         $(".menu1").show();
	      } else{
	         $(this).children('.menu2').slideUp();
	      }
	      
	   });
	  
		
});
</script> 
<body>
	<div class="side_bar">
	<div class="title">마이페이지</div>
	<div class="inner">
		<div class="container">
			   
			<ul id="ac">
				<li class="menu1">
					<div class="mmenu" style="border: 0; padding: 10px 5px;" id="mmenu">
						마이페이지
						<%-- <img src="${pageContext.request.contextPath}/resources/icons/arrow.png" alt="" id="arrow"> --%>
						<img id="myArrow" src="resources/icons/wing1.png">
					</div>
					<ul class="menu2">
						<!-- header.js에서 이벤트 처리, id는 같지 않기 위해서 2를 붙였다. -->
						<li id="myPage2" class="submenu1">메인화면</li>
						<li id="infoupdate2" class="submenu1">기본정보 수정하기</li>
						<li id="pwupdate2" class="submenu1">비밀번호 수정하기</li>
						<li id="parkreview2" class="submenu1">주차장 리뷰</li>
						<li id="post2" class="submenu1">게시글</li>
						<li id="withdrawal2" class="submenu1">회원탈퇴</li>
					</ul>
				</li>

			</ul>
			     
		</div>
</div>

	</div>

</body>
