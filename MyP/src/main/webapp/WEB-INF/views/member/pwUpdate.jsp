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
<main class="main1">
        <div class="main_wrap">
            <div class="side_bar">
                <div class="title">마이페이지</div>
                <div class="inner">
                    <div>마이페이지</div>
                </div> 
             </div>
             <div class="right_area">            
                <div class="content_wrap">
                    <div class="title">비밀번호 수정</div>
                    <hr class="line">
                    <div class="box1"> 
                        <div class="row1">
                            <div class="box_title">비밀번호</div>
                            <div class="input">
                                <input type="password" placeholder="****" />
                            </div>
                        </div>
                        <div class="row1" style="border-top: 0px">
                            <div class="box_title">비밀번호 확인</div>
                            <div class="input">
                                <input type="password" placeholder="****" />
                            </div>
                        </div>
                    </div>
                    <div class="btn_wrap">
                        <input type="button" value="수정" class="btn update">
                    </div>
                </div>

            </div>
        </div>
      </main>
<c:import url="/footer"></c:import>
</body>
</html>