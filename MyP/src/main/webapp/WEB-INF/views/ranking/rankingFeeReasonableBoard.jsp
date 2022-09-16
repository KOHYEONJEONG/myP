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
    <link rel="stylesheet" href="resources/rety/jquery.raty.css">
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/header.js"></script>
    <script type="text/javascript" src="resources/rety/jquery.raty.js"></script>
<script type="text/javascript">
 	 $(document).ready(function () {

	reloadList();
		
	// 페이징 클릭시
	 $(".page_nation").on("click", "a", function () {
		$("#page").val($(this).attr("page"));
		//기존 값 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		reloadList();
	})		
})


function reloadList() {
	var params = $("#searchForm").serialize();
	$.ajax({
		url : "rankingFeeReasonableBoardList",
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
	
	var html1 = "";
	
	
	for(var data of list){
		if(data.RNK < 4){                                                    
            html1 +="	<div class=\"ranking_box\">";
            if(data.RNK == 1) {
            	html1 +="  		<div class=\"icon gold\"></div>";
            } else if(data.RNK == 2) {
            	html1 +="  		<div class=\"icon sliver\"></div>";
            } else {
            	html1 +="  		<div class=\"icon bronze\"></div>";
            }
            if(data.RNK == 1) {
            	html1 +="  		<div class=\"photo\">";
                html1 +="      		<img src=\"resources/img/weP.jpg\" alt=\"\" width=\"100%\">";
                html1 +="  		</div>";
            } else if(data.RNK == 2) {
            	html1 +="  		<div class=\"photo\">";
                html1 +="      		<img src=\"resources/img/wep1.jpg\" alt=\"\" width=\"100%\">";
                html1 +="  		</div>";
            } else {
            	html1 +="  		<div class=\"photo\">";
                html1 +="      		<img src=\"resources/img/wep2.jpg\" alt=\"\" width=\"100%\">";
                html1 +="  		</div>";
            }           
            html1 +="  		<div class=\"info\">";
            html1 +="    		<span class=\"parking_name\">" + data.CAR_PARK_NM + "</span>";          
            html1 +="    		<div class=\"star" + data.RNK + "\"></div>";
            html1 +="  		</div>";
          	html1 +="	</div>";
		}                                                      
	}   
	
	$(".ranking_area").html(html1);
	                                                                                      
	
	var html = "";
	
	for(var data of list){
		const address = data.ADDRESS.split(' ');
				
		html +="<tr no=\"" + data.RNK  + "\">";
		html +="<td>" + data.RNK + "</td>";
		html +="<td>" + data.CAR_PARK_NM + "</td>";		
		html +="<td>" + address[0] + "</td>";
		html +="<td>" + address[1] + "</td>";
		html +="<td><div class=\"star" + data.RNK + "\"></div></td>";
		html +="</tr>";
	}
	
	$("tbody").html(html);
	
	
	for(var data of list) {		
		
		$('.star' + data.RNK).raty({ readOnly: true, score: data.SYSTEM, 
			path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"	
		});	 		
	}	
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
            <div class="title">랭킹</div>
            <div class="inner">
                <div id="system2">시스템 좋은 주차장</div>
                <div class="on">요금 합리적인 주차장</div>
            </div> 
        </div>
        <div class="right_area">     
        <form action="#" id="searchForm">
			<!-- 검색어 유지용 -->
			<input type="hidden" id="oldGbn" value="0" />
			<input type="hidden" id="oldText" />
			<input type="hidden" name="page" id="page" value="1" />
		</form>       
            <div class="table_wrap">
                <div class="ranking_area">
                    <div class="ranking_box">
                      <div class="icon gold"></div>
                      <div class="photo">
                          <img src="resources/img/1.png" alt="" width="100%">
                      </div>
                      <div class="info">
                        <span class="parking_name">논현 공영주차장</span>
                        <sapn>⭐⭐⭐⭐⭐</sapn>
                      </div>
                  </div>    
                    <div class="ranking_box">
                        <div class="icon sliver"></div>
                        <div class="photo">
                            <img src="resources/img/1.png" alt="" width="100%">
                        </div>
                        <div class="info">
                          <span class="parking_name">논현 공영주차장</span>
                          <sapn>⭐⭐⭐⭐⭐</sapn>
                        </div>
                    </div>
                    <div class="ranking_box">
                        <div class="icon bronze"></div>
                        <div class="photo">
                            <img src="resources/img/1.png" alt="" width="100%">
                        </div>
                        <div class="info">
                          <span class="parking_name">논현 공영주차장</span>
                          <sapn>⭐⭐⭐⭐⭐</sapn>
                        </div>
                    </div>
                </div>
              <table>
              <colgroup>
					<col width="100"> <!-- 순위 -->
					<col width="300"> <!-- 주차장명 -->
					<col width="125"> <!-- 구 -->
					<col width="125"> <!-- 동 -->
					<col width="150"> <!-- 별점 -->
				</colgroup>
                <thead>
                  <tr>
                    <th>순위</th>
                    <th>주차장명</th>
                    <th>구</th>
                    <th>동</th>
                    <th>별점</th>
                  </tr>
                </thead>
                <tbody></tbody>
              </table>
                <!-- <div class="page_wrap">
                    <div class="page_nation">
                       <a class="arrow pprev" href="#"></a>
                       <a class="arrow prev" href="#"></a>
                       <a href="#" class="active">1</a>
                       <a href="#">2</a>
                       <a href="#">3</a>
                       <a href="#">4</a>
                       <a href="#">5</a>
                       <a href="#">6</a>
                       <a href="#">7</a>
                       <a href="#">8</a>
                       <a href="#">9</a>
                       <a href="#">10</a>
                       <a class="arrow next" href="#"></a>
                       <a class="arrow nnext" href="#"></a>
                    </div>
                 </div> -->
            </div> 
        </div>
        </div>
      </main>
	<c:import url="/footer"></c:import>
</body>
</html>