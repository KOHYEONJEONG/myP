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
 <script type="text/javascript"
      src="resources/script/common/popup.js"></script>   
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
	        $("#page").val($(this).attr("page"));
	      $("#select_b").val($("#oldGbn").val());
	      $("#searchTxt").val($("#oldTxt").val());
	     
	      reloadList();
	   });   
	   $("tbody").on("click", "tr", function() {
		   	console.log($(this).attr("no"));
		      $("#review_num").val($(this).attr("no"));
		      
		     console.log($(this).attr("status"));
		     if($(this).attr("status")==1){
		    	 $("#select_b").val($("#oldGbn").val());
			      $("#searchTxt").val($("#oldTxt").val());
			      
			      $("#actionForm").attr("action", "reportReviewDetail2");
			      $("#actionForm").submit(); 
		     }else{
		    	 $("#select_b").val($("#oldGbn").val());
			      $("#searchTxt").val($("#oldTxt").val());
			      
			      $("#actionForm").attr("action", "reportReviewDetail");
			      $("#actionForm").submit(); 
		     }

		   });
		}); // document ready end
		function reloadList() {
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "reportReviewAjax",
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
				  html += "<tr no=\"" + data.REVIEW_NUM + "\" status=\"" + data.STS_NUM + "\">";
				  html += "<td>" + data.NORNK + "</td>";
			      html += "<td>" + data.TITLE + "</td>";
			      html += "<td>" + data.NM + "</td>";
			      html += "<td>" + data.DT + "</td>";
			      html += "<td>" + data.HIT + "</td>";
			      html += "<td>" + data.CNT + "</td>";
			      if(data.STS_NUM == 0){
			      html += "<td>" + "X" + "</td>";
			      }else{
			      html += "<td>" + "○" + "</td>";	  
			      }
			      if(typeof data.RFC == 'undefined'){
			    	  html += "<td>" + "X" + "</td>";
					}else{
						   html += "<td>" + data.RFC + "</td>";
					}
			
			   
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
        
         <c:import url="/managerSidebar">
         	<c:param name="link" value="reportReviewManagement"></c:param>
         </c:import>
         
        <div class="right_area">
            <div class="table_wrap">
            <input type="hidden" id="oldGbn" value="${param.select_b}" />
			<input type="hidden" id="oldTxt" value="${param.searchTxt}" />
            
            <form action="#" id="actionForm" method="post">
                <div class="search_box">
                 	<input type="hidden" id="oldGbn" value="0" />
					<input type="hidden" id="oldTxt" />
               		<input type="hidden" name="review_num" id="review_num" />   
      				<input type="hidden" name="page" id="page" value="${page}" />  	
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
                   <div class="search_btn" id="searchbtn">
                    검색
                  </div>
                </div> <!-- searchBox -->
                </form>
                
                <table>
                  <thead>
                    <tr>
                      <th>no</th>
                      <th>제목</th>
                      <th>닉네임</th>
                      <th>작성일</th>
                      <th>조회수</th>
                      <th>신고</th>
                      <th>확인상태</th>
                      <th>반려사유</th>
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
    </div>
  </main>
<c:import url="/footer"></c:import>
</body>
</html>