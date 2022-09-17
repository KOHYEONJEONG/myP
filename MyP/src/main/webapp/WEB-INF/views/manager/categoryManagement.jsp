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
    <link rel="stylesheet" type="text/css" href="resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/font.css">
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/main.js"></script>
    <script type="text/javascript" 
		src="resources/script/common/popup.js"></script>
    <style type="text/css">
   
 	.input1 {
	    height: 35px;
	    border: 1px solid #d7d7d7;
	    box-sizing: border-box;
	    width: 250px;
	    margin-left: 5px;
      }
      
      .insert_btn{
      	width: 70px;
	    height: 35px;
	    border: 1px solid #FD9A29;
	    background: #FD9A29;
	    color: #fff;
	    font-size: 20px;
	    text-align: center;
	    box-sizing: border-box;
	    text-align: center;
	    font-size: 14px;
	    line-height: 33px;
	    cursor: pointer;
	    margin-top: 10px;
	    float: right;
    
       }
	.table_wrap {
	    width: 400px;
	    top: 200px;
	    left: 50%;
	    transform: translateX(-50%);
	    position: absolute;
	}
	      
	.table_wrap table {
		width: 400px;
	}
	.table_wrap .search_box {
		width: 400px;
	
	}
	
	.table_wrap.first{
		left: 30%
	}
	
	.table_wrap.second{
		left: 75%
	}
	
	.table_wrap .search_box .search_form {
	    width: 150px;
	    
	   }
	   
	.table_wrap .btn_wrap{
	   	margin-top: 0px;  
	}
   
   .delete_btn, .update_btn, .cancle_btn, .finish_btn{
   	width: 70px;
    height: 35px;
    border: 1px solid #e6e6e6;
    background: linear-gradient(to bottom, rgb(255, 255, 255) 0%, rgb(229, 229, 229) 100%);
    font-size: 20px;
    text-align: center;
    box-sizing: border-box;
    text-align: center;
    font-size: 14px;
    line-height: 33px;
    cursor: pointer;
   
   } 
   .not_delete_btn{
	   width: 70px;
	   height: 35px;
	   border: 1px solid #b0b0b0;
	   	background: linear-gradient(to bottom, rgb(186 186 186) 0%, rgb(144 144 144) 100%);
	   	font-size: 20px;
	    text-align: center;
	    box-sizing: border-box;
	    text-align: center;
	    font-size: 14px;
	    line-height: 33px;
   }
   
   .update_btn, .finish_btn{
   	margin-right: 5px;
   }
   
   .table_wrap .search_box .search_btn1 {
    width: 70px;
    height: 35px;
    border: 1px solid #e6e6e6;
    background: rgb(255, 255, 255);
    background: linear-gradient(to bottom, rgb(255, 255, 255) 0%, rgb(229, 229, 229) 100%);
    font-size: 20px;
    text-align: center;
    box-sizing: border-box;
    text-align: center;
    font-size: 14px;
    line-height: 33px;
    cursor: pointer;
    }
    
    .input {
        height: 35px;
    	border: 1px solid #d7d7d7;
    	box-sizing: border-box;
    	width: 140px;
    }
    
    .cancle_btn, .finish_btn{
    	display: none;
    }
    
    </style>
    
    
	<script type="text/javascript">
	
	var oldDivNm; // 분류명 테이블 기존 divNm 담는 변수
	var oldCateNm; // 하위분류명 테이블 기존 CateNm 담는 변수
	
	
 	 $(document).ready(function () {
 		 
 		if("${params.searchGbn1}" != ""){
 			$("#searchGbn1").val("${param.searchGbn1}");
 		} else {
 			$("#oldGbn1").val("0");
 		}

 		if("${params.searchGbn}" != ""){
 			$("#searchGbn").val("${param.searchGbn}");
 		} else {
 			$("#oldGbn").val("0");
 		}
 		
		reloadList1(); // 분류명 테이블 reload
		reloadList(); // 하위분류명 테이블 reload
		
				
	// 분류명 테이블 페이징 클릭시
	 $(".page_nation1").on("click", "a", function () {
		$("#page1").val($(this).attr("page1"));
		//기존 값 유지
		$("#searchGbn1").val($("#oldGbn1").val());
		$("#searchText1").val($("#oldText1").val());
		
		reloadList1();
	})
	
	
	// 분류명 테이블 클릭시 하위분류명 데이터 reload
	$(".div_nm_tbody").on("click", "tr", function () {
		$("#no").val($(this).attr("no"));
			
		reloadList();		
		
	})
	
	// 분류명 테이블 검색버튼 부분, 엔터키 이벤트 막기
	$("#searchForm1").on("keypress", "input", function(event){
		if(event.keyCode == 13){ //이벤트 코드가 엔터가들어오면
		
		//버튼 이벤트 발생
		$("#searchBtn1").click();
			return false;
			
		}

	});	
		
			
	// 분류명 테이블 검색버튼 클릭시
	 $("#searchBtn1").on("click", function () {
		
		$("#page1").val("1");
		//기존 값 새값으로 변경
		$("#oldGbn1").val($("#searchGbn1").val());
		$("#oldText1").val($("#searchText1").val());
		
		reloadList1();
	})
	
		// 분류명 테이블 추가버튼 클릭시
		$("#insertBtn1").on("click", function () {
		     
			     makePopup({
		         title : "추가",
		         contents : "분류명: <input type=\"text\" class=\"input1\"/>",
		         // draggable : true,
		         buttons : [{
		            name : "추가",
		            func:function() {
		            	if($.trim($(".input1").val())==""){
		            		$(".input1").focus()
		            		$(".input1").attr("placeholder", "분류명을 입력해주세요");
		            	} else {
		            		var divNm =  $(".input1").val();
			        		$("#divNm").val(divNm);
			            	action1("insert");
			            	closePopup();
		            	}
		            }
		         }, {
		            name : "취소"
		    }]
		})
	});
		  
	// 분류명 테이블 삭제버튼 클릭시
	$(".div_nm_tbody").on("click", ".delete_btn", function () {
		var no = $(this).parent().parent().parent().attr("no");
	
		 makePopup({
	         title : "알림",
	         contents : "삭제하시겠습니까?",
	         // draggable : true,
	         buttons : [{
	            name : "삭제",
	            func:function() {
	            	$("#divNum").val(no);
	            	action1("delete");
	            	closePopup(); // 제일 위의 팝업 닫기
	            }
	         }, {
	            name : "취소"
	    }]
	})
		
	}) 
	
	
	
	// 분류명 테이블 수정버튼 클릭시
	 $(".div_nm_tbody").on("click", ".update_btn", function () {
		// input으로 변경 및 oldDivNm을 input안에
		oldDivNm = $(this).parent().parent().parent().children().eq(1).html();	
		var html =  "<input type=\"text\" class=\"input\" value=\"" + oldDivNm + "\"/>";	
		$(this).parent().parent().parent().children().eq(1).html(html);
				
		$(this).parent().children().eq(0).hide(); // 수정버튼 감추기
		$(this).parent().children().eq(1).hide(); // 삭제버튼 감추기
		$(this).parent().children().eq(2).show(); // 완료버튼 보이기
		$(this).parent().children().eq(3).show(); // 취소버튼 보이기
		
	})
	 
	// 분류명 테이블 수정버튼 클릭후, 수정영역의 취소버튼 클릭시
	$(".div_nm_tbody").on("click", ".cancle_btn", function () {
		// 기존값으로 변경
		var html =  oldDivNm;
		$(this).parent().parent().parent().children().eq(1).html(html);
		
		$(this).parent().children().eq(0).show(); // 수정버튼 보이기
		$(this).parent().children().eq(1).show(); // 삭제버튼 보이기
		$(this).parent().children().eq(2).hide(); // 완료버튼 감추기
		$(this).parent().children().eq(3).hide(); // 취소버튼 감추기
	})
	
	//  분류명 테이블 수정버튼 클릭후, 수정영역의 완료버튼 클릭시
	 $(".div_nm_tbody").on("click", ".finish_btn", function () {
		var no = $(this).parent().parent().parent().attr("no");
		$("#divNum").val(no);
		
		var divNm =  $(this).parent().parent().parent().children().children().val();	
		$("#divNm").val(divNm);
								
		action1("update");
	}) 
		
	
	// 하위분류명 테이블 페이징 클릭시
	 $(".page_nation").on("click", "a", function () {
		$("#page").val($(this).attr("page"));
		//기존 값 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		reloadList();
	})
	
	
	// 하위분류명 테이블 검색버튼 부분, 엔터키 이벤트 막기
	$("#searchForm").on("keypress", "input", function(event){
		if(event.keyCode == 13){ //이벤트 코드가 엔터가들어오면
		
		//버튼 이벤트 발생
		$("#searchBtn").click();
			return false;
		}
	});	
		
	
	// 하위분류명 테이블 검색 클릭시
	 $("#searchBtn").on("click", function () {
		
		$("#page").val("1");
		//기존 값 새값으로 변경
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldText").val($("#searchText").val());
		
		reloadList();
	})
	
	
	
	
	// 하위분류명 테이블 추가버튼 클릭시
	$("#insertBtn").on("click", function () {
		
		console.log($("#no").val()); // 분류명의 divNm 여부 확인
		
		if($("#no").val() == ""){
			makePopup({
		         title : "추가",
		         contents : "분류명을 선택해주세요",
		         // draggable : true,
		         buttons : [{
		            name : "확인",
		            func:function() {
		            	closePopup(); // 제일 위의 팝업 닫기
		            }
		         }]
			})
		} else {
			 makePopup({
		         title : "추가",
		         contents :
		        	"하위분류명: <input type=\"text\" class=\"input1\"/>",
		         // draggable : true,
		         buttons : [{
		            name : "추가",
		            func:function() {
		            	if($.trim($(".input1").val())==""){
		            		$(".input1").focus()
		            		$(".input1").attr("placeholder", "하위분류명을 입력해주세요");
		            	} else {
		            		var cateNm =  $(".input1").val();
			        		$("#cateNm").val(cateNm);
			            	action("insert");
			            	closePopup();
		            	}
		            }
		         }, {
		            name : "취소"
		    }]
		})
		}
	});
		  
	
	// 하위분류명 테이블 삭제버튼 클릭시
	$(".cate_nm_tbody").on("click", ".delete_btn", function () {

		var no = $(this).parent().parent().parent().attr("no");
			
		  makePopup({
		         title : "알림",
		         contents : "삭제하시겠습니까?",
		         // draggable : true,
		         buttons : [{
		            name : "삭제",
		            func:function() {
		            	$("#cateNum").val(no);
		            	action("delete");
		            	closePopup(); // 제일 위의 팝업 닫기
		            }
		         }, {
		            name : "취소"
		    }]
		})
	})
	
	// 하위분류명 테이블 수정버튼 클릭시
	 $(".cate_nm_tbody").on("click", ".update_btn", function () {
		// input으로 변경 및 oldCateNm을 input안에
		oldCateNm = $(this).parent().parent().parent().children().eq(1).html();	
		var html =  "<input type=\"text\" class=\"input\" value=\"" + oldCateNm + "\"/>";	
		$(this).parent().parent().parent().children().eq(1).html(html);
				
		$(this).parent().children().eq(0).hide(); // 수정버튼 감추기
		$(this).parent().children().eq(1).hide(); // 삭제버튼 감추기
		$(this).parent().children().eq(2).show(); // 완료버튼 보이기
		$(this).parent().children().eq(3).show(); // 취소버튼 보이기
		
	})
	 
	// 하위분류명 테이블 수정버튼 클릭후, 수정영역의 취소버튼 클릭시
	$(".cate_nm_tbody").on("click", ".cancle_btn", function () {
		// 기존값으로 변경
		var html =  oldCateNm;
		$(this).parent().parent().parent().children().eq(1).html(html);
		
		$(this).parent().children().eq(0).show(); // 수정버튼 보이기
		$(this).parent().children().eq(1).show(); // 삭제버튼 보이기
		$(this).parent().children().eq(2).hide(); // 완료버튼 감추기
		$(this).parent().children().eq(3).hide(); // 취소버튼 감추기
	})
	
	//  하위분류명 테이블 수정버튼 클릭후, 수정영역의 완료버튼 클릭시
	 $(".cate_nm_tbody").on("click", ".finish_btn", function () {
		var no = $(this).parent().parent().parent().attr("no");
		$("#cateNum").val(no);
		
		var cateNm =  $(this).parent().parent().parent().children().children().val();	
		$("#cateNm").val(cateNm);
								
		action("update");
	}) 
	
	
	
	
})

