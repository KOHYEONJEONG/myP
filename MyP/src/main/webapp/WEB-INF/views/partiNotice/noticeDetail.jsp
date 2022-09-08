<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/font.css">
    <style>
        .rigth_contents {
            width: 900px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .contents_top {
            display: flex;
            justify-content: space-between;
        }

        .noticeTitle{
            width: 100px;
            height: 40px;
            line-height:40px;
        }

        .right_area .notice {
            display: flex;
            justify-content: space-between;
            font-size: 0;
            height: 30px;
            margin: 8px 0;
        }

        .title_left {
            font-size: 16px;
            width: 500px;/*긴글이 있을 수도 있어서 자동으로 늘어나게 해야할듯* -> width크기 늘림 */
            line-height: 30px;
            padding-left: 5px;
            overflow: hidden; /*추가*/
            
        }

        .title_right {
            font-size: 16px;
            height: 30px;
            text-align: center;
        }

        .title_font1 {
            display: inline-block;
            vertical-align: top;
            width: 200px;
            line-height: 30px;
        }

        .title_font2 {
            display: inline-block;
            vertical-align: top;
            width: 100px;
            line-height: 30px;
        }

        .btn_wrap {
            width: 90%;
            height: 100%;
        }

        .btn {
            width: 70px;
            height: 35px;
            font-size: 14px;
            color: #fff;
        }

        .update {
            margin: 0px 10px 0px 0px;
            background: #FD9A29;
            border: solid 1px #FD9A29;

        }

        .delete {
            background: #00af80;
            border: solid 1px #00af80;
        }

        .rigth_contents .title_font {
            position: absolute;
            color: #000;
            margin: 5px;
        }

        .content {
            /*내용 불러옴*/
            margin: 10px 0;
            width: 898px;
            height: 464px;
            padding-top: 23px;
            border: 1px solid #ccc;
            font-size: 20px;
            padding: 20px;
            box-sizing: border-box;
        }

        .backBtnBox {
            margin-top: 10px;
            text-align: right;
        }

        .backBtn{
            border: 1px solid #ccc;
            background-color: #f6f6f6;
            width: 70px;
            height: 35px;
            font-size: 14px;
            box-sizing: border-box;
            cursor: pointer;
        }


        /*목록보기 버튼*/
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
                    <div class="on">공지사항</div>
                    <div>FAQ</div>
                    <div>QnA</div>
                </div>
            </div>
            <div class="right_area">
                <div class="rigth_contents">
                    <div class="contents_top">
                        <h2 class="noticeTitle">공지사항</h2>
                        <div class="btn_wrap">
                            <input type="button" value="수정" class="btn update">
                            <input type="button" value="삭제" class="btn delete">
                        </div>
                    </div>

                    <hr />
                    <div class="notice">
                        <div class="title_left">암사동 공영주차장 운영 개시</div>
                        <div class="title_right">
                            <div class="title_font1">작성일 : 2022-06-27</div>
                            <div class="title_font2">조회수:50</div>
                        </div>
                    </div>
                    <hr />
                    <div class="content">
                        <!--값 받아오려고-->
                        공지사항 내용...
                    </div>

                    <!--
            <hr class="line">
            <pre class="content">
                <암사동 공영주차장 운영 개시>
        
                1. 주차장명:암사동 공영주차장
                2. 주차장 위치:암사1동 산 59
                3. 정상 운영일자:2022-07-01
        
                *많은 관심 및 이용 부탁드리겠습니다!
            </pre> -->
                <hr/>
                <div class="backBtnBox">
                    <input type="button" value="목록" class="backBtn" id="backBtn">
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
</body>

</html>