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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/rety/jquery.raty.js"></script>
<!-- 별 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/rety/jquery.raty.css">
<!-- 별 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/common/popup.css" />
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<style>
.rigth_contents {
	width: 900px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 900px;
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
	width: 907px;
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

.updateClick{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$(".updateNoneClick").show();
	$(".updateClick").hide();
	
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
	
	$("#updateBtn").on("click",function(){
		console.log("수정");
		//action("update");
		
		//actionform에 수정할 name들 hidden으로 만들어야할듯!!!
		//class로 한 이유는 여러개를 한번에 바꿔야하기에(id로 하면 맨처음 인식하는 셀렉터만 변경하기에~)
		$(".updateNoneClick").hide();
		$(".updateClick").show();
		
		//text창을 만들어줘야함
		
		$('#deleteBtn').css({"background-color":"#595959","border":"1px solid #595959"});
	    $('#deleteBtn').attr('disabled', false); //버튼 잘 눌리는데??(수정해야함.)
	    $('#con').attr('readonly',false);
		$("#updateBtn").html("수정완료");
		
	});
});

var msg ={
		"update" : "수정",
		"delete" : "삭제",
	}
	
//분류명 테이블의 action
function action(flag) {
	console.log(msg[flag]);
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "myReviewAction/" + flag,
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			switch(res.msg){
			case "success" :
				// 목록 재조회
				switch(flag){
					case "delete" :
						$("#actionForm").attr("action","mypageReviewBoard");
						$("#actionForm").submit();
						break;
					case "update" :
						$("#actionForm").attr("action","mypageReviewUpdate");
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
		<input type="hidden" name="review_num" id="review_num"
			value="${param.review_num}" /> <input type="hidden" name="no" id="no"
			value="${sMemNo}" />
		<!--  전 화면에서 넘어온 페이지 정보 -->
		<input type="hidden" name="page" id="page" value="${param.page}" />
		<!--  전 화면에서 넘어온 검색 정보 -->
		<input type="hidden" id="searchGbn" name="searchGbn"
			value="${param.searchGbn}" /> <input type="hidden" id="searchTxt"
			name="searchTxt" value="${param.searchTxt}" />
		<input type="hidden" id="updatedisstar" name="updatedisstar"/><!-- 할인별점 수정 -->
		<input type="hidden" id="updatecctvstar" name="updatecctvstar"/><!-- cctv별점 수정 -->
		<input type="hidden" id="updateenvstar" name="updateenvstar"/><!-- 환경별점 수정 -->
		<input type="hidden" id="updatefeestar" name="updatefeestar"/><!-- 요금별점 수정 -->
	</form>
	<main>
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">주차장 안내</div>
				<div class="inner">
					<div class="on">공영 주차장 조회</div>
				</div>
			</div>

			<div class="right_area">
				<div class="rigth_contents">
					<div class="btn_wrap1">
						<div class="btn delete" id="deleteBtn">삭제</div>
						<div class="btn update" id="updateBtn">수정</div>
					</div>
					<table>
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
							<tr>
								<td colspan="4">[나의 리뷰]</td>
							</tr>
							<tr>
								<td>CCTV별점</td>
								<td>
									<div class="updateNoneClick">
										<input type="hidden" id="ENV_STAR_SCORE" value="${data.CCTV_STAR_SCORE}" />
										<div class="cctvStar"></div> 
										<script type="text/javascript">
											$('.cctvStar').raty({ readOnly: true, score: $("#CCTV_STAR_SCORE").val(), 
												path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"	
											});
										</script>
									</div>
									<div class="updateClick">
										<div class="cctvStar2"></div> 
										<script type="text/javascript">
											$('.cctvStar2').raty({
												path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images",
											 	half : true,
								                hints :  [['bad 1/2', 'bad'], ['poor 1/2', 'poor'], ['regular 1/2', 'regular'], ['good 1/2', 'good'], ['gorgeous 1/2', 'gorgeous']],
								                width : 200,
								                score: $("#CCTV_STAR_SCORE").val(),
								                click: function(score, evt) {//선택한 별점수가
								                    $("#updatecctvstar").val(score);
								                	console.log($("#updatecctvstar").val());
								                }
											});
										</script>
									</div>
								</td>
								
								<td>환경별점</td>
								<td>
									<div class="updateNoneClick">
										<input type="hidden" id="ENV_STAR_SCORE" value="${data.ENV_STAR_SCORE}" />
										<div class="envStar"></div> 
										<script type="text/javascript">
										$('.envStar').raty({ 
											readOnly: true, 
											score: $("#ENV_STAR_SCORE").val(), 
											path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"	
										});
										</script>
									</div>
									<div class="updateClick">
										<div class="envStar2"></div> 
										<script type="text/javascript">
											$('.envStar2').raty({
												path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images",
											 	half : true,
								                hints :  [['bad 1/2', 'bad'], ['poor 1/2', 'poor'], ['regular 1/2', 'regular'], ['good 1/2', 'good'], ['gorgeous 1/2', 'gorgeous']],
								                width : 200,
								                score: $("#ENV_STAR_SCORE").val(),
								                click: function(score, evt) {//선택한 별점수가
								                    $("#updateenvstar").val(score);
								                	console.log($("#updateenvstar").val());
								                }
											});
										</script>
									</div>
								</td>
								
							</tr>
							<tr>
								<td>요금별점</td>
								<td>
									<div class="updateNoneClick">
										<input type="hidden" id="FEE_STAR_SCORE"
										value="${data.FEE_STAR_SCORE}" />
										<div class="feeStar"></div> 
										<script type="text/javascript">
											$('.feeStar').raty({ readOnly: true, score: $("#FEE_STAR_SCORE").val(), 
												path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"	
											});
										</script>
									</div>
									
									<div class="updateClick">
										<div class="feeStar2"></div> 
										<script type="text/javascript">
											$('.feeStar2').raty({
												path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images",
											 	half : true,
								                hints :  [['bad 1/2', 'bad'], ['poor 1/2', 'poor'], ['regular 1/2', 'regular'], ['good 1/2', 'good'], ['gorgeous 1/2', 'gorgeous']],
								                width : 200,
								                score: $("#FEE_STAR_SCORE").val(),
								                click: function(score, evt) {//선택한 별점수가
								                    $("#updatefeestar").val(score);
								                	console.log($("#updatefeestar").val());
								                }
											});
										</script>
									</div>
								</td>
								
								<td>할인정보별점</td>
								<td>
									<div class="updateNoneClick">
										<div class="disStar"></div> 
										<input type="hidden" id="DIS_STAR_SCORE"
											value="${data.DIS_STAR_SCORE}" />
											
											<script type="text/javascript">
												$('.disStar').raty({ 
													readOnly: true, 
													score: $("#DIS_STAR_SCORE").val(), 
													path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"	
												});
											</script>
									</div>
									
									<div class="updateClick">
										<div class="disStar2"></div> 
										<script type="text/javascript">
											$('.disStar2').raty({
												path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images",
											 	half : true,
								                hints :  [['bad 1/2', 'bad'], ['poor 1/2', 'poor'], ['regular 1/2', 'regular'], ['good 1/2', 'good'], ['gorgeous 1/2', 'gorgeous']],
								                width : 200,
								                score: $("#DIS_STAR_SCORE").val(),
								                click: function(score, evt) {//선택한 별점수가
								                    $("#updatedisstar").val(score);
								                	console.log($("#updatedisstar").val());
								                }
											});
										</script>
									</div>
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