<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/font.css">
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/rety/jquery.raty.js"></script><!-- 별 -->
<link rel="stylesheet" href="resources/rety/jquery.raty.css"><!-- 별 -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script type="text/javascript" src="resources/script/common/popup.js"></script>
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
<script type="text/javascript">
$(document).ready(function() {
	
	console.log("qna번호 : "+$("#qna_num").val());
	console.log("페이지번호 : "+ "${param.page}");
	
	$('.feeStar, .envStar, .cctvStar, .disStar').raty({ 
		readOnly: true, 
		path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"
	});
	
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action","myQnA");/*페이지이동*/ 
		$("#actionForm").submit();
	})
	
	$("#deleteBtn").on("click",function(){
		if($("#no").val() != ""){
			makePopup({
		         title : "삭제",
		         contents : "정말로 삭제하시겠습니까?",
		         // draggable : true,
		         buttons : [{
		            name : "확인",
		            func:function() {
		            	action("delete");
		            	closePopup(); // 제일 위의 팝업 닫기
		            }
		         }, {
			            name : "취소"
				    }]
			});
		}
	});
	
	$("#updateBtn").on("click", function(){
		console.log("수정버튼");
		$("#actionForm").attr("action","myQnAUpdate");/*페이지이동*/  
		$("#actionForm").submit();
	});
});

var msg ={
		"delete" : "삭제",
	}
	
//분류명 테이블의 action
function action(flag) {
	console.log(msg[flag]);
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "myQnaAction/"+flag, 
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			switch(res.msg){
				case "success" :
					// 목록 재조회
					switch(flag){
						case "delete" :
							$("#page").val("1"); //1 중요!!
			            	$("#searchGbn").val("0");
			            	$("#searchText").val("");
			            	
							$("#actionForm").attr("action","myQnA");/*삭제 후 목록으로 페이지이동*/
							$("#actionForm").submit();
							break;
					}
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
</script>
</head>
<body>
	<c:import url="/header1"></c:import>
	
	<form action="#" id="actionForm" method="post">
		<input type="hidden" name="qna_num" id="qna_num" value="${param.qna_num
		
		}"/>
	 	<input type="hidden" name="no" id="no" value="${sMemNo}" />
		<!--  전 화면에서 넘어온 페이지 정보 -->
		<input type="hidden" name="page" id="page" value="${param.page}"/>
		<!--  전 화면에서 넘어온 검색 정보 -->
		<input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}" />
		<input type="hidden" id="searchText" name="searchText" value="${param.searchText}" />
	</form>
	
	<main>
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">주차장 안내</div>
				<div class="inner">
					<div class="on">공영 주차장 조회</div>
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
				                        <div>작성일 : ${data.REG_DT}</div>
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
			                          <div>작성일 : ${data.REG_DT}</div>
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
		                <input type="hidden" name="no" value="${data.QNA_NUM}"/>
		                <c:choose>
		                 	<c:when test="${sMemAuto == 1}">
		                <textarea  class="answer_txt" id="con" name="con" >${data.ANSWER_CON}</textarea>
		                </c:when>
		                <c:otherwise>
		                 <textarea  class="answer_txt" id="con" name="con" readonly >${data.ANSWER_CON}</textarea>
		                </c:otherwise>
		               </c:choose>
	                
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