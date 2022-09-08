<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랭킹 요금이 합리적인 주차장 순위별로정리한 게시판 페이지</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/font.css">
    <script src="./jquery/jquery-1.12.4.js"></script>
    <script src="./js/main.js"></script>
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
      <div class="bottom_area1">
          <h1 class="logo">
            <a href="/"></a>
          </h1>
          <div class="menu_area">
              <nav class="menu_container">
                  <span class="header_bg"></span>
                  <ul class="main_menu">
                      <li><span class="curr_bar"></span><a href="">주차장안내</a>
                        <ul class="sub_menu l20">
                          <li><a href="/menu1-1.html">공영주차장 조회</a></li>
                      </ul>
                      </li>
                      <li><a href="">참여/알림</a>
                          <ul class="sub_menu l40">
                              <li><a href="/menu2-1.html">공지사항</a></li>
                              <li><a href="/menu2-2.html">FAQ</a></li>
                              <li><a href="/menu2-3.html">QNA</a></li>
                          </ul>
                      </li>
                      <li><a href="">랭킹</a>
                        <ul class="sub_menu l120">
                          <li><a href="/menu3-1.html">시스템 좋은 주차장</a></li>
                          <li><a href="/menu3-2.html">요금 합리적인 주차장</a></li>
                      </ul>
                      </li>
                  </ul>
              </nav>
            <div class="login_comment">홍길동님 환영합니다</div>
            <div class="login_i"></div>
          </div>
      </div>
    </div> 
  </header>
      <main>
        <div class="main_wrap">
          <div class="side_bar">
            <div class="title">랭킹</div>
            <div class="inner">
                <div>시스템 좋은 주차장</div>
                <div class="on">요금 합리적인 주차장</div>
            </div> 
        </div>
        <div class="right_area">            
            <div class="table_wrap">
                <div class="ranking_area">
                    <div class="ranking_box">
                      <div class="icon gold"></div>
                      <div class="photo">
                          <img src="./img/1.png" alt="" width="100%">
                      </div>
                      <div class="info">
                        <span class="parking_name">논현 공영주차장</span>
                        <sapn>⭐⭐⭐⭐⭐</sapn>
                      </div>
                  </div>    
                    <div class="ranking_box">
                        <div class="icon sliver"></div>
                        <div class="photo">
                            <img src="./img/1.png" alt="" width="100%">
                        </div>
                        <div class="info">
                          <span class="parking_name">논현 공영주차장</span>
                          <sapn>⭐⭐⭐⭐⭐</sapn>
                        </div>
                    </div>
                    <div class="ranking_box">
                        <div class="icon bronze"></div>
                        <div class="photo">
                            <img src="./img/1.png" alt="" width="100%">
                        </div>
                        <div class="info">
                          <span class="parking_name">논현 공영주차장</span>
                          <sapn>⭐⭐⭐⭐⭐</sapn>
                        </div>
                    </div>
                </div>
              <table>
                <thead>
                  <tr>
                    <th>순위</th>
                    <th>주차장명</th>
                    <th>구</th>
                    <th>동</th>
                    <th width="150px">별점</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>논현 공영주차장</td>
                    <td>강남구</td>
                    <td>개포동</td>
                    <td>⭐⭐⭐⭐⭐</td>
                  </tr>
                  <tr>
                    <td> </td>
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
                  <tr>
                    <td> </td>
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
                  <tr>
                    <td> </td>
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
                  <tr>
                    <td> </td>
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
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
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
      <footer>
        <div id="footer_box">
            <ul >
                <li>서울시 금천구 가산동 가산디지털로2로 115 대륭테크노타운3차 1109호 1호 TEL : 02-2108-5900 Email : TRAFFICTEAMj@goodee.co.kr</li>
                <li>COPYRIGHT ⓒ 2022 나만의P ALL RIGHTS RESERVED</li>
            </ul>
        </div>
    </footer>
</body>
</html>