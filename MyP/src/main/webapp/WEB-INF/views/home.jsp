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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/popup.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"> <!-- 여기 있어야함 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper.css"> <!--추가-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/weather.css"> <!--추가--> 
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script><!--추가-->
  <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script> <!--추가-->
  <script src="${pageContext.request.contextPath}/resources/js/weather.js"></script><!--추가-->
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=e41934107d35da0fcd73a47e8bc1ca9e"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/rety/jquery.raty.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rety/jquery.raty.css">
</head>
<body>
<c:import url="/header"></c:import>
  <main class="main1">
    <div class="left_area">
      <div class="icon_bar">
        <div class="icons first"></div>
        <div class="icons second"></div>
        <div class="icons third"></div>
        <div class="icons fourth"></div>
        <div class="icons fifth"></div>
        <div class="icons sixth"></div>
        <div class="icons end"></div>
      </div>
      <div class="left_section">
        <div class="search_warp on">
          <div class="search_box">
            <div class="box_top">
              <select name="gu">
                <option value="" disabled selected>전체</option>
                <option value="">강남구</option>
              </select>
              <select name="dong">
                <option value="" disabled selected>전체</option>
                <option value="">논현동</option>
              </select>
            </div>
            <div class="box_bottom">
              <input type="text" class="search_txt" placeholder="검색어를 입력하세요" />
              <div class="search_i"></div>
            </div>
          </div>
          <!-- <div class="result_area">
            <div class="result_box">검색결과: 4건</div>
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">언주로 147길 공영주차장</div>
              <div class="parking_info">
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
                <span class="detail">상세보기</span>
              </div>
              <div class="box_inner_i">
                <div class="bookmark_i"></div>
                <div class="share_i"></div>
              </div>
            </div>
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">언주로 147길 공영주차장</div>
              <div class="parking_info">
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
                <span class="detail">상세보기</span>
              </div>
              <div class="box_inner_i">
                <div class="bookmark_i"></div>
                <div class="share_i"></div>
              </div>
            </div>
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">언주로 147길 공영주차장</div>
              <div class="parking_info">
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
                <span class="detail">상세보기</span>
              </div>
              <div class="box_inner_i">
                <div class="bookmark_i"></div>
                <div class="share_i"></div>
              </div>
            </div>
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">언주로 147길 공영주차장</div>
              <div class="parking_info">
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
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
          </div> -->
          <!-- 날씨 -->
          <div class="result_area">
            <div class="side_bar">
              <div class="side_middle">
                  <div class="where">서울시 날씨</div>
                  <div class="day_data">
                      <div class="time_box">
                          <div class="day1">오늘</div>
                          <div class="day2"></div>
                      </div>
                      <div class="icon_box">
                          <div class="icon">아이콘</div>
                          <div class="iconMean">맑음</div>
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
                          <div class="probability2">%</div>
                      </div>
                      <div class="humidityBox">
                          <div class="humidity1">습도</div>
                          <div class="humidity2">%</div>
                      </div>
                      <div class="fineDustBox">
                          <div class="fineDust1">미세먼지</div>
                          <div class="fineDust2">좋음/보통/나쁨</div>
                      </div>
                  </div>
              </div>
              <div class="stitle">주간 예보</div>
              <div class="side_bottom">
                  <div class="swiper mySwiper">
                      <div class="swiper-wrapper">
                      </div>
                      <div class="swiper-button-prev"></div>
                      <div class="swiper-button-next"></div>
                  </div>
              </div>
          </div>
          </div>
        </div>
        <div class="calc_wrap">
          <div class="title">요금 계산</div>
          <div class="select_box">
            <span>이용시간</span>
            <select name="use_time">
              <option value="" disabled selected>전체</option>
              <option value="">30분</option>
              <option value="">1시간</option>
              <option value="">2시간</option>
              <option value="">4시간</option>
              <option value="">종일</option>
            </select>
          </div>
          <div class="result_area">
            <div class="box">
              <div class="close_i"></div>
              <div class="parking_name">가산동 공영주차장</div>
              <div class="parking_info">
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
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
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
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
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
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
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
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
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
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
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
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
                <span class="time">09:00~18:00</span>
                <span class="pay">유료</span>
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
        <div class="distance_wrap">
          <div class="title">최단거리 비교</div>
          <div class="select_box">
            <span>이용시간</span>
            <select name="use_time">
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
        <!-- <div class="bookmark_wrap">
          <div class="title">즐겨찾기</div>
          <div class="result_area">
            <div class="file">
              <div class="file_i"></div>
              <div class="file_txt">주차장</div>
            </div>
            <div class="file">
              <div class="file_i"></div>
              <div class="file_txt">맛집</div>
            </div>
            <div class="file">
              <div class="file_i"></div>
              <div class="file_txt">문화생활</div>
            </div>
            <div class="file">
              <div class="file_i"></div>
              <div class="file_txt">주유소</div>
            </div>
          </div>
        </div> -->
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
              <select name="gu">
                <option value="" disabled selected>전체</option>
                <option value="">강남구</option>
              </select>
              <select name="dong">
                <option value="" disabled selected>전체</option>
                <option value="">논현동</option>
              </select>
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
    </div>
  </main>
