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
    <link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
    <script src="resources/jquery/jquery-1.12.4.js"></script>
     <script src="resources/js/main.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script type="text/javascript" src="resources/script/common/popup.js"></script>
<style type="text/css">
.update {
    margin: 0px 75px 0px 0px;
    background: #FD9A29;
    border: solid 1px #FD9A29;
}   

.finish {
    margin: 0px 8px 0px 0px;
    background: #FD9A29;
    border: solid 1px #FD9A29;
} 

.delete {
    background: #00af80;
    border: solid 1px #00af80;
}

.cancel {
    background: #00af80;
    border: solid 1px #00af80;
}

.btn {
    width: 70px;
    height: 35px;
    font-size: 14px;
    color: #fff;
    cursor: pointer;
    box-sizing: border-box;
    line-height: 35px;
    text-align: center;
    position: absolute;
    bottom: 5px;
    right: 5px;
}

.btn_wrap1{
    display: flex;
}
</style>
<script type="text/javascript">

   var oldQue; // 기존 제목 담는 변수
   var oldCon; // 기존 내용 담는 변수

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
      $('.tap.t1').addClass('on');
        $('.tap.t1').siblings().removeClass('on');
      $("#no").val("1");
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
   
     /// 테이블 검색버튼 부분, 엔터키 이벤트 막기
   $("#actionForm").on("keypress", "input", function(event){
      if(event.keyCode == 13){ //이벤트 코드가 엔터가들어오면
      
      //버튼 이벤트 발생
      $("#searchBtn").click();
         return false;
      }
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
      $("#searchTxt").val($("#oldTxt").val());
      
      reloadList();
   });
   
             
   // 글쓰기 버튼
   $("#insertBtn").on("click", function() {
      // 기존 검색상태 유지      
      $("#searchGbn").val($("#oldGbn").val());
      $("#searchTxt").val($("#oldTxt").val());
      
      $("#actionForm").attr("action", "FaqInsert");
      $("#actionForm").submit();      
   });
   
   // 수정버튼 클릭
   $(".accordion_wrap").on("click", "#updateBtn", function () {
      $("#no1").val($(this).attr("no1"));
      
      $("#searchGbn").val($("#oldGbn").val());
      $("#searchTet").val($("#oldTet").val());
      
       $("#actionForm").attr("action", "faqUpdate");
      $("#actionForm").submit(); 
   });
   
   // 목록의 삭제버튼 클릭시
   $(".accordion_wrap").on("click", "#deleteBtn", function() {
      $("#no1").val($(this).attr("no1"));
      
       makePopup({
            title : "알림",
            contents : "삭제 하시겠습니까?",
            buttons : [{
               name : "삭제",
               func : function() {                     
                   action("delete"); 
                   closePopup(); // 제일 위에 팝업 닫기
               }
            }, {
               name : "취소"
         }]           
      });
   });       
   
});
  
var msg ={
   "insert" : "등록",
   "update" : "수정",
   "delete" : "삭제",
}  

function action(flag) {
   
   // Javascript Object에서의 [] : 해당 키값으로 내용을 불러오거나 넣을 수 있다.
   //                       Java의 Map에서 get, put역할
   var params = $("#actionForm").serialize();
   $.ajax({
      url : "faqAction/" + flag,
      type : "POST",
      dataType : "json", 
      data : params, 
      success : function(res) { 
         switch(res.msg) {
         case "success" :
            // 내용 초기화
            $("#con").val("");
            $("#no1").val("");
                        
            // 목록 재조회
            switch(flag) {
            case "delete" :
               // 조회 데이터 초기화
               $("#page").val("1");
               $("#searchGbn").val("0");
               $("#searchTet").val("");
               $("#oldGbn").val("0");
               $("#oldTet").val("");
               break;
            }            
            reloadList();
            break;
         case "fail" :
            makeAlert("알림", msg[flag] + "에 실패하였습니다.");
            break;
         case "error" :
            makeAlert("알림", msg[flag] + " 중 문제가 발생하였습니다.");
            break;   
         }
      },
      error : function(request, status, error) {
         console.log(request.responseText); 
      }
   });  // Ajax End
} // action Function End

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
   var cate_num = "";
    html +="<div class=\"accordion_con on\">";                               
    html +="  <div id=\"accordion_con\"> ";                               
   for(var data of list){
      cate_num = data.CATE_NUM;
      
      html +="<h3 no1=\"" + data.FAQ_NUM + "\">" + data.QUE + "</h3>";   
      html +="    <div class=\"btn_wrap1\">                         ";                               
      html +="      <p>" + data.ANSWER_CON + "</p>     "; 
       if("${sMemAuto}" == 1){
          html +="<div no1=\"" + data.FAQ_NUM + "\" class=\"btn update\" id=\"updateBtn\">수정</div>";
          html +="<div no1=\"" + data.FAQ_NUM + "\" class=\"btn delete\" id=\"deleteBtn\">삭제</div>";
       }
       html +="    </div>    ";             
   }                                                                          
    html +="  </div>";                               
    html +="</div>";                               
   
   $("#cate_num").val(cate_num);
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
      <main>
        <div class="main_wrap">
            <c:import url="/partiNoticeSidebar">
            	<c:param name="link" value="faq"></c:param>
            </c:import>
            <div class="right_area">            
                <div class="table_wrap">
                
            <input type="hidden" id="oldGbn" value="${param.searchGbn}" />
         <input type="hidden" id="oldTxt" value="${param.searchTxt}" /> 
                <form action="#" id="actionForm" method="post">
                  <div class="search_box">
                  <input type="hidden" id="oldGbn" value="0" />
              <input type="hidden" id="oldTxt" />
                  <input type="hidden" name="no" id="no" /> 
                  <input type="hidden" name="no1" id="no1" />  
                  <input type="hidden" name="page" id="page" value="${page}" />
                  <input type="hidden" name="cate_num" id="cate_num"/>
                    <div class="select">
                        <select name="searchGbn" id="searchGbn" >
                          <option value="0">제목</option>
                          <option value="1">내용</option>
                      </select>
                     <!--조건선택-->
                    </div>                                     
                    <div class="search_form">
                      <input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
                    </div>  
                    <div class="search_btn" id="searchBtn">검색</div>                               
                  </div>
                  <div class="accordion">   
                    <div class="tap_wrap">
                       <div class="tap t1 on" value="1" name="faq_num" id="faq_num">
                           <div class="img_wrap">
                               <div class="img"></div> 
                           </div>
                           <div class="tap_txt">환경설정</div>
                       </div>
                       <div class="tap t2" value="2" name="faq_num" id="faq_num">
                           <div class="img_wrap">
                               <div class="img"></div> 
                           </div>
                           <div class="tap_txt">주차장 문의</div>
                       </div>
                       <div class="tap t3" value="3" name="faq_num" id="faq_num">
                           <div class="img_wrap">
                               <div class="img"></div> 
                           </div>
                           <div class="tap_txt">이용안내</div>
                       </div>
                    </div> <!-- tab wrap end -->
                       <c:if test="${sMemAuto == 1}"><!-- 관리자로 로그인해야 글쓰기 보임 -->
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
                    </div><!-- table_wrap -->
                </div><!-- right area -->
        </div>
      </main>
      <c:import url="/footer"></c:import>
 

</body>
</html>