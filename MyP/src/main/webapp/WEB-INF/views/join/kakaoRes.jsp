<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
	switch("${res}"){
	case "success" : 
		if("${param.gbn}" == "u"){ // 수정이 성공했을 떄
			$("#goForm").submit();
		} else { // 등록, 삭제가 성공했을 떄
			location.href = "managerList" 
		}
		break;
	case "failed" : 
		alert("작업에 실패하였습니다.");
		history.back();
	case "error" : 
		alert("작업중 문제가 발생 하였습니다.");
		history.back();
		break;
	}
});
</script>
</head>
<body>
<form action="kakaoJoin" id="kakaoJoinForm" method="post">
	<input type="hidden" name="email" value="${param.email}" />
</form>
</body>
</html>