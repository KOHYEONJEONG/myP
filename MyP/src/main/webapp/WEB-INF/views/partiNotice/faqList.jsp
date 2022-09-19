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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <!-- <link rel="stylesheet" href="resources/demos/style.css"> -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function () {
//검색 구분 설정
	if("${param.searchGbn}" != "") {
		$("#searchGbn").val("${param.searchGbn}");
	} else {
		$("#oldGbn").val("0");
	}

	// 카테고리 설정
	if("${param.no}" != "") {
		$("#no").val("${param.no}");
	} else {
		$('.tap.t2').addClass('on');
        $('.tap.t2').siblings().removeClass('on');
		$("#no").val("2");
	}
	
	// 목록 조회
	reloadList();
	
	// 참여/알림 메뉴 FAQ에서 버튼 클릭시 하단 아코디언 변경
    $(".tap.t1").click(function () {
        $('.tap.t1').addClass('on');
        $('.tap.t1').siblings().removeClass('on');  
        $("#no").val("1");
        
     	// 검색 및 페이징 초기화
		$("#page").val("1");
		$("#searchGbn").val("0");
		$("#searchTxt").val("");
		$("#oldGbn").val("0");
		$("#oldTxt").val("");
		// 목록 재조회
		reloadList();
    });
    $(".tap.t2").click(function () {
        $('.tap.t2').addClass('on');
        $('.tap.t2').siblings().removeClass('on');  
        $("#no").val("2");
        
     	// 검색 및 페이징 초기화
		$("#page").val("1");
		$("#searchGbn").val("0");
		$("#searchTxt").val("");
		$("#oldGbn").val("0");
		$("#oldTxt").val("");
		// 목록 재조회
		reloadList();
    });
    $(".tap.t3").click(function () {
        $('.tap.t3').addClass('on');
        $('.tap.t3').siblings().removeClass('on');  
        $("#no").val("3");
        
     	// 검색 및 페이징 초기화
		$("#page").val("1");
		$("#searchGbn").val("0");
		$("#searchTxt").val("");
		$("#oldGbn").val("0");
		$("#oldTxt").val("");
		// 목록 재조회
		reloadList();
    });
	
	
	
	// 검색 버튼
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		
		// 신규 상태 적용
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	});
		
	// 페이징 클릭시
	 $(".page_nation").on("click", "a", function () {
		$("#page").val($(this).attr("page"));
		//기존 값 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		reloadList();
	})		
	
    	      
 // 등록 버튼
	/* 	// 기존 검색상태 유지		
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "FaqRegister");
		$("#actionForm").submit();		
	}); */
});


function reloadList() {
	var params = $("#actionForm").serialize();
	$.ajax({
		url : "FaqList",
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

    html +="<div class=\"accordion_con on\">";                               
    html +="  <div id=\"accordion_con\"> ";                               
	for(var data of list){
				                                                         
    html +="    <h3>" + data.QUE + "</h3>     ";
    html +="    <div>                         ";                               
    html +="      <p>" + data.ANSWER_CON + "</p>     ";                                                        
    html +="    </div>                        ";                               
	}                                                                          
    html +="  </div>                          ";                               
    html +="</div>                            ";                               
	
	$(".accordion_wrap").html(html);
	
	 // 아코디언
	 $("#accordion_con").accordion({
	    collapsible: true
	});
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
<!-- 페이징 때 기존 검색 내용 유지용 -->
<input type="hidden" id="oldGbn" value="${param.searchGbn}" />
<input type="hidden" id="oldTxt" value="${param.searchTxt}" />  
      <main>
        <div class="main_wrap">
            <div class="side_bar">
                <div class="title">참여/알림</div>
                <div class="inner">
                    <div>공지사항</div>
                    <div class="on">FAQ</div>
                    <div>QnA</div>
                </div> 
            </div>
            <div class="right_area">            
                <div class="table_wrap">
                <form action="#" id="actionForm" method="post">
                  <div class="search_box">
                    <div class="select">
                    <input type="hidden" name="no" id="no" />	
					<input type="hidden" name="page" id="page" value="${page}" />
                        <select name="searchGbn" id="searchGbn" >
                          <option value="0">제목</option>
                          <option value="1">내용</option>
                      </select>
                     <!--조건선택-->
                    </div>                   
						<input type="hidden" name="no" id="no" />
						<input type="hidden" name="page" id="page" value="${page}"/>
                    <div class="search_form">
                      <input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
                    </div>  
                    <div class="search_btn" id="searchBtn">
                      검색
                    </div>                               
                  </div>
                  <div class="accordion">   
                    <div class="tap_wrap" name="cateNo" id="cateNo">
                       <div class="tap t1 on">
                           <div class="img_wrap">
                               <div class="img"></div> 
                           </div>
                           <div class="tap_txt" value="${data.FAQ_NUM}">환경설정</div>
                       </div>
                       <div class="tap t2">
                           <div class="img_wrap">
                               <div class="img"></div> 
                           </div>
                           <div class="tap_txt" value="${data.FAQ_NUM}">주차장 문의</div>
                       </div>
                       <div class="tap t3">
                           <div class="img_wrap">
                               <div class="img"></div> 
                           </div>
                           <div class="tap_txt" value="${data.FAQ_NUM}">이용안내</div>
                       </div>
                    </div> <!-- tab wrap end -->
                       <c:if test="${sMemAuto == 1}">
					 <div class="btn_wrap">
                    	 <div class="write_btn" id="insertBtn">글쓰기</div>
                 	</div> <!-- btn wrap end -->
				</c:if>
                     
                     <div class="accordion_wrap"></div>
                    </div> <!-- accordion end -->
                    </form>
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
                </div><!-- right area -->
              </div>
        </div>
      </main>
      <c:import url="/footer"></c:import>
   <script>


	
      
    </script>

</body>
</html>