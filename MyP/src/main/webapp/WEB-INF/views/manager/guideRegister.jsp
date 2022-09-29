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
            <c:import url="/sidebar"></c:import>
            <div class="right_area">
               <div class="register_wrap">
                <div class="title">
                    챗봇관리
                </div>
                <hr />
                <!--대분류-->
                <div class="select_wrap">
                <select name="" class="select_box">
                    <option value="" disabled selected>선택</option>
                    <option value="">환경설정</option>
                    <option value="">정기권</option>
                    <option value="">이용안내</option>
                    <option value="">요금관련</option>
                  </select>
                <!--소분류-->
                <select name="" class="select_box">
                  <option value="" disabled selected>선택</option>
                  <option value="">홈페이지 인증오류</option>
                </select>
              </div>
              <hr />
                <div class="discript">
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
  </main>
  <c:import url="/footer"></c:import>
</body>
</html>