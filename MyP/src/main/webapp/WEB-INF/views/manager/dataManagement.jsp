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
	
	console.log( "page : "+$("#page").val());
	
	//처음에 보이는 리스트를 가져온다.
	reloadList1();
	
	//검색 구분 설정
	if("${param.searchGbn}" != "") {
		$("#searchGbn").val("${param.searchGbn}");
	} else {
		$("#oldGbn").val("0"); //없으면 0으로 고정
	}
	
	//카테고리 설정
	if("${param.cateNo}" != "") {
		$("#cateNo").val("${param.cateNo}")
	}else{
		$("#cateNo").val("1");
	}
	
	console.log($("#cateNo").val());
	
	//카테고리 번호가 1이면 주차장 리스트 가져오고 2로 바뀌면 맛집 리스트를 가져옴
	$("#cateNo").on("change", function() {
		$("#page").val("1");
		$("#searchGbn").val("0");
		$("#searchTxt").val("");
		$("#oldGbn").val("0");
		$("#oldTxt").val("");
		switch($(this).val()) {
		case "1" :
			reloadList1(); //주차장
			break;
		case "2" :
			reloadList2(); //맛집
			break;
		case "3" :
			reloadList3(); //문화생활(영화관)
			break;
		case "4" :
			reloadList4(); //주유소
			break;
		}
	});
	
	//검색 버튼
	$("#search_btn").on("click", function() {
		$("#page").val("1");
		
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList1();
	});
	
	//주차장관련 ajax
	function reloadList1() {
		var params = $("#dataForm").serialize();
		
		$.ajax({
			url: "datacarAjax",
			type: "POST",
			dataType : "json",
			data: params,
			success: function(res) {
				drawListcar(res.list1); //리스트 각각 가져와야해서 4개 만들었음.
				drawPaging(res.pd); //페이징은 하나로 써도됨
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	}
	//맛집관련 ajax
	function reloadList2() {
		var params = $("#dataForm").serialize();
		
		$.ajax({
			url: "datafoodAjax",
			type: "POST",
			dataType : "json",
			data: params,
			success: function(res) {
				drawListfood(res.list2); 
				drawPaging(res.pd);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	}
	//문화생활관련 ajax
	function reloadList3() {
		var params = $("#dataForm").serialize();
		
		$.ajax({
			url: "datacultureAjax",
			type: "POST",
			dataType : "json",
			data: params,
			success: function(res) {
				drawListculture(res.list3);
				drawPaging(res.pd);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	}
	//주유소관련 ajax
	function reloadList4() {
		var params = $("#dataForm").serialize();
		
		$.ajax({
			url: "datagasAjax",
			type: "POST",
			dataType : "json",
			data: params,
			success: function(res) {
				drawListgas(res.list4);
				drawPaging(res.pd);
			},
			error : function(request, status, error) {
				console.log(request.responseText);
			}
		});
	}
	
	function drawListcar(list1) {
		var html = "";
		var flag = true;
		
		if(flag){
			
			html += "<tr>"+ +"<\>";
			html += "<th>"+"주차장관리번호"+"</th>";
		    html += "<th>"+"주차장명"+"</th>";
		    html += "<th>"+"주차장유형"+"</th>";
		    html += "<th>"+"주소"+"</th>";
			html += "</tr>";
			
			flag = false;
			$("thead").html(html);
		}
		
		html = "";
	    
		for(var data of list1) {
			html += "<tr no=\""+data.CAR_PARK_MAG_NUM+"\">"; //주차장관리번호
		    html += "<th>"+data.CAR_PARK_MAG_NUM+"</th>"; 
		    html += "<th>"+data.CAR_PARK_NM+"</th>"; //주차장명
		    html += "<th>"+data.CAR_PARK_TP_NM+"</th>"; //주차장유형(노상/노외)
		    html += "<th>"+data.ADDRESS+"</th>"; //주소
		    html += "</tr>";
		    
		}
		$("tbody").html(html);
		
		
	}
	
	function drawListfood(list2) {
		var html = "";
		var flag = true;
		
		if(flag){
			html += "<tr>"+ +"<\>";
			html += "<th>"+"맛집관리번호"+"</th>";
		    html += "<th>"+"사업장명"+"</th>";
		    html += "<th>"+"전화번호"+"</th>";
		    html += "<th>"+"도로명 주소"+"</th>";
			html += "</tr>";
			
			flag = false;
			$("thead").html(html);
		}
		
		html = "";
	  
	    
		for(var data of list2) {
			html += "<tr no=\""+data.RESTAURANT_NO+"\">"; //맛집관리번호
		    html += "<th>"+data.RESTAURANT_NO+"</th>";
		    html += "<th>"+data.ENT_NM+"</th>"; //사업장명
		    html += "<th>"+data.PHONE+"</th>"; //전화번호
		    html += "<th>"+data.ROAD_NM_ADDRESS+"</th>"; //도로명 주소
		    html += "</tr>";
		    
		}
		$("tbody").html(html);
	}

	function drawListculture(list3) {
		var html = "";
		var flag = true;
		
		if(flag){
			
			html += "<tr>"+ +"<\>";
			html += "<th>"+"영화관관리번호"+"</th>";
		    html += "<th>"+"사업자명"+"</th>";
		    html += "<th>"+"전화번호"+"</th>";
		    html += "<th>"+"도로명 주소"+"</th>";
			html += "</tr>";
			
			flag = false;
			$("thead").html(html);
		}
	
		html = "";
		
		for(var data of list3) {
			html += "<tr no=\""+data.CINEMA_MAG_NUM+"\">"; //영화관관리번호
		    html += "<th>"+data.CINEMA_MAG_NUM+"</th>";
		    html += "<th>"+data.ENT_NM+"</th>"; //사업장명
		    html += "<th>"+data.PHONE+"</th>"; //전화번호
		    html += "<th>"+data.ROAD_NM+"</th>"; //도로명 주소
		    html += "</tr>";
		    
		}
		$("tbody").html(html);
	}
	
function drawListgas(list4) {
		var html = "";
		var flag = true;
		
		if(flag){
			
			html += "<tr>"+ +"<\>";
			html += "<th>"+"주유소관리번호"+"</th>";
		    html += "<th>"+"주유소명"+"</th>";
		    html += "<th>"+"전화번호"+"</th>";
		    html += "<th>"+"도로명 주소"+"</th>";
			html += "</tr>";
			
			flag = false;
			$("thead").html(html);
		}
		html = "";
		
	    
		for(var data of list4) {
			html += "<tr no=\""+data.GAS_STATION_NUM+"\">"; //주유소관리번호
		    html += "<th>"+data.GAS_STATION_NUM+"</th>";
		    html += "<th>"+data.GAS_NM+"</th>"; //주유소명
		    html += "<th>"+data.PHONE+"</th>"; //전화번호
		    html += "<th>"+data.ROAD_NM_ADDRESS+"</th>"; //도로명주소
		    html += "</tr>";
		    
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
	
	if($("#page").val() *1 == pd.maxp){ //endp로하면 5번째 페이징에서 끝으로 넘어가버림.
		html += "<a class=\"arrow next\" page=\"" +pd.maxP+ "\"></a>";
	} else {
		html += "<a class=\"arrow next\" page=\"" + ($("#page").val() *1 + 1) + "\"></a>";
	}
	
	html += "<a class=\"arrow nnext\" page=\"" +pd.maxP+ "\"></a>";
	
	$(".page_nation").html(html);
                                                                     
}
	
	//디테일로 이동
	$("tbody").on("click", "tr", function() {
		$("#no").val($(this).attr("no"));
		
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#dataForm").attr("action", "parkinfodetail");
		
		$("#dataForm").submit();
	});
	
	//카테고리 번호에 맞춰서 리스트 가져온다
	$(".page_nation").on("click", "a", function() {
		$("#page").val($(this).attr("page")); 
	
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		switch($("#cateNo").val())  {
		case "1" : 
			reloadList1(); //주차장
			break;
		case "2" :
			reloadList2(); //맛집
			break;
		case "3" :
			reloadList3(); //문화생활(영화관)
			break;
		case "4" :
			reloadList4(); //주유소
			break;
		}
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
			<c:import url="/managerSidebar">
				<c:param name="link" value="dataManagement"></c:param>
			</c:import>          
        <div class="right_area">     
            <div class="table_wrap">
              <div class="search_box1">
                <select class="cate" id="cateNo">
                  <option value="1">주차장</option>
                  <option value="2">맛집</option>
                  <option value="3">문화생활</option>
                  <option value="4">주유소</option>
                </select>
                <form action="#" id="dataForm" method="post">
                <input type="hidden" name="no" id="no" />
                <input type="hidden" id="oldGbn" value="0" />
				<input type="hidden" id="oldTxt" />
                <input type="hidden" name="page" id="page" value="1" /> 
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
                  <input type="text" name="searchTxt" id="searchTxt"  value="${param.serarchTxt}"/>
                </div>
                <div class="search_btn" id="search_btn">
                  검색
                </div>
              </div>
              </form>
              </div>           
              
              <table>
              <colgroup>
				<col width="100" />
				<col width="150" />
				<col width="100" />
				<col width="250" />
			</colgroup>
			
                <thead>
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
<c:import url="/footer"></c:import>
</body>
</html>