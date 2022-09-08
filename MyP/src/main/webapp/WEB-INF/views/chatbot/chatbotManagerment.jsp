<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지(챗봇관리)</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/font.css">
    <style type="text/css">
        /* 메인에서 챗봇 사용시 css예정*/
        /* .chatbot{
            width: 360px;
    height: 580px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 10;
    padding: 0 20px;
    border-radius: 5px;
    border: 2px solid #000;
    box-shadow: 0 0 30px 0 rgb(0 0 0 / 29%);
    border-bottom-right-radius: 5px;
    border-bottom-left-radius: 5px;
        } */
        .chatbot {
            width: 480px;
            height: 600px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 10;
            /* padding: 0 20px; */
            border-radius: 5px;
            /* border: 2px solid #000; */
            box-shadow: 0px 0px 10px 0 rgb(0 0 0 / 29%);
            box-sizing: border-box;
        }
        .chatbot .header{
            height: 50px;
            background: #505669;
            line-height: 50px;
            color: #fff;
            text-align: center;
        }

        .chatbot .contents{
            padding: 0 30px;
            height: 550px;
            overflow-y: auto;
            box-sizing: border-box;
        }
        .response{
            padding-top: 30px;
            display: flex;
        }
        .icon {
            width: 40px;
            height: 40px;
            border-radius: 50px;
            background-color: #eeeeee;
            text-align: center;
            box-sizing: border-box;
            line-height: 50px;
        } 
        .img{
            background: url(./icons/person3.png) no-repeat;
            background-size: 90%;
            background-position: 50%;
            z-index: 10;
            width: 40px;
            height: 40px;
        }

      
        .text_wrap{
            width: 320px;
            margin-left: 10px;
        }
        .text {  
            width: 100%;
            font-size: 14px;
            background-color: #eeeeee;
            border: solid 1px #dadada;
            border-radius: 5px;
            padding: 10px;
            box-sizing: border-box;
            line-height: 1.3;
        }

        .response .b{
            height: 100px;
            margin-top: 10px;
        }
        .b input{
            float: left;
            width: 160px;
            height: 45px;
            background-color: #eeeeee;
            border: solid 1px #dadada;
            cursor: pointer;
        }
        .b input:nth-child(even){
            border-left: 0px;
        }
        .bold{
            font-weight: bold;
            color: #588ccc;
        }
        .time{
            font-size: 12px;
        }


        .answer{
            display: flex;
            flex-direction: row-reverse;
            margin-top: 30px;

        }
        .answer .b{
            width: 100%;
            height: 50px;
        }
        
        
        .answer .img{
            background: url(./img/dog.jpg) no-repeat;
            background-size: 100%;
            background-position: 50%;
            z-index: 10;
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
        .answer .text_wrap{
            width: 160px;
            margin-right: 10px;
        }

        .answer .time{
            text-align: right;
        }

        .footer{
            height: 60px;
            text-align: center;
            box-sizing: border-box;
            padding: 10px 0;
            margin-top: 40px;
            margin-bottom: 20px;
        }
        .footer input{
            width: 120px;
            height: 40px;
            background: #fff;
            border: solid 1px #588ccc;
            color: #588ccc;
            border-radius: 20px;
            cursor: pointer;
        }
       
      
       
    </style>   
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
              <div class="title">관리자페이지</div>
              <div class="inner">
                  <div>회원관리</div>
                  <div class="on">챗봇관리</div>
                  <div>데이터관리</div>
                  <div>신고리뷰관리</div>
              </div> 
           </div>
        <div class="right_area">
            <div class="chatbot">
                <div class="header">나만의 P 챗봇</div>
                <div class="contents">
                    <div class="response">
                        <div class="icon">
                            <div class="img"></div>
                        </div>
                        <div class="text_wrap">
                            <div class="text">안녕하세요<br/>주차장의 모든것을 제공하는 <span class="bold">나만의 P</span> 입니다<br/>문의사항 선택해주세요
                            </div>
                            <div class="b">
                                <input type="button" value="환경설정"/>
                                <input type="button" value="정기권"  />
                                <input type="button" value="이용안내" />
                                <input type="button" value="요금감면"  />
                            </div>
                            <div class="time">오후 2:00</div>
                        </div>
                    </div>  
                    <div class="answer">
                        <div class="icon">
                            <div class="img"></div>
                        </div>
                        <div class="text_wrap">
                        <div class="b">
                            <input type="button" value="정기권"  />
                        </div>
                        <div class="time">오후 2:01</div>
                        </div>
                    </div>
                    <div class="response">
                        <div class="icon">
                            <div class="img"></div>
                        </div>
                        <div class="text_wrap">
                            <div class="text">정기권 관련하여 안내해 드릴게요. <br/> 상세 질문을 선택해 주세요.</div>
                            <div class="b">
                                <input type="button" value="1. 취소,환불"/>
                                <input type="button" value="2. 비용문의"  />
                                <input type="button" value="3. 일일주차장"  />
                                <input type="button" value="4. 할인방법"  />
                            </div>
                            <div class="time">오후 2:02</div>
                        </div>
                    </div>
                    <div class="footer">
                        <input type="button" value="새 질문하기" />
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
  <script src="./jquery/jquery-1.12.4.js"></script>
  <script src="./js/main.js"></script>
</body>
</html>