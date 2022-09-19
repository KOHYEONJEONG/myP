<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나만의 P</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/font.css">
    <link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
    <script src="resources/jquery/jquery-1.12.4.js"></script>
     <script src="resources/js/main.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 추가, 툴팁관련 -->
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
    <script type="text/javascript"
      src="resources/script/common/popup.js"></script>      
<script type="text/javascript">
$(document).ready(function() {
   // 에디터 연결
	CKEDITOR.replace("con", {
			resize_enabled: false, // resize_enabled : 크기조절기능 활용여부
			language : "ko", // 사용언어
			enterMode: "2", // 엔터키처리방법. 2번이면 <br/>
			width : "100%", // 숫자일경우 px, 문자열일경우 css크기
			height : 400
		});

	// CKEditor의 값 취득
    // CKEDITOR.instances[아이디] : CKEditor중 아이디가 같은 것을 찾겠다.
    //.getData() : 작성중인 내용을 취득하겠다.
   
   
   $("#cancelBtn").on("click", function() {
      $("#backForm").submit();
   });
   
   $("#updateBtn").on("click", function() {
	   
	   		$("#answercon").val("");
	      // CKEditor의 값 취득
	      // CKEDITOR.instances[아이디] : CKEditor중 아이디가 같은 것을 찾겠다.
	      // .getDate() : 작성중인 내용을 취득한다
	      $("#con").val(CKEDITOR.instances['con'].getData());
	      
	      // $.trim(값) : 값 앞 뒤 공백제거
	      if($.trim($("#title").val()) == "") {
	         makeAlert("알림", "제목을 입력하세요.", function() {
	            $("#title").focus();
	         });
	      } else if($.trim($("#con").val()) == "") {
	         makeAlert("알림", "내용을 입력하세요.", function() {
	            $("#con").focus();
	         });
	      }else{
	    	  var params = $("#actionForm").serialize();
	    	  
	    	  $.ajax({
	              url : "QnaAction/update",
	              type : "POST",
	              dataType : "json", 
	              data : params, 
	              success : function(res) { 
	  				switch(res.msg){
	  				case "success":
	  					
	  					$("#backForm").submit();
	  					break;
	  				case "fail":
	  					 makeAlert("알림", "수정에 실패하였습니다.");
	  					break;
	  				case "error":
	  					 makeAlert("알림", "수정 중 문제가 발생하였습니다.");
	  					break;
	  				}
	              },
	              error : function(request, status, error) {
	                 console.log(request.responseText); 
	          		    }
	      	     });  

	     	}
	  });

});
function check(box){
	if(box.checked){
		$('#ckval').val("0");
		console.log($("#ckval").val());
	}else{
		console.log("체크안됨")
	}
}
</script>
</head>
<body>

<form action="QnaDetail" id="backForm" method="post">
   <!-- 전 화면에서 넘어온 페이지 정보 -->
    <input type="hidden" id="no" name="no" value="${data.QNA_NUM}" />
   <input type="hidden" id="page" name="page" value="${page}" />
   <!-- 전 화면에서 넘어온 검색 정보 -->
   <input type="hidden" id="oldGbn" value="${param.searchGbn}" />
   <input type="hidden" id="oldTxt" value="${param.searchTxt}" />
</form>

  <header>
    <div class="header_wrap">
      <div class="top_area">
        <div class="notices">
          <div class="icons no"></div>
          <div class="notice first">암사동 공영주차장 운영개시 안내</div>
        </div>
      </div>
      <div class="bottom_area">
          <h1 class="logo">
            <a href="/"></a>
          </h1>
          <div class="menu_area">
              <nav class="menu_container">
                  <span class="header_bg"></span>
                  <ul class="main_menu">
                      <li><span class="curr_bar"></span><a href="">주차장안내</a>
                        <ul class="sub_menu l20">
                          <li><a href="/menu1-1.html">공영주차장 조회</a></li>
                      </ul>
                      </li>
                      <li><a href="">참여/알림</a>
                          <ul class="sub_menu l40">
                              <li><a href="/menu2-1.html">공지사항</a></li>
                              <li><a href="/menu2-2.html">FAQ</a></li>
                              <li><a href="/menu2-3.html">QNA</a></li>
                          </ul>
                      </li>
                      <li><a href="">랭킹</a>
                        <ul class="sub_menu l120">
                          <li><a href="/menu3-1.html">시스템 좋은 주차장</a></li>
                          <li><a href="/menu3-2.html">요금 합리적인 주차장</a></li>
                      </ul>
                      </li>
                  </ul>
              </nav>
            <div class="login_comment">홍길동님 환영합니다</div>
            <div class="login_i"></div>
          </div>
      </div>
    </div> 
  </header>
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
            <form action="#" id="actionForm" method="post">
            	<input type="hidden" name="no" value="${data.QNA_NUM}"/>
            	<input type="hidden" name="answercon" value="${data.ANSWER_CON}"/>
            	<input type="hidden" name="ckval" id="ckval"/>
                <div class="register_wrap">
                    <div class="title">
                        QnA
                    </div>
                    <hr />
                    <!-- <select name="use_time" class="select_box">
                        <option value="" disabled selected>선택</option>
                        <option value="">이용안내</option>
                        <option value="">불편사항</option>
                      </select>
                    <hr /> -->
                    <input type="text" class="input_box" placeholder="${data.TITLE}" id="title" name="title"/>
                    <hr />
                   <div class="con">
                     <textarea class="form-control" rows="5" id="con" name="con"> ${data.CON}</textarea>
                </div>
                	
                    <hr >
                    <div class="checkbox_box">
                        <span>비공개</span>
                         <input type="checkbox" id="checkbox" onClick="check(this)"/>
                    </div>
                    <input type="hidden" id="memNo" name="memNo" value="${sMemNo}"/>
                    </form>
                    <hr >
                    <div class="btn_wrap">
                    	
                        <input type="button" value="취소" class="btn list" id="cancelBtn">
                        <input type="button" value="등록" class="btn regi" id="updateBtn">
                    </div>
                </div>
                </div>
        </div>
</div>
</main>
<footer>
  <div id="footer_box">
      <ul >
          <li>서울시 금천구 가산동 가산디지털로2로 115 대륭테크노타운3차 1109호 1호 TEL : 02-2108-5900 Email : TRAFFICTEAMj@goodee.co.kr</li>
          <li>COPYRIGHT ⓒ 2022 나만의P ALL RIGHTS RESERVED</li>
      </ul>
  </div>
</footer>

</body>
</html>