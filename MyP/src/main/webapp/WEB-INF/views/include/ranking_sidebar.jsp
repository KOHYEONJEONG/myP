<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.inner div{
		color: black;
	}
</style>
<script type="text/javascript">
$(document).ready(function name() {
	  $(".side_bar #inner div").each(function() { //해당 페이지에 가서도 class on을 유지하려고
		  if("${param.link}" == $(this).attr("link")){ 
			  $(this).addClass("on");
		  }
	  });
	
	
	 $("#inner").on("click","div", function() {
		  location.href= $(this).attr("link");//컨틀롤러 매핑, 이동하려고  
	});
});
</script>
</head>
<body>
<div class="side_bar">
                <div class="title">참여/알림</div>
                <div class="inner" id="inner">
                    <div link="rankingSystemGoodParking">시스템 좋은 주차장</div>
                    <div link="rankingFeeReasonableBoard">요금 합리적인 주차장</div>
                </div> 
            </div>
</body>
</body>
</html>