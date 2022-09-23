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
    <style>
        .contents{
            position: absolute;
            top: 55%;
            left: 50%;
            transform: translate(-50%, -50%);            
            z-index: 2;  
            width: 800px;
        }
        .right_area .title{
            width: 790px;
            margin: 10px 0px;
            padding-left: 10px;
            font-size: 30px;
            display:flex;
            justify-content: space-between;
        }
       
        
        .right_area .notice{
            margin: 5px 0px;
            width: 800px; 
            height:35px;
            display:flex;
            justify-content: space-between;
            line-height: 35px;
            font-size:14px;
        }
        .notice_right{
            padding-right: 20px;
            display: flex;
       
        }
        .notice_right > div:nth-child(1){
            margin-right: 20px;
        }
        .notice_left{
            color: #000;
            width: 500px;
            padding-left: 20px;
        }
        .content{
            height: 400px;
            padding: 20px;
            box-sizing: border-box;
            font-size:14px;
        }
        .answer {
            display: flex;
            margin: 8px 0;
            height: 100px;
             font-size:14px;
         
        }
        .answer .txt{
            padding: 10px 0 0 20px;
            width: 40px;
        }
        .answer_txt{
            width: 700px;
            background-color: #ffffff;
            border: solid 1px #595959;
            border-radius: 10px;
            margin-right: 20px;
            outline-color: #000;
            padding: 10px;
            box-sizing: border-box;
            font-size:14px;
        }
        .btn_wrap{
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
            width: 800px;
        }
        .btn{
            width: 75px;
            height: 40px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn.list{
            margin-right: 10px;
            background-color:#f6f6f6;
            border: 1px solid #ccc;
            /* background: linear-gradient(to bottom, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%); */
        }
        .btn.regi{
            border:solid 1px #00af80;
            background-color:#00af80;
            color: #fff;
        }
       

    </style>
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/main.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script type="text/javascript"
src="resources/script/jquery/jquery.slimscroll.js"></script>
  <script type="text/javascript"
		src="resources/script/common/popup.js"></script>
<script type="text/javascript">
   
   $(document).ready(function() {
	   
	   console.log(${sMemAuto});
	   
	   $("#listBtn").on("click", function() {
	         $("#actionForm").attr("action","qna"); 
	         $("#actionForm").submit();
	      });
	   
	   
      
      $("#insertBtn").on("click", function() { 
          
          if($.trim($("#con").val())==""){//1.내용이 있는지 먼저 확인하기!!
             makeAlert("알림", "내용을 입력하세요.", function() {
                $("#con").focus();
             });
          }else{
        	action("insert");  
          	}
          
  	 	});
      
     
   
   
   var mag={
		      "insert" : "등록",
		  
		   }
         function action(flag){
        	//con  <들을 웹문자로 변환
             $("#con").val($("#con").val().replace(/</gi, "&lt;"));
           	//con dml <들을 웹문자로 변환
           	      $("#con").val($("#con").val().replace(/>/gi, "&gt;"));
           	var params = $("#actionForm").serialize();
           	   $.ajax({
           		   url : "qnaDetail/"+flag,
           		 type : "POST",
                 dataType : "json", 
                 data : params, 
                 success : function(res) { 
                	 switch(res.msg){
                     case "success":
                    	 makeAlert("알림", "답변이 등록되었습니다.");
                      
                     break;
                	 
                     case "fail":
                         makeAlert("알림", mag[flag] + "에 실패하였습니다.");
                        break;
                     case "error":
                         makeAlert("알림", mag[flag] +" 중 문제가 발생하였습니다.");
                     break;
                  }
               },
               error : function(request, status, error) {
                  console.log(request); 
               }
            });//ajax End
   } //action(flag) function End
   
   $("#deleteBtn").on("click", function () {
       makePopup({
          title : "알림",
          contents : "삭제 하시겠습니까?",
          buttons : [{
             name : "삭제",
             func : function() {
                var params = $("#action2Form").serialize();
                 $.ajax({
                    url : "QnaAction/delete",
                    type : "POST",
                    dataType : "json", 
                    data : params, 
                    success : function(res) { 
                       switch(res.msg) {
                       case "success" :
                      		$("#page").val("1");
								$("#searchGbn").val("1");
								$("#searchTxt").val("");
								
								$("#actionForm").attr("action","qna");
								$("#actionForm").submit();
                          break;
                       case "fail" :
                          makeAlert("알림", "삭제에 실패하였습니다.");
                          break;
                       case "error" :
                          makeAlert("알림", "삭제 중 문제가 발생하였습니다.");
                          break;   
                       }
                    },
                    error : function(request, status, error) {
                       console.log(request, responseText); 
                    }
                 }); 
             }
          }, {
             name : "취소"
          }]        
  	 });
	 }); 
   $("#updateBtn").on("click", function () {
       $("#actionForm").attr("action","qnaUpdate");
       $("#actionForm").submit();
    });
});
           	   
</script>
</head>
<body>
	<c:import url="/testAHeader"></c:import>
<form action="#" id="action2Form" method="post">
   <input type="hidden" name="gbn" value="delete" />
   <input type="hidden" name="no" value="${data.QNA_NUM}" />
   <!-- 전 화면에서 넘어온 페이지 정보 -->
   <input type="hidden" name="page" id="page" value="${param.page}" />
   <!-- 전 화면에서 넘어온 검색 정보 -->
   <input type="hidden" name="searchGbn" id="searchGbn" value="${param.searchGbn}" />
   <input type="hidden" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
   <!--  전화면에서 넘어온 카테고리 번호 -->
 
</form>
  <c:import url="/header1"></c:import>
     <main>
        <div class="main_wrap">
            <div class="side_bar">
                <div class="title">참여/알림</div>
                <div class="inner">
                    <div>공지사항</div>
                    <div>FAQ</div>
                    <div class="on">QnA</div>
                </div> 
            </div>
            <div class="right_area">      
                <div class="detail_wrap">
                    <div class="title">QnA
                    <div class="upbtn">
                    <c:choose>
                  		<c:when test="${sMemNo eq data.MEM_NUM}">
                  				   <input type="button" value="수정" class="btn update" id="updateBtn">
                    			   <input type="button" value="삭제" class="btn del"  id="deleteBtn">
                  		</c:when>
                  		
                  		<c:when test="${sMemAuto == 1}">
                   			   <input type="button" value="삭제" class="btn del" id="deleteBtn">
                  		</c:when>
                  </c:choose> 
                  </div>
                  	</div> 
                    <hr>
                     <c:choose>
                  		<c:when test="${sMemNo eq data.MEM_NUM  and data.PRIVATE == 0}">
                    <div class="notice">
                        <div class="notice_left">
                            <span class="i"></span>
                            <span>${data.TITLE}</span>
                        </div>
                        <div class="notice_right">
                            <div>작성일 : ${data.DT}</div>
                            <div>조회수:${data.HIT}</div>
                        </div>
                    </div>
                    <hr>
                    <div class="content">
                          ${data.CON}
                       
                    </div>
                    </c:when>
                    
                    <c:when test="${sMemAuto == 1}">
                    <div class="notice">
                        <div class="notice_left">
                            <span class="i"></span>
                            <span>${data.TITLE}</span>
                        </div>
                        <div class="notice_right">
                            <div>작성일 : ${data.DT}</div>
                            <div>조회수:${data.HIT}</div>
                        </div>
                    </div>
                    <hr>
                    <div class="content">
                          ${data.CON}
                       
                    </div>
                    </c:when>
                    
                     <c:when test="${data.PRIVATE == 1}">
                    <div class="notice">
                        <div class="notice_left">
                            <span class="i"></span>
                            <span>${data.TITLE}</span>
                        </div>
                        <div class="notice_right">
                            <div>작성일 : ${data.DT}</div>
                            <div>조회수:${data.HIT}</div>
                        </div>
                    </div>
                    <hr>
                    <div class="content">
                          ${data.CON}
                       
                    </div>
                    </c:when>
                    
                    <c:when test="${data.PRIVATE == 0 }">
                    
                    <div class="notice">
                        <div class="notice_left">
                            <span class="i"></span>
                            <span>비공개</span>
                        </div>
                        <div class="notice_right">
                            <div>비공개</div>
                            <div>비공개</div>
                        </div>
                    </div>
                    <hr>
                    <div class="content">
                          비공개
                       
                    </div>
                    </c:when>
                      </c:choose>
                      
                    
                    
                 <hr>
                
                 <div class="answer">
                    <div class="txt">답변</div>
                    <form action = "#" id="actionForm" method="post">
                   <c:choose>
                     <c:when test="${sMemAuto == 1}">
                    <textarea  class="answer_txt" id="con" name="con" >${data.ANSWER_CON}</textarea>
                    <input type="hidden" name="no" value="${data.QNA_NUM}"/>
                    </c:when>
                     <c:when test="${sMemAuto != 1 and sMemNo eq data.MEM_NUM}">
                     <textarea  class="answer_txt" id="con" name="con" readonly >${data.ANSWER_CON}</textarea>
                     <input type="hidden" name="no" value="${data.QNA_NUM}"/>
                   </c:when>
                   <c:when test="${sMemAuto != 1 and data.PRIVATE == 0}">
                     <textarea  class="answer_txt" id="con" name="con" readonly>비공개</textarea>
                     <input type="hidden" name="no" value="${data.QNA_NUM}"/>
                   </c:when>
                   <c:when test="${sMemAuto != 1 and data.PRIVATE == 1}">
                     <textarea  class="answer_txt" id="con" name="con" readonly>${data.ANSWER_CON}</textarea>
                     <input type="hidden" name="no" value="${data.QNA_NUM}"/>
                   </c:when>
                   </c:choose>
                    </form>
                    
                    <div class="setting"></div> 
                    <div class="recycle_bin"></div> 
                </div>
                <hr>
                <div class="btn_wrap">
                	<c:choose>
                     <c:when test="${sMemAuto == 1}">
                    <input type="button" value="목록" class="btn list" id="listBtn">
                      <input type="button" value="등록" class="btn regi" id="insertBtn">
                      </c:when>
                       <c:otherwise>
                         <input type="button" value="목록" class="btn list" id="listBtn">
                        </c:otherwise>
                      </c:choose>
                      
                </div>
            </div>
        </div>
</div>
</main>
<c:import url="/footer"></c:import>
</body>
</html>