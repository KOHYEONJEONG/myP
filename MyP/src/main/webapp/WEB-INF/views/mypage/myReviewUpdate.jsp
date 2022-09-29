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

.delete {
	background: #00af80;
	border: solid 1px #00af80;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	var starUpdate= [];
	
	$('.feeStar, .envStar, .cctvStar, .disStar').raty({ 
		path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images",
        half : true,
        hints :  [['bad 1/2', 'bad'], ['poor 1/2', 'poor'], ['regular 1/2', 'regular'], ['good 1/2', 'good'], ['gorgeous 1/2', 'gorgeous']]
        ,width : 200
	});
	
	$("#updateCancelBtn").on("click",function(){
		console.log("수정취소");
		//action("update");
		history.back();
	});
		
	$("#updateBtn").on("click",function(){
		
		$("#cctv_star").val($("#cctvStar input").val());
		$("#env_star").val($("#envStar input").val());
		$("#fee_star").val($("#feeStar input").val());
		$("#dis_star").val($("#disStar input").val());
		$("#sendCon").val($("#con").val());
		
		action("update");
	});
});

var msg ={
		"update" : "수정",
	}
	
//분류명 테이블의 action
function action(flag) {
	console.log(msg[flag]);
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "myReviewAction/"+flag, 
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			switch(res.msg){
			case "success" :
				switch(flag){
					case "update" :
						$("#actionForm").attr("action","myReviewDetail");/*리뷰 상세보기 페이지로 이동*/
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
</script>
</head>
<body>
	<c:import url="/header1"></c:import>
	<form action="#" id="actionForm">
		<input type="hidden" name="review_num" id="review_num" value="${param.review_num}" /> 
		<input type="hidden" name="no" id="no" value="${sMemNo}" />
		
		<input type="hidden" name="page" id="page" value="${param.page}" /><!--  전 화면에서 넘어온 페이지 정보 -->
		
		<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}" /><!--  전 화면에서 넘어온 검색 정보 -->
			
		<input type="hidden" id="cctv_star" name="cctv_star"/>
		<input type="hidden" id="env_star" name="env_star"/>
		<input type="hidden" id="dis_star" name="dis_star"/>
		<input type="hidden" id="fee_star" name="fee_star"/>
		<input type="hidden" id="sendCon" name="sendCon"/>
	</form>
	<main>
		<div class="main_wrap">
			<div class="side_bar">
				<c:import url="/mypagesidebar"></c:import> 
			</div>

			<div class="right_area">
				<div class="rigth_contents">
					<div class="btn_wrap1">
						<div class="btn update cancle" id="updateCancelBtn">상세보기</div>
						<div class="btn update" id="updateBtn">수정완료</div>
					</div>
					<table>
						<thead>
							<tr>
								<td colspan="4">[리뷰 수정페이지]</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>CCTV별점</td>
								<td>
									<div class="cctvStar" data-score="${data.CCTV_STAR_SCORE}" id="cctvStar"></div> 
								</td>
								
								<td>환경별점</td>
								<td>
									<div class="envStar" data-score="${data.ENV_STAR_SCORE}" id="envStar"></div> 
								</td>
								
							</tr>
							<tr>
								<td>요금별점</td>
								<td>
									<div class="feeStar" data-score="${data.FEE_STAR_SCORE}" id="feeStar"></div> 
								</td>
								
								<td>할인정보별점</td>
								<td>
									<div class="disStar" data-score="${data.DIS_STAR_SCORE}" id="disStar"></div> 
								</td>
							</tr>
							
							<tr>
								<td>내용</td>
								<td colspan="3" class="textarea_box">
									<textarea name="con" id="con" class="con">${data.CON}</textarea>
							    </td>
							</tr>
						</tbody>
					</table>

				</div>

			</div>

		</div>
	</main>
	<c:import url="/footer"></c:import>
</body>
</html>