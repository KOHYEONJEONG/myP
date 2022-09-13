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
                <div class="table_wrap">
                    <div class="search_box">
                      <div class="select">
                        <select name="select_b" id="select_b">
                          <option value="">대분류</option>
                          <option value="">소분류</option>
                          <option value="">답변</option>
                      </select>
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
                          <th>대분류</th>
                          <th>소분류</th>
                          <th>답변</th>
                          <th>작성일</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>10</td>
                          <td>환경설정</td>
                          <td>홈페이지 인증오류</td>
                          <td>홈페이지에서 본인인증이 잘 되지...</td>
                          <td>2022.08.27</td>
                        </tr>
                        <tr>
                          <td>9</td>
                          <td>정기권</td>
                          <td>취소환불</td>
                          <td>해당 주차장 사무실 방문하여...</td>
                          <td>2022.08.27</td>
                        </tr>
                        <tr>
                          <td>8</td>
                          <td>정기권</td>
                          <td>구매 후 사용방법</td>
                          <td>자동화 정산시스템이 갖춰진...</td>
                          <td>2022.08.27</td>
                        </tr>
                        <tr>
                          <td>7</td>
                          <td>정기권</td>
                          <td>만차시 주차자이용</td>
                          <td>정기권은 일정한 기간동안(해당월) 이용...</td>
                          <td>2022.08.27</td>
                        </tr>
                        <tr>
                          <td>6</td>
                          <td>이용안내</td>
                          <td>이륜자동차 주차</td>
                          <td>현재 주차장법상 이륜자동차 역시 자동차...</td>
                          <td>2022.08.27</td>
                        </tr>
                        <tr>
                          <td>6</td>
                          <td>이용안내</td>
                          <td>임시번호판 부착차량</td>
                          <td>임시번호판 부착차량도 공영주차장을 이용하실...</td>
                          <td>2022.08.27</td>
                        </tr>
                        <tr>
                          <td>5</td>
                          <td>이용안내</td>
                          <td>일일주차권</td>
                          <td>서울시 주차장 설치 및 관리조치...</td>
                          <td>2022.08.27</td>
                        </tr>
                        <tr>
                          <td>4</td>
                          <td>요금감면</td>
                          <td>전기차 충전시 요금감면</td>
                          <td>1시간범위 내에서 주차요금을 면제...</td>
                          <td>2022.08.27</td>
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td> </td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="btn_wrap">
                      <div class="write_btn">
                          글쓰기
                       </div>
                    </div>
                      <!--페이징-->
                      <div class="page_wrap">
                          <div class="page_nation">
                             <a class="arrow pprev" href="#"></a>
                             <a class="arrow prev" href="#"></a>
                             <a href="#" class="active">1</a>
                             <a href="#">2</a>
                             <a href="#">3</a>
                             <a href="#">4</a>
                             <a href="#">5</a>
                             <a href="#">6</a>
                             <a href="#">7</a>
                             <a href="#">8</a>
                             <a href="#">9</a>
                             <a href="#">10</a>
                             <a class="arrow next" href="#"></a>
                             <a class="arrow nnext" href="#"></a>
                          </div>
                       </div>
                  </div>
            </div>
        </div> 
  </main>
  <c:import url="/footer"></c:import>
</body>
</html></html>