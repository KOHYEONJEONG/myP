<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyP</title>
<script src="resources/jquery/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/manager.css">
<link rel="stylesheet" href="resources/css/font.css">
<script src="resources/js/main.js"></script>
<script src="resources/js/manager.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//검색구분 유지
	if("${param.searchGbn}" != ""){ //(*) .jsp파일에 넣어주지 않으면 jsp 값을 절대절대 읽어오지 않아(manager.js에 21번줄부터 25번줄은 절대 넣으면 안돼!)
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");//없으면 0으로 고정
	}	
	
})

</script>
</head>
<body>
	<c:import url="/header1"></c:import>
	
	<input type="hidden" id="oldGbn" value="${param.searchGbn}"> <!-- 기존 검색 유지용 보관 (검색구분)-->
	<input type="hidden" id="oldText" value="${param.searchText}"> <!-- 기존 검색 유지용 보관 (검색어)-->
	
	<main>
		<div class="main_wrap">
			<c:import url="/managerSidebar">
				<c:param name="link" value="memManagement"></c:param>
			</c:import>
			<div class="right_area">
				<div class="table_wrap" style="top:435px;">
				<form action="#" id="searchForm">
				  <div class="search_box1">
						<div class="search_box">
							<input type="hidden" name="page" id="page" value="${page}"/>
							<input type="hidden" id="no" name="no"/>
							<div class="select">
								<select name="searchGbn" id="searchGbn">
									<option value="0">전체</option>
									<option value="1">아이디</option>
									<option value="2">닉네임</option>
									<option value="3">이메일</option>
									<option value="4">권한</option>
								</select>
								<!--조건선택-->
							</div>
							
							<div class="search_form">
								<input type="text" name="searchText" id="searchText"/>
							</div>
							<div class="search_btn" id="searchBtn">검색</div>
						</div>
						</div>
			   </form>	
					<table>
						<colgroup>
							<col width="100">
							<col width="200">
							<col width="200"> 
							<col width="300">
							<col width="150">
							<col width="150"> 
						</colgroup>
						<thead>
							<tr>
								<th>no</th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>이메일</th>
								<th>경고</th>
								<th>권한</th>
							</tr>
						</thead>

						<tbody>
						</tbody>
					</table>

					<!--페이징-->
					<div class="page_wrap">
						<div class="page_nation"></div>
					</div>

				</div>
			</div>
		</div>
	</main>
	
	<!-- 권한 팝업창 -->
	<div id="autority_popup" class="autority_popup">
 		<c:import url="/autorityPopup"></c:import>
 	</div>
 	
	<c:import url="/footer"></c:import>
</body>
</html>