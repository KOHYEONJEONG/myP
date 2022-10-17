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
	margin-left: 5px;
	background: #00af80;
	border: solid 1px #00af80;
}

.list{
	background: #595959;
	border: solid 1px #595959;
	
}

.carInfo{
	margin-bottom: 40px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	
	console.log("리뷰번호 : "+$("#review_num").val());
	console.log("페이지번호 : "+ "${param.page}");
	console.log("검색 : "+ "${param.searchText}");
	console.log("구분 : "+ "${param.searchGbn}");
	
	//별점
	$('.feeStar, .envStar, .cctvStar, .disStar').raty({ 
		readOnly: true, 
		path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"
	});
	
	//qna목록
	$("#listBtn").on("click", function() { 
	   $("#actionForm").attr("action","mypageReviewBoard");
	   $("#actionForm").submit();
	})
	
	$("#deleteBtn").on("click",function(){
		if($("#no").val() != ""){
			makePopup({
		         title : "삭제",
		         contents : "정말로 삭제하시겠습니까?",
		         // draggable : true,
		         buttons : [{
		            name : "확인",
		            func:function() {
		            	action("delete");
		            	closePopup(); // 제일 위의 팝업 닫기
		            }
		         }, {
			            name : "취소"
				    }]
			});
		}
	});
	
	$("#updateBtn").on("click", function(){
		console.log("수정버튼");
		$("#actionForm").attr("action","mypageReviewUpdate");/*페이지이동*/ 
		$("#actionForm").submit();
	});
});

var msg ={
		"delete" : "삭제",
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
					// 목록 재조회
					switch(flag){
						case "delete" :
							$("#actionForm").attr("action","mypageReviewBoard");/*삭제 후 목록으로 페이지이동*/
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
	
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="review_num" id="review_num" value="${param.review_num}"/>
	 	<input type="hidden" name="no" id="no" value="${sMemNo}" />
		<!--  전 화면에서 넘어온 페이지 정보 -->
		<input type="hidden" name="page" id="page" value="${param.page}" />
		<!--  전 화면에서 넘어온 검색 정보 -->
		<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" id="searchText" name="searchText" value="${param.searchText}" />
	</form>
	
	<main>
		<div class="main_wrap">
				<c:import url="/mypageSidebar"></c:import> 

			<div class="right_area">
				<div class="rigth_contents">
					<table class="carInfo">
						<thead>
							<tr>
								<th colspan="4">[주차장 정보]</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>주차장명</td>
								<td>${data.CAR_PARK_NM}</td>
								<td>연락처</td>

								<c:if test="${!empty data.PHONE}">
									<td>${data.PHONE}</td>
								</c:if>

								<c:if test="${empty data.PHONE}">
									<td>-</td>
								</c:if>
							</tr>
							<tr>
								<td>노상/노외</td>
								<td>${data.CAR_PARK_TP_NM}</td>
								<td>무료/유료</td>
								<td>${data.PAYORFREE_DIV}</td>
							</tr>
							<tr>
								<td>주소</td>
								<td colspan="3">${data.ADDRESS}</td>
							</tr>
							<tr>
								<td>운영시간</td>
								<td class="time">
									<div>
										<span>매일</span> <span>${data.WEEKDAY_START_TIME}</span> <span>${data.WEEKDAY_END_TIME}</span>
									</div>
									<div>
										<span>공휴일</span> <span>${data.WEEKEND_START_TIME}</span> <span>${data.WEEKEND_END_TIME}</span>
									</div>
								</td>
								<td>주차요금</td>
								<td class="money">
									<div>
										<span>기본요금</span> <span>${data.TIME_RATE}분</span><span>${data.FEE_RATE}원</span>
									</div>
									<div>
										<span>추가요금</span> <span>${data.ADD_TIME_RATE}분</span><span>${data.ADD_FEE}원</span>
									</div>
								</td>
							</tr>
							
						</tbody>
					</table>
					
					<div class="btn_wrap1">
						<div class="btn list" id="listBtn">목록</div>
						<div class="btn delete" id="deleteBtn">삭제</div>
						<div class="btn update" id="updateBtn">수정</div>
					</div>
					<table class="myReviewInfo">
						<thead>
							<tr>
								<td colspan="4">[나의 리뷰]</td>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>제목</td>
								<td colspan="3">${data.TITLE}</td>
							</tr>
							
							<tr>
								<td>CCTV별점</td>
								<td>
									<div class="cctvStar" data-score="${data.CCTV_STAR_SCORE}"></div> 
								</td>
								
								<td>환경별점</td>
								<td>
									<div class="envStar" data-score="${data.ENV_STAR_SCORE}"></div> 
								</td>
								
							</tr>
							<tr>
								<td>요금별점</td>
								<td>
									<div class="feeStar" data-score="${data.FEE_STAR_SCORE}"></div> 
								</td>
								
								<td>할인정보별점</td>
								<td>
									<div class="disStar" data-score="${data.DIS_STAR_SCORE}"></div> 
								</td>
							</tr>
							
							<tr>
								<td>내용</td>
								<td colspan="3" class="textarea_box">
									<textarea name="con" id="con" class="con" readonly="readonly">${data.CON}</textarea>
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