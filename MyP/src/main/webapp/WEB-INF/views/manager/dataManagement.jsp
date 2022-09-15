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
    
<script type="text/javascript">
$(document).ready(function() {
	//검색 구분 설정
	if("${param.searchGbn}" != "") {
		$("#searchGbn").val("${param.searchGbn}");
	} else {
		$("#oldGbn").val("0");
	}
	
	
	reloadList();
	
	//검색 버튼
	$("#searchBtn").on("click", function() {
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
	});
	
	function reloadList() {
		var params = $("#dataForm").serialize();
		
		$.ajax({
			url: "DataMListAjax",
			type: "POST",
			dataType : "json",
			data: params,
			success: function(res) {
				drawList(res.list);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	}
	
	function drawList(list) {
		var html = "";
		
		for(var data of list) {
			html += "<tr no=\""+data.CAR_PARK_MAG_NUM+"\">";
		    html += "<th>"+data.CAR_PARK_MAG_NUM+"</th>";
		    html += "<th>"+data.CAR_PARK_NM+"</th>";
		    html += "<th>"+data.ADDRESS+"</th>";
		    html += "<th>"+data.CAR_PARK_TP_NM+"</th>";
		    html += "</tr>";
		}
		$("tbody").html(html);
	}
});
</script>
</head>
<body>
 <input type="hidden" id="oldGbn" value="${param.searchGbn}">
 <input type="hidden" id="oldTxt" value="${param.searchTxt}">
 <c:import url="/header1"></c:import>
     <main>
        <div class="main_wrap">
          <div class="side_bar">
            <div class="title">관리자페이지</div>
            <div class="inner">
              <div>회원관리</div>
              <div>챗봇관리</div>
              <div class="on">데이터관리</div>
              <div>신고 리뷰관리</div>
          </div> 
        </div>
        <div class="right_area">     
            <div class="table_wrap">
              <div class="search_box1">
                <select class="cate">
                  <option value="parking">주차장</option>
                  <option value="restaurant">맛집</option>
                  <option value="culture">문화생활</option>
                  <option value="gasstation">주유소</option>
                </select>
                <form action="#" id="dataForm" method="post">
                <input type="hidden" name="no" id="no" />
                <div class="select_box">
                <div class="select">
                    <select name="searchGbn" id="searchGbn">
                      <option value="0">전체</option>
                      <option value="1">주차장명</option>
                      <option value="2">주차장유형</option>
                      <option value="3">주소</option>
                  </select>
                 <!--조건선택-->
                </div>
                <div class="search_form">
                  <input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
                </div>
                <div class="search_btn" id="search_btn">
                  검색
                </div>
              </div>
              </form>
              </div>           
              
              <table>
                <thead>
                  <tr>
                    <th>주차장관리번호</th>
                    <th>주차장명</th>
                    <th>주차장유형</th>
                    <th>주소</th>
                  </tr>
                </thead>
                <tbody>
                  
                </tbody>
              </table>
                <!--페이징-->
                <div class="page_wrap">
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
                 </div>
            </div>
          </div>
        </div>
      </main>
<c:import url="/footer"></c:import>
</body>
</html>