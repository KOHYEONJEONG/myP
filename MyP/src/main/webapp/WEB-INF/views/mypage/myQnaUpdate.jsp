<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/font.css">
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/rety/jquery.raty.js"></script><!-- 별 -->
<link rel="stylesheet" href="resources/rety/jquery.raty.css"><!-- 별 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<style>
.rigth_contents {
	width: 800px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 800px;
	box-sizing: border-box;
	border: 1px #a39485 solid;
	font-size: 14px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

th {
	text-align: center;
}

thead {
	font-weight: bold;
	color: #000;
	background: #eeeeee;
	border-bottom: 1px solid rgba(0, 0, 0, .1);
}

td, th {
	padding: 15px 5px;
	vertical-align: middle;
}

td {
	border-right: 1px solid rgba(0, 0, 0, .1);
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}

tr td:nth-child(odd) {
	background-color: #eeeeee;
	font-weight: bold;
}

td.money>div {
	display: flex;
	justify-content: space-between;
	padding: 0 50px;
	box-sizing: border-box;
}

.btn_wrap1 {
	display: flex;
	justify-content: flex-end;
	width: 800px;
	margin-bottom: 10px;
}

.btn {
	width: 70px;
	height: 35px;
	font-size: 14px;
	color: #fff;
	cursor: pointer;
	box-sizing: border-box;
	line-height: 35px;
	text-align: center;
}

textarea.con{
	width: 100%;
    height: 100px;
    box-sizing: border-box;
    border: 0;
	resize: none;
	background-color: #fff;
}

.update {
	margin: 0px 8px 0px 0px;
	background: #FD9A29;
	border: solid 1px #FD9A29;
	margin-left: 5px;
}

.cancle{
	margin: 0px 8px 0px 0px;
	background: #595959;
	border: solid 1px #595959;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	// 에디터 연결
	CKEDITOR.replace("con", {
			resize_enabled: false, // resize_enabled : 크기조절기능 활용여부
			language : "ko", // 사용언어
			enterMode: "2", // 엔터키처리방법. 2번이면 <br/>
			width : "100%", // 숫자일경우 px, 문자열일경우 css크기
			height : 400
		});
	
	$("#updateCancelBtn").on("click",function(){
		$("#actionForm").attr("action","myQnADetail");
		$("#actionForm").submit();
	});
		
	$("#updateBtn").on("click",function(){
		
		$("#answercon").val("");
		$("#con").val(CKEDITOR.instances['con'].getData());
		
		if($.trim($("#title").val()) == "") {
	         makeAlert("알림", "제목을 입력하세요.", function() {
	            $("#title").focus();
	         });
	      } else if($.trim($("#con").val()) == "") {
	         makeAlert("알림", "내용을 입력하세요.", function() {
	            $("#con").focus();
	         });
	      }else{
			action("update");
	      }
	});
	
	check(box);
});

var msg ={
		"update" : "수정",
	}
	
//분류명 테이블의 action
function action(flag) {
	console.log(msg[flag]);
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "QnaAction/update", //형석이가 만든 qna update 사용
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			switch(res.msg){
			case "success" :
				switch(flag){
					case "update" :
						$("#actionForm").attr("action","myQnADetail");/*리뷰 상세보기 페이지로 이동*/
						$("#actionForm").submit();
					break; 
				}
				break;
			case "fail" :
				makeAlert("알림" ,  msg[flag] + "에 실패하였습니다.");
				break;
			case "error" :
				makeAlert("알림" , msg[flag] + " 중 문제가 발생하였습니다.");
				break;
			}
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
} // action Function End

function check(box){//비공개 여부
	if(box.checked){
		$('#ckval').val("0");
		console.log("체크여부(0 비공개) : "+$("#ckval").val());
	}else{
		console.log("체크안됨")
	}
}
</script>
</head>
<body>
	<c:import url="/header1"></c:import>
	<main>
          <div class="main_wrap">
	         <div class="side_bar">
	           <div class="title">마이페이지</div>
	           <div class="inner">
	               <div class="on">마이페이지</div>
	           </div> 
	        </div>
       		<form action="#" id="actionForm" method="post">
				<input type="hidden" name="qna_num" id="qna_num" value="${param.qna_num}" /> 
				<input type="hidden" name="no" id="no" value="${sMemNo}" />
				<input type="hidden" name="page" id="page" value="${param.page}" /><!--  전 화면에서 넘어온 페이지 정보 -->
				<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
				<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" /><!--  전 화면에서 넘어온 검색 정보 -->
            	<input type="hidden" name="ckval" id="ckval" value="1"/> <!-- 비공개 클릭(0,1) -->
               
	            <div class="right_area">      
                	<div class="register_wrap">
	                    <div class="title">QnA </div>
	                    <hr/>
	                    
	                    <input type="text" class="input_box" value="${data.TITLE}" id="title" name="title"/>
	                    <hr/>
	                    
	                    <div class="con">
	                     	<textarea class="form-control" rows="5" id="con" name="con"> ${data.CON}</textarea>
	                	</div>
	                	
	                    <hr/>
	                    <div class="checkbox_box">
	                        <span>비공개</span>
                            <input type="checkbox" id="checkbox" onClick="check(this)"/>
	                    </div>
	                    
	                    <hr/>
	                    
	                    <div class="btn_wrap">
	                        <input type="button" value="수정취소" class="btn cancle" id="updateCancelBtn">
	                        <input type="button" value="수정완료" class="btn update" id="updateBtn">
                    	</div>
                   	</div>
                </div>
  			</form>        
  			</div>
		</main>
	<c:import url="/footer"></c:import>
</body>
</html>