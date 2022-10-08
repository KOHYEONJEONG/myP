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
<link rel="stylesheet" href="resources/css/popup.css">
<link rel="stylesheet" href="resources/css/font.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"> <!-- 여기 있어야함 -->
<link rel="stylesheet" href="resources/css/swiper.css"> <!--추가-->
<link rel="stylesheet" href="resources/css/weather.css"> <!--추가--> 
<script type="text/javascript" src="resources/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="resources/js/weather.js"></script><!--추가-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script> <!--추가-->
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=e41934107d35da0fcd73a47e8bc1ca9e&libraries=services"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<style>
  .result_area2 {
  width: 100%;
  height: calc(100% - 190px);
  overflow-y: auto;
  overflow-x: hidden;
  }
  
  .left_section .result_area2 .box {
    width: 90%;
    height: 100px;
    background: #fff;
    border-radius: 15px;
    margin: 15px 5% 0px 5%;
    border: 1px solid #000;
    padding: 15px 10px 15px 20px;
    box-sizing: border-box;
    position: relative;
    cursor: pointer;
    overflow: hidden;
    font-size: 17px;
}
	.left_section .result_area2 .box .pay {
  color: #e06666;
  font-weight: bold;
  font-size: 12px;
}
	.left_section .result_area2 .box .detail {
  color: #4285f4;
  font-weight: bold;
  font-size: 12px;
}  
  .left_section .result_area2 .result_box {
    height: 40px;
    background: #fff;
    text-align: right;
    line-height: 40px;
    border-top: 1px solid #000;
    border-bottom: 1px solid #000;
    padding-right: 20px;
    font-size: 14px;
}

.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

.left_section .result_area2 .box .box_inner_i {
  position: absolute;
  bottom: 8px;
  right: 20px;
  display: flex;
}
.left_section .result_area2 .box .bookmark_i {
  background: url(resources/icons/bookmark.png) no-repeat;
  background-size: 60%;
  background-position: 50%;
  width: 30px;
  height: 30px;
  float: left;
}
.left_section .result_area2 .box .share_i {
  background: url(resources/icons/share.png) no-repeat;
  background-size: 60%;
  background-position: 50%;
  width: 30px;
  height: 30px;
}
.movies{
	filter: invert(1);
}





