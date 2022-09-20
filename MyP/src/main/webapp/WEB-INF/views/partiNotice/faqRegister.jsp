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
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script type="text/javascript" src="resources/script/common/popup.js"></script> 
 <script>
// 메인화면 페이지 로드 함수
$(document).ready(function () {
    $('#answer_con').summernote({
        placeholder: '게시글을 작성하시오',
        width:900,
        height: 700,
        maxHeight: 400,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
          ]
    });
    
    $("#insertBtn").on("click", function() { 
        
        if($.trim($("#que").val())=="") {
           makeAlert("알림", "제목을 입력하세요.", function() {
              $("#que").focus();
           });
        } else if($.trim($("#answer_con").val())=="") {
        	makeAlert("알림", "내용을 입력하세요.", function() {
                $("#answer_con").focus();
           });
        } else {
      	action("insert");  
        	}
	});
    $("#listBtn").on("click", function() {
		$("#backForm").submit();
	}); 
}); //document
var msg={
	"insert" : "등록",
	"update" : "수정",
	"delete" : "삭제",
	}
	
function action(flag){
	 
	//con  <들을 웹문자로 변환
     $("#answer_con").val($("#answer_con").val().replace(/</gi, "&lt;"));
   	//con dml <들을 웹문자로 변환
   	 $("#answer_con").val($("#answer_con").val().replace(/>/gi, "&gt;"));
   	
   	var params = $("actionForm").serialize();
   	
   	$.ajax({
		url : "faqAction/" + flag,
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			switch(res.msg){
			case "success" :
				// 내용 초기화
				$("#answer_con").val("");
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
}//action(flag) function End	
	
</script>
</head>
<body>
  <c:import url="/header1"></c:import>
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
                <div class="register_wrap">
                    <div class="title">
                        FAQ
                    </div>
                    <hr />
                    <form action="#" id="actionForm" method="post">
                    <select name="use_time" class="select_box">
                        <option value="0">환경설정</option>
                        <option value="1">주차장문의</option>
                        <option value="2">이용안내</option>
                      </select>
                    <hr />
                    <input type="text" class="input_box" id="que" name="que" placeholder="제목을 입력하세요">
                    <hr />
                    <div class="summer">
                        <!--textarea에 id값을 answer_con로 바꿔줌-->
                         <textarea class="form-control" rows="5" id="answer_con" name="answer_con"></textarea>
                    </div>
                    <hr >
                    <div class="btn_wrap">
                        <input type="button" value="목록" class="btn list" id="listBtn">
                        <input type="button" value="등록" class="btn regi" id="insertBtn">
                    </div>
                    </form>
                </div>
                </div>
        </div>
</div>
</main>
<c:import url="/footer"></c:import>

</body>
</html>