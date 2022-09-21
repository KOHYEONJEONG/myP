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
    <script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>    
<script type="text/javascript">
$(document).ready(function () {
		
		// 에디터 연결
		// CKEDITOR.replace(아이디, 옵션)
		CKEDITOR.replace("con", {
			resize_enabled: false, // resize_enabled : 크기조절기능 활용여부
			language : "ko", // 사용언어
			enterMode: "2", // 엔터키처리방법. 2번이면 <br/>
			width : "100%", // 숫자일경우 px, 문자열일경우 css크기
			height : 400
		});
		
		$("#cancelBtn").on("click", function () {
			$("#backForm").submit();
		});
		
		$("#updateBtn").on("click", function () {
			// CKEditor의 값 취득
			// CKEDITOR.instances[아이디] : CKEditor중 아이디가 같은 것을 찾겠다.
			//.getData() : 작성중인 내용을 취득하겠다.
			$("#con").val(CKEDITOR.instances['con'].getData());
			
			if($.trim($("#que").val()) == ""){
				makeAlert("알림","제목 입력하세요." , function () {
					$("#que").focus();
				})
			} else if($.trim($("#con").val()) == ""){
				makeAlert("알림","내용을 입력하세요." , function () {
					$("#con").focus();
				})
			} else {
				var params = $("#backForm").serialize();
				
				$.ajax({
					url : "faqAction/update", 
					type : "POST", 
					dataType: "json", 
					data: params, 
					success : function(res) { 
						switch(res.msg){
						case "success" : 
							// 카테고리를 유지하고 나머지 정보 초기화
							$("#page").val("1");
							$("#searchGbn").val("0");
							$("#searchText").val("");
						
							$("#backForm").submit();
							break;
						case "fail" :
							makeAlert("알림" , "등록에 실패하였습니다.");
							break;
						case "error" :
							makeAlert("알림" , "등록 중 문제가 발생하였습니다.");
							break;
						}
					},
					error : function(request, status, error) { 
						console.log(request.responseText); 
					}
				});  
			}
		})
	});	
</script>
</head>
<body>
<c:import url="/header1"></c:import>
  <form action="faq" id="backForm" method="post">
      <main>
      <input type="hidden" name="no" value="${param.no}">
      <input type="hidden" name="page" value="${param.page}" />
	  <input type="hidden" name="searchGbn" value="${param.searchGbn}"/>
	  <input type="hidden" name="searchText" value="${param.searchText}"/>
	  <input type="hidden" name="mem_num" value="${sMemNo}"/>
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
                <div class="register_wrap">
                    <div class="title">
                        FAQ
                    </div>
                    <hr />            
                    <select name="cate_num" class="select_box" id="cate_num">
                        <option value="1">환경설정</option>
                        <option value="2">주차장문의</option>
                        <option value="3">이용안내</option>
                      </select>
                    <hr />
                    <input type="text" class="input_box" id="que" name="que" placeholder="제목을 입력하세요">
                    <hr />
                    <div class="con">
                        <!--textarea에 id값을 con로 바꿔줌-->
                         <textarea class="form-control" rows="5" id="con" name="con"></textarea>
                    </div>
                    <hr >
                    <div class="btn_wrap">
                        <input type="button" value="취소" class="btn list" id="cancelBtn">
                        <input type="button" value="수정" class="btn regi" id="updateBtn">
                    </div>
                </div>
                </div>
        </div>
</main>
  </form>
<c:import url="/footer"></c:import>
</body>
</html>