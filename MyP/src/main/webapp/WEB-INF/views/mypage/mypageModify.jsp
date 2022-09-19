<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyP</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/font.css">
    <script src="resources/js/main.js"></script>
    <script src="resources/js/mypage.js"></script>
    <style>
        input{
            font-family: 'TmoneyRoundWindRegular';
        }
        .bg{
            width: 800px;
            margin: 0 auto;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        
        }
        .bg .title {
            font-size: 22px;
            margin-bottom: 5px;
        }

        .line {
            width: 800px;
            border: solid 2px #9e9e9e;
            box-sizing: border-box;
            margin: 3px 0;
        }

        .box {
            width: 800px;
            height: 250px;     
            background-color: #eeeeee;
            border: solid 1px #595959;
            box-sizing: border-box;
            padding: 50px 100px;
        }


        .row1 , .row2{
            width: 600px;
            height: 50px;
            display: flex;
            border: 1px solid #000;
            margin: auto;
            line-height: 50px;
            box-sizing: border-box;
        }
        .row2{
            border-top: 0px
        }
        .box_title {
            font-size: 16px;
            width: 120px;
            border-right: 1px solid #000;
            text-align: center;
            box-sizing: border-box;
        }
        .input{
            width: 478px;
            background: #fff;
            box-sizing: border-box;
            padding-left: 5px;
        }
        .input input{
            border: 0px;
            padding: 5px;
            height: 40px;
            outline: 0;

            
        }
        .row1 .input input[type=text]{
            width: 470px;
            box-sizing: border-box;
        }
        .row2 .input input[type=text]{
            width: 395px;
            box-sizing: border-box;
        }

        .btn_wrap{
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
        }

        .btn {
            width: 70px;
            height: 35px;
            font-size: 14px;
            box-sizing: border-box;
            cursor: pointer;
            color: #fff;
        }
        .btn.email{
            border: solid 1px #595959;
            background-color: #595959;
        }
        .btn.confirm{
            border: solid 1px #595959;
            background-color: #595959;
        }
        .btn.update{
            border: solid 1px #00af80;
            background-color: #00af80;
        }

        
    </style>
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
      <main  class="main1">
        <div class="main_wrap">
            <div class="side_bar">
                <div class="title">마이페이지</div>
                <div class="inner">
                    <div class="on">마이페이지</div>
                </div> 
             </div>
             <div class="right_area">            
                <!-- 여기 -->
                <div class="bg">
                    <div class="title">기본정보 수정</div>
                    <hr class="line">
                    <div class="box"> 
                        <div class="row1">
                            <div class="box_title">닉네임</div>
                            <div class="input">
                                <input type="text" placeholder="기존닉네임" />
                            </div>
                        </div>
                        <div class="row2">
                            <div class="box_title">이메일</div>
                            <div class="input">
                                <input type="text" placeholder="csshtml97@naver.com" />
                                <input type="button" value="인증번호" class="btn email">
                            </div>
                        </div>
                        <div class="row2">
                            <div class="box_title">인증번호</div>
                            <div class="input">
                                <input type="text" placeholder="인증번호" />
                                <input type="button" value="확인" class="btn confirm">
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
      
      
</body>
</html>