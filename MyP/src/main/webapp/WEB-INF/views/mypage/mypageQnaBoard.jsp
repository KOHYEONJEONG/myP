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
    	
    	$("#search_btn").on("click", function () {
	   		 console.log("검색버튼")
	   		$("#page").val("1");
	   		//기존 값 새값으로 변경
	   		$("#oldGbn").val($("#searchGbn").val());
	   		$("#oldText").val($("#searchText").val());
	   		
	   		reloadList();
  		});
    	
    	//행을 누르면 상세보기로 이동~
   		$("tbody").on("click", "tr", function() {
   		      $("#qna_num").val($(this).attr("no"));
   			  $("#actionForm").attr("action","myQnADetail");
   			  $("#actionForm").submit();
   		   });
    	     
	});
    
    
    function reloadList() {
	   var params = $("#actionForm").serialize();
	   $.ajax({
		   url : "mypageQnaBoardAjax",
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
    	var status = "O";
    	for(var data of list){		
    		html +="<tr no=\""+data.QNA_NUM+"\">";
    		html +="<td>" + data.NORNK+ "</td>";
    		
    		if(data.PRIVATE == 0){
   				html +="<td><i class=\"lock\"></i>" + data.TITLE + "</td>";
   			}else{
   				html +="<td>" + data.TITLE + "</td>";
   			}
    		
    		html +="<td>" + data.REG_DT+ "</td>"; //등록일
    		
   			if(typeof data.ANSWER_DT == 'undefined'){
   				html +="<td>" + "답변대기" + "</td>";
   			}else{
   				html +="<td>" + "답변완료" + "</td>";
   			}
   			
    		html +="<td>" + data.HIT+ "</td>";
    		html +="</tr>";
    	}
    	
    	$("tbody").html(html);
	}
    
    function drawPaging(pd) {
      	var html = "";
     	html += "<a class=\"parrow pprev\"  page=\""+1+"\"></a>";
 	     // 이전
 	    if($("#page").val() == "1"){
 	      		html += "<a class=\"arrow prev\"  page=\""+1+"\"></a>";
      	} else{
      		// 문자열을 숫자로 바꾸기위해 *1
      		html += "<a class=\"arrow prev\" page=\"" + ($("#page").val() *1 - 1) + "\"></a>";
      	}
      	
      	for(var i = pd.startP; i <= pd.endP; i++){
      		if($("#page").val() * 1 == i){ // 현재 페이지
      			console.log("(qna)현재페이지==>"+i);
      			html += "<a class=\"active\" page=\"" + i + "\">" + i + "</a>";
      		} else { // 다른 페이지
      			html += "<a page=\"" + i + "\">" + i + "</a>";
      		}
      		
      	}
      	
      	if($("#page").val() *1 == pd.maxP){ // 현재페이지가 마지막 페이지라면
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
	<input type="hidden" id="oldText" value="${param.searchText}"> <!-- 기존 검색 유지용 보관 (검색어)-->
   <main>
       <div class="main_wrap">
         <div class="side_bar">
           <div class="title">마이페이지</div>
           <div class="inner">
               <div class="on">마이페이지</div>
           </div> 
        </div>
        
        <form name="#" id="actionForm" method="post">
	        <input type="hidden" id="qna_num" name="qna_num"/><!-- 해당 글 리뷰 번호 -->
			<input type="hidden" name="page" id="page" value="${page}" />
	 		<input type="hidden" name="no" id="no" value="${sMemNo}"/><!-- 나의 no-->
	        <div class="right_area">
	           <div class="table_wrap">
	               <div class="search_box">
	                 <div class="select_box">
	                  <div class="select">
	                      <select name="searchGbn" id="searchGbn">
	                        <option value="0">전체</option>
	                        <option value="1">제목</option>
	                        <option value="2">내용</option>
	                    </select>
	                   <!--조건선택-->
	                  </div>
	                  <div class="search_form">
	                    <input type="text" id="searchText" name="searchText" value="${param.searchText}"/>
	                  </div>
	                  <div class="search_btn" id="search_btn">
	                    검색
	                  </div>
	               </div>
	               </div>
	               <table>
	               	<colgroup>
	               		<col width="100px">
	               		<col width="200px">
	               		<col width="100px">
	               		<col width="100px">
	               		<col width="100px">
	               	</colgroup>	
	                 <thead>
	                   <tr>
	                     <th>번호</th>
	                     <th>제목</th>
	                     <th>작성일</th>
	                     <th>답변일</th>
	                     <th>조회수</th>
	                   </tr>
	                 </thead>
	                 
	                 <tbody>
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