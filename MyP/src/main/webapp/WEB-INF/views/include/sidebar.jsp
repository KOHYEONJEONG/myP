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
	
	  $("#inner").on("click","div", function() {
		  $("#inner div").removeClass("on");
		  $(this).addClass("on");
		  location.href= $(this).attr("link");
	});
	  
});
  </script>
</head>
<body>

<div class="side_bar">
            <div class="title">관리자페이지</div>
            <div class="inner" id="inner">
              <div link="memManagement">회원관리</div>
              <div link="guideManagement">가이드관리</div>
              <div link="dataManagement">데이터관리</div>
              <div link="reportReviewManagement">신고리뷰관리</div>
              <div link="categoryManagement">카테고리관리</div>
          </div> 
        </div>

</body>
</html>