<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		// 에디터 연결
		// CKEDITOR.replace(아이디, 옵션)
		CKEDITOR.replace("discript", {
			resize_enabled: false, // resize_enabled : 크기조절기능 활용여부
			language : "ko", // 사용언어
			enterMode: "2", // 엔터키처리방법. 2번이면 <br/>
			width : "100%", // 숫자일경우 px, 문자열일경우 css크기
			height : 400
		});
		
	});
	</script>
</head>
<body>
  <header>
    <div class="header_wrap">
      <div class="top_area">
        <div class="notices">
          <div class="icons no"></div>
          <div class="notice first">암사동 공영주차장 운영개시 안내</div>
        </div>
      </div>
      <div class="bottom_area1">
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
                <div class="title">관리자페이지</div>
            <div class="inner">
                <div>회원관리</div>
                <div>챗봇관리</div>
                <div>데이터관리</div>
                <div>신고리뷰관리</div>
                <div>카테고리관리</div>
            </div> 
         </div>
            <div class="right_area">      
                <div class="register_wrap">
                    <div class="title">
                        카테고리관리
                    </div>
                    <hr />
                    <select name="use_time" class="select_box">
                        <option value="" disabled selected>분류번호추가</option>
                        <option value="">1</option>
                        <option value="">2</option>
                      </select>
                    <hr />
                    <input type="text" class="input_box" placeholder="분류명을 입력하세요">
                    <hr />
                    <div class="discript" style="margin-bottom: 5px;">
                        <!--textarea에 id값을 contents로 바꿔줌-->
                         <textarea class="form-control" rows="5" id="discript" name="discript"></textarea>
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
<footer>
  <div id="footer_box">
      <ul >
          <li>서울시 금천구 가산동 가산디지털로2로 115 대륭테크노타운3차 1109호 1호 TEL : 02-2108-5900 Email : TRAFFICTEAMj@goodee.co.kr</li>
          <li>COPYRIGHT ⓒ 2022 나만의P ALL RIGHTS RESERVED</li>
      </ul>
  </div>
</footer>

 <script>
    // 메인화면 페이지 로드 함수
    $(document).ready(function () {
        $('#contents').summernote({
            placeholder: '하위분류명을 작성하시오',
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