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
<link rel="stylesheet" href="resources/css/manager.css">
<link rel="stylesheet" href="resources/css/font.css">
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script src="resources/js/main.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
   reloadList();
	
	//검색구분 유지
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");//없으면 0으로 고정
	}
	   
	// 페이징 클릭시
	 $(".page_nation").on("click", "a", function () {
		$("#page").val($(this).attr("page"));
		//기존 값 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		reloadList();
	});
	
	 $("#searchBtn").on("click", function () {
		 console.log("검색버튼")
		$("#page").val("1");
		//기존 값 새값으로 변경
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldText").val($("#searchText").val());
		
		reloadList();
	});
	   
});
   
  var msg ={
	"update" : "수정",
}
  
  function reloadList() {
	var params = $("#searchForm").serialize();
	$.ajax({
		url : "memManagementListAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) {
			console.log("성공")
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
		
		html +="<tr no=\"" + data.MEM_NUM+ "\">";
		html +="<td>" + data.MEM_NUM+ "</td>";
		html +="<td>" + data.ID+ "</td>";
		html +="<td>" + data.NM+ "</td>";
		html +="<td>" + data.EMAIL+ "</td>";
		html +="<td>" + data.WARNING+ "</td>";
		html +="<td>" + data.AUTORITY_NM+ "</td>";
		html +="</tr>";
		
		//html +="<div class=\"delete_btn\">삭제</div>";
		//html +="<div class=\"delete_btn\">수정</div><br/>";
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
					<div class="search_box">
						 <form action="#" id="searchForm">
							<!-- 검색어 유지용 -->
							<input type="hidden" id="oldGbn" value="0" />
							<input type="hidden" id="oldText" />
							<input type="hidden" name="page" id="page" value="1" />
							
							<div class="select">
								<select name="searchGbn" id="searchGbn">
									<option value="0">전체</option>
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
						</form>	
					</div>
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
	<c:import url="/footer"></c:import>
</body>
</html>