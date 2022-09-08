<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나만의 P</title>
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
                        <div class="row">
                            <span>머순님 정말 탈퇴하시겠습니까?</span>
                        </div>
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
      <footer>
        <div id="footer_box">
            <ul >
                <li>서울시 금천구 가산동 가산디지털로2로 115 대륭테크노타운3차 1109호 1호 TEL : 02-2108-5900 Email : TRAFFICTEAMj@goodee.co.kr</li>
                <li>COPYRIGHT ⓒ 2022 나만의P ALL RIGHTS RESERVED</li>
            </ul>
        </div>
    </footer>
      <script src="./js/main.js"></script>
</body>
</html>