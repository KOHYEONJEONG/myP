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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/rety/jquery.raty.js"></script> <!-- 별 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rety/jquery.raty.css"><!-- 별 -->
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
	margin-left: 5px;
}

.delete {
	background: #00af80;
	border: solid 1px #00af80;
}
td.con{
	background-color: #fff;
}
</style>
</head>
<body>
	<c:import url="/header1"></c:import>
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
									<div>
									</div>
								</td>
								<td>환경별점</td>
								<td>
									<div>
									</div>
								</td>
							</tr>
							<tr>
								<td>요금별점</td>
								<td>
									<div>
									</div>
								</td>
								<td>할인정보별점</td>
								<td>
									<div>
									</div>
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td class="con" colspan="3">${data.CON}</td>
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