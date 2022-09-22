<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <style>
		
.swiper-container1 {
  position: relative;
  width: 100%;
  height: 40px;
  overflow: hidden;

}
.swiper-wrapper {
  height: 40px;
}
.swiper-slide {
	text-align: left;
  font-size: 16px;
  background: #fff;
  heigth: 40px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  align-items: center; 
}
    </style>
<script src="resources/jquery/jquery-1.12.4.js"></script>  
 <script src="resources/js/header.js"></script>   
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
	<form action="#" id="headerForm">
		<input type="hidden" name="mem_num" id="mem_num" value="${sMemNo}">
	</form>
	<form action="#" id="headerNotiForm"></form>
 <header>
        <div class="header_wrap">
          <div class="top_area">
            <div class="notices">
              <div class="icons no"></div>
				<div class="swiper-container1">
				  <div class="swiper-wrapper">
				 	<div class="swiper-slide">Slide 1</div>
				    <div class="swiper-slide">Slide 2</div>
				    <div class="swiper-slide">Slide 3</div> 
				  </div>
				</div>
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
							<div class="login_comment on">${sMemNm}님환영합니다</div>
							<div class="login_i1"></div>							
							<c:choose>
								<c:when test="${sMemAuto eq 1}">
									<input type="hidden" id="sMemAuto" value="관리자"/>
								</c:when>
							</c:choose>
							
							<div class="login_box" id="login_box">
								<c:choose>
									<c:when test="${sMemAuto eq 1}">
										<%-- 관리자 권한 --%>
										<div class="managerPage" id="managerPage">관리자 페이지</div>
									</c:when>
								</c:choose>
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
