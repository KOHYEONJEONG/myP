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
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/main.js"></script>
 <style type="text/css">
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
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 10;
            padding: 0 20px;
        }

        .top{
            /*pic_top 박스와 mypage_top을 감싼 큰 박스 */
            display: flex;
        }
        img {
            /*이미지 크기와 margin*/
            margin-top: 15px;
            width: 80px;
            height: 80px;
            margin-bottom: 20px;
        }
        .pic_top {
            /*사진박스*/
            border: 1px solid #969595;
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
            margin: 8px 0 3px 0;
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
            margin-top: 5px;
            height: 100px;
            background-color: #f5f6f7;
            font-weight: 700;
            border: 1px solid #969595;
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
            background-color: #f5f6f7;
            font-weight: 700;
            border: 1px solid #969595;
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
            border: 1px solid #969595;
            line-height: 50px;
            text-align: center;
            font-size: 14px;
        }
        .info_first > div:nth-child(odd){
            border-right: 0;
            width: 60px;
            font-weight: bold;
        }
        .info_first > div:nth-child(even), .info_second > div:nth-child(even){
            width: 170px;
        }
        .info_first > div:nth-child(2){
            border-right: 0px;
        }
        .info_second > div:nth-child(2){
            border-right: 0px;/*겹치는 선을 없애기 위해서*/
        }

        .info_second >div{
            border: 1px solid #969595;
            border-top: 0;
            line-height: 50px;
            text-align: center;
            font-size: 14px;
        }
        .info_second > div:nth-child(odd){
            border-right: 0;
            width: 60px;
        }
        .mypage_bottom  div, input {
            cursor: pointer;
        }
        
    </style>  
</head>

    
<body>
<c:import url="/header1"></c:import>    
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
                            <div><img src="resources/icons/person3.png" alt="이미지"></div>
                            <div class="input">
                                <input type="file" />
                            </div>
                        </div>  
                        <div class="mypage_top">
                            <div class="my_info">
                                <div class="info_first">
                                    <div>아이디</div>
                                    <div></div>
                                    <div>닉네임</div>
                                    <div></div>
                                </div>
                                <div class="info_second">
                                    <div>경고수</div>
                                    <div></div>
                                    <div>이메일</div>
                                    <div></div>
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
                                <img class="myReviewImg" src="resources/icons/reviewmypage.png">
                                <div class="txt">주차장리뷰</div>
                            </div>
                            <div class="my_btn1 myQna">
                                    <img class="qnaImg" src="resources/icons/qna.png">
                                <div class="txt">
                                    게시글
                                </div>
                            </div>
                            <div class="my_btn1 myResignMembership">
                                <img class="resignMembershipImg" src="resources/icons/logout.png">
                                <div class="txt">회원탈퇴</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </main>
<c:import url="/footer"></c:import>      
</body>

    

</body>
</html>