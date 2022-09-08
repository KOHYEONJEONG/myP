<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고리뷰관리(반려사유버튼 누를시)</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/font.css">
    <style>
     .table1 {
        border: 1px #a39485 solid;
        font-size: 14px;
        box-shadow: 0 2px 5px rgba(0,0,0,.25);
        width: 900px;
        border-collapse: collapse;
        border-radius: 5px;
        overflow: hidden;
        margin: 200px auto 0 auto;
        
        }

        th {
        text-align: center;
        }
        
        thead {
        font-weight: bold;
        color: #000;
        background: #eeeeee;
        border-bottom: 1px solid rgba(0,0,0,.1);
        }
        
        td, th {
        padding: 1em .5em;
        vertical-align: middle;
        }
        
        td {
        border-right: 1px solid rgba(0,0,0,.1);
        border-bottom: 1px solid rgba(0,0,0,.1);
        background: #fff;
        text-align: center;
        }

        td:nth-child(odd){
            background-color:#eeeeee; 
            font-weight: bold;
        }

        a {
        color: #73685d;
        }
        .btn_wrap1{
            width: 900px;
            text-align: right;
            margin: 20px auto 0 auto;
        }
        .btn_wrap1 input[type=button]{
            width: 70px;
            height: 35px;
            font-size: 14px;
            margin-left: 5px;
            cursor: pointer;
        }
        .btn1{
            background-color: #f6f6f6;
            border: 1px solid #ccc;
        }
        .contents{
            text-align: left;
            padding: 10px;
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
            <div class="title">관리자페이지</div>
            <div class="inner">
                <div>회원관리</div>
                <div>챗봇관리</div>
                <div>데이터관리</div>
                <div>신고 리뷰관리</div>
            </div> 
        </div>
        <div class="right_area">            
            <table class="table1">
                <thead>
                <tr>
                    <th colspan="5">고척돔 주차장후기</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>닉네임</td>
                    <td>두린이</td>
                    <td>작성일</td>
                    <td>2022-07-07</td>
                </tr>
                <tr>
                    <td>시스템별점</td>
                    <td>3.0 ★★★☆☆</td>
                    <td>요금별점</td>
                    <td>2.0 ★★★☆☆</td>
                </tr>
                <tr>
                    <td>조회수</td>
                    <td>22</td>
                    <td>신고수</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td colspan="3" class="contents">주차장이 너무 협소합니다.</td>
                </tr>
                <tr>
                    <td>반려사유</td>
                    <td colspan="3" class="contents">
                      악의적인 신고
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="btn_wrap1">
                <input type="button" class="btn1" value="목록" />
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