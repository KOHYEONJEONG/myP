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
    <link rel="stylesheet" href="resources/css/popup.css">
    <link rel="stylesheet" href="resources/css/font.css">
    <style>
     .table1 {
        border: 1px #a39485 solid;
        font-size: 14px;
        box-shadow: 0 2px 5px rgba(0,0,0,.25);
        width: 900px;
        border-collapse: collapse;
        border-radius: 5px;
        overflow: hidden;
        margin: 200px auto 0 auto;
        
        }

        th {
        text-align: center;
        }
        
        thead {
        font-weight: bold;
        color: #000;
        background: #eeeeee;
        border-bottom: 1px solid rgba(0,0,0,.1);
        }
        
        td, th {
        padding: 1em .5em;
        vertical-align: middle;
        }
        
        td {
        border-right: 1px solid rgba(0,0,0,.1);
        border-bottom: 1px solid rgba(0,0,0,.1);
        background: #fff;
        text-align: center;
        }

        td:nth-child(odd){
            background-color:#eeeeee; 
            font-weight: bold;
        }

        a {
        color: #73685d;
        }
        .btn_wrap1{
            width: 900px;
            text-align: right;
            margin: 20px auto 0 auto;
        }
        .btn_wrap1 input[type=button]{
            width: 70px;
            height: 35px;
            font-size: 14px;
            margin-left: 5px;
            cursor: pointer;
        }
        .btn1{
            background-color: #f6f6f6;
            border: 1px solid #ccc;
        }
        .btn2{
            background-color: #eeeeee;
            border: solid 1px #ccc;  
        }
        .btn3{
            background-color: #e06666;
            border: solid 1px #e06666;
            color: #fff
        }
        .contents{
            text-align: left;
            padding: 10px;
        }
    </style>
       <script src="resources/jquery/jquery-1.12.4.js"></script>
       <script src="resources/js/main.js"></script>
        <script src="resources/js/header.js"></script>
    <script type="text/javascript" src="resources/rety/jquery.raty.js"></script>
     <script type="text/javascript"
      src="resources/script/common/popup.js"></script>  
<script type="text/javascript">
 	 $(document).ready(function () {
 		  $("#listBtn").on("click", function() {
 	         $("#backForm").attr("action","reportReviewManagement"); 
 	         $("#backForm").submit();
 	      });
 		  
 	$("#warningBtn").on("click",function(){
 		 if($.trim($("#feedtxt").val())==""){//1.내용이 있는지 먼저 확인하기!!
             makeAlert("알림", "내용을 입력하세요.", function() {
                $("#feedtxt").focus();
             });
          }else{
        	  $("#actionForm").attr("action","reportReviewDetail2");
              $("#actionForm").submit();
          	}
          
  	 	});
 	 })
 	 </script>
</head>
<body>
    <%-- <c:import url="/header1"></c:import> --%>
      <main class="main1">
      <form action="#" id="backForm" method="post">
	
	<input type="hidden" name="page" id="page" value="${param.page}" /> <!-- 전 화면에서 넘어온 페이지 정보 -->
		<!-- 전 화면에서 넘어온 검색 정보 -->
	<input type="hidden" name="searchGbn" id="searchGbn" value="${param.searchGbn}"/>
	<input type="hidden" name="searchText" id="searchText" value="${param.searchText}"/>
	</form>
        <div class="main_wrap">
          <div class="side_bar">
            <div class="title">관리자페이지</div>
            <div class="inner">
                <div>회원관리</div>
                <div>챗봇관리</div>
                <div>데이터관리</div>
                <div>신고 리뷰관리</div>
            </div> 
        </div>
        <div class="right_area">   
        	
        		<input type="hidden" name="no" value="${data.REVIEW_NUM}"/>
        		
        	
        	
        	       
            <table class="table1">
                <thead>
                <tr>
                    <th colspan="5">고척돔 주차장후기</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>닉네임</td>
                    <td>${data.NM}</td>
                    <td>작성일</td>
                    <td>${data.DT}</td>
                </tr>
                <tr>
                    <td>시스템별점</td>
                    <td>${data.SYSTEM}</td>
                    <td>요금별점</td>
                    <td>${data.SYSTEM2}</td>
                </tr>
                <tr>
                    <td>조회수</td>
                    <td>${data.HIT}</td>
                    <td>신고수</td>
                    <td>${data.CNT}</td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td colspan="3" class="contents">주차장이 너무 협소합니다.</td>
                </tr>
                </tbody>
            </table>
            <div class="btn_wrap1">
                 <input type="button" value="목록" class="btn list" id="listBtn">
                <input type="button" class="btn2 refuseBtn" value="반려" />
                <input type="button" class="btn3" value="경고" />
            </div>
          </div>
        </div>
      </main>
      <c:import url="/footer"></c:import>
    <div id="refuse_popup">
        <form action= "#" id="actionForm" method="post">
        <input type="hidden" name="gbn" value="delete" />
   <input type="hidden" name="no" value="${data.REVIEW_NUM}" />
   <!-- 전 화면에서 넘어온 페이지 정보 -->
   <input type="hidden" name="page" id="page" value="${param.page}" />
   <!-- 전 화면에서 넘어온 검색 정보 -->
   <input type="hidden" name="searchGbn" id="searchGbn" value="${param.searchGbn}" />
   <input type="hidden" name="searchTxt" id="searchTxt" value="${param.searchTxt}" />
   
            <div class="close_i">
                <img src="resources/icons/close.png" alt="">
            </div>
            <div class="popup_top">
                <div class="title">반려사유</div>
                <div class="input">
                    <input type="text" class="txt_title" id="feedtxt" name="feedtxt">
                </div>
            </div>
            <div class="warningBtn_wrap" style="text-align: center">
                <input type="button" value="반려" id="warningBtn">
            </div>
        </form>
      </div>
 
</body>
</html>