var msg ={
	"insert" : "등록",
	"update" : "수정",
	"delete" : "삭제",
}
 	

 	 
	// 분류명 테이블의 action
	function action1(flag) {
		console.log(msg[flag]);
		
		var params = $("#searchForm1").serialize();
		
		$.ajax({
			url : "divManagementAction/" + flag,
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
						$("#page1").val("1");
						$("#searchGbn1").val("0");
						$("#searchText1").val("");
						$("#oldGbn1").val("0");
						$("#oldText1").val("");
						break;
					case "update" :
						// 기존값 유지
						$("#searchGbn1").val($("#oldGbn1").val());
						$("#searchText1").val($("#oldText1").val());
	
						break; 
					}
					reloadList1();
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

 	
	//분류명 테이블 reload
 	 function reloadList1() {
 	 var params = $("#searchForm1").serialize();
 		$.ajax({
 			url : "divManagementList",
 			type : "POST", 
 			dataType: "json", 
 			data: params, 
 			success : function(res) { 
 				drawList1(res.list);
 				drawPaging1(res.pd);
 			},
 			error : function(request, status, error) { 
 				console.log(request.responseText); 
 			}
 		}); //Ajax End
 		
 	 }	

 	//분류명 테이블 drawList
 	function drawList1(list) {
 		var html = "";
 		

 			for(var data of list){

 				html +="<tr no=\"" + data.DIV_NUM  + "\">";
 				html +="<td>" + data.RNK + "</td>";
 				html +="<td>" + data.DIV_NM + "</td>";
 				html +="<td>";
 					html +="<div class=\"btn_wrap\">";
 					html +="<div class=\"update_btn\">수정</div>";
 					if(data.CCNT != 0){
 						html +="<div class=\"not_delete_btn\">삭제</div>";
 					} else {
 						html +="<div class=\"delete_btn\">삭제</div>";
 					}
 					html +="<div class=\"finish_btn\">완료</div>";
 					html +="<div class=\"cancle_btn\">취소</div>";
 					html +="</div>";
 				html +="</td>";
 				html +="</tr>";
 			}


 		$(".div_nm_tbody").html(html);
 	}



 	//분류명 테이블 drawPaging
 	function drawPaging1(pd) {
 		var html = "";
 		
 		html +=
 		html += "<a class=\"parrow pprev\" page1=\"1\"></a>";
 		// 이전
 		if($("#page1").val() == "1"){
 			html += "<a class=\"arrow prev\" page1=\"1\"></a>";
 		} else{
 			// 문자열을 숫자로 바꾸기위해 *1
 			html += "<a class=\"arrow prev\" page1=\"" + ($("#page1").val() *1 - 1) + "\"></a>";
 		}
 		
 		for(var i = pd.startP; i <= pd.endP; i++){
 			if($("#page1").val() * 1 == i){ // 현재 페이지
 				html += "<a class=\"active\" page1=\"" + i + "\">" + i + "</a>";
 			} else { // 다른 페이지
 				html += "<a page1=\"" + i + "\">" + i + "</a>";
 			}
 			
 		}
 		
 		if($("#page1").val() *1 == pd.endP){ // 현재페이지가 마지막 페이지라면
 			html += "<a class=\"arrow next\" page1=\"" +pd.maxP+ "\"></a>";
 		} else {
 			html += "<a class=\"arrow next\" page1=\"" + ($("#page1").val() *1 + 1) + "\"></a>";
 		}
 		
 		html += "<a class=\"arrow nnext\" page1=\"" +pd.maxP+ "\"></a>";
 		
 		$(".page_nation1").html(html);
 	                                                                     
 	}

 	
 	 
// 하위분류명 테이블의 action
function action(flag) {
	console.log(msg[flag]);
	
	var params = $("#searchForm").serialize();
	
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
				//$("#no").val("");

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

					$("#no").val($("#no").val());
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
  
 
// 하위분류명 reload
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

//하위분류명 drawList
 function drawList(list) {
		var html = "";
		
			for(var data of list){
				html +="<tr no=\"" + data.CATE_NUM  + "\">";
				html +="<td>" + data.RNK + "</td>";
				html +="<td>" + data.CATE_NM + "</td>";
				html +="<td>";
				html +="<div class=\"btn_wrap\">";
				html +="<div class=\"update_btn\">수정</div>";
				html +="<div class=\"delete_btn\">삭제</div>";
				html +="<div class=\"finish_btn\">완료</div>";
				html +="<div class=\"cancle_btn\">취소</div>";
				html +="</div>";
				html +="</td>";
				html +="</tr>";
			
			}	
		$(".cate_nm_tbody").html(html);

	}


//하위분류명 drawPaging
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
            <div class="table_wrap first">
       		<!-- 페이징 때 기존 검색 내용 유지용 -->
			<input type="hidden" id="oldGbn1" value="${param.searchGbn1}"/>
			<input type="hidden" id="oldText1" value="${param.searchText1}"/>
       		
            <form action="#" id="searchForm1">

                <div class="search_box">
                <!-- 검색어 유지용 -->
                <input type="hidden" id="oldGbn1" value="0" />
				<input type="hidden" id="oldText1" />
				<input type="hidden" name="page1" id="page1" value="1" />
				<input type="hidden" name="divNum" id="divNum" />
				<input type="hidden" name="divNm" id="divNm" />
                  <div class="select">
					<select name="searchGbn1" id="searchGbn1">
						 <option value="0">분류명</option>
					</select>
					</div>
					<div class="search_form">
					<input type="text" name="searchText1" id="searchText1" />
                </div>
				<div class="search_btn" id="searchBtn1">검색</div>	
			</div>
			</form>	
                <table>
                <colgroup>
					<col width="100"> <!-- 번호 -->
					<col width="170"> <!-- 분류명 -->
					<col width="150"> <!-- 수정/삭제 -->
				</colgroup>
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>분류명</th>
                      <th>수정/삭제</th>
                    </tr>
                  </thead>
                  <tbody class="div_nm_tbody"></tbody>
                </table>
                  <!--페이징-->
                  <div class="page_wrap">
                      <div class="page_nation1"></div>
                   </div>
                    <div class="insert_btn" id="insertBtn1">추가</div>
              </div>
                     
           <!-- 하위분류명 테이블 -->
             <div class="table_wrap second">
             <!-- 페이징 때 기존 검색 내용 유지용 -->
			<input type="hidden" id="oldGbn" value="${param.searchGbn}"/>
			<input type="hidden" id="oldText" value="${param.searchText}"/>
			
            <form action="#" id="searchForm">
                <div class="search_box">
                <!-- 검색어 유지용 -->
                <input type="hidden" id="oldGbn" value="0" />
				<input type="hidden" id="oldText" />
				<input type="hidden" name="page" id="page" value="1" />
				<input type="hidden" name="cateNum" id="cateNum" />
				<input type="hidden" name="cateNm" id="cateNm" />
				<input type="hidden" name="no" id="no" /> <!-- 분류명 테이블에 divNum 보관중 -->
                  <div class="select"> 
					<select name="searchGbn" id="searchGbn">
						<option value="0">하위분류명</option>
					</select>
					</div>
					<div class="search_form">
                  	<input type="text" name="searchText" id="searchText"/>
                </div>
				<div class="search_btn" id="searchBtn">검색</div>
			</div>
				</form>	
                <table>
                <colgroup>
					<col width="100"> <!-- 번호 -->
					<col width="150"> <!-- 하위분류명 -->
					<col width="150"> <!-- 수정/삭제 -->
				</colgroup>
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>하위분류명</th>
                      <th>수정/삭제</th>
                    </tr>
                  </thead>
                  <tbody class="cate_nm_tbody"></tbody>
                </table>
                  <!--페이징-->
                  <div class="page_wrap">
                      <div class="page_nation"></div>
                   </div>
                   <c:if test="${empty no}">
						 <div class="insert_btn" id="insertBtn">추가</div>
					</c:if>
              </div>
        </div>
        
        </div>
        	
       </div>
  </main>
<c:import url="/footer"></c:import>
</body>
</html>