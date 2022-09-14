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
        .contents{
            position: absolute;
            top: 55%;
            left: 50%;
            transform: translate(-50%, -50%);            
            z-index: 2;  
            width: 800px;
        }
        .right_area .title{
            width: 60%;
            margin: 10px 0px;
            padding-left: 10px;
            font-size: 30px;
        }
        .right_area .notice{
            margin: 5px 0px;
            width: 800px; 
            height:35px;
            display:flex;
            justify-content: space-between;
            line-height: 35px;
            
        }
        .notice_right{
            padding-right: 20px;
            display: flex;
        }
        .notice_right > div:nth-child(1){
            margin-right: 20px;
        }
        .notice_left{
            color: #000;
            width: 500px;
            padding-left: 20px;
        }
        .content{
            height: 400px;
            padding: 20px;
            box-sizing: border-box;
        }
        .answer {
            display: flex;
            margin: 8px 0;
            height: 100px;
        }
        .answer .txt{
            padding: 10px 0 0 20px;
            width: 40px;
        }
        .answer_txt{
            width: 700px;
            background-color: #ffffff;
            border: solid 1px #595959;
            border-radius: 10px;
            margin-right: 20px;
            outline-color: #000;
            padding: 10px;
            box-sizing: border-box;
        }
        .btn_wrap{
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
            width: 800px;
        }
        .btn{
            width: 75px;
            height: 40px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn.list{
            margin-right: 10px;
            background-color:#f6f6f6;
            border: 1px solid #ccc;
            /* background: linear-gradient(to bottom, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%); */
        }
        .btn.regi{
            border:solid 1px #00af80;
            background-color:#00af80;
            color: #fff;
        }

    


    
    </style>
    <script src="./jquery/jquery-1.12.4.js"></script>
     <script src="./js/main.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
  <c:import url="/header1"></c:import>
      <main>
        <div class="main_wrap">
            <div class="side_bar">
                <div class="title">참여/알림</div>
                <div class="inner">
                    <div>공지사항</div>
                    <div>FAQ</div>
                    <div class="on">QnA</div>
                </div> 
            </div>
            <div class="right_area">      
                <div class="contents">
                    <div class="title">QnA</div>
                    <hr>
                    <div class="notice">
                        <div class="notice_left">
                            <span class="i"></span>
                            <span>${data.TITLE}</span>
                        </div>
                        <div class="notice_right">
                            <div>작성일 : ${data.DT}</div>
                            <div>조회수:${data.HIT}</div>
                        </div>
                    </div>
                    <hr>
                    <div class="content">
                        ${data.CON}
                         ${data.ADT}
                    </div>
                 <hr>
                 <div class="answer">
                    <div class="txt">답변</div>
                    <textarea class="answer_txt"></textarea>
                </div>
                <hr>
                <div class="btn_wrap">
                    <input type="button" value="목록" class="btn list">
                    <input type="button" value="등록" class="btn regi">
                </div>
            </div>
        </div>
</div>
</main>
<c:import url="/footer"></c:import>
</body>
</html>