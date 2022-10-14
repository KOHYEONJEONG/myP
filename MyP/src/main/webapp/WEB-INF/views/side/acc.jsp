<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="title">요금 계산</div>
	<div class="select_box">
	  <span>이용시간</span>
	    <select name="use_time" id="time_rate">
		    <option value="0" disabled selected>전체</option>
		    <option value="1">30분</option>
		    <option value="2">1시간</option>
		    <option value="3">2시간</option>
		    <option value="4">4시간</option>
		</select>
		<br/>
		
	  	<span style="font-size: 12px;margin: 0px auto;">※기본 주차 5분 단위(자세한 요금은 상세보기로 확인해주세요.)</span>
	</div>

	<div class="result_area" id="feeComArea">
		<div class="text">요금을 비교할 주차장을 선택해주세요</div>
		<!-- 요금 비교(배열)-->
		</div>
	<div class="btn_wrap">
	  <input type="button" class="bottom_btn" id="feeCompareBtn" value="요금 비교" />
	</div>
</body>
</html>