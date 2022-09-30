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
$(document).ready(function name) {
	$(".side_bar #inner div").each(function() {
		if("${param.link}" == $(this).attr("link")) {
			$(this).addClass("on");
		}
	});
	
	$("#inner").on("click", "div", function() {
		location.href= $(this).attr("link");
	})
}
</script>
</head>

<body>
<div class="side_bar">
                <div class="title">참여/알림</div>
                <div class="inner">
                    <div id="notice2">공지사항</div>
                    <div id="faq2">FAQ</div>
                    <div id="qna2">QnA</div>
                </div> 
            </div>
</body>
</html>