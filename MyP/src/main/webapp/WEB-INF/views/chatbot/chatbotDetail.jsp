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
                  <div class="detail_wrap">
              <div class="title">챗봇관리</div>
              <hr>
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
              <div class="content">
                홈페이지에서 본인인증이 잘 되지 않으실 경우, 새로 고침
                키보드 상단의 F5 키를 눌러 페이지를 새로고침 하신 뒤 다시 본인인증을 시도를 보세요
              </div>
          <hr>
          <div class="btn_wrap">
            <input type="button" value="목록" class="btn list">
            <input type="button" value="수정" class="btn update">
            <input type="button" value="삭제" class="btn del">
          </div>
      </div>
            </div>
        </div> 
  </main>
  <c:import url="/footer"></c:import>
</body>
</html>