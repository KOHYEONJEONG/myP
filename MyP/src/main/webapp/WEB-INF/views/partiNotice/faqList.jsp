<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ페이지</title>
    
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/font.css">
    <script src="./jquery/jquery-1.12.4.js"></script>
     <script src="./js/main.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

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
                <div class="title">참여/알림</div>
                <div class="inner">
                    <div>공지사항</div>
                    <div class="on">FAQ</div>
                    <div>QnA</div>
                </div> 
            </div>
            <div class="right_area">            
                <div class="table_wrap">
                  <div class="search_box">
                    <div class="select">
                        <select name="select_b" id="select_b" >
                          <option value="all">전체</option>
                          <option value="title">제목</option>
                          <option value="content">내용</option>
                          <option value="nickname">작성자</option>
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
                  <div class="accordion">
    
                    <div class="tap_wrap">
                       <div class="tap t1 on">
                           <div class="img_wrap">
                               <div class="img"></div> 
                           </div>
                           <div class="tap_txt">환경설정</div>
                       </div>
                       <div class="tap t2">
                           <div class="img_wrap">
                               <div class="img"></div> 
                           </div>
                           <div class="tap_txt">주차장 문의</div>
                       </div>
                       <div class="tap t3">
                           <div class="img_wrap">
                               <div class="img"></div> 
                           </div>
                           <div class="tap_txt">이용안내</div>
                       </div>
                    </div>
                       <div class="btn_wrap">
                           <div class="write_btn">
                               글쓰기
                            </div>
                       </div>
                       <div class="accordion_wrap">
                       <div class="setting_accordion on">
                         <div id="setting_accordion">
                           <h3>Q. 임시번호판 부착차량도 주차장 이용이 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 이륜자동차(오토바이도)도 주차가 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 임시번호판 부착차량도 주차장 이용이 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 이륜자동차(오토바이도)도 주차가 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 이륜자동차(오토바이도)도 주차가 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
    
    
                         </div>
                       </div>
                       <div class="question_accordion">
                         <div id="question_accordion">
                           <h3>Q. 잠실역 공영주차장을 24시간 이용할 수 없는 이유가 궁금합니다.</h3>
                           <div>
                             <p>일부 주차장(잠실역, 학여울역, 영등포구청역)은 주차장 출입통로가 지하철역사와 연결되어 있어 지하철이 운행되지 않는 오전 01~05시 동안 주차장을 이용할 수 없습니다. 
                               (차량출입구가 폐쇄되고 해당 시간대에는 시간주차 요금이 부과되지 않습니다.)
                             </p>
                           </div>
                           <h3>Q. 이륜자동차(오토바이도)도 주차가 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 임시번호판 부착차량도 주차장 이용이 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 이륜자동차(오토바이도)도 주차가 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 이륜자동차(오토바이도)도 주차가 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
    
    
                         </div>
                       </div>
                       <div class="guide_accordion">
                         <div id="guide_accordion">
                           <h3>Q. 주차장내 차량파손 등 사고발생시 대처방법이 궁금합니다.</h3>
                           <div>
                             <p>주차장 운영시간 중 사고가 발생한 경우 즉시 현장 주차관리실을 방문하여 근무자에게 신고하여 주시기 바라며, 야간 등 근무자가 현장에 없는 경우 통합센터로 연락하여 차량사고를 접수하실 수 있습니다.
                             </p>
                           </div>
                           <h3>Q. 이륜자동차(오토바이도)도 주차가 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 임시번호판 부착차량도 주차장 이용이 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 이륜자동차(오토바이도)도 주차가 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
                           <h3>Q. 이륜자동차(오토바이도)도 주차가 가능한지 궁금합니다.</h3>
                           <div>
                             <p>임시번호판 부착차량도 공영주차장을 이용하실 수 있습니다. 다만, 자동화시스템으로 운영되는 경우 차번인식기에서 임시번호판을 인식하지 못하므로, 출차시 정산기에 설치된 호출 버튼을누르셔서 차량번호와 함께 임시번호판 부착 차량이라는사실을 알려주셔야 
                                 합니다.
                             </p>
                           </div>
    
    
                         </div>
                       </div>
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
      <footer>
        <div id="footer_box">
            <ul >
                <li>서울시 금천구 가산동 가산디지털로2로 115 대륭테크노타운3차 1109호 1호 TEL : 02-2108-5900 Email : TRAFFICTEAMj@goodee.co.kr</li>
                <li>COPYRIGHT ⓒ 2022 나만의P ALL RIGHTS RESERVED</li>
            </ul>
        </div>
    </footer>
      <script src="./js/main.js"></script>
      <script>
         // 아코디언
         $("#setting_accordion").accordion({
            collapsible: true
        });
        $("#question_accordion").accordion({
            collapsible: true
        });
        $("#guide_accordion").accordion({
            collapsible: true
        });
      </script>
</body>
</html>