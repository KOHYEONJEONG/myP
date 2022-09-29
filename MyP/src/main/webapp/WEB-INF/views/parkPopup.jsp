<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        html,
        body {
            margin: 0;
            padding: 0;
        }


        .bg {
            margin-left: 5PX;
            display: inline-block;
            vertical-align: top;
            width: 250px;
            height: 200px;
            background-color: #fff;
            /*hegiht/2*/
            /*width/2*/
            padding: 0 20px;
            border: 1px solid black;
            position: relative;
        }

        .x {
            position: absolute;
            top: 0px;
            right: 0px;
            vertical-align: top;
            padding-right: 5px;
            padding-top: 5px;
        }

        img {
            width: 20px;
            height: 20px;
        }

        input {
            border: 0;
            background: transparent;
            width: 100%;
        }

        .parkName {
            margin-top: 20px;
            width: 200px;
            height: 20px;
            font-size: 14px;
            font-weight: 700;
        }

        .reviewBox,.middleBox,.parkName, .buttonBox {
            display: flex;
            padding: 5px 5px 5px 0;

        }

        .reviewBox>div,.middleBox>div, .parkName{
            padding: 5px;
        }

        .payBox {
            width: 70px;
        }

        .pay {
            font-weight: 700;
            color: red;
            text-align: center;
        }

        .viewDetail {
            font-weight: 700;
            color: blue;
        }

        .boomarkBox,
        .shareBox {
            padding: 5px 10px;
            border: 1px solid #595959;
        }

        .compareBox {
            /*요금비교 상자*/
            margin-left: 10px;
            width: 200px;
        }

        .compareBoxBtn {
            /*요금비교*/
            width: 100%;
            height: 100%;
        }

        input:focus {
            outline: 0;
        }


        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="bg">
        <div class="x">
            <img src="./icons/close.png" alt="">
        </div>

        <div class="title">
            <!--db에서 값을 가져다 넣어야함.-->
            <input value="가산동 공영주차장" class="parkName" readonly>
        </div>

        <div class="reviewBox">
            <div class="reviewTotal">
                <!--리뷰 점수-->
                3.0
            </div>
            <div class="reviewStar">
                <!--예시-->
                ⭐⭐⭐⭐⭐
            </div>
            <div class="reviewCnt">
                <!--해당 주차장에 리뷰갯수-->
                <a href="#">리뷰 n개</a>
            </div>
        </div>

        <div class="middleBox">
            <div class="businessHours">
                <!--운영시간-->
                09:00~24:00
            </div>
            <div class="payBox">
                <!--유료/무료-->
                <input value="유료" class="pay">
            </div>

            <div class="viewDetailBox">
                <!--상세보기-->
                <input value="상세보기" class="viewDetail">
            </div>
        </div>

        <div class="buttonBox">
            <div class="boomarkBox">
                <!--즐겨찾기 버튼(이미지를 클릭하면 공유)-->
                <img src="icons/bookmark.png" id="boomarkBtn" class="boomarkBtn">
            </div>
            <div class="shareBox">
                <!--공유 버튼(이미지를 클릭하면 공유)-->
                <img src="icons/share.png" id="shareBtn" class="shareBtn">
            </div>


            <div class="compareBox">
                <!--요금비교 버튼-->
                <button class="compareBoxBtn">요금비교</button>
            </div>
        </div>
    </div>
</body>
</html>