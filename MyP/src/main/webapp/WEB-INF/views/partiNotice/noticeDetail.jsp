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
    <script type="text/javascript" src="resources/script/common/popup.js"></script>
    <style>
        .rigth_contents {
            width: 800px;
            position: absolute;
		    top: 230px;
		    left: 50%;
		    transform: translateX(-50%);
        }
        .contents_top {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }

        .s_title{
            width: 100px;
            height: 40px;
            line-height:40px;
            margin-left: 5px;
            font-size: 24px;
        }

        .right_area .notice {
            display: flex;
            justify-content: space-between;
            font-size: 0;
            height: 30px;
            margin: 8px 0;
            padding: 0 20px 0 10px;
        }

        .title_left {
            font-size: 16px;
            width: 500px;/*긴글이 있을 수도 있어서 자동으로 늘어나게 해야할듯* -> width크기 늘림 */
            line-height: 30px;
            overflow: hidden; /*추가*/
            
        }

        .title_right {
            font-size: 16px;
    		height: 30px;
    		width: 280px;
    		text-align: right;
        }

        .title_font1 {
            display: inline-block;
            vertical-align: top;
            line-height: 30px;
        }

        .title_font2 {
            display: inline-block;
            vertical-align: top;
            line-height: 30px;
            margin-left: 20px;
        }

        .rigth_contents .title_font {
            position: absolute;
            color: #000;
            margin: 5px;
        }

        .content {
            margin: 10px 0;
            width: 800px;
            height: 464px;
            padding-top: 23px;
            font-size: 16px;
            padding: 10px;
            box-sizing: border-box;
        }
        
         .btn_wrap {
          height: 100%;
          display: flex;
          justify-content: flex-end;
          margin-top: 10px;
        }
        
        .btn_wrap1{
        	display: flex;
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
        }

        .update {
            margin: 0px 8px 0px 0px;
            background: #FD9A29;
            border: solid 1px #FD9A29;
        }

        .delete {
            background: #00af80;
            border: solid 1px #00af80;
        }
        .back{
        	border: 1px solid #ccc;
            background-color: #f6f6f6;
            color: #000;
         }

    </style>
<script type="text/javascript">
$(document).ready(function () {
	
	
	$("#listBtn").on("click", function () {
		$("#backForm").attr("action","notice");
		$("#backForm").submit();
	});
	
	
	$("#updateBtn").on("click", function () {
		$("#backForm").attr("action","noticeUpdate");
		$("#backForm").submit();
	});
	
	
	$("#deleteBtn").on("click", function () {
		  makePopup({
		         title : "알림",
		         contents : "삭제하시겠습니까?",
		         // draggable : true,
		         buttons : [{
		            name : "삭제",
		            func:function() {
		            	var params = $("#backForm").serialize();
		    			
		    			$.ajax({
		    				url : "noticeAction/delete",
		    				type : "POST", 
		    				dataType: "json", 
		    				data: params, 
		    				success : function(res) { 
		    					switch(res.msg){
		    					case "success" : 
		    						location.href ="notice";
		    						break;
		    					case "fail" :
		    						makeAlert("알림" , "삭제에 실패하였습니다.");
		    						break;
		    					case "error" :
		    						makeAlert("알림" , "삭제 중 문제가 발생하였습니다.");
		    						break;
		    					}
		    				},
		    				error : function(request, status, error) { 
		    					console.log(request.responseText); 
		    				}
		    			});
		            }
		         }, {
		            name : "취소"
		    }]
		});
	});
	
});
</script>
</head>

<body>
    <c:import url="/header1"></c:import>
    <main>
 <form action="#" id="backForm" method="post">
	<input type="hidden" name="no" value="${data.NOTICE_NUM}">
	<input type="hidden" name="page" value="${param.page}" /> <!-- 전 화면에서 넘어온 페이지 정보 -->
		<!-- 전 화면에서 넘어온 검색 정보 -->
	<input type="hidden" name="searchGbn" value="${param.searchGbn}"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
</form>
        <div class="main_wrap">
            <div class="side_bar">
                <div class="title">참여/알림</div>
                <div class="inner">
                    <div class="on">공지사항</div>
                    <div>FAQ</div>
                    <div>QnA</div>
                </div>
            </div>
            <div class="right_area">
                <div class="rigth_contents">
                    <div class="contents_top">
                        <h2 class="s_title">공지사항</h2>   
                         <!-- 로그인 한 사람이 글 쓴 사람 이면서 관리자인 경우 -->
		                 <!-- 글쓴 사람의 권한이 관리자에서 다른 걸로 바꿨을 경우 대비에 and로 함 -->
		                 <c:choose>
							<c:when test="${sMemNo eq data.MEM_NUM and sMemAuto == 1}">
								<div class="btn_wrap1">
		                        	<div class="btn update" id="updateBtn">수정</div>
		                   			<div class="btn delete" id="deleteBtn">삭제</div>
		                   		</div>
							</c:when>
							<c:when test="${sMemAuto == 1}">
								<div class="btn_wrap1">
		                        	<div class="btn update" id="updateBtn">수정</div>
		                   			<div class="btn delete" id="deleteBtn">삭제</div>
		                   		</div>
							</c:when>
						</c:choose>
                    </div>
                    <hr />
                    <div class="notice">
                        <div class="title_left">${data.TITLE}</div>
                        <div class="title_right">
                            <div class="title_font1">작성일: ${data.REG_DT}</div>
                            <div class="title_font2">조회수: ${data.HIT}</div>
                        </div>
                    </div>
                    <hr />
                    <div class="content">
                       ${data.CON}
                    </div>
                <hr/>
                <div class="btn_wrap">
                    <div class="btn back" id="listBtn">목록</div>
                </div>
            </div>
        </div>
        </div>
    </main>
	<c:import url="/footer"></c:import>
</body>

</html>