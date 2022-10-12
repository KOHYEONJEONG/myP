<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl의 functions : el tag 추가 옵션 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyP</title>
<link rel="stylesheet" href="resources/css/main.css">

<link rel="stylesheet" href="resources/css/font.css">
<!-- Popup CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/css/common/popup.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!--추가-->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Popup JS -->
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<script type="text/javascript"
	src="resources/script/jquery/jquery.form.js"></script>
<!-- 이미지 보내려고(사진 올리려고) -->
</head>

<script type="text/javascript">
var defalutImg = false;
$(document).ready(function() {
	imgRelod();
	//사진변경 시 미리보기
	$(":input[name='vPic']").on("change", function() {
		if( $(":input[name='vPic']").val() == "") {
			
		}else{
			readURL(this);
		}
	});
	
	//개인정보 수정하기 버튼
	$("#mypage_modify").click(function(){
		$("#sendForm").attr("action", "memInfoUpdate");
        $("#sendForm").submit();   
	});
	
	//사이드바 개인정보 수정하기로 이동
	$("#sidebar_mypage_modify").click(function(){
		$("#sendForm").attr("action", "memInfoUpdate");
        $("#sendForm").submit();   
	});
	
	//비밀번호 수정하기 버튼
	$("#password_modify").click(function(){
		$("#sendForm").attr("action", "memPwUpdate");
        $("#sendForm").submit();   
	});
	
	//사이드바 비밀번호 수정하기로 이동
	$("#sidebar_password_modify").click(function(){
		$("#sendForm").attr("action", "memPwUpdate");
        $("#sendForm").submit();   
	});
	
	//(*)동적으로 만들었기 때문에 접근은 .my_pic으로 한다음에 x버튼을 찾아가야한다(ajax로 그려줬기에)
	$(".my_pic").on("click", "#close_i", function(){ 
		defalutImg = true;//기본이미지라는 체크
		var html = "";
		html += "<img src=\"resources/icons/person3.png\" alt=\"이미지\">"; //기본 이미지로 변경
		$(".my_pic #imgRelod").html(html);
		
		//기존에 있던 db명을 삭제해야한다.
		$("#img").val("");
		$("#vPic").val("");
	});
	
	$("#savefile").click(function(){
		var form = $("#actionForm");
		form.ajaxForm({
			   success:function(res){
			   if(res.result == "SUCCESS"){
				   if(res.fileName.length > 0){
					   $("#img").val(res.fileName[0]);//올라간 파일명 보관(서버에서 파일이름 알맞게 바꿔서 보내줌.)
				   }
					   
			   /*글 저장*/
			   var params = $("#actionForm").serialize();
			   $.ajax({
				   url : "memAction/update",
				   type:"POST",
				   dataType:"json",
				   data : params, 
				   success: function(res){
						switch (res.msg) {
						case "success":
							makeAlert("성공","사진 등록 성공");
							imgRelod();
							break;
						case "fail":
							makeAlert("알림","사진 등록 실패하였습니다");
							break;
						case "error":
							makeAlert("알림","사진 등록 중 문제가 발생하였습니다");
							break;
						}
				   },
				   error : function(request, status, error) {
						console.log(request.responseText);
				   }//error
			   });//ajax
			   
			}else{
				makeAlert("알림", "파일 업로드에<br/> 문제가 발생하였습니다.");
			}
		},error : function() {//에러시
			makeAlert("알림", "파일 업로드에<br/> 문제가 발생하였습니다.");
		}
		
		});//ajaxForm
		form.submit();
	});
	
	$("#memWitBtn").on("click", function(){
		//회원 탈퇴 버튼
		$("#sendForm").attr("action", "withdraw");
        $("#sendForm").submit();  
	});
	
	$("#myReview").on("click", function(){
		$("#sendForm").attr("action", "mypageReviewBoard");
        $("#sendForm").submit();  
	});
	
	$("#myQnA").click(function(){
		$("#sendForm").attr("action", "myQnA");
        $("#sendForm").submit();   
	});

});

//사진 영역만 비동기화
function imgRelod() {
	var params = $("#headerForm").serialize();
	$.ajax({
		url : "memImgAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) {
			img(res.data);
			img1Relod();
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
}


function img(data){
	var img = data.IMG;
	var html = "";
	
	if(img != null && !img.length == 0){
		html += "<img class=\"memImg\" rel=\"group1\" src=\"resources/upload/"+img+"\" data-link=\"resources/upload/"+img+"\"/>"; //x버튼
		html += "<img class=\"close_i\" id=\"close_i\" src=\"${pageContext.request.contextPath}/resources/icons/close.png\">";    //등록한 이미지
	}else{
		html += "<img src=\"resources/icons/person3.png\" alt=\"이미지\">";
	}
	
	$(".my_pic #imgRelod").html(html);
}

//사진 미리보기
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		var html = "";
		reader.onload = function(e) {
			html += "<img src="+e.target.result+">";
			html += "<img class=\"close_i\" id=\"close_i\" src=\"${pageContext.request.contextPath}/resources/icons/close.png\">";//x버튼
			$('.my_pic #imgRelod').html(html);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

</script>

<body>
	<c:import url="/header1"></c:import>
	<main class="main1">
		<div class="main_wrap">
				<c:import url="/mypageSidebar"></c:import>
			<div class="right_area" >
				<div class="bg">
					
					<c:choose>
						<c:when test="${sMemAuto eq 1}">
							<%-- 관리자 권한 --%>
							<div>
								<img src="resources/icons/crown.png" style="width: 60px; height: 60px;
								
								">
							</div>
							<span style="font-size: 18px; font-weight: 700;">관리자님의 MYPAGE</span>
						</c:when>
						<c:otherwise>
							<h2 style="font-size: 18px">MYPAGE</h2>
						</c:otherwise>
					</c:choose>
					
					<div class="mypage_top">
						<div class="my_pic">
							<form action="fileUploadAjax" id="actionForm" method="post"
								enctype="multipart/form-data">
								<input type="hidden" id="img" name="img" class="img" />
								<!-- 올라갈 파일명 -->
								<input type="hidden" name="no" id="no" value="${data.MEM_NUM}" />
								<div class="pic_top">
									<div id="imgRelod"></div>
									<div class="filebox2">
										<label for="vPic">사진선택</label>
										<!-- type=file에 id와 같아야함. -->
										<input type="file" name="vPic" id="vPic" /> <input
											type="button" id="savefile" class="savefile" value="저장" />
									</div>

								</div>
							</form>
							<!-- fileUploadAjax -->
						</div>
						<form name="#" id="sendForm" method="post">
							<input type="hidden" name="no" id="no" value="${sMemNo}" /> <input
								type="hidden" name="nm" id="nm" value="${data.NM}">
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
							<input type="button" class="my_btn info" id="mypage_modify"
								value="기본정보 수정하기"> <input type="button"
								class="my_btn password" id="password_modify" value="비밀번호 수정하기">
						</div>
						<!--bottom2-->
						<div class="bottom2">
							<div class="my_btn1 myReview" id="myReview">
								<img class="myReviewImg" src="resources/icons/reviewmypage.png">
								<div class="txt">주차장리뷰</div>
							</div>
							<div class="my_btn1 myQna" id="myQnA">
								<img class="qnaImg" src="resources/icons/qna.png">
								<div class="txt">게시글</div>
							</div>
							<div class="my_btn1 myResignMembership" id="memWitBtn">
								<img class="resignMembershipImg"
									src="resources/icons/logout.png">
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
</html>