<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/font.css">
    <style type="text/css">
        body{
            overflow-x: auto;
        }
        header{
            height: 163px;
            position: sticky;
        }
        .top_area{
            height: 40px;
            background: #fff;
        }
        .bottom_area{
            height: 123px;
            width: 1400px !important;
            margin: 0 auto;
            /* background: #04725B; */
        }
        .header_wrap{
            /* 원래 */
            background: #f6f6f6 !important; 
            /* background: #00604b !important; */
            /* background: #516373 !important; */
            /* background: #fc8e8e !important; */
            /* background: #6fb2fe !important; */
            /* background: #006044 !important; */
            /* background: #006948 !important; */
            /* background: #4a88d4 !important; */
        }
        .header_bg{
            color: #fcf1e3;
        }
        
/* .menu_container .main_menu > li > a{
            color: #fff !important;
        } */
    .menu_container .main_menu > li > a{line-height: 123px;}
        .header_wrap{
            /* width: 1400px !important; */
            background: #fcf5f6;
            /* background: #f6f6f6; */
        }
        .main_wrap{
            width: 1400px !important;
        }
        .menu_area{
            right: 40px;
        }


        body,
        html {
            margin: 0;
            padding: 0;
        }

        table {
            border-collapse: collapse;
            text-align: center;
            margin: 0 auto;
            width: 100%;
        }

        td,
        th {
            border: 1px solid #000;
            height: 30px;
            text-align: center;
        }
        .bg {
            width: 650px;
            height: 500px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            /* z-index: 10; */
            padding: 0 20px;
        }

        .top{
            /*pic_top 박스와 mypage_top을 감싼 큰 박스 */
            display: flex;
        }
        img {
            /*이미지 크기와 margin*/
            margin-top: 10px;
            width: 100px;
            height: 100px;
        }
        .pic_top {
            /*사진박스*/
            border: 1px solid black;
            margin: 10px 10px 10px 0;
            width: 180px;
            height: 150px;
            text-align: center;
        }
        .mypage_top{
            /*경고수,이메일,아이디,닉네임 박스*/
            margin: 10px 0 10px 0;
            padding-top: 25px;
        }
        .line {
            width: 650px;
            border: solid 2px #9e9e9e;
            box-sizing: border-box;
            margin: 3px 0;
        }

        .mypage_bottom{
            display: flex;
            /* justify-content: center;
            align-items: center; */
            font-size: 0;
            margin-top: 5px;;
        }
        .my_info input{
            width: 100%;
            height: 100%;
            padding: 5px;
            box-sizing: border-box;
        }


        .my_btn{
            /*공통 버튼 스타일*/
            margin-top: 5px;
            height: 100px;
            background-color: #f6f6f6;
            font-weight: 700;
            border: 1px solid #595959;
            border-radius: 5px;
            width: 100%;
            font-size: 14px;
            box-sizing: border-box;
            line-height: 100px;
        }

        .bottom2{
            display: flex;
        }

        .my_btn1{
            margin-left: 5px;
            margin-top: 5px;
            padding: 20px 10px 10px;
            background-color: #f6f6f6;
            font-weight: 700;
            border: 1px solid #595959;
            border-radius: 5px;
            height: 205px;
            width: 150px;
            box-sizing: border-box;
            text-align: center;
        }
        .txt{
            font-size: 14px;
            margin-top: 10px;

        }
        .my_info{
            box-sizing: border-box;
        }
        .my_info > div{
            height: 50px;
            
        }
        img{
            margin-bottom: 10px;

        }
        .input{
            padding: 0 10px;
        }
        input[type=file]{
            width: 100%;
        }
        .info_first,.info_second{
            display: flex;
        }
        .info_first >div{
            border: 1px solid #000;
        }
        .info_first > div > input{
            border: 0;/*input영역에 테두리를 없애서 깔끔하다.*/
            outline: 0;
        }
        .info_first > div:nth-child(odd){
            width: 50px;
            line-height: 50px;
            text-align: center;
            font-size: 14px;
            border-right: 0;
        }
        .info_first > div:nth-child(2){
            border-right: 0px;
        }
        .info_second > div:nth-child(2){
            border-right: 0px;/*겹치는 선을 없애기 위해서*/
        }

        .info_second >div{
            border: 1px solid #000;
            border-top: 0;
        }
        .info_second > div > input{
            border: 0;
            outline: 0;
        }
        .info_second > div:nth-child(odd){
            width: 50px;
            line-height: 50px;
            text-align: center;
            font-size: 14px;
            border-right: 0;
        }
        .mypage_bottom  div, input {
            cursor: pointer;
        }
        .main_wrap{
            background: url(./img/bg2.jpeg) no-repeat;
            height: 100%;
            width: 100%;
            padding-top: 50px;
        }
        .side_bar{
            margin-left: 100px;
            width: 250px;
            height: calc(100% - 50px);
        }
        .side_bar .title{
            margin-top: 0;
        }
        .logo{
            width: 230px;
        height: 100%;
        background: url(./icons/logo8.png) no-repeat;
        background-size: 140%;
        background-position: 50%;
        top: 48%;
        left: 20px;
        transform: translateY(-50%);
        position: absolute;
        }
        .logo a{
            width: 250px;
            height: 100%;
            display: block;
        }
        .bg{
            width: 650px;
    height: 500px;
    position: absolute;
    top: 55%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 10;
    padding: 0 20px;
        }
        .right_area{
            width: 1050px;
            height: calc(100% - 50px);
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
                    <div class="on">마이페이지</div>
                </div> 
             </div>
            <div class="right_area">
                <div class="bg">
                    <h2>MYPAGE</h2>
                    <hr class="line" />
                    <div class="top">
                        <div class="pic_top">
                            <div><img src="./icons/person3.png" alt="이미지"></div>
                            <div class="input">
                                <input type="file" />
                            </div>
                        </div>  
                        <div class="mypage_top">
                            <div class="my_info">
                                <div class="info_first">
                                    <div>아이디</div>
                                    <div><input type="text" /></div>
                                    <div>닉네임</div>
                                    <div><input type="text" /></div>
                                </div>
                                <div class="info_second">
                                    <div>경고수</div>
                                    <div><input type="text" /></div>
                                    <div>이메일</div>
                                    <div><input type="text" /></div>
                                </div>
                            </div>
                        </div>
                    </div>             
                    <!--하단 버튼's-->
                    <div class="mypage_bottom">
                        <!--bottom1-->
                        <div class="bottom1" style="text-align: center;">
                            <input type="button" class="my_btn info" value="기본정보 수정하기">
                            <input type="button" class="my_btn password" value="비밀번호 수정하기">
                        </div>
                        <!--bottom2-->
                        <div class="bottom2">
                            <div class="my_btn1 myReview">
                                <img class="myReviewImg" src="./icons/reviewmypage.png">
                                <div class="txt">주차장리뷰</div>
                            </div>
                            <div class="my_btn1 myQna">
                                    <img class="qnaImg" src="./icons/qna.png">
                                <div class="txt">
                                    게시글
                                </div>
                            </div>
                            <div class="my_btn1 myResignMembership">
                                <img class="resignMembershipImg" src="./icons/logout.png">
                                <div class="txt">회원탈퇴</div>
                            </div>
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