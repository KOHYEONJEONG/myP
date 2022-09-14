<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script src="resources/js/header.js"></script>
</head>
<body>
	<!-- 메인페이지 제외하고 다 사용. 너비가 header.jsp보다 좁음. -->
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
								</ul></li>
							<li><a href="">참여/알림</a>
								<ul class="sub_menu l40">
									<li id="notice"><a>공지사항</a></li>
									<li id="faq"><a>FAQ</a></li>
									<li id="qna"><a>QNA</a></li>
								</ul></li>
							<li><a href="">랭킹</a>
								<ul class="sub_menu l120">
									<li><a href="/menu3-1.html">시스템 좋은 주차장</a></li>
									<li><a href="/menu3-2.html">요금 합리적인 주차장</a></li>
								</ul></li>
						</ul>
					</nav>
					<c:choose>
						<c:when test="${empty sMemNm}">
							<div class="login_comment"></div>
							<div class="login_i" id="loginBtn"></div>
						</c:when>
						<c:otherwise>
							<div class="login_comment on">${sMemNm}님환영합니다</div>
							<div class="login_i1">
								<div class="img1"></div>
							</div>
							
							<div class="login_box">
								<c:choose>
									<c:when test="${sMemAuto eq 1}">
										<%-- 관리자 권한 --%>
										<div class="managerPage" id="managerPage">관리자 페이지</div>
										<div class="logout" id="logoutBtn">로그아웃</div>
									</c:when>
									<c:otherwise>
										<div class="mypage" id="myPage">마이페이지</div>
										<div class="logout" id="logoutBtn">로그아웃</div>
									</c:otherwise>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</header>
</body>
</html>