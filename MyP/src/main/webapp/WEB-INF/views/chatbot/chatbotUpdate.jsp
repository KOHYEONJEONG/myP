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
 <c:import url="/header1"></c:import>
      <main>
         <div class="main_wrap">
            <div class="side_bar">
              <div class="title">관리자페이지</div>
              <div class="inner">
                <div><a href="/manager_page1.html">회원관리</a></div>
                <div class="on"><a href="/manager_page2.html">챗봇관리</a></div>
                <div><a href="/manager_page3.html">데이터관리</a></div>
                <div><a href="/manager_page4.html">신고 리뷰관리</a></div>
            </div> 
           </div>
            <div class="right_area">
                <div class="register_wrap">
                <div class="title">
                    챗봇관리
                </div>
                <hr />
                <!--대분류-->
                <div class="select_wrap">
                <select name="" class="select_box">
                    <option value="" disabled>선택</option>
                    <option value="" selected>환경설정</option>
                    <option value="">정기권</option>
                    <option value="">이용안내</option>
                    <option value="">요금관련</option>
                  </select>
                <!--소분류-->
                <select name="" class="select_box">
                  <option value="" disabled>선택</option>
                  <option value="" selected>홈페이지 인증오류</option>
                </select>
              </div>
              <hr />
                <div class="discript">
                    <!--textarea에 id값을 contents로 바꿔줌-->
                     <textarea class="form-control" rows="5" id="discript" name="discript">
                      홈페이지에서 본인인증이 잘 되지 않으실 경우, 새로 고침
                      키보드 상단의 F5 키를 눌러 페이지를 새로고침 하신 뒤 다시 본인인증을 시도를 보세요
                     </textarea>
                </div>
                <hr >
                <div class="btn_wrap">
                    <input type="button" value="목록" class="btn list">
                    <input type="button" value="수정" class="btn regi">
                </div>
            </div>
            </div>
        </div> 
  </main>
  <c:import url="/footer"></c:import>
</body>
</html></html>