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
 	 $(document).ready(function () {

	reloadList();
	
	
/* 	$("#insertBtn").on("click", function () {
	 		if($.trim($("#cateNm").val()) == ""){
				makeAlert("알림","카테고리를 입력하세요." , function () {
					$("#cateNm").focus();
				});
	 		}	else {
	 				action("insert");
			}
	
		}) */
		
	// 페이징 클릭시
	 $(".page_nation").on("click", "span", function () {
		$("#page").val($(this).attr("page"));
		//기존 값 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		reloadList();
	})	
	/*	
	// 검색 클릭시
	$("#searchBtn").on("click", function () {
		$("#page").val("1");
		//기존 값 새값으로 변경
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldText").val($("#searchText").val());
		
		reloadList();
	})
	 */
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
		url : "rankingSystemGoodParkingList",
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
		const address = data.ADDRESS.split(' ');
		
		html +="<tr no=\"" + data.RNK  + "\">";
		html +="<td>" + data.RNK + "</td>";
		html +="<td>" + data.CAR_PARK_NM + "</td>";		
		html +="<td>" + address[0] + "</td>";
		html +="<td>" + address[1] + "</td>";
		html +="<td>" + data.SYSTEM + "</td>";
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
	
	if($("#page").val() *1 == pd.endP){ // 현재페이지가 마지막 페이지라면
		html += "<a class=\"arrow next\" page=\"" +pd.maxP+ "\"></a>";
	} else {
		html += "<a class=\"arrow next\" page=\"" + ($("#page").val() *1 + 1) + "\"></a>";
	}
	
	html += "<a class=\"arrow nnext\" page=\"" +pd.maxP+ "\"></a>";
	
	$(".page_nation").html(html);
                                                                     
}


$(function() {
    $('.starstar').raty({
//                score: 3,
        path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images",
        half : true,
        hints :  [['bad 1/2', 'bad'], ['poor 1/2', 'poor'], ['regular 1/2', 'regular'], ['good 1/2', 'good'], ['gorgeous 1/2', 'gorgeous']]
        ,width : 200
        ,click: function(score, evt) {//선택한 별점수가
        }
    });
});

</script>    
</head>
<body>
  <c:import url="/header1"></c:import>
      <main>
        <div class="main_wrap">
          <div class="side_bar">
            <div class="title">랭킹</div>
            <div class="inner">
                <div class="on">시스템 좋은 주차장</div>
                <div>요금 합리적인 주차장</div>
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
                <thead>
                  <tr>
                    <th>순위</th>
                    <th>주차장명</th>
                    <th>구</th>
                    <th>동</th>
                    <th width="150px">별점</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>논현 공영주차장</td>
                    <td>강남구</td>
                    <td>개포동</td>
                    <td>⭐⭐⭐⭐⭐</td>
                  </tr>
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
                <div class="page_wrap">
                    <div class="page_nation">
                       <!-- <a class="arrow pprev" href="#"></a>
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
                       <a class="arrow nnext" href="#"></a> -->
                    </div>
                 </div>
            </div> 
        </div>
        </div>
      </main>
 	<c:import url="/footer"></c:import>
</body>
</html>