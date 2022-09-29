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
<style>
/* .search_form1 {
  width: 200px;
  height: 35px;
  border: 1px solid #d7d7d7;
  margin-right: 5px;
  box-sizing: border-box;
}

.table_wrap .search_box .search_form1 input {
  width: 100%;
  height: 100%;
  border: 0;
  outline-color: #000;
  padding: 5px;
  box-sizing: border-box;
}

.table_wrap .search_box {
    position: relative;
    width: 800px;
    height: 100%;
    background-color: #fff;
    border: 0px; 
    display: flex;
    justify-content: right;
    align-items: end;
    box-sizing: border-box;
    margin-bottom: 20px;
}

.table_wrap .search_box .select {
    width: 110px;
    height: 35px;
    background-color: #f6f6f6;
    border: 1px solid #d7d7d7;
    cursor: pointer;
    margin-right: 5px;
    box-sizing: border-box;
}

.table_wrap .search_box .search_btn {
    width: 70px;
    height: 35px;
    border: 1px solid #e6e6e6;
    background: rgb(255,255,255);
    background: -moz-linear-gradient(top, rgba(255,255,255,1) 0%, rgba(229,229,229,1) 100%);
    background: -webkit-linear-gradient(top, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%);
    background: linear-gradient(to bottom, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%);
    font-size: 20px;
    text-align: center;
    box-sizing: border-box;
    text-align: center;
    font-size: 14px;
    line-height: 33px;
    cursor: pointer;
} */
</style>
<!--  <script src="./jquery/jquery-1.12.4.js"></script>
    <script src="./js/main.js"></script>-->
<script type="text/javascript">
$(document).ready(function() {
	
	console.log( "page : "+$("#page").val())
	
	//검색 구분 설정
	if("${param.searchGbn}" != "") {
		$("#searchGbn").val("${param.searchGbn}");
	} else {
		$("#oldGbn").val("0"); //없으면 0으로 고정
	}
	
	//처음에 보이는 리스트를 가져온다.
	reloadList();
	
	//검색 버튼
	$("#search_btn").on("click", function() {
		$("#page").val("1");
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	});
	
	//주차장관련 ajax
	function reloadList() {
		var params = $("#dataForm").serialize();
		
		$.ajax({
			url: "parkinfoList",
			type: "POST",
			dataType : "json",
			data: params,
			success: function(res) {
				drawListcar1(res.list); //리스트 각각 가져와야해서 4개 만들었음.
				drawPaging1(res.pd);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	}
	
	function drawListcar1(list) {
		var html = "";
	    
		for(var data of list) {
			html += "<tr no=\""+data.CAR_PARK_MAG_NUM+"\">"; //주차장관리번호
		    html += "<td>"+data.CAR_PARK_NM+"</td>"; //주차장명
		    html += "<td>"+data.CAR_PARK_TP_NM+"</td>"; //노외/노상
		    html += "<td>"+data.ADDRESS+"</td>"; //주소
		    html +="<td>" + data.HIT + "</td>"; // 조회수
		    html += "</tr>";
		    
		}
		$("tbody").html(html);
	}
	
	function drawPaging1(pd) {
		var html = "";
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
		
		if($("#page").val() *1 == pd.maxp){ //endp로하면 5번째 페이징에서 끝으로 넘어가버림.
			html += "<a class=\"arrow next\" page=\"" +pd.maxP+ "\"></a>";
		} else {
			html += "<a class=\"arrow next\" page=\"" + ($("#page").val() *1 + 1) + "\"></a>";
		}
		
		html += "<a class=\"arrow nnext\" page=\"" +pd.maxP+ "\"></a>";
		
		$(".page_nation").html(html);
	                                                                     
	}
	
	$(".page_nation").on("click", "a", function() {
		$("#page").val($(this).attr("page")); 
	
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		reloadList();
	});
	
	//디테일로 이동 코드
	$("tbody").on("click", "tr", function() {
		$("#no").val($(this).attr("no"));
		
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#dataForm").attr("action", "parkinfodetail");
		$("#dataForm").submit();
	});
});

</script>
</head>
<body>
	<c:import url="/header1"></c:import>
	<input type="hidden" id="oldGbn" value="${param.searchGbn}">
	<input type="hidden" id="oldTxt" value="${param.searchTxt}">
	<main>
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">주차장 안내</div>
				<div class="inner">
					<div class="on">공영 주차장 조회</div>
				</div>
			</div>

			<div class="right_area">
				<div class="table_wrap">
					<form action="#" id="dataForm" method="post">
						<div class="search_box">
							<input type="hidden" id="oldGbn" value="0" /> 
							<input type="hidden" id="oldTxt" /> <input type="hidden" name="no"id="no" /> 
							<input type="hidden" name="page" id="page" value="${page}" />

							<div class="select">
								<select name="searchGbn" id="searchGbn">
									<option value="0">전체</option>
									<option value="1">주차장명</option>
									<option value="2">주차장유형</option>
									<option value="3">주소</option>
								</select>
							</div>

							<div class="search_form">
								<input type="text" name="searchTxt" id="searchTxt"
									value="${param.serarchTxt}" />
							</div>

							<div class="search_btn" id="search_btn">검색</div>
						</div>

						<table>
							<thead>
							 <tr>
                    		  <th>주차장명</th>
                    		  <th>유형</th>
                    		  <th>주소</th>
                    		  <th>조회수</th>
                  		     </tr> 
							</thead>

							<tbody>
							</tbody>
						</table>

						<!--페이징-->
						<div class="page_wrap">
							<div class="page_nation"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<c:import url="/footer"></c:import>
	<!-- <script src="./js/main.js"></script> -->
</body>
</html>