.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {font-size: 16px;float:left;list-style: none;width:100px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #ffe6e6;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}

		
        .bg {
            width: 250px;
            background-color: #fff;
            padding: 20px;
            position: relative;
        }

        .bg img {
            width: 20px;
            height: 20px;
        }

      /*   input {
            border: 0;
            background: transparent;
            width: 100%;
        }
 */
        .bg .title {
            width: 200px;
            height: 20px;
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 3px;
        }

        .reviewBox,.middleBox,.parkName, .buttonBox {
            display: flex;
            padding: 5px 0px 0px 0;
            font-size: 14px;

        }

        .reviewBox>div,.middleBox>div, .parkName{
            padding: 5px;
        }
        
        .phone, .address {
         	font-size: 12px;
         	margin-bottom: 3px;
        }
        .phone{
        	color: #028f69;
        }
        
         .phone2, .address {
         	font-size: 12px;
         	margin-bottom: 3px;
        }
        .phone2{
        	color: #028f69;
        }

        .payBox {
            width: 70px;
        }

        .pay {
            font-weight: 700;
            color: red;
            text-align: center;
        }
		.detail {
            font-weight: 700;
            color: blue;
            text-align: center;
        }
        .viewDetail {
            font-weight: 700;
            color: blue;
        }

        .bookmarkBox,
        .shareBox {
            padding: 5px 10px;
            border: 1px solid #595959;
        }
        
        .bookmarkBox {
         border-right: 0px;
         }

        .compareBox {
            /*요금비교 상자*/
            margin-left: 10px;
            width: 200px;
            font-size: 12px;
        }

        .compareBoxBtn {
            /*요금비교*/
            width: 100%;
            height: 100%;
            line-height: 12px;
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
<c:import url="/header"></c:import>

<form action="#" id="goForm" method="post">
	<!-- 상세보기 페이지로 이동하려고 -->
	<input type="hidden" id="car_num" name="car_num">
</form>

  <main class="main1">
    <div class="left_area">
      <div class="icon_bar">
        <div class="icons on">
          <div class="first"></div>
        </div>
        <div class="icons">
          <div class="second"></div>
        </div>
        <div class="icons">
          <div class="third"></div>
        </div>
        <div class="icons">
          <div class="fourth"></div>
        </div>
        <div class="icons">
          <div class="fifth"></div>
        </div>
        <div class="icons">
          <div class="sixth"></div>
        </div>
        <div class="icons">
          <div class="end on"></div>
        </div>
      </div>
        <form action="#" id="actionForm" method="post">
      <div class="left_section">
        <div class="search_warp on">
          <div class="search_box">
            <div class="box_top">
          
              <select name="sido1" id="sido1">
              
              </select>
              <select name="gugun1" id="gugun1">
              </select>
            
            </div>
            <div class="box_bottom">
              <input type="text" class="search_txt" id= "search_txt" name= "search_txt" placeholder="검색어를 입력하세요" />
              <div class="search_i" id= "search_i" ></div>
               
            </div>
          </div>
          </form> 
          <!-- 날씨 -->
          <div class="result_area2">
            <div class="side_bar">
              <div class="side_middle">
                  <div class="where">서울시 날씨</div>
                  <div class="day_data">
                      <div class="time_box">
                          <div class="day1">오늘</div>
                          <div class="day2"></div>
                      </div>
                      <div class="icon_box">
                          <div class="icon"></div>
                          <div class="iconMean"></div>
                      </div>
                      <div class="temp_box">
                          <div class="temp_min" style="color: #3172e7;"></div>
                          <span class="solidus" style="color: #ccc">/</span>               
                          <div class="temp_max" style="color: #cd3534;"></div>               
                          
                      </div>
                      
                  </div>
                  <div class="middle_box">
                      <div class="probabilityBox">
                          <div class="probability1">강수확률</div>
                          <div class="probability2"></div>
                      </div>
                      <div class="humidityBox">
                          <div class="humidity1">습도</div>
                          <div class="humidity2"></div>
                      </div>
                      <div class="fineDustBox">
                          <div class="fineDust1">미세먼지</div>
                          <div class="fineDust2"></div>
                      </div>
                  </div>
              </div>
              <div class="stitle">주간 예보</div>
              <div class="side_bottom">
                  <div class="swiper mySwiper">
                      <div class="swiper-wrapper"></div>
                      <div class="swiper-button-prev"></div>
                      <div class="swiper-button-next"></div>
                  </div>
              </div>
          </div>
          </div>
        </div>
        
        <!-- 요금계산 사이드 -->
        <div class="calc_wrap">
         	<c:import url="/calc_wrap"/>
        </div>
        
        
        <div class="distance_wrap">
          <div class="title">최단거리 비교</div>
          <div class="select_box">
            <span>이용시간</span>
            <select name="use_time" id="use_time">
              <option value="" disabled selected>전체</option>
              <option value="">30분</option>
              <option value="">1시간</option>
              <option value="">2시간</option>
              <option value="">4시간</option>
              <option value="">종일</option>
            </select>
          </div>
          <div class="result_area">
            <div class="standard">노브랜드 가산디지털단지 기준</div>
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">가산동 공영주차장</div>
              <div class="parking_info">
                <span class="km">200m</span>
                <span class="detail">상세보기</span>
              </div>
              <div class="box_inner_i">
                <div class="bookmark_i"></div>
                <div class="share_i"></div>
              </div>
            </div>
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">가산동 공영주차장</div>
              <div class="parking_info">
                <span class="km">300m</span>
                <span class="detail">상세보기</span>
              </div>
              <div class="box_inner_i">
                <div class="bookmark_i"></div>
                <div class="share_i"></div>
              </div>
            </div>
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">가산동 공영주차장</div>
              <div class="parking_info">
                <span class="km">400m</span>
                <span class="detail">상세보기</span>
              </div>
              <div class="box_inner_i">
                <div class="bookmark_i"></div>
                <div class="share_i"></div>
              </div>
            </div>
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">가산동 공영주차장</div>
              <div class="parking_info">
                <span class="km">800m</span>
                <span class="detail">상세보기</span>
              </div>
              <div class="box_inner_i">
                <div class="bookmark_i"></div>
                <div class="share_i"></div>
              </div>
            </div>
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">가산동 공영주차장</div>
              <div class="parking_info">
                <span class="km">1km</span>
                <span class="detail">상세보기</span>
              </div>
              <div class="box_inner_i">
                <div class="bookmark_i"></div>
                <div class="share_i"></div>
              </div>
            </div>
          </div>
          <div class="btn_wrap">
            <input type="button" class="bottom_btn" value="요금 비교" />
          </div>
        </div>
      
        <div class="bookmark_wrap">
          <div class="title p40">주차장</div>
          <div class="result_area">
            <div class="box add">
              <div class="close_i"></div>
                <div class="content">
                  <div class="park_img"></div>
                  <div class="main"> 
                    <div class="parking_name">가산동 공영주차장</div>
                    <div class="parking_info">
                      <div class="time">09:00~18:00</div>
                      <div class="detail mt8">상세보기</div>
                    </div>
                  </div>
                </div>
              </div>
            <div class="box add">
              <div class="close_i"></div>
                <div class="content">
                  <div class="park_img"></div>
                  <div class="main"> 
                    <div class="parking_name">가산동 공영주차장</div>
                    <div class="parking_info">
                      <div class="time">09:00~18:00</div>
                      <div class="detail mt8">상세보기</div>
                    </div>
                  </div>
                </div>
              </div>
            <div class="box add">
              <div class="close_i"></div>
                <div class="content">
                  <div class="park_img"></div>
                  <div class="main"> 
                    <div class="parking_name">가산동 공영주차장</div>
                    <div class="parking_info">
                      <div class="time">09:00~18:00</div>
                      <div class="detail mt8">상세보기</div>
                    </div>
                  </div>
                </div>
              </div>
            <div class="box add">
              <div class="close_i"></div>
                <div class="content">
                  <div class="park_img"></div>
                  <div class="main"> 
                    <div class="parking_name">가산동 공영주차장</div>
                    <div class="parking_info">
                      <div class="time">09:00~18:00</div>
                      <div class="detail mt8">상세보기</div>
                    </div>
                  </div>
                </div>
              </div>
            <div class="box add">
              <div class="close_i"></div>
                <div class="content">
                  <div class="park_img"></div>
                  <div class="main"> 
                    <div class="parking_name">가산동 공영주차장</div>
                    <div class="parking_info">
                      <div class="time">09:00~18:00</div>
                      <div class="detail mt8">상세보기</div>
                    </div>
                  </div>
                </div>
              </div>       
          </div>
      </div>
        <div class="review_wrap">
          <div class="title">리뷰</div>
          <div class="select_box">
          <select>
              <option value="">높은별점순</option>
              <option value="">최신순</option>
            </select>
          </div>
          <div class="result_area">
            <div class="standard">가산동 공영 주차장</div>
            <div class="box pr40">
              <div class="nickname">머순</div>
              <div class="line">
                <div class="stars">
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                </div>
                <div class="date">2022-07-26</div>
              </div>
              <div class="review_title">
                <span>제목 :</span>
                <span>가산동 공영 주차장 굿!</span>
              </div>
              <div class="review_contents">
                <span>내용 :</span>
                <span>깔끔하니 좋아요, 또 방문할것 같습니다!</span>
              </div>
              <div class="box_inner_i">
                <div class="warning_i"></div>
              </div>
            </div>
            <div class="box pr40">
              <div class="nickname">머순</div>
              <div class="line">
                <div class="stars">
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                </div>
                <div class="date">2022-07-26</div>
              </div>
              <div class="review_title">
                <span>제목 :</span>
                <span>가산동 공영 주차장 굿!</span>
              </div>
              <div class="review_contents">
                <span>내용 :</span>
                <span>깔끔하니 좋아요</span>
              </div>
              <div class="box_inner_i">
                <div class="warning_i"></div>
              </div>
            </div>
            <div class="box pr40">
              <div class="nickname">머순</div>
              <div class="line">
                <div class="stars">
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                </div>
                <div class="date">2022-07-26</div>
              </div>
              <div class="review_title">
                <span>제목 :</span>
                <span>가산동 공영 주차장 굿!</span>
              </div>
              <div class="review_contents">
                <span>내용 :</span>
                <span>깔끔하니 좋아요</span>
              </div>
              <div class="box_inner_i">
                <div class="warning_i"></div>
              </div>
            </div>
            <div class="box pr40">
              <div class="nickname">머순</div>
              <div class="line">
                <div class="stars">
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                </div>
                <div class="date">2022-07-26</div>
              </div>
              <div class="review_title">
                <span>제목 :</span>
                <span>가산동 공영 주차장 굿!</span>
              </div>
              <div class="review_contents">
                <span>내용 :</span>
                <span>깔끔하니 좋아요</span>
              </div>
              <div class="box_inner_i">
                <div class="warning_i"></div>
              </div>
            </div>
            <div class="box pr40">
              <div class="nickname">머순</div>
              <div class="line">
                <div class="stars">
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                  <div class="star_i"></div>
                </div>
                <div class="date">2022-07-26</div>
              </div>
              <div class="review_title">
                <span>제목 :</span>
                <span>가산동 공영 주차장 굿!</span>
              </div>
              <div class="review_contents">
                <span>내용 :</span>
                <span>깔끔하니 좋아요</span>
              </div>
              <div class="box_inner_i">
                <div class="warning_i"></div>
              </div>
            </div>
            
          </div>
          <div class="btn_wrap">
            <input type="button" class="bottom_btn review_btn" value="글쓰기" />
          </div>
        </div>
        <div class="accident_wrap">
          <div class="search_box">
            <div class="box_top">
          
              <select name="sido1" id="sido1"></select>
              
              <select name="gugun1" id="gugun1"></select>
             
            </div>
            <div class="box_bottom">
              <input type="text" class="search_txt" placeholder="검색어를 입력하세요" />
              <div class="search_i"></div>
            </div>
          </div>
          <div class="result_area">
            <div class="result_box">검색결과: 4건</div>
            <div class="box">
              <div class="accident_title">목동로 교통사고</div>
              <div class="accident_period">2022-07-01 15:42 ~ 2022-07-01 16:30</div>
              <div class="accident_info">
                구로중앙로 오금교동측 -> 서층방향 1,2차로 교통사고, 일부 구간 통제
              </div>
            </div>
            <div class="box">
              <div class="accident_title">목동로 교통사고</div>
              <div class="accident_period">2022-07-01 15:42 ~ 2022-07-01 16:30</div>
              <div class="accident_info">
                구로중앙로 오금교동측 -> 서층방향 1,2차로 교통사고, 일부 구간 통제
              </div>
            </div>
            <div class="box">
              <div class="accident_title">목동로 교통사고</div>
              <div class="accident_period">2022-07-01 15:42 ~ 2022-07-01 16:30</div>
              <div class="accident_info">
                구로중앙로 오금교동측 -> 서층방향 1,2차로 교통사고, 일부 구간 통제
              </div>
            </div>
            <div class="box">
              <div class="accident_title">목동로 교통사고</div>
              <div class="accident_period">2022-07-01 15:42 ~ 2022-07-01 16:30</div>
              <div class="accident_info">
                구로중앙로 오금교동측 -> 서층방향 1,2차로 교통사고, 일부 구간 통제
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="right_area1">
      <div id="map"></div>
      <ul id="category">
        <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            은행
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            마트
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            약국
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            주유소
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li>      
    </ul>
    </div>
  </main>
<c:import url="/footer"></c:import>
 
<!-- 요금표 팝업창 -->
<div id="feeTablePopup" class="feeTablePopup" style="display: block;">
	<div class="close_i">
      		<img src="${pageContext.request.contextPath}/resources/icons/close.png" alt="">
   	</div>
 
	<table>
        <colgroup>
     	   <col width="200">
     	   <col width="150">
        </colgroup>
   
   	    <caption>금액표</caption>
   	
   	    <tbody>
    	</tbody>
    </table>
</div>  <!-- 요금표 팝업창 --> 
 
<!-- 가이드(챗봇 아님)-->
<c:import url="/guideMain"/>

<!-- 리뷰 팝업 -->
<c:import url="/reviewPopup2"/>

<!-- 신고하기 팝업 -->
<div id="warning_popup">
  <form>
      <div class="close_i">
          <img src="${pageContext.request.contextPath}/resources/icons/close.png" alt="">
      </div>
      <div class="popup_top">
          <div class="title">제목</div>
          <div class="input">
              <input type="text" class="txt_title" readonly>
          </div>
      </div>
      <div class="popup_middle">
          <div class="writer">작성자</div>
          <div class="input">
              <input type="text" class="txt_writer" readonly>
          </div>
      </div>
      <hr/>
      <div class="popup_content">
          <div class="note">※여러사유에 해당하는 경우 대표적인 사유 1개만 골라주세요.</div>
          <div class="choice_label"> <사유선택> </div>
          <div>
              <input type="radio" name="selete" value="1" checked>
              <label>부적절한 홍보 게시글</label>
          </div>
          <div>
              <input type="radio" name="selete" value="2" checked>
              <label>음란성 및 청소년에게 부적절한 게시글</label>
          </div>
          <div>
              <input type="radio" name="selete" value="3" checked>
              <label>명예훼손/사생활 침해 및 저작권침해 등</label>
          </div>
      </div>
      <hr/>
      <div class="warningBtn_wrap" style="text-align: center">
          <input type="button" value="신고" id="warningBtn">
      </div>
  </form>
</div>
  
  <script>
  
	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	 mapOption = { 
			 //33.450701, 126.570667 
	  center: new kakao.maps.LatLng(37.586769, 126.974779), // 지도의 중심좌표
	     level: 3 // 지도의 확대 레벨
	 };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  </script>
  

</body>

</html>