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
    <link rel="stylesheet" href="resources/css/mypage.css">
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/font.css">
     <script src="resources/jquery/jquery-1.12.4.js"></script>
     <script src="resources/js/main.js"></script>
     <script type="text/javascript">
	
	
	
 	 $(document).ready(function () {
 		 
 		if("${params.searchGbn}" != ""){
 			$("#searchGbn").val("${param.searchGbn}");
 		} else {
 			$("#oldGbn").val("0");
 		}

		reloadList(); 
		

	//  테이블 페이징 클릭시
	 $(".page_nation").on("click", "a", function () {
		$("#page").val($(this).attr("page"));
		//기존 값 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		reloadList();
	})
	
	
	// 테이블 검색버튼 부분, 엔터키 이벤트 막기
	$("#searchForm").on("keypress", "input", function(event){
		if(event.keyCode == 13){ //이벤트 코드가 엔터가들어오면
		
		//버튼 이벤트 발생
		$("#searchBtn").click();
			return false;
		}
	});	 
		
	
	//  테이블 검색 클릭시
	 $("#searchBtn").on("click", function () {
		
		$("#page").val("1");
		//기존 값 새값으로 변경
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldText").val($("#searchText").val());
		
		reloadList();
	})
	
	
	// 등록버튼
	$("#insertBtn").on("click", function () {
		// 기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		$("#searchForm").attr("action", "noticeRegister");
		$("#searchForm").submit();
	}) 
	
	
	$("tbody").on("click", "tr", function() {
		console.log("1");
		
		$("#notiNo1").val($(this).attr("no"));
		
		
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		$("#searchForm").attr("action", "noticeDetail");
		$("#searchForm").submit();
	});
	
	
	
})

var msg ={
	"insert" : "등록",
	"update" : "수정",
	"delete" : "삭제",
}
 	

function reloadList() {
	var params = $("#searchForm").serialize();
	
	$.ajax({
		url : "noticeList",
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
	}); 
	
}

 function drawList(list) {
		var html = "";
		
		for(var data of list){
			html +="<tr no=\"" + data.NOTICE_NUM  + "\">";
			html +="<td>" + data.NORNK + "</td>";
			html +="<td>" + data.TITLE + "</td>"; // 제목
			html +="<td>관리자</td>"; // 작성자
			html +="<td>" + data.REG_DT + "</td>"; // 작성일
			html +="<td>" + data.HIT + "</td>"; // 조회수
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
		
		if($("#page").val() *1 == pd.maxp){ // 현재페이지가 마지막 페이지라면
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
          <c:import url="/partiNoticeSidebar">
          	<c:param name="link" value="notice"></c:param>
          </c:import>
        <div class="right_area">            
            <div class="table_wrap">
            <form action="#" id="searchForm" method="post">
                <div class="search_box">
                <!-- 검색어 유지용 -->
                <input type="hidden" id="oldGbn" value="0" />
				<input type="hidden" id="oldText" />
				<input type="hidden" name="notiNo" id="notiNo1" />
				<input type="hidden" name="page" id="page" value="${page}"/>
                <div class="select">
                    <select name="searchGbn" id="searchGbn">
                      <option value="0">제목</option>
                  </select>
                </div>
                <div class="search_form">
                  <input type="text" name="searchText" id="searchText" value="${param.searchText}" />
                </div>
                <div class="search_btn" id="searchBtn">검색</div>
                  </div>
                </form>
              <table>
               <colgroup>
					<col width="90">
					<col width="400">
					<col width="100">
					<col width="120">
					<col width="90">
				</colgroup>
                <thead>
                  <tr>
                    <th>no</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
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
                 <c:if test="${sMemAuto == 1}">
					 <div class="btn_wrap">
                    	 <div class="write_btn" id="insertBtn">글쓰기</div>
                 	</div>
				</c:if>
            </div>
          </div>
        </div>
      </main>
	<c:import url="/footer"></c:import>
</body>
</html>