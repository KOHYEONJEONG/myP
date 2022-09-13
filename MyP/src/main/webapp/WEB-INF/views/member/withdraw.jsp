<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나만의 P</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<body>
<c:import url="/header1"></c:import>
    <main class="main1">
        <div class="main_wrap">
            <div class="side_bar">
                <div class="title">마이페이지</div>
                <div class="inner">
                    <div class="on">마이페이지</div>
                </div> 
             </div>
             <div class="right_area">            
                <div class="content_wrap">
                    <div class="title">회원 탈퇴</div>
                    <hr class="line">
                    <div class="box"> 
                        <div class="row1">
                            <div class="box_title">탈퇴사유</div>
                            <div class="select">
                                <select name="reason">
                                    <option value="" disabled selected>무엇이 불편하셨나요?</option>
                                    <option value="이용 불편">이용 불편</option>
                                    <option value="사용빈도 낮음">사용빈도 낮음</option>
                                    <option value="기타">기타</option>
                                  </select>
                            </div>
                        </div>
                        <div class="row1" style="border-top: 0px">
                            <div class="box_title">비밀번호</div>
                            <div class="input">
                                <input type="password" placeholder="현재 비밀번호 입력" />
                            </div>
                        </div>
                    </div>
                    <div class="btn_wrap">
                        <input type="button" value="탈퇴" class="btn update">
                    </div>
                </div>
            </div>
        </div>
      </main>
<c:import url="/footer"></c:import>
</body>
</html>