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
      
      .stitle {
      	margin: 0 10px;
      	font-weight: bold;
      }
      
      .update{
      	display: flex;
      }
      
      .update .update_btn{
      	width: 70px;
      	margin: 0 5px 0 10px;
      }
      
      .update .delete_btn{
      	width: 70px;
      }
      
    </style>
	<script type="text/javascript">
 	 $(document).ready(function () {

		reloadList();
	
	
	/* $("#insertBtn").on("click", function () {
	 		if($.trim($("#cateNum").val()) == ""){
				makeAlert("알림","카테고리를 입력하세요." , function () {
					$("#cateNum").focus();
				});
	 		}	else {
	 				action("insert");
			}
	
		})  */
		
	// 페이징 클릭시
	 $(".page_nation").on("click", "a", function () {
		$("#page").val($(this).attr("page"));
		//기존 값 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		reloadList();
	})
		
	// 검색 클릭시
	/* $("#searchBtn").on("click", function () {
		$("#page").val("1");
		//기존 값 새값으로 변경
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldText").val($("#searchText").val());
		
		reloadList();
	}) */
	 
	// 목록의 삭제버튼 클릭시
	/* $("tbody").on("click", ".delete_btn", function () {
		var no = $(this).parent().parent().attr("no");
		
		  makePopup({
		         title : "알림",
		         contents : "삭제하시겠습니까?",
		         // draggable : true,
		         buttons : [{
		            name : "삭제",
		            func:function() {
		            	$("#no").val(no);
		            	action("delete");
		            	closePopup(); // 제일 위의 팝업 닫기
		            }
		         }, {
		            name : "취소"
		    }]
		})
	}) */
	
	// 목록 수정버튼 클릭시
	/* $("tbody").on("click", ".update_btn", function () {
		var no = $(this).parent().parent().attr("no");
		$("#no").val(no);

		
		//eq(인덱스번호) : 자식들 중 인덱스 몇번째 인지 찾아서 취득
		var con = $(this).parent().parent().children().eq(1).html();
		// 수정 내용 넣기 전 <> 변화
		con = con.replace(/&lt;/gi, "<");
		con = con.replace(/&gt;/gi, ">");
		
		
		$("#cateNm").val(con);
		
		
		// 등록버튼 감추기 + 수정, 취소버튼 나타나기
		$(".insert").hide();
		$(".update").show();
		
		// 작성영역에 포커스
		$("#cateNm").focus();
	})
	 */
	// 수정 영역의 취소버튼
	/* $("thead #cancelBtn").on("click", function () {
		// 입력내용 초기화
		$("#no").val("");
		$("#cateNm").val("");
		// 등록버튼 나타나기 + 수정, 취소버튼 감추기
		$(".insert").show();
		$(".update").hide();
	})
	 */
	// 수정 영역의 수정버튼
	/* $("thead #updateBtn").on("click", function () {
		action("update");
		console.log("1");
	}) */
	
})

/* 
var msg ={
	"insert" : "등록",
	"update" : "수정",
	"delete" : "삭제",
}

function action(flag) {
	// con의 <를을 웹문자로 변환
	$("#cateNm").val($("#cateNm").val().replace(/</gi, "&lt;"));
	// con의 >를을 웹문자로 변환
	$("#cateNm").val($("#cateNm").val().replace(/>/gi, "&gt;"));
	
	
	// Javascript object에서의 [] : 해당 키값으로 내용을 불러오거나 넣을 수있다. 
	// Java의 Map에서 get, put역활
	console.log(msg[flag]);
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "categoryManagementAction/" + flag,
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			switch(res.msg){
			case "success" :
				// 내용 초기화
				$("#cateNm").val("");
				$("#no").val("");

				// 목록 재조회
				switch(flag){
				case "insert" :
				case "delete" :
					// 조회 데이터 초기화
					$("#page").val("1");
					$("#searchGbn").val("0");
					$("#searchText").val("");
					$("#oldGbn").val("0");
					$("#oldText").val("");
					break;
				case "update" :
					// 기존값 유지
					$("#searchGbn").val($("#oldGbn").val());
					$("#searchText").val($("#oldText").val());

					// 입력내용 초기화
					$("#no").val("");
					$("#cateNm").val("");
					// 등록버튼 나타나기 + 수정, 취소버튼 감추기
					$(".insert").show();
					$(".update").hide();
					break;
					
			
				}
				reloadList();
				break;
			case "fail" :
				makeAlert("알림" ,  msg[flag] + "에 실패하였습니다.");
				break;
			case "error" :
				makeAlert("알림" , msg[flag] + " 중 문제가 발생하였습니다.");
				break;
			}
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
} // action Function End
 */
function reloadList() {
	var params = $("#searchForm").serialize();
	$.ajax({
		url : "categoryManagementList",
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
		html +="<tr no=\"" + data.CATE_NUM  + "\">";
		html +="<td>" + data.CATE_NUM + "</td>";
		html +="<td>" + data.DIV_NM + "</td>";
		html +="<td>" + data.CATE_NM + "</td>";
		html +="<td>";
			html +="<div class=\"update_btn\">수정</div><br/>";
			html +="<div class=\"delete_btn\">삭제</div>";
		html +="</td>";
		html +="</tr>";
	}
	
	$("tbody").html(html);
	
	var html1 = "";
	
	
	for(var i = 1; i <= list.length; i++){
		html1 += "<option value=\"" + i + "\">" + list.DIV_NM + "</option>";
		
		console.log(list);
	}
		
	
	$("#selectDiv").html(html1);
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
            <div class="title">관리자페이지</div>
            <div class="inner">
                <div>회원관리</div>
                <div>챗봇관리</div>
                <div>데이터관리</div>
                <div>신고리뷰관리</div>
                <div class="on">카테고리관리</div>
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
                <div class="search_box">
                  <div class="select">
					<select name="select_b" id="select_b">
						 <option value="0">전체</option>
						<option value="1">분류명</option>
						<option value="2">하위분류명</option>
					</select>
					</div>
					<div class="search_form">
                  	<input type="text" name="searchText" id="searchText"/>
                </div>
				<div class="search_btn" id="searchBtn">검색</div>
			</div>
			<div class="insert_box">
			<div class="stitle">분류명</div>
			 	<form action="#" id="actionForm">
					 <div class="select">
					 <select name="select_b" id="selectDiv">
								 
							</select>
					<input type="hidden" name="no" id="no">
					</div>
				</form> 
				<div class="stitle">하위분류명</div>
					<div>
						<form action="#" id="actionForm">
							<input type="hidden" name="no" id="no">
							<div class="search_form">
                  			<input type="text" name="searchText" id="searchText"/>
                			</div>
						</form>
					</div>
					<div>
						<!-- <div class="insert">
							<div class="insert_btn" id="insertBtn">등록</div>
						</div>  -->
						<div class="update">
							<div class="update_btn" id="updateBtn">수정</div>
							<div class="delete_btn" id="cancelBtn">취소</div>
						</div>
					</div>
			
			</div>
                <table>
                <colgroup>
					<col width="100"> <!-- 분류번호 -->
					<col width="200"> <!-- 분류명 -->
					<col width="350"> <!-- 하위분류명 -->
					<col width="150"> <!-- 수정/삭제 -->
				</colgroup>
                  <thead>
                    <tr>
                      <th>분류번호</th>
                      <th>분류명</th>
                      <th>하위분류명</th>
                      <th>수정/삭제</th>
                    </tr>
                  </thead>
                  <tbody></tbody>
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