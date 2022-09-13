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
    <script src="./jquery/jquery-1.12.4.js"></script>
     <script src="./js/main.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
  <c:import url="/header1"></c:import>
      <main>
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
                <div class="register_wrap">
                    <div class="title">
                        공지사항
                    </div>
                    <hr />
                    <input type="text" class="input_box" placeholder="제목을 입력하세요">
                    <hr />
                    <div class="summer">
                        <!--textarea에 id값을 contents로 바꿔줌-->
                         <textarea class="form-control" rows="5" id="contents" name="contents"></textarea>
                    </div>
                    <hr >
                    <div class="btn_wrap">
                        <input type="button" value="목록" class="btn list">
                        <input type="button" value="등록" class="btn regi">
                    </div>
                </div>
                </div>
        </div>

</div>
</main>
<c:import url="/footer"></c:import>

 <script>
    // 메인화면 페이지 로드 함수
    $(document).ready(function () {
        $('#contents').summernote({
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
    });
</script>
</body>
</html>