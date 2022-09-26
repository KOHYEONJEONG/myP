<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyP</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/common/cmn.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/common/popup.css" />
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="resources/css/font.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<style>
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

.right_area1 {
	width: 900px;
	margin: 10px auto 0;
}

.rigth_contents1 {
	width: 900px;
	position: absolute;
	top: 230px;
	left: 50%;
	transform: translateX(-50%);
}

.right_area .notice {
	display: flex;
	justify-content: space-between;
	font-size: 0;
	height: 30px;
	margin: 8px 0;
	padding: 0 20px 0 10px;
}

.s_title {
	width: 200px;
	height: 40px;
	line-height: 40px;
	margin-left: 5px;
	font-size: 24px;
}

.btn_wrap {
	height: 100%;
	display: flex;
	justify-content: flex-end;
	margin-top: 10px;
}

.contents_top {
	display: flex;
	justify-content: space-between;
	margin-bottom: 5px;
}

.btn_wrap1 {
	display: flex;
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

.update {
	margin: 0px 8px 0px 0px;
	background: #FD9A29;
	border: solid 1px #FD9A29;
}

.delete {
	background: #00af80;
	border: solid 1px #00af80;
}

.back {
	border: 1px solid #ccc;
	background-color: #f6f6f6;
	color: #000;
}
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#listBtn").on("click", function() {
			$("#dataForm").attr("action", "parkinfo");
			$("#dataForm").submit();
		});

		$("#updateBtn").on("click", function() {
			$("#dataForm").attr("action", "parkInfoUpdate");
			$("#dataForm").submit();
		});

		$("#deleteBtn").on("click", function() {
			makePopup({
				title : "알림",
				contents : "삭제 하시겠습니까?",
				buttons : [ {
					name : "삭제",
					func : function() {
						var params = $("#dataForm").serialize();

						$.ajax({
							url : "INFOAction/delete", //경로
							type : "POST", //전송방식
							dataType : "json", //데이터형채
							data : params, // 보낼 데이터
							success : function(res) { //성공했을 때 결과를 res에 받고 함수 실행
								switch (res.msg) {
								case "success":
									//카테고리만 유지하고 나머지 정보 초기화
									$("#page").val("1");
									$("#searchGbn").val("0");
									$("#searchTxt").val("");

									$("#dataForm").attr("action", "parkinfo");
									$("#dataForm").submit();
									break;
								case "fail":
									makeAlert("알림", "삭제에 실패하였습니다.");
									break;
								case "error":
									makeAlert("알림", "삭제 중 문제가 발생하였습니다.");
									break;
								}

							},
							error : function(request, status, error) { //실패했을때 함수 실행
								console.log(request.responseText); //실패 상세내역
							}
						});
					}
				}, {
					name : "취소"

				} ]
			});
		});

	})
</script>
</head>
<body>
	<c:import url="/header1"></c:import>
	<main>
		<form action="#" id="dataForm" method="post">
			<input type="hidden" name="no" value="${data.CAR_PARK_MAG_NUM}" /> 
			<input type="hidden" name="page" id="page" value="${param.page}" />
		</form>
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">주차장 안내</div>
				<div class="inner">
					<div class="on">공영 주차장 조회</div>
				</div>
			</div>
			<div class="right_area1">
				<div class="rigth_contents1">
					<div class="contents_top">
						<h2 class="s_title">주차장 안내</h2>
						<c:choose>
							<c:when test="${sMemNo eq data.MEM_NUM and sMemAuto == 1}">
								<div class="btn_wrap">
									<div class="btn_wrap1">
										<div class="btn delete" id="deleteBtn">삭제</div>
										<div class="btn update" id="updateBtn">수정</div>
										<div class="cmn_btn_ml float_right_btn" id="listBtn">목록</div>
									</div>
								</div>
							</c:when>
							<c:when test="${sMemAuto == 1}">
								<div class="btn_wrap">
									<div class="btn_wrap1">
										<div class="btn update" id="updateBtn">수정</div>
										<div class="btn delete" id="deleteBtn">삭제</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
					<table>
						<thead>
							<tr>
								<c:set var="gu" value="${fn:split(data.ADDRESS,' ')}" />
								<!-- 주소 구만 가져오기 -->
								<th colspan="4">${gu[0]}</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>주차장명</td>
								<td>${data.CAR_PARK_NM}</td>
								<td>연락처</td>
								<td>${data.PHONE}</td>
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
										<span>매일</span> <span>${data.WEEKDAY_START_TIME}</span>~ <span>${data.WEEKDAY_END_TIME}</span>
									</div>
									<div>
										<span>공휴일</span> <span>${data.WEEKEND_START_TIME}</span>~ <span>${data.WEEKEND_END_TIME}</span>
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
								<td>방문자데이터</td>
								<td colspan="3">
									<canvas id="myChart"></canvas>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_wrap">
						<div class="btn back" id="listBtn">목록</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<c:import url="/footer"></c:import>
	<script type="text/javascript">
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context,
				{
					type : 'line', // 차트의 형태
					data : { // 차트에 들어갈 데이터
						labels : [
						//x 축
						'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
								'11', '12', '13', '14', '15', '16', '17', '18',
								'19', '20', '21', '22', '23', '24' ],
						datasets : [ { //데이터
							label : '시간도 인기도', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 0, 0, 0, 3, 5, 6, 10, 15, 25, 30, 20, 20,
									15, 15, 20, 20, 20, 15, 14, 12, 10, 8, 5,
									3, 0 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [
							//경계선 색상
							'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1, //경계선 굵기

						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true,
									steps : 10,
									max : 50
								}
							} ]
						}
					}
				});
	</script>
</body>
</html>