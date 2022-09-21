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
    
    <style type="text/css">
   	.select_box{
   		display: flex;
   	}
    </style>
    
    <script type="text/javascript">
    $(document).ready(function() {
    	reloadList();
    	
    	//검색구분 유지
    	if("${param.searchGbn}" != ""){
    		$("#searchGbn").val("${param.searchGbn}");
    	}else{
    		$("#oldGbn").val("0");//없으면 0으로 고정
    	}
    	
    	$("#searchBtn").on("click", function () {
	   		 console.log("검색버튼")
	   		$("#page").val("1");
	   		//기존 값 새값으로 변경
	   		$("#oldGbn").val($("#searchGbn").val());
	   		$("#oldText").val($("#searchText").val());
	   		
	   		reloadList();
   		});
    	
    	//행을 누르면 상세보기로 이동~
    	$(".tbody").on("click", "tr", function() {
    	      //Ajax
    	      // 성공 시 #autority_popup에 html넣기
    	      $("#review_num").val($(this).attr("no"));
    	     
    	   });
    	
    	//myReviewDetail 이동
    	
    	
	});
    function reloadList() {
		//mypageReviewBoard
		 var params = $("#actionForm").serialize();
	   $.ajax({
		   url : "mypageReviewBoardAjax",
		   type:"POST",
		   dataType:"json",
		   data : params, 
		   success: function(res){
			   console.log("성공");
				drawList(res.list);
				drawPaging(res.pd);
		   },
		   error : function(request, status, error) {
				console.log(request.responseText);
		   }//error
	   });//ajax
	}
    
    function drawList(list) {
    	var html = "";
    	for(var data of list){		
    		html +="<tr no=\""+data.REVIEW_NUM+"\">";
    		html +="<td>" + data.NORNK+ "</td>";
    		html +="<td>" + data.CAR_PARK_NM+ "</td>";
    		html +="<td>" + data.TITLE+ "</td>";
    		html +="<td>" + data.REG_DT+ "</td>";
    		html +="<td>" + data.HIT+ "</td>";
    		html +="</tr>";
    		//html +="<div class=\"delete_btn\">삭제</div>";
    		//html +="<div class=\"delete_btn\">수정</div><br/>";
    	}
    	
    	$(".tbody").html(html);
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
           <div class="title">마이페이지</div>
           <div class="inner">
               <div class="on">마이페이지</div>
           </div> 
        </div>
        
        <form name="#" id="actionForm" method="post">
        <input type="hidden" id="oldGbn" value="0" />
		<input type="hidden" id="oldText" />
        <input type="hidden" id="review_num" name="review_num" /><!-- 해당 글 리뷰 번호 -->
		<input type="hidden" name="page" id="page" value="1" />
 		<input type="hidden" name="mem_num" id="mem_num" value="${param.mem_num}"/><!-- 나의 no-->
	       <div class="right_area">
	           <div class="table_wrap">
	               <div class="search_box">
	                 <div class="select_box">
	                  <div class="select">
	                      <select name="select_b" id="select_b">
	                        <option value="all">전체</option>
	                        <option value="title">주차장명</option>
	                        <option value="content">제목</option>
	                        <option value="nickname">내용</option>
	                    </select>
	                   <!--조건선택-->
	                  </div>
	                  <div class="search_form">
	                    <input type="text" />
	                  </div>
	                  <div class="search_btn" >
	                    검색
	                  </div>
	               </div>
	               </div>
	               <table>
	                 <thead>
	                   <tr>
	                     <th>번호</th>
	                     <th>주차장명</th>
	                     <th>제목</th>
	                     <th>작성일</th>
	                     <th>조회수</th>
	                   </tr>
	                 </thead>
	                 
	                 <tbody class="tbody">
	                 </tbody>
	               </table>
	                 <!--페이징-->
	                 <div class="page_wrap">
	                     <div class="page_nation">
	                     </div>
	                  </div>
	             </div>
	       </div>
       </form> 
   </div>
 </main>  
<c:import url="/footer"></c:import>
</body>
</html>