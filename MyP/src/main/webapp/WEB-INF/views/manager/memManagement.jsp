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
                <div class="on">회원관리</div>
                <div>챗봇관리</div>
                <div>데이터관리</div>
                <div>신고리뷰관리</div>
                <div>카테고리관리</div>
            </div> 
         </div>
        <div class="right_area">
            <div class="table_wrap">
                <div class="search_box">
                  <div class="select">
                      <select name="select_b" id="select_b">
                        <option value="0">전체</option>
                        <option value="1">아이디</option>
                        <option value="2">작성자</option>
                        <option value="3">이메일</option>
                        <option value="4">권한</option>
                    </select>
                   <!--조건선택-->
                  </div>
                  <div class="search_form">
                    <input type="text" />
                  </div>
                  <div class="search_btn" >
                    검색
                  </div>
                </div>
                <table>
                  <thead>
                    <tr>
                      <th>no</th>
                      <th>아이디</th>
                      <th>닉네임</th>
                      <th>이메일</th>
                      <th>경고</th>
                      <th>권한</th>
                    </tr>
                  </thead>
                 
                  <tbody>
                    <!-- 
                    <tr>
                      <td>10</td>
                      <td>coco</td>
                      <td>코코넛사탕</td>
                      <td>coco@email.com</td>
                      <td>3</td>
                      <td>관리자</td>
                    </tr>
                     -->
                 
                  </tbody>
                </table>
                
                  <!--페이징-->
                  <div class="page_wrap">
                      <div class="page_nation"></div>
                  </div>
                   
              </div>
        </div>
    </div>
  </main>
<c:import url="/footer"></c:import>
</body>
</html>