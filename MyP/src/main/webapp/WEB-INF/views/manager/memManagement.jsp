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
 
</head>
<body>
	<c:import url="/header1"></c:import>
	<input type="hidden" id="oldGbn" value="${param.searchGbn}"> <!-- 기존 검색 유지용 보관 (검색구분)-->
	<input type="hidden" id="oldTxt" value="${param.searchTxt}"> <!-- 기존 검색 유지용 보관 (검색어)-->
	
	<main>
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">관리자페이지</div>
				<div class="inner">
					<div class="on">회원관리</div>
					<div>챗봇관리</div>
					<div>데이터관리</div>
					<div>신고리뷰관리</div>
					<div>카테고리관리</div>
				</div>
			</div>
			<div class="right_area">
				<div class="table_wrap">
				  
				 	<form action="#" id="searchForm">
				  <div class="search_box1">
				
					<div class="autority_btn" id="autority_btn">권한</div>
				 	
				 	
				 	
						<div class="search_box">
								<!-- 검색어 유지용 -->
								<input type="hidden" id="oldGbn" value="0" />
								<input type="hidden" id="oldText" />
								<input type="hidden" name="page" id="page" value="1" />
								
								<div class="select">
									<select name="searchGbn" id="searchGbn">
										<option disabled selected>전체</option>
										<option value="1">아이디</option>
										<option value="2">작성자</option>
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
							<col width="100">
							<col width="200">
							<col width="200"> 
							<col width="300">
							<col width="150">
							<col width="150"> 
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" class="cb" /></th>
								<th>no</th>
								<th>아이디</th>
								<th>닉네임</th>
								<th>이메일</th>
								<th>경고</th>
								<th>권한</th>
							</tr>
						</thead>

						<tbody>
							<!-- 
              
                     -->

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
	<div id="autority_popup" class="autority_popup">
 		<c:import url="/autorityPopup"></c:import>
 	</div>
	<c:import url="/footer"></c:import>
</body>
</html>