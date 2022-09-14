<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script src="resources/js/main.js"></script>
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
          <div class="bottom_area">
              <h1 class="logo" id="logo"></h1>
              <div class="menu_area">
                  <nav class="menu_container">
                      <span class="header_bg"></span>
                      <ul class="main_menu">
                          <li><span class="curr_bar"></span><a href="">주차장안내</a>
                            <ul class="sub_menu l20">
                              <li id="parkinfo"><a>공영주차장 조회</a></li>
                          	</ul>
                          </li>
                          <li><a href="">참여/알림</a>
                              <ul class="sub_menu l40">
                                  <li id="notice"><a>공지사항</a></li>
                                  <li id="faq"><a>FAQ</a></li>
                                  <li id="qna"><a>QNA</a></li>
                              </ul>
                          </li>
                          <li><a href="">랭킹</a>
                            <ul class="sub_menu l120">
                              <li id="system"><a>시스템 좋은 주차장</a></li>
                              <li id="fee"><a>요금 합리적인 주차장</a></li>
                          </ul>
                          </li>
                      </ul>
                  </nav>
            <c:choose>
              <c:when test="${empty sMemNm}">
            <div class="login_comment"></div>
             <div class="login_i" id="loginBtn"></div>
            </c:when>
            <c:otherwise>
             <div class="login_comment on">${sMemNm}님 환영합니다</div>
              <div class="login_i1">
                  <div class="img1"></div>
                </div>
                <div class="login_box">
                  <div class="mypage" id="myPage">마이페이지</div>
                  <div class="logout" id="logoutBtn">로그아웃</div>
                </div>
            </c:otherwise>
              </c:choose>
              </div>
          </div>
        </div> 
      </header>
</body>
</html>