<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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