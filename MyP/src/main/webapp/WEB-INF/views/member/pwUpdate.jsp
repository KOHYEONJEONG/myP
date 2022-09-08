<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 수정</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/font.css">
      <script src="./jquery/jquery-1.12.4.js"></script>
      <script src="./js/main.js"></script>
    <style type="text/css">
    .wrap {
   width: 400px;
   height: 350px;
   padding: 40px 20px 20px 20px;
   background-color: #C4E2F2;
   position: absolute;
   top: 65%;
   left: 62%;
   transform: translate(-50%,-50%);
    border-radius: 30px;
   box-sizing: border-box;
    }
    .title {
   margin: 0 auto;
    width: 240px;
    height: 44px;
    text-align: center;
    font-size: 25px;
    background-repeat: no-repeat;
    background-position: 0 0;
    background-size: 240px auto;
    margin-bottom: 20px;
    }
    .input_box1 {
   position: relative;
   height: 60px;
    border: solid 1px #dadada;
    background: #fff;
    border-radius: 10px;
   padding: 10px;
   margin: 5px 0px 15px;
   box-sizing: border-box;
   }
    .input_box2 {
   position: relative;
   height: 60px;
    border: solid 1px #dadada;
    background: #fff;
    border-radius: 10px;
   padding: 10px;
   margin: 5px 0px 10px;
   box-sizing: border-box;
   }
    input {
   height: 100%;
   width: 100%;
    
    border: 0;
    background: #fff;
   font-size: 15px;
   outline: 0;
    }
    input::placeholder {
     font-size: 14px;
    }
    .loginBtn_wrap {
   font-size: 0;
    margin-top: 10px;
   text-align: center;
    
    }
    #loginBtn {
    margin-top: 10px;
   height: 60px;
    border: solid 1px #6E9FED;
    text-align: center;
    background: #6E9FED;
    color:white;
    font-size: 18px; 
   box-sizing: border-box;
   border-radius: 5px;
   cursor: pointer;
   width: 350px;
    }  
    </style>
</head>
<body>
    <header>
        <div class="header_wrap">
          <div class="top_area">
            <div class="notices">
              <div class="icon no"></div>
              <div class="notice first">암사동 공영주차장 운영개시 안내</div>
            </div>
          </div>
          <div class="bottom_area">
              <h1 class="logo">
                <a href="/"></a>
              </h1>
              <div class="menu_area">
                  <nav class="menu_container">
                      <span class="header_bg"></span>
                      <ul class="main_menu">
                          <li><span class="curr_bar"></span><a href="">주차장안내</a>
                            <ul class="sub_menu l20">
                              <li><a href="">공영주차장 조회</a></li>
                          </ul>
                          </li>
                          <li><a href="">참여/알림</a>
                              <ul class="sub_menu l40">
                                  <li><a href="">공지사항</a></li>
                                  <li><a href="">FAQ</a></li>
                                  <li><a href="">QNA</a></li>
                              </ul>
                          </li>
                          <li><a href="">랭킹</a>
                            <ul class="sub_menu l120">
                              <li><a href="">시스템 좋은 주차장</a></li>
                              <li><a href="">요금 합리적인 주차장</a></li>
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
                    <div>마이페이지</div>
                </div> 
             </div>
             <div class="wrap">
                <div class="title">비밀번호 수정</div>
                <div class="box"> 
                    <div class="input_box1">
                        <input type="password"  maxlength="20"  placeholder="현재 비밀번호 입력해주세요"/>
                    </div>
                    <div class="input_box2">
                        <input type="password"  maxlength="20"  placeholder="새로운 비밀번호를 입력해주세요"/>
                    </div>
                    <div  class="loginBtn_wrap">
                        <input type="button" id="loginBtn"  value="수정" />
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