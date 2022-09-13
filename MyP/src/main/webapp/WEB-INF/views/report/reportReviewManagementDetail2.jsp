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
  <c:import url="/header1"></c:import>
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
      <c:import url="/footer"></c:import>
      <script src="./js/main.js"></script>
</body>
</html>