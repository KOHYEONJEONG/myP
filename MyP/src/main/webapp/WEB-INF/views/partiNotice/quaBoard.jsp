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
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/font.css">
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
	 // 검색 구분 설정
	   if("${param.select_b}" != "") {
	      $("#select_b").val("${param.select_b}");
	   } else {
	      $("#oldGbn").val("0");
	   }
	
	   // 목록 조회
	   reloadList();	
	
	   // 검색 버튼
	   $("#searchbtn").on("click", function() {
	      $("#page").val("1");
	      console.log("클릭");
	      
	      // 신규 상태 적용
	      $("#oldGbn").val($("#select_b").val());
	      $("#oldTxt").val($("#searchTxt").val());
	      
	      reloadList();
	   });
	   
	   // 페이징 버튼
	   $(".page_nation").on("click", "a", function() {
	      // 기존 검색상태 유지      
	      $("#select_b").val($("#oldGbn").val());
	      $("#searchTxt").val($("#oldTxt").val());
	      
	      
	      $("#page").val($(this).attr("page"));
	      
	      reloadList();
	   });
	   
	   // 글쓰기 버튼
	   $("#writeBtn").on("click", function() {
	      // 기존 검색상태 유지      
	      $("#select_b").val($("#oldGbn").val());
	      $("#searchTxt").val($("#oldTxt").val());
	      
	      $("#actionForm").attr("action", "qnaInsert");
	      $("#actionForm").submit();      
	   });
	   
	   $("tbody").on("click", "tr", function() {
		      $("#qna_num").val($(this).attr("no"));
		      
		      // 기존 검색상태 유지
		      $("#select_b").val($("#oldGbn").val());
		      $("#searchTxt").val($("#oldTxt").val());
		      
		      $("#actionForm").attr("action", "QnaDetail");
		      $("#actionForm").submit();
		   });
		}); // document ready end


		
function reloadList() {
	var params = $("#actionForm").serialize();
	$.ajax({
		url : "QnaAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			drawList(res.list);
			drawPaging(res.pd);
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
}

function drawList(list) {
	var html = "";
	for(var data of list){
		html +="<tr no=\"" + data.QNA_NUM  + "\">";
		html +="<td>" + data.NORNK + "</td>";
		/* 공개 비공개 구분 */
		if(data.PRIVATE == 0){
		html +="<td><i class=\"lock\"></i>" + data.TITLE + "</td>";
		}else{
		html +="<td>" + data.TITLE + "</td>";
		}
		/* 답변대기 답변완료 구분 */
		if(typeof data.ADT == 'undefined'){
			html +="<td>" + "답변대기" + "</td>";
		}else{
			html +="<td>" + "답변완료" + "</td>";
		}
		html +="<td>" + data.NM + "</td>";
		html +="<td>" + data.DT + "</td>";
		html +="<td>" + data.HIT + "</td>";
		
		html +="</tr>";
	}
	
	$("tbody").html(html);
}

function drawPaging(pd) {
	var html = "";
	
	html +=
	html += "<a class=\"parrow pprev\" page=\"1\"></a>";
	// 이전
	if($("#page").val() == "1"){
		html += "<a class=\"arrow prev\" page=\"1\"></a>";
	} else{
		// 문자열을 숫자로 바꾸기위해 *1
		html += "<a class=\"arrow prev\" page=\"" + ($("#page").val() *1 - 1) + "\"></a>";
	}
	
	for(var i = pd.startP; i <= pd.endP; i++){
		if($("#page").val() * 1 == i){ // 현재 페이지
			html += "<a class=\"active\" page=\"" + i + "\">" + i + "</a>";
		} else { // 다른 페이지
			html += "<a page=\"" + i + "\">" + i + "</a>";
		}
		
	}
	
	if($("#page").val() *1 == pd.endP){ // 현재페이지가 마지막 페이지라면
		html += "<a class=\"arrow next\" page=\"" +pd.maxP+ "\"></a>";
	} else {
		html += "<a class=\"arrow next\" page=\"" + ($("#page").val() *1 + 1) + "\"></a>";
	}
	
	html += "<a class=\"arrow nnext\" page=\"" +pd.maxP+ "\"></a>";
	
	$(".page_nation").html(html);
                                                                     
}
</script>
</head>
<body>
<c:import url="/header1"></c:import>
	<main>
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">참여/알림</div>
				<div class="inner">
					<div>공지사항</div>
					<div>FAQ</div>
					<div class="on">QnA</div>
				</div>
			</div>

			<div class="right_area">
				<div class="table_wrap">


					<input type="hidden" id="oldGbn" value="${param.select_b}" /> <input
						type="hidden" id="oldTxt" value="${param.searchTxt}" />

					<form action="#" id="actionForm" method="post">
						<div class="search_box">
							<input type="hidden" name="qna_num" id="qna_num" />
						<input type="hidden" id="no" name="no" value="${sMemNo}"/>
							<input type="hidden" id="oldGbn" value="0" /> 
							<input	type="hidden" id="oldTxt" /> 
							 <input type="hidden" name="page" id="page"	value="${page}" />
							<div class="select">
								<select name="select_b" id="select_b">
									<option value="0">전체</option>
									<option value="1">제목</option>
									<option value="2">작성자</option>
								</select>
								<!--조건선택-->
							</div>
							<div class="search_form">
								<input type="text" name="searchTxt" id="searchTxt" />
							</div>
							<div class="search_btn" id="searchbtn">검색</div>
					</form>
				</div>

				<table>
					<thead>
						<tr>
							<th>no</th>
							<th>제목</th>
							<th>답변상태</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td>10</td>
							<td><i class="lock"></i> <span> 이용관련 문의드려요~ </span></td>
							<td>답변대기</td>
							<td>머순</td>
							<td>2022-06-27</td>
							<td>0</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!--페이징-->
				<div class="page_wrap">
					<div class="page_nation">
						<a class="arrow pprev" href="#"></a> <a class="arrow prev"
							href="#"></a> <a href="#" class="active">1</a> <a href="#">2</a>
						<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
						<a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a>
						<a class="arrow next" href="#"></a> <a class="arrow nnext"
							href="#"></a>
					</div>
				</div>
				<div class="btn_wrap">
					<c:choose>

						<c:when test="${empty sMemNo}">

						</c:when>

						<c:otherwise>
							<div class="write_btn" id="writeBtn">글쓰기</div>
						</c:otherwise>

					</c:choose>
				</div>
			</div>
		</div>
		</div>
	</main>
	<c:import url="/footer"></c:import>
	<!--  <script src="./js/main.js"></script> -->
</body>
</html>