<c:import url="/footer"></c:import>

 
 
<!-- 챗봇-->
<div class="chatbot_wrap">
  <img src="${pageContext.request.contextPath}/resources/icons/chatrobot.svg" alt="" class="chatrobot">
  <div class="chatbot">
    <div class="header">나만의 P 챗봇</div>
    <div class="contents">
        <div class="response">
            <div class="icons">
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
            <div class="icons">
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
            <div class="icons">
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
   <!-- 리뷰 팝업 -->
<!-- 리뷰 팝업 -->
<div id="review_popup">
  <div class="close_i">
      <img src="${pageContext.request.contextPath}/resources/icons/close.png" alt="">
  </div>
  <div class="popup_top">
      <div class="txt_title">제목</div>
      <input type="text" class="title" maxlength="30">
  </div>

  <div class="popup_middle">
      <div class="txt_title">별점을 선택해주세요.</div>
      <div class="star_wrap">
        <div class="group1"><시스템 별점></div>
      
        <div class="star1">
          <div class="cctv_wrap">
              <div class="wrap_title">CCTV</div>
              <div class="starstar"></div>
          </div>
          <div class="env_wrap">
              <div class="wrap_title">환경</div>
              <div class="starstar"></div>
          </div>
        </div>

        <div class="group2"><요금 별점></div>
        <div class="star2">
            <div class="amo_wrap">
                <div class="wrap_title">요금</div>
                <div class="starstar"></div>
            </div>
            <div class="ticket_wrap">
                <div class="wrap_title">정기권</div>
                <div class="starstar"></div>
            </div>
            <div class="sale_wrap">
                <div class="wrap_title">할인정보</div>
                <div class="starstar"></div>
            </div>
        </div>
        <script type="text/javascript">
          $(function() {
              $('.starstar').raty({
  //                score: 3,
                  path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images",
                  half : true,
                  hints :  [['bad 1/2', 'bad'], ['poor 1/2', 'poor'], ['regular 1/2', 'regular'], ['good 1/2', 'good'], ['gorgeous 1/2', 'gorgeous']]
                  ,width : 200
                  ,click: function(score, evt) {//선택한 별점수가
                  }
              });
          });
      </script>
      </div><!--star_wrap-->
  </div>
    <div class="popup_content">
        <div class="txt_title">내용을 입력해주세요.</div>
        <textarea cols="" rows="" class="contents"></textarea>
    </div>
    <div class="sendBtn_wrap">
        <input type="button" value="등록" id="sendBtn">
    </div>
</div>
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
    var container = document.getElementById('map');
    var options = {
      center: new kakao.maps.LatLng(33.450701, 126.570667),
      level: 3
    };

    var map = new kakao.maps.Map(container, options);
  </script>
  
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>

</html>