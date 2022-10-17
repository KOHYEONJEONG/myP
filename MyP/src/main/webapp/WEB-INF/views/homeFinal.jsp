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
  <link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script><!--추가-->
  <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script> <!--추가-->
  <script src="resources/js/weather.js"></script><!--추가-->
  <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=e41934107d35da0fcd73a47e8bc1ca9e&libraries=services"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script src="resources/js/main.js"></script>
  <script src="resources/js/header.js"></script>
  <script type="text/javascript" src="resources/rety/jquery.raty.js"></script>
  <link rel="stylesheet" href="resources/rety/jquery.raty.css">
  <script type="text/javascript" 
		src="resources/script/common/popup.js"></script>
  <script type="text/javascript" src="resources/js/proj4.js"></script>
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

.map_wrap, .map_wrap * {
	margin:0; 
	padding:0;
	font-family:'Malgun Gothic',dotum,'돋움',sans-serif;
	font-size:12px;
}
.map_wrap {
	position:relative;
	width:100%;
	height:350px;
}
#category {
	position:absolute;
	top:10px;
	left:10px;
	border-radius: 5px;
	border:1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}
#category li {
	font-size: 16px;
	float:left;
	list-style: none;
	width:100px;
	border-right:1px solid #acacac;
	padding:6px 0;
	text-align: center;
	cursor: pointer;
}
#category li.on {
	background: #ffe6e6;
}
#category li:hover {
	background: #ffe6e6;
	border-left:1px solid #acacac;
	margin-left: -1px;
}
#category li:last-child{
	margin-right:0;
	border-right:0;
}
#category li span {
	display: block;
	margin:0 auto 3px;
	width:27px;
	height: 28px;
}

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
   
   .accident_wrap .result_area{
   	height: 100% !important;
   }

 /* 팝업CSS */
  .bg .title {
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
      color: #e06666;
      text-align: center;
      font-size: 12px
  }

  .detail, .viewDetail {
      font-weight: 700;
      color: #4285f4;
      font-size: 12px
  }

  .bookmarkBox,
  .shareBox {
      padding: 5px 10px;
      border: 1px solid #595959;
      cursor: pointer;
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
      cursor: pointer;
  }

  input:focus {
      outline: 0;
  }


  a {
      text-decoration: none;
  }
  

</style>
<script type="text/javascript">
 
  const grs80 = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=0,0,0,0,0,0,0";
  const wgs84 = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs";
  var logx = [];
  var logy = [];
  var title = [];
  var markers = new Array();
  var feeComArray  = [];
  var feeSort = [];
  var mapContainer = null;
  var map = null;
  
  $(document).ready(function() {
	   
	  mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	  mapOption = { 
	   center: new kakao.maps.LatLng(37.5642135, 127.0016985), // 지도의 중심좌표, 서울로맞춰놓음
	      level: 3 // 지도의 확대 레벨
	  };

	  map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	  
	  cultureBookmarkReloadList();
	  cinemaBookmarkReloadList();
	  gasstationBookmarkReloadList();
	  restaurantBookmarkReloadList();
	  parkingBookmarkReloadList();
	  
	  $("#cultrueBookmark").click(function () {
          $(".cultrue_bookmark_wrap").addClass("on");
          $(".cultrue_bookmark_wrap").siblings().removeClass("on");  
      })
 
      $("#gasstationBookmark").click(function () {
          $(".gasstation_bookmark_wrap").addClass("on");
          $(".gasstation_bookmark_wrap").siblings().removeClass("on");  
      })
       $("#parkingBookmark").click(function () {
          $(".parking_bookmark_wrap").addClass("on");
          $(".parking_bookmark_wrap").siblings().removeClass("on");  
      })
       $("#restaurantBookmark").click(function () {
          $(".restaurant_bookmark_wrap").addClass("on");
          $(".restaurant_bookmark_wrap").siblings().removeClass("on");  
      })      
       $("#cinemaBookmark").click(function () {
          $(".cinema_bookmark_wrap").addClass("on");
          $(".cinema_bookmark_wrap").siblings().removeClass("on");  
      })

	  var area0 = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	  var area1 = ["전체","개포동","논현동","도곡동","대치동","삼성동","수서동","신사동","세곡동","압구정동","역삼동","율현동","일원동","자곡동","청담동"];
	   var area2 = ["전체","강일동","고덕동","길동","둔촌동","명일동","상일동","성내동","암사동","천호동"];
	   var area3 = ["전체","미아동","번동","수유동","우이동"];
	   var area4 = ["전체","가양동","개화동","공항동","과해동","내발산동","등촌동","마곡동","방화동","염창동","오곡동","오쇠동","외발산동","화곡동"];
	   var area5 = ["전체","남현동","봉천동","신림동"];
	   var area6 = ["전체","광장동","구의동","군자동","능동","자양동","중곡동","화양동"];
	   var area7 = ["전체","가리봉동","개봉동","고척동","구로동","궁동","신도림동","오류동","온수동","천왕동","항동"];
	   var area8 = ["전체","가산동","독산동","시흥동"];
	   var area9 = ["전체","공릉동","상계동","월계동","중계동","하계동"];
	   var area10 = ["전체","도봉동","방학동","쌍문동","창동"];
	   var area11 = ["전체","답십리동","신설동","용두동","이문동","장안동","전농동","제기동","청량리동","회기동","휘경동"];
	   var area12 = ["전체","노량진동","대방동","동작동","본동","사당동","상도동","제기동","신대방동","흑석동"];
	   var area13 = ["전체","공덕동","구수동","노고산동","당인동","대흥동","도화동","동교동","마포동","망원동","상수동","상암동","서교동","성산동","신공덕동","신수동","신정동","아현동","연남동","염리동","용강동","중동","창전동","토정동","하중동","합정동","현석동"];
	   var area14 = ["전체","남가좌제1동","남가좌제2동","북가좌제1동","북가좌제2동","북아현동","신촌동","연희동","천연동","충현동","홍은제1동","홍은제2동","홍제제1동","홍제제2동","홍제제3동"];
	   var area15 = ["전체","내곡동","반포동","방배동","서초동","신원동","양재동","우면동","염곡동","원지동","잠원동"];
	   var area16 = ["전체","금호동1가","금호동2가","금호동3가","금호동4가","도선동","마장동","사근동","상왕십리동","성수동1가","성수동2가","송정동","옥수동","용답동","응봉동","하왕십리동","홍익동","행당동"];
	   var area17 = ["전체","길음제1동","길음제2동","돈암제1동","돈암제2동","동선동","보문동","삼선동","석관동","성북동","안암동","월곡제1동","월곡제2동","장위제1동","장위제2동","장위제3동","정릉제1동","정릉제2동","정릉제3동","정릉제4동","종암동"];
	   var area18 = ["전체","가락동","거여동","마천동","문정동","방이동","삼전동","석촌동","송파동","신천동","오금동","장지동","잠실동","풍납동"];
	   var area19 = ["전체","목동","신월동","신정동"];
	   var area20 = ["전체","당산제1동","당산제2동","대림제1동","대림제2동","대림제3동","도림동","문래동","신길제1동","신길제3동","신길제4동","신길제5동","신길제6동","신길제7동","양평제1동","양평제2동","여의도","영등포동","영등포본동"];
	   var area21 = ["전체","남영동","보광동","서빙고동","용문동","용산2가동","원효로제1동","원효로제2동","이촌제1동","이촌제2동","이태원제1동","이태원제2동","청파동","한강로동","한남동","효창동","후암동"];
	   var area22 = ["전체","갈현동","구산동","녹번동","대조동","불광동","수색동","신사동","역촌동","응암동","증산동","진관동"];
	   var area23 = ["전체","가희동","교남동","무악동","부암동","사직동","삼청동","숭인제1동","숭인제2동","이화동","종로1.2.3.4가동","종로5.6가동","창신제1동","창신제2동","창신제3동","청운효자동","평창동","혜화동"];
	   var area24 = ["전체","광희동","다산동","동화동","명동","소공동","신당동","신당5동","약수동","을지로동","장충동","중림동","청구동","필동","황학동","회현동"];
	   var area25 = ["전체","망우동","면목동","묵동","상봉동","신내동","중화동"];
	   
		// 시/도 선택 박스 초기화
	   
	   $("select[name^=sido]").each(function() {
		   $selsido = $(this);
		   $.each(eval(area0), function() {
		    $selsido.append("<option value='"+this+"'>"+this+"</option>");
		   });
		   $selsido.next().append("<option value=''>동</option>");
		  });

		  
		  // 시/도 선택시 구/군 설정
		$("select[name^=sido]").change(function() {
		   var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		   var $gugun = $(this).next(); // 선택영역 군구 객체
		   $("option",$gugun).remove(); // 구군 초기화
		   if(area == "area0")
		    $gugun.append("<option value=''>동</option>");
		   else {
		    $.each(eval(area), function() {
		     $gugun.append("<option value='"+this+"'>"+this+"</option>");
		    });
		   }
		  });

		  
		 //팝업 창 안에 있는 신고 버튼
		  $("#warningBtn").on("click", function() {
			  var params = $("#actionForm2").serialize();
		         $.ajax({
		        	 url : "HomeAction/insert",
		            type : "POST",
		            dataType : "json", 
		            data : params, 
		            success : function(res) { 
						switch(res.msg){
						 case "success":
							  makeAlert("알림","신고에 성공하였습니다.");
							  $("#warning_popup").hide();
							  break;
						  case "fail":
							  makeAlert("알림","신고에 실패하였습니다.");
							  break;
						}
		            },
		            error : function(request, status, error) {
		               console.log(request.responseText); 
		            }
		            
		         }); 
		  });
		 
		  $("#selectx").change(function(){  
			  reviewReload();
		  })
		  
		  $("body").on("click", ".phone2", function(){//리뷰 버튼
				 $("#carparknum").val($(this).attr("no"));
				 $("#car_park_nm").html($(this).attr("nm"));
				 reviewReload();
		});
		 
		$("#search_i").on("click", function(){//검색 버튼
			  $("#time_rate").val(0);
				mapReload();
	  	});
		  
		// 문화생활 카테고리 지도에 마커
		$("#culture").on("click", function(){
			$("#shortDistanceArea").html('');
			
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
			
			if($("#sido1").val() == "전체" || $("#sido1").val() == "구" || $("#gugun1").val() == "동" || $("#gugun1").val() == "전체" ){
				makePopup({
			         title : "알림",
			         contents : "구와 동을 선택해주세요",
			         buttons : [{
			            name : "확인",
			         }]
				});
				$("#culture").removeClass('on');
			} else {
				
				var params = $("#actionForm").serialize();
				$.ajax({
					url : "cultureAjax",
					type : "POST",
					dataType: "json",
					data: params,
					success : function(res){
						cultureList(res.list);
					},
					error : function(request, status, error) { 
						console.log(request.responseText); 
					}
				})
			}	
		});
		
		//  주유소 카테고리 지도에 마커
		$("#gasStation").on("click", function(){
			$("#shortDistanceArea").html('');
			
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
			
			if($("#sido1").val() == "전체" || $("#sido1").val() == "구" || $("#gugun1").val() == "동" || $("#gugun1").val() == "전체"){
				makePopup({
			         title : "알림",
			         contents : "구와 동을 선택해주세요",
			         buttons : [{
			            name : "확인",
			         }]
				});
				$("#gasStation").removeClass('on');
			} else {
				var params = $("#actionForm").serialize();
				$.ajax({
					url : "gasStationAjax",
					type : "POST",
					dataType: "json",
					data: params,
					success : function(res){
						gasStationList(res.list);
					},
					error : function(request, status, error) { 
						console.log(request.responseText); 
					}
				})
			}
		});
		
		
		// 음식점 카테고리 지도에 마커
		$("#restaurant").on("click", function(){
			$("#shortDistanceArea").html('');
			
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
			
			if($("#sido1").val() == "전체" || $("#sido1").val() == "구" || $("#gugun1").val() == "동" || $("#gugun1").val() == "전체" ){
				makePopup({
			         title : "알림",
			         contents : "구와 동을 선택해주세요",
			         buttons : [{
			            name : "확인",
			         }]
				});
				$("#restaurant").removeClass('on');
			} else {
				var params = $("#actionForm").serialize();
				$.ajax({
					url : "restaurantAjax",
					type : "POST",
					dataType: "json",
					data: params,
					success : function(res){
						restaurantList(res.list);
					},
					error : function(request, status, error) { 
						console.log(request.responseText); 
					}
				})
			}
		});
		

		// 영화관 카테고리 지도에 마커
		$("#cinema").on("click", function(){
			$("#shortDistanceArea").html(''); //다시 검색했을때 최단거리 기록 지워짐
			
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
			
			if($("#sido1").val() == "전체" || $("#sido1").val() == "구" || $("#gugun1").val() == "동" || $("#gugun1").val() == "전체"){
				makePopup({
			         title : "알림",
			         contents : "구와 동을 선택해주세요",
			         buttons : [{
			            name : "확인",
			         }]
				});
				$("#cinema").removeClass('on');
			} else {
				var params = $("#actionForm").serialize();
				$.ajax({
					url : "cinemaAjax",
					type : "POST",
					dataType: "json",
					data: params,
					success : function(res){
						cinemaList(res.list);
					},
					error : function(request, status, error) { 
					}
				})
			}	

		});

		// 지도 인포윈도우에서 즐겨찾기 아이콘 클릭시, 즐겨찾기 폴더에 삽입, 삭제
		$("body").on("click", ".bookmarkBox", function() {
			// 로그인 안된상태,
			if($("#mem_num").val() == ""){ // 헤더에서 세션정보 가지고 있음
				makePopup({
			         title : "알림",
			         contents : "즐겨찾기 메뉴는 로그인 후 이용 가능합니다.",
			         buttons : [{
			            name : "확인",
			         }]
				});
			} else { // 로그인 상태
				
				// 로그인 되면은 세션 회원정보를 넣어줌
				var cateNm = $(this).attr("cateNm");
				$("#sendMemNum").val($("#mem_num").val());
				$("#sendCultureNum").val($("#cultureNum1").val())
  				$("#sendRestaurantNum").val($("#restaurantNum1").val());
				$("#sendGasStationNum").val($("#gasStation1").val()); 
				$("#sendCinemaNum").val($("#cinemaNum1").val());
				$("#sendParkingNum").val($(".bg #carparknum").val());
			
				if($(this).children("img").attr("src") == "resources/icons/bookmark.png" ){
					
				 	var params = $("#bookmarkForm").serialize();
					$.ajax({
						url : "bookmarkAction/insert" + cateNm,
						type : "POST",
						dataType: "json",
						data: params,
						success : function(res) { 
							switch(res.msg){
							case "success" : 
								// 북마크 리스트 로드
								cultureBookmarkReloadList();
								cinemaBookmarkReloadList();
								gasstationBookmarkReloadList();
								restaurantBookmarkReloadList();
								parkingBookmarkReloadList();
								// 별이미지 변경하기, 북마크 된 상태 이미지로
								$("#bookmarkBtn").attr("src", "resources/icons/star1.png")
								break;
							case "fail" :							
								break;
							case "error" :							
								break;
							}
						},
						error : function(request, status, error) { 
							console.log(request.responseText); 
						}
					}) 
				} else {				
					var params = $("#bookmarkForm").serialize();
					$.ajax({
						url : "bookmarkAction/delete" + cateNm,
						type : "POST",
						dataType : "json",
						data: params,
						success : function(res) { 
							switch(res.msg){
							case "success" : 
								// 별이미지 변경하기, 북마크 안 된 상태 이미지로
								$("#bookmarkBtn").attr("src", "resources/icons/bookmark.png")
								// 북마크 리스트 로드
								cultureBookmarkReloadList();
								cinemaBookmarkReloadList();
								gasstationBookmarkReloadList();
								restaurantBookmarkReloadList();
								parkingBookmarkReloadList();
								break;
							case "fail" :
								break;
							case "error" :								
								break;
							}
						},
						error : function(request, status, error) { 
							console.log(request.responseText); 
						}
					}) 	
				}	
			}
		});
		
		// 즐겨찾기 리스트에서 x버튼 클릭시 삭제
		$("body").on("click", "#close_i", function() {
			// 로그인 되면은 세션 회원정보를 넣어줌
  			$("#sendMemNum").val($("#mem_num").val());
  			$("#sendCultureNum").val($(this).attr("cultureNo"));
  			$("#sendRestaurantNum").val($(this).attr("restaurantNo"));
			$("#sendGasStationNum").val($(this).attr("gasstationNo")); 
			$("#sendCinemaNum").val($(this).attr("cinemaNo"));
			$("#sendParkingNum").val($(this).attr("parkingNo"));
  			
  			var cateNm = $(this).attr("cateNm");
			
			 makePopup({
		         title : "알림",
		         contents : "즐겨찾기에서 삭제하겠습니까?",
		         // draggable : true,
		          buttons : [{
	              name : "확인",
	              func : function() {                     
	      			
	      			var params = $("#bookmarkForm").serialize();
	      			$.ajax({
	      				url : "bookmarkAction/delete" + cateNm,
	      				type : "POST",
	      				dataType: "json",
	      				data: params,
	      				success : function(res) { 
	      					switch(res.msg){
	      					case "success" : 
	      						// 별이미지 변경하기, 북마크 안 된 상태 이미지로
								$("#bookmarkBtn").attr("src", "resources/icons/bookmark.png")
	      						// 북마크 리스트 로드
	      						cultureBookmarkReloadList();
								cinemaBookmarkReloadList();
								gasstationBookmarkReloadList();
								restaurantBookmarkReloadList();
								parkingBookmarkReloadList();
	      						break;
	      					case "fail" :
	      						break;
	      					case "error" :
	      						break;
	      					}
	      				},
	      				error : function(request, status, error) { 
	      					console.log(request.responseText); 
	      				}
	      			}) 	
	                  closePopup(); // 제일 위에 팝업 닫기
	              }
	           }, {
               name : "취소"
			}]
		})
	});
		
	// 즐겨찾기 리스트에서 주차장 박스 클릭시 마커 지도에 찍힘
	$("body").on("click", "#parkingBox", function() {
		
		var parkingNm = $(this).attr("parkingNm");
		var parkingNo = $(this).children().attr("parkingNo");
		var address = $(this).attr("address");
		var locx = $(this).attr("locx");
		var locy = $(this).attr("locy");
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(locx, locy); 
		
		// 마커 이미지의 이미지 주소입니다
		// 없으면 기본 마커, 파란색
		var imageSrc = "resources/icons/park_marker4.png";
	    // 마커 이미지의 이미지 크기 입니다
	    imageSize = new kakao.maps.Size(35, 35)  // 마커 이미지의 크기
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	   
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    image : markerImage // 마커 이미지 
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = "<input type=\"hidden\" id=\"carparknum\" value="+ parkingNo +" />";
		iwContent += "<div class=\"bg\"><div class=\"title\">" + parkingNm +"</div>";
    	iwContent += "<div class=\"address\">" + address +"</div>";
    	iwContent += "<div class=\"buttonBox\">";
    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"parking\">";
    	$(".parking_bookmark_wrap .result_area").each(function() {
           if($(this).html().match(parkingNo)){ //cultureNum로 하면, cultureNum가 단순한 번호라서 html주소나 번호에 걸리는 경우 있음 
              iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
           } else {
              iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
           }
        });
    	iwContent += "</div>";
    	iwContent += "<div class=\"shareBox\">";
    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
    	iwContent += "</div>";
    	iwContent += "<div class=\"compareBox\">";
    	iwContent += "<button class=\"compareBoxBtn\">요금비교</button>";
    	iwContent += "</div>";
    	iwContent += "</div>";
    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    	iwRemoveable = true; // 인포윈도우의 X버튼
    
    	 // 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
			    removable : iwRemoveable
			
			});  
		 
		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		 // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		 (function(marker, infowindow) {
			 // 마커에 클릭이벤트를 등록합니다
			 kakao.maps.event.addListener(marker, 'click', function() {
				 	// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
				  $("img[alt='close']").click();
			       // 마커 위에 인포윈도우를 표시합니다
			       infowindow.open(map, marker);  
			 });
		
		 })(marker, infowindow);
		 
		var points = new Array();
		points.push(new kakao.maps.LatLng(locx, locy));
		
		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();    

		var i, marker;
		for (i = 0; i < points.length; i++) {
		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다

		    // LatLngBounds 객체에 좌표를 추가합니다
		    bounds.extend(points[i]);
		}
		map.setBounds(bounds);
	
	})
	
		
	// 즐겨찾기 리스트에서 문화생활 박스 클릭시 마커 지도에 찍힘
	$("body").on("click", "#cultureBox", function() {
		
		var cultureNm = $(this).attr("cultureNm");
		var cultureNo = $(this).children().attr("cultureNo");
		var phone = $(this).attr("phone");
		var address = $(this).attr("address");
		var locx = $(this).attr("locx");
		var locy = $(this).attr("locy");
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(locx, locy); 
		
		// 마커 이미지의 이미지 주소입니다
		// 없으면 기본 마커, 파란색
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_theme.png"; 
	    // 마커 이미지의 이미지 크기 입니다
	    imageSize = new kakao.maps.Size(40, 41),  // 마커 이미지의 크기
	    imgOptions =  {
	        spriteSize : new kakao.maps.Size(30, 910), // 스프라이트 이미지의 크기
	        spriteOrigin : new kakao.maps.Point(3, 640), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	    }
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions); 
	   
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition,
		    image : markerImage // 마커 이미지 
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = "<input type=\"hidden\" id=\"cultureNum1\" value="+ cultureNo +" />";
    	iwContent += "<div class=\"bg\"><div class=\"title\">" + cultureNm +"</div>";
    	iwContent += "<div class=\"phone\">" + phone +"</div>";
    	iwContent += "<div class=\"address\">" + address +"</div>";
    	iwContent += "<div class=\"buttonBox\">";
    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"culture\">";
    	$(".cultrue_bookmark_wrap .result_area").each(function() {
           if($(this).html().match(cultureNm)){ //cultureNum로 하면, cultureNum가 단순한 번호라서 html주소나 번호에 걸리는 경우 있음 
              iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
           } else {
              iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
           }
        });
    	iwContent += "</div>";
    	/* iwContent += "<div class=\"shareBox\">";
    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
    	iwContent += "</div>"; */
    	iwContent += "<div class=\"compareBox\">";
    	iwContent += "<button class=\"compareBoxBtn\">최단거리비교</button>";
    	iwContent += "</div>";
    	iwContent += "</div>";
    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    	iwRemoveable = true; // 인포윈도우의 X버튼
    
    	 // 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
			    removable : iwRemoveable
			
			});  
		 
		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		 // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		 (function(marker, infowindow) {
			 // 마커에 클릭이벤트를 등록합니다
			 kakao.maps.event.addListener(marker, 'click', function() {
				 	// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
				  $("img[alt='close']").click();
			       // 마커 위에 인포윈도우를 표시합니다
			       infowindow.open(map, marker);  
			 });
		
		 })(marker, infowindow);
		 
		var points = new Array();
		points.push(new kakao.maps.LatLng(locx, locy));
		
		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();    

		var i, marker;
		for (i = 0; i < points.length; i++) {
		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다

		    // LatLngBounds 객체에 좌표를 추가합니다
		    bounds.extend(points[i]);
		}
		map.setBounds(bounds);
	
	})
	
	
	// 즐겨찾기 리스트에서 영화관 박스 클릭시 마커 지도에 찍힘
	$("body").on("click", "#cinemaBox", function() {
		
		var cinemaNm = $(this).attr("cinemaNm");
		var cinemaNo = $(this).children().attr("cinemaNo");
		var phone = $(this).attr("phone");
		var address = $(this).attr("address");
		
		// 마커 이미지의 이미지 주소입니다
		// 없으면 기본 마커, 파란색
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_theme.png"; 
	   // 마커 이미지의 이미지 크기 입니다
	    imageSize = new kakao.maps.Size(40, 41),  // 마커 이미지의 크기
	    imgOptions =  {
	        spriteSize : new kakao.maps.Size(30, 910), // 스프라이트 이미지의 크기
	        spriteOrigin : new kakao.maps.Point(0, 520), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	    }
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions); 
		
	 	// 주소-좌표 변환 객체를 생성합니다
	    var geocoder = new kakao.maps.services.Geocoder(); 	

	    // 주소로 좌표를 검색합니다
	    geocoder.addressSearch(address, function(result, status) {
	    	

	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {

	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	            // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords,
	                image : markerImage // 마커 이미지 
	            });

		     	
		        var iwContent = "<input type=\"hidden\" id=\"cinemaNum1\" value="+ cinemaNo +" />" 
		        	iwContent += "<div class=\"bg\"><div class=\"title\">" +  cinemaNm  +"</div>";
		        	if(phone != "undefined"){
		        		iwContent += "<div class=\"phone\">"+ phone +"</div>"; 
		        	}
			    	iwContent += "<div class=\"address\">" + address +"</div>"; 
			    	iwContent += "<div class=\"buttonBox\">";
			    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"cinema\">";
			    	$(".cinema_bookmark_wrap .result_area").each(function() {
		               if($(this).html().match(cinemaNo)){
		                  iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
		               } else {
		                  iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
		               }
		            });
			    	iwContent += "</div>";
			    	iwContent += "<div class=\"shareBox\">";
			    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
			    	iwContent += "</div>";
			    	iwContent += "<div class=\"compareBox\">";
			    	iwContent += "<button class=\"compareBoxBtn\">최단거리비교</button>";
			    	iwContent += "</div>";
			    	iwContent += "</div>";
			    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    	iwRemoveable = true; // 인포윈도우의 X버튼
			    
			    
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
				    removable : iwRemoveable
				
				}); 
				 
				// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
				// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				(function(marker, infowindow) {
					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
						// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
						$("img[alt='close']").click();
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);  
					});
				
				})(marker, infowindow);		

	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	        } 
	    });    
	
	})
	
	// 즐겨찾기 리스트에서 주유소 박스 클릭시 마커 지도에 찍힘
	$("body").on("click", "#gasstationBox", function() {
		
		var gasstationNm = $(this).attr("gasstationNm");
		var gasstationNo = $(this).children().attr("gasstationNo");
		var phone = $(this).attr("phone");
		var address = $(this).attr("address");
		
		// 마커 이미지의 이미지 주소입니다
		// 없으면 기본 마커, 파란색
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_theme.png"; 
	   // 마커 이미지의 이미지 크기 입니다
	    imageSize = new kakao.maps.Size(40, 41),  // 마커 이미지의 크기
	    imgOptions =  {
	        spriteSize : new kakao.maps.Size(30, 910), // 스프라이트 이미지의 크기
	        spriteOrigin : new kakao.maps.Point(0, 350), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	    }
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions); 
		
	 	// 주소-좌표 변환 객체를 생성합니다
	    var geocoder = new kakao.maps.services.Geocoder();

	    // 주소로 좌표를 검색합니다
	    geocoder.addressSearch(address, function(result, status) {

	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {

	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	            // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords,
	                image : markerImage // 마커 이미지 
	            });

		     	
	            var iwContent = "<input type=\"hidden\" id=\"gasStation1\" value="+ gasstationNo +" />";
	        	iwContent += "<div class=\"bg\"><div class=\"title\">" +  gasstationNm +"</div>";
		     	iwContent += "<div class=\"phone\">" + phone +"</div>";
		    	iwContent += "<div class=\"address\">" + address +"</div>"; 
		    	iwContent += "<div class=\"buttonBox\">";
		    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"gasStation\">";
		    	$(".gasstation_bookmark_wrap .result_area").each(function() {
		               if($(this).html().match(gasstationNo)){
		                  iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
		               } else {
		                  iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
		               }
		         });
		    	iwContent += "</div>";
		    	iwContent += "<div class=\"shareBox\">";
		    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
		    	iwContent += "</div>";
		    	iwContent += "<div class=\"compareBox\">";
		    	iwContent += "<button class=\"compareBoxBtn\">최단거리비교</button>";
		    	iwContent += "</div>";
		    	iwContent += "</div>";
		    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    	iwRemoveable = true; // 인포윈도우의 X버튼
			    
			    
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
				    removable : iwRemoveable
				
				}); 
				 
				// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
				// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				(function(marker, infowindow) {
					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
						// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
						$("img[alt='close']").click();
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);  
					});
				
				})(marker, infowindow);		

	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	        } 
	    });    
	
	})
	
	// 즐겨찾기 리스트에서 음식점 박스 클릭시 마커 지도에 찍힘
	$("body").on("click", "#restaurantBox", function() {
		
		var restaurantNm = $(this).attr("restaurantNm");
		var restaurantNo = $(this).children().attr("restaurantNo");
		var phone = $(this).attr("phone");
		var address = $(this).attr("address");
		
		// 마커 이미지의 이미지 주소입니다
		// 없으면 기본 마커, 파란색
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_theme.png"; 
	   // 마커 이미지의 이미지 크기 입니다
	    imageSize = new kakao.maps.Size(40, 41),  // 마커 이미지의 크기
	    imgOptions =  {
	        spriteSize : new kakao.maps.Size(30, 910), // 스프라이트 이미지의 크기
	        spriteOrigin : new kakao.maps.Point(0, 150), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	    }
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions); 
		
	 	// 주소-좌표 변환 객체를 생성합니다
	    var geocoder = new kakao.maps.services.Geocoder();

	    // 주소로 좌표를 검색합니다
	    geocoder.addressSearch(address, function(result, status) {

	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {

	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	            // 결과값으로 받은 위치를 마커로 표시합니다
	            var marker = new kakao.maps.Marker({
	                map: map,
	                position: coords,
	                image : markerImage // 마커 이미지 
	            });

	            var iwContent = "<input type=\"hidden\" id=\"restaurantNum1\" value="+ restaurantNo +" />" 
	        	iwContent += "<div class=\"bg\"><div class=\"title\">" +  restaurantNm +"</div>";
		     	iwContent += "<div class=\"phone\" id=\"phone\">" + phone +"</div>";
		    	iwContent += "<div class=\"address\">" + address +"</div>"; 
		    	iwContent += "<div class=\"buttonBox\">";
		    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"restaurant\">";
		    	$(".restaurant_bookmark_wrap .result_area").each(function() {
		               if($(this).html().match(restaurantNo)){
		                  iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
		               } else {
		                  iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
		               }
		         });
		    	iwContent += "</div>";
		    	iwContent += "<div class=\"shareBox\">";
		    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
		    	iwContent += "</div>";
		    	iwContent += "<div class=\"compareBox\">";
		    	iwContent += "<button class=\"compareBoxBtn\">최단거리비교</button>";
		    	iwContent += "</div>";
		    	iwContent += "</div>";
		    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    	iwRemoveable = true; // 인포윈도우의 X버튼
			    
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
				    removable : iwRemoveable
				
				}); 
				 
				// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
				// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				(function(marker, infowindow) {
					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
						// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
						$("img[alt='close']").click();
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);  
					});
				
				})(marker, infowindow);		

	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	        } 
	    });    
	
	})

		  
	//최단거리 상세보기 팝업
	$("#detailTablePopup .close_i").click(function () {
		$("#detailTablePopup").hide();
	    $('main').css({"opacity" : "1","pointer-events":"auto"});
	    $('header').css({"opacity" : "1","pointer-events":"auto"});
	});
	
	
	
	$("#feeCompareBtn").on("click", function(){//사이드바에 있는 요금 비교 버튼
		feeSort = feeComArray;//다시 담고 뿌려주려고
		var lastLength = feeSort.length;
		//추가 단위로 선택한 시간(분)으로 나눈다음
		//몫을 통해 
		//(몫 x 추가요금) =  요금비교 
		var time = 0;
		
		var temp = 0;
		
		switch($("#time_rate").val()){
			case "1"://30분
				time = 6;// 5(기본요금 분단위) * 6 = 30 
			break;
			case "2"://60분
				time = 12;
			break;
			case "3"://120분
				time = 24;
			break;
			
			case "4"://240분
				time = 48;
			break;
			
			default:
				time = 0; 
				break;
		}
		// re_fee_rate, re_add_fee <-- 5분 단위 기본요금, 추가요금
		//기본요금으로 정렬하돼
		//기본요금이 0이면 추가요금으로 
		
		if(time == 0){
			alert("비교할 시간을 클릭해주세요.");
			return;
		}else if(lastLength<2){
			alert("비교할 대상을 2개이상 넣어주세요.");
			return;
		}else{
			//오름차순
			for(var i=0; i<lastLength-1; i++){
				for(var j=0; j<(lastLength-i-1); j++){
					
					if(feeSort[j].re_fee_rate *time > feeSort[j+1].re_fee_rate*time){
						temp = feeSort[j];
						feeSort[j] = feeSort[j+1];
						feeSort[j+1] = temp;
					}
				}
			}
			
			//순서를 바꿔주려고 다시 그리자~
			var html = "";
			for(var data of feeSort){
				 html +="<div class=\"box\">";
		         html +="<div class=\"close_i\" no=\""+data.car_num+"\"></div>";
		         html +="<div class=\"parking_name\">"+data.title+"</div>";
		         html +="<div class=\"parking_info\">";
		         html +="<span class=\"time\">"+data.starttime+"~"+data.endtime+"</span>";
		         html +="<span style=\"color:red;\">₩"+data.re_fee_rate*time+"</span>";
		         html +="<br/><span class=\"pay\">"+data.payorfree_div+"</span> ";
		         html +="<span class=\"detail\" onclick=\"goDetail("+data.car_num+")\">금액표</span>";
		         html +="</div>";
		         html +="<div class=\"box_inner_i\">";
		         html +="<div class=\"bookmark_i\"></div>";
		         html +="<div class=\"share_i\"></div>";
		         html +="</div>";
		         html +="</div>";
			}
			$("#feeComArea").html(html);
		}
		
		});
		
		$("#feeTablePopup .close_i").click(function () {
			$("#feeTablePopup").hide();
		    $('main').css({"opacity" : "1","pointer-events":"auto"});
		    $('header').css({"opacity" : "1","pointer-events":"auto"});
		});
		
		$("#feeComArea").on("click",".box .close_i",function(){
			console.log("요금비교 box x버튼");
			//feeComArray
			var car_num = $(this).attr("no");
			//console.log(feeComArray[0].car_num);
			
			//현재 이 no의 값을 갖는 배열에 인덱스 번호를 알아낸 다음 지워주려고
			var json_idx = feeComArray.findIndex(function(key) {return key.car_num === car_num});
	    	feeComArray.splice(json_idx, 1);
			
			//(*)UI에서 지워주기
			$(this).parent().remove();
		});
		
		
		// 사고 탭에서 검색 클릭시
		$(".sixth").on("click", function() { // 사고탭 아이콘 클릭시 api 실행
			
			$.ajax({
				url :"http://openapi.seoul.go.kr:8088/7067696175776b6437334374514f54/xml/AccInfo/1/20/", 
				type :"GET", 
				dataType :"xml", 
				success : function(xml) { 
					
					var logx = [];
					var logy = [];
					// xml 형식 json으로 바꿈
					var xmlData = $(xml).find("row");
					var listLength = xmlData.length;
					
					
					if(listLength > 0) {
						
						var html = "";
						
						html += "<div class=\"title\">사건, 사고 정보</div>";
						html += "<div class=\"result_box\"></div>"; 
						
						var positions = new Array();
			 			var points = new Array();
			 			
						$(xmlData).each(function() {
							
							//혼자 쓸수없는 데이터들 변수 선언
							var sdate1 = $(this).find("occr_date").text().substring(0, 4);
							var sdate2 = $(this).find("occr_date").text().substring(4, 6);
							var sdate3 = $(this).find("occr_date").text().substring(6, 9);
							
							var edate1 = $(this).find("exp_clr_date").text().substring(0, 4);
							var edate2 = $(this).find("exp_clr_date").text().substring(4, 6);
							var edate3 = $(this).find("exp_clr_date").text().substring(6, 9);
							
							var stime1 = $(this).find("occr_time").text().substring(0, 2);
							var stime2 = $(this).find("occr_time").text().substring(2, 4);
							
							var etime1 = $(this).find("exp_clr_time").text().substring(0, 2);
							var etime2 = $(this).find("exp_clr_time").text().substring(2, 4);					
						
						   //https://www.osgeo.kr/17  <-- 한국 주요 좌표계 EPSG코드 및 proj4 인자 정리(*중부원점(Bessel): 서울 등 중부지역)
						   //https://yganalyst.github.io/spatial_analysis/spatial_analysis_3/ <--좌표가 정확히 안맞는 문제를 해결(+towgs84=0,0,0,0,0,0,0)
						   const grs80 = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=0,0,0,0,0,0,0";
						   const wgs84 = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs";
						   
						   //  () * 1 정수화 ().toFixed() * 1 도 정수화
						   //console.log(($(this).find("grs80tm_x").text() * 1).toFixed(1)); 
						   const p = proj4(grs80, wgs84, [($(this).find("grs80tm_x").text() * 1).toFixed(1) * 1, ($(this).find("grs80tm_y").text() * 1).toFixed(1) * 1]);				 

						   //console.log(p); 

							html += "<div class=\"box\">";
				            html += "<div class=\"accident_title " + $(this).find("acc_type").text() + "\"></div>";
				            html += "<div class=\"accident_period\">"+ sdate1 +" "+ sdate2 +" "+ sdate3 +" "+"/"+" "+ stime1 +" "+":"+" "+ stime2 +" "+"~"+" "+ edate1 +" "+ edate2 +" "+ edate3 +" "+"/"+" "+ etime1 +" "+":"+" "+ etime2 +"</div>";
				            html += "<div class=\"accident_info\">"+ $(this).find("acc_info").text() +"</div>";	
							//html += "<input type=\"hidden\" id=\"grs80tm_x\" name=\"grs80tm_x\" value="+ p[1] +" />";
							//html += "<input type=\"hidden\" id=\"grs80tm_y\" name=\"grs80tm_y\" value="+ p[0] +" />"; 					
				            html += "</div>	";					
				            
				 			positions.push({
				 				title: $(this).find("acc_info").text(),
				 				latlng:new kakao.maps.LatLng(p[1], p[0]) //경도, 위도 순서 중요
				 			});
				 			 
				 			 points.push(new kakao.maps.LatLng(p[1], p[0]));//경도, 위도 순서 중요
						})
						
			 			// 마커 이미지의 이미지 주소입니다
			 			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_theme.png"; 
			 			    
			 			 for (var i = 0; i < positions.length; i ++) {
			 			    
			 			   // 마커 이미지의 이미지 크기 입니다
						   imageSize = new kakao.maps.Size(40, 41),  // 마커 이미지의 크기
						   imgOptions =  {
						        spriteSize : new kakao.maps.Size(30, 910), // 스프라이트 이미지의 크기
						        spriteOrigin : new kakao.maps.Point(0, 790), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
						    }
		    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions); 
			 			    
			 			    // 마커를 생성합니다
			 			    var marker = new kakao.maps.Marker({
			 			        map: map, // 마커를 표시할 지도
			 			        position: positions[i].latlng, // 마커를 표시할 위치
			 			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			 			        image : markerImage // 마커 이미지 
			 			    });
			 			} 


			 			// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
			 			var bounds = new kakao.maps.LatLngBounds();    

			 			var i, marker;
			 			for (i = 0; i < points.length; i++) {
			 			    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다

			 			    // LatLngBounds 객체에 좌표를 추가합니다
			 			    bounds.extend(points[i]);
			 			}
			 			
			 			map.setBounds(bounds); 
						
						$(".accident_wrap .result_area").html(html);

		 				 $.ajax({
				         type:"post",
				         url:"trafficAccidentList", 
				         dataType : "json",
				         success : function(res) {
				        	   for(var i=0; i < res.list.length; i++){
				        	         $("." + res.list[i].ACC_TYPE).html(res.list[i].ACC_TYPE_NM)
				        	 }  
				        	   
				        	  $(".result_box").html("검색결과:" + listLength + "건");
				         },
				         error : function(request, status, error) {// 실패했을 때 함수 실행
					            console.log(request.responseText);    //실패 상세 내역
					         }
				         
				      }); //ajax	       
						
					}
				},
				error : function(request, status, error) { // 실패했을 때 함수 실행
					console.log(request.responseText); // 실패 상세 내역
				}
				
			});
		});	

	
		
 });
  
function mapReload(){
	  
	  var params = $("#actionForm").serialize();
		$.ajax({
			url : "HomeAjax",
			type : "POST",
			dataType: "json",
			data: params,
			success : function(res){
				
				searchList(res.list);
				mapList(res.list);
			},
			error : function(request, status, error) { 
				console.log(request.responseText); 
			}
		});
		
  }
  
  
  
  function reviewReload(){
	  
	   var data = {carparknum : $("#carparknum").val(),	select : $("#selectx").val()};
		
	  $.ajax({
			 type : "POST",
			   url : "ReviewAjax", 
			   dataType : "json",
			   data : data,
			   success : function(res){
			       $('.review_wrap').addClass('on');
			       $('.review_wrap').siblings().removeClass('on');  
				   reviewList(res.reviewlist);
				
			   },
			  error : function(request, status, error){
					console.log(request.responseText); 
			  }
		})
  }
  
  
 function reviewList(reviewList){
	 
	 var html = "";
	 /* html += "<div class=\"standard\">"+reviewList[0].CAR_PARK_NM +"</div>"; */
	 for(var data of reviewList){
     html += "<div class=\"box pr40\">                        ";
     html += "<div class=\"nickname\">"+data.NM +"</div>";
     html += "<div class=\"line\">                            ";
     html += "<div class=\"stars\">                           ";
     html += "<div class=\"Star\" data-score=\"" +data.AVG +"\"></div>";
     html += "</div>                                          ";
     html += "<div class=\"date\">"+data.DT+"</div>            ";
     html += "</div>                                          ";
     html += "<div class=\"review_title\">                    ";
     html += "<span>제목 :</span>                             ";
     html += "<span>"+data.TITLE +"</span>             ";
     html += "</div>                                          ";
     html += "<div class=\"review_contents\">                 ";
     html += "<span>내용 :</span>                             ";
     html += "<span>"+data.CON +"</span>";
     html += "</div>                                          ";
     html += "<div class=\"box_inner_i\">                     ";
     html += "<div onclick=\"warningPopup("+data.REVIEW_NUM+")\" class=\"warning_i\"></div>";//신고버튼
     html += "</div>                                          ";
     html += "</div>                                          ";
 	}
	
 	$('.review_wrap .result_area').html(html);
 	
 	$(".review_wrap .Star").raty({
		readOnly: true, 
		path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"
	});
	
 } 
 
 function reportList(reportlist){//신고 사유 DB
	 
	 var html= "";
	 html += "<div class=\"note\">※여러사유에 해당하는 경우 대표적인 사유 1개만 골라주세요.</div>";
     for(var data of reportlist){                                                            
	     html += "<div>";
	     html += "<input type=\"radio\" name=\"selete\" value=\""+data.CATE_NUM +"\" checked>";                        
	     html += "<label>"+data.CATE_NM +"</label>";
	     html += "</div>";
	 }
    $('#warning_popup .popup_content').html(html);  
 }
 
 
  function warningPopup(review_num) {
	  if($("#mem_num").val() == null || $("#mem_num").val() == ""){
		  makeAlert("알림","로그인을 하셔야합니다.");
	  }else{
	   	 	$("#send").val(review_num); //actionForm2에 있는 send <-- review_num담기
	   	 	$("#warning_popup").show();
	        $('main').css({"opacity" : "0.5","pointer-events":"none"});
	        $('header').css({"opacity" : "0.5","pointer-events":"none"});
	      
	        $.ajax({
				url : "ReportAjax",
				type : "POST",
				dataType: "json",
				success : function(res){
					reportList(res.reportlist);
				},
				error : function(request, status, error) { 
					console.log(request.responseText); 
				}
			});
	  }
  }
   
    
  
  function searchList(list){ //사이드 쪽에 주차장 리스트
		 var html = "";
		 html += "<div class=\"result_box\">" +list.length+ "</div>";
		 for(var data of list){		
			 html += "<div class=\"box\">";
	         html += "<div class=\"close_i\"></div>";
	         html += "<div class=\"parking_name\">" + data.CAR_PARK_NM + "</div>";
	         html += "<div class=\"parking_info\">";
	         html += "<span class=\"time\">" + data.STARTTIME + " "+"~"+" " + data.ENDTIME + "</span>";
	         html += "<span class=\"pay\">유료</span>";
	         html += "<span class=\"detail\">상세보기</span>";  // 추가됨
	         html += "</div>";
	         html += "<div class=\"box_inner_i\">";
	         html += "<div class=\"bookmark_i\"></div>";
	         html += "<a id=\"kakaotalk-sharing-btn\" href=\"javascript:shareMessage(" + data.CAR_PARK_MAG_NUM + ")\" class=\"share_i\">";
	         html += "<img src=\"resources/icons/share.png\" alt=\"카카오톡 공유 보내기 버튼\" /></a>";
	         html += "</div>";
	         html += "</div>";
		 }
		 $('.result_area2').html(html);
	 } 
 
  function carDetail(car_num){
	 	//잘 넘어오면 금액표 팝업을 보여주자.
	 	$("#car_num").val(car_num);
		var html = "";
	 	
	 	var params = $("#carDetailForm").serialize();
		$.ajax({
			url : "parkDetail", //경로
			type : "POST", //전송방식(GET: 주소형태, Post : 주소 헤더형태)
			dataType : "json", //데이터 형태
			data : params, //보낼 데이터
			success : function(res){// 성공했을때 겨로가를 res에 받고 함수실행
				html += "<tr>";
		      	html += "<th colspan=\"2\" style=\"background-color:lightgray;\">"+res.data.CAR_PARK_NM+"</th>";
		      	html += "</tr>";
		      	
				html += "<tr>";
		      	html += "<th>평일 유/무료구분</th>";
		      	html += "<td>"+res.data.PAYORFREE_DIV+"</td>";
		      	html += "</tr>";
		      
		        html += "<tr>";
		      	html += "<th>토요일 유/무료 구분</th>";
		      	html += "<td>"+res.data.SATURDAY_PAYORFREE_DIV+"</td>";
		        html += "</tr>";
		      
		        html += "<tr>";
		        html += "<th>공휴일 유/무료 구분</th>";
		      	html += "<td>"+res.data.HOLIDAY_PAYORFREE_DIV+"</td>";
		        html += "</tr>";
		
		        html += "<tr>";
		      	html += "<th>전화번호</th>";
		      	html += "<td>"+res.data.PHONE+"</td>";
		        html += "</tr>";
		      
		        html += "<tr>";
		      	html += "<th>기본 주차 시간</th>";
		      	html += "<td>"+res.data.TIME_RATE+"</td>";
		        html += "</tr>";
		      
		        html += "<tr>";
		      	html += "<th>기본 요금</th>";
		      	html += "<td>"+res.data.FEE_RATE+"</td>";
		        html += "</tr>";
		        
		      
		        
		        $("#detailTablePopup tbody").html(html);
				$("#detailTablePopup").show();
				
			},
			error : function(request, status, error){
				makeAlert("알림", "빠른 시일 내에 준비하겠습니다.");
				console.log(request.responseText);
			}
		});
		
		
	} 
  function mapList(list){ //지도 안에 핀 그리기
		 
		 var positions = new Array();
		 var points = new Array();
		 for(var data of list) {
			 positions.push({
				title: data.CAR_PARK_NM,
				latlng:new kakao.maps.LatLng(data.LOCX, data.LOCY),
				starttime: data.STARTTIME,
				endtime: data.ENDTIME,
				review: data.CNT,
				starscore: data.AVG,
				payorfree_div:data.PAYORFREE_DIV,//유,무료
				fee_rate:data.FEE_RATE,//기본 주차 요금
				add_fee : data.ADD_FEE,//추가 단위 요금
				add_time_rate : data.ADD_TIME_RATE,//추가 단위 시간
				time_rate : data.TIME_RATE,//기본 주차 시간
				re_fee_rate : data.RE_FEE_RATE, //환산 정보 '기본' 요금
				re_add_fee : data.RE_ADD_FEE, //환산 정보 '추가' 요금
				carparknum: data.CAR_PARK_MAG_NUM
			 });
			
			 
			 points.push(new kakao.maps.LatLng(data.LOCX, data.LOCY));
		 }

			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "resources/icons/park_marker4.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(35, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage, // 마커 이미지 
			        clickable: true
			    });
			    
				 
			    var iwContent = "<div class=\"bg\"><div class=\"title\">" + positions[i].title +"</div>";
		    	iwContent  += "<input type=\"hidden\" id=\"carparknum\" value=\"" + positions[i].carparknum + "\" />"; 
		    	iwContent += "<span class=\"Star\" data-score=\"" +positions[i].starscore +"\"></span>";
		    	iwContent += "<span class=\"phone2\" no=\""+positions[i].carparknum+"\" nm=\""+positions[i].title+"\"> "+"리뷰"+" " + positions[i].review + "</span>";
		    	iwContent += "<div>"
		    	iwContent += "<sapn class=\"address\">"+ positions[i].starttime + " "+"~"+" " + positions[i].endtime + "</sapn>";
		    	iwContent += "<span class=\"pay\">"+positions[i].payorfree_div+"</span>";
		    	iwContent += "<span class=\"detail\"  onclick=\"goDetail("+positions[i].carparknum+")\">상세보기</span>";
		    	iwContent += "</div>";
		    	iwContent += "<div class=\"buttonBox\">";
		    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"parking\">";
		    	$(".parking_bookmark_wrap .result_area").each(function() {
	               if($(this).html().match(positions[i].carparknum)){
	                  iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
	               } else {
	                  iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
	               }
	            });
		    	iwContent += "</div>";
		    	iwContent += "<a id=\"kakaotalk-sharing-btn\" href=\"javascript:shareMessage(" + positions[i].carparknum + ")\" class=\"shareBox\">";
		    	iwContent += "<img src=\"resources/icons/share.png\" alt=\"카카오톡 공유 보내기 버튼\" /></a>";
		    	iwContent += "<div class=\"compareBox\">";
		    	iwContent += "<button class=\"compareBoxBtn\" onclick=\"feeCom("+positions[i].carparknum+",\'"+positions[i].starttime+"\',\'"+positions[i].endtime+"\', \'"+ positions[i].payorfree_div+"\', \'"+ positions[i].fee_rate+"\', \'"+ positions[i].add_time_rate+"\', \'"+ positions[i].time_rate+"\', \'"+ positions[i].add_fee+"\',\'"+positions[i].re_fee_rate+"\',\'"+positions[i].re_add_fee +"\', \'"+positions[i].title+"\')\">요금비교</button>"; // 객체라서 positions[i]로 바로 못보냄!
		    	iwContent += "</div>"
		    	iwContent += "</div>"
		    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    	iwRemoveable = true; 
				    
			    	
			    
			    
			 // 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
				    removable : iwRemoveable
				
				});  
			 
			if(positions[i].carparknum == $(".review_wrap #carparknum").val()) {//(*)리뷰가 작성되고 나면 자동으로 다시 팝업이 그려지게
				 $("img[alt='close']").click();
			       // 마커 위에 인포윈도우를 표시합니다
			       infowindow.open(map, marker);
			       
			       $("#map .Star").empty();
			       $("#map .Star").raty({ 
						readOnly: true, 
						path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"
				});
			 } 
			 		 
			 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		     // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		     (function(marker, infowindow) {
		    	 // 마커에 클릭이벤트를 등록합니다
				 kakao.maps.event.addListener(marker, 'click', function() {
					 
					 	// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
					  $("img[alt='close']").click();
				 
				       // 마커 위에 인포윈도우를 표시합니다
				      infowindow.open(map, marker);
				       $("#map .Star").empty(); 
				       $("#map .Star").raty({ 
							readOnly: true, 
							path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"
						});  
				 });

		     })(marker, infowindow);	
		
			}//for

			// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
			var bounds = new kakao.maps.LatLngBounds();    

			var i, marker;
			for (i = 0; i < points.length; i++) {
			    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
			    // LatLngBounds 객체에 좌표를 추가합니다
			    bounds.extend(points[i]);
			}
			
			map.setBounds(bounds);
	 }
  
// 문화생활 카테고리 지도에 마커 function
function cultureList(list){
	
	 var positions = new Array();
	 var points = new Array();
	 
	 for(var data of list) {
		 positions.push({
			title: data.CUL_LIFE,
			phone: data.PHONE,
			address: data.ADDRESS,
			cultureNum: data.CUL_LIFE_NUM,
			fee_rate:data.FEE_RATE, //기본 주차 요금
			locx : data.LOCX,
			locy : data.LOCY,
			latlng:new kakao.maps.LatLng(data.LOCX, data.LOCY)
		 });
		 
		 points.push(new kakao.maps.LatLng(data.LOCX, data.LOCY));
	 }
	 
		// 마커 이미지의 이미지 주소입니다
		// 없으면 기본 마커, 파란색
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_theme.png"; 
	    // 마커 이미지의 이미지 크기 입니다
	    imageSize = new kakao.maps.Size(40, 41),  // 마커 이미지의 크기
	    imgOptions =  {
	        spriteSize : new kakao.maps.Size(30, 910), // 스프라이트 이미지의 크기
	        spriteOrigin : new kakao.maps.Point(3, 640), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	    }
	   	
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null); //지도에 마커 삭제.
	    }   
	    markers = [];
	    
	    $("img[alt='close']").click();
	    
		for (var i = 0; i < positions.length; i ++) {
	      	    
		    // 마커 이미지의 이미지 크기 입니다
		   var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		       image : markerImage // 마커 이미지 
		        //clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다, 마커 클릭시 팝업창 뜨게 추가
		    });
		    markers.push(marker);	 		   
		    var iwContent = "<input type=\"hidden\" id=\"cultureNum1\" value="+ positions[i].cultureNum +" />";
		    	iwContent += "<div class=\"bg\"><div class=\"title\">" + positions[i].title +"</div>";
		    	iwContent += "<div class=\"phone\">" + positions[i].phone +"</div>";
		    	iwContent += "<div class=\"address\">" + positions[i].address +"</div>";
		    	iwContent += "<div class=\"buttonBox\">";
		    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"culture\">";
		    	$(".cultrue_bookmark_wrap .result_area").each(function() {
	               if($(this).html().match(positions[i].title)){ //cultureNum로 하면, cultureNum가 단순한 번호라서 html주소나 번호에 걸리는 경우 있음 
	                  iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
	               } else {
	                  iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
	               }
	            });
		    	iwContent += "</div>";
		    	iwContent += "<div class=\"shareBox\">";
		    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
		    	iwContent += "</div>";
		    	iwContent += "<div class=\"compareBox\">";
		    	iwContent += "<button class=\"compareBoxBtn\"onclick=\"getShortDistance('"+positions[i].title+"',"+positions[i].locx+","+positions[i].locy+")\">최단거리비교</button>";
		    	iwContent += "</div>";
		    	iwContent += "</div>";
		    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    	iwRemoveable = true; // 인포윈도우의 X버튼
		    
		    
		   // 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
			    removable : iwRemoveable
			
			});  
		 
		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	     // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	     (function(marker, infowindow) {
	    	 // 마커에 클릭이벤트를 등록합니다
			 kakao.maps.event.addListener(marker, 'click', function() {
				 	// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
				  $("img[alt='close']").click();
			       // 마커 위에 인포윈도우를 표시합니다
			       infowindow.open(map, marker);  
			 });

	     })(marker, infowindow);		 
	
		}

		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();    

		var i, marker;
		
		if(points.length == 0){
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch($("#sido1").val() + " " + $("#gugun1").val(), function(result, status) {
				if (status === kakao.maps.services.Status.OK) { 

		 	    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		 	    	
		 	    	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
					map.setLevel(5);
				}
			});
				
		} else {
			for (i = 0; i < points.length; i++) {
			    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
			     
			    // LatLngBounds 객체에 좌표를 추가합니다
			    bounds.extend(points[i]);
			}
			map.setBounds(bounds);
		}

 }
 	
function getShortDistance(nm,locx,locy,carnum) { //클릭한거에 넣어줌 
	var html = "";
	
	$("#locx").val(locx);
	$("#locy").val(locy);
	$("#carnum").val(carnum);
	
	var params = $("#disForm").serialize();
	$.ajax({
		url : "shortDistanceAjax",
		type : "POST",
		dataType: "json",
		data: params,
		success : function(res){
			
			html += "<div class=\"standard\">"+nm+" 기준</div>";	
			
			for(var data of res.list){
				html += "<div class=\"box\">";
				html += "<div class=\"parking_name\">"+data.CAR_PARK_NM+"</div>";
				html += "<div class=\"parking_info\">";
				html += "<span class=\"km\">"+data.METER+"</span>";
				html += "</div>";
				html += "<input type=\"hidden\" name=\"locx\" id=\"locx\" value=\""+data.LOCX+"\">";
				html += "<input type=\"hidden\" name=\"locy\" id=\"locy\" value=\""+data.LOCY+"\">";
				html += "<input type=\"hidden\" name=\"car_num\" id=\"car_num\" value=\""+data.CAR_PARK_MAG_NUM+"\">";
				html += "<div class=\"box_inner_i\">";
				html += "<div class=\"bookmark_i\"></div>";
				/* html += "<div class=\"share_i\"></div>"; */
				html += "</div>";
				html += "</div>";
			}
			$("#shortDistanceArea").html(html);
			
			//주차장 5개도 같이 찍어주기
			var positions = new Array();
			var points = new Array();
			for(var data of res.list) {
				positions.push({
					car_num : data.CAR_PARK_MAG_NUM,
					title: data.CAR_PARK_NM,
					latlng:new kakao.maps.LatLng(data.LOCX, data.LOCY),
					starttime: data.STARTTIME,
					endtime: data.ENDTIME,
					review: data.CNT,
					starscore: data.AVG,
					payorfree_div:data.PAYORFREE_DIV,//유,무료
					fee_rate:data.FEE_RATE,//기본 주차 요금
					add_fee : data.ADD_FEE,//추가 단위 요금
					add_time_rate : data.ADD_TIME_RATE,//추가 단위 시간
					time_rate : data.TIME_RATE,//기본 주차 시간
					re_fee_rate : data.RE_FEE_RATE, //환산 정보 '기본' 요금
					re_add_fee : data.RE_ADD_FEE, //환산 정보 '추가' 요금
					carparknum: data.CAR_PARK_MAG_NUM
				});
				points.push(new kakao.maps.LatLng(data.LOCX, data.LOCY));
			}
			
			 var imageSrc = "resources/icons/park_marker4.png"; 
		    
		    $("img[alt='close']").click();
			
			for (var i = 0; i < positions.length; i ++) {
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(35, 35); 
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage, // 마커 이미지 
			        clickable: true
			    });
			    markers.push(marker);
				    
			    var iwContent = "<div class=\"bg\"><div class=\"title\">" + positions[i].title +"</div>";
			     iwContent +="<span class=\"time\">"+positions[i].starttime+"~"+positions[i].endtime+"</span>";
			     iwContent += "<div class=\"address\">₩"+positions[i].fee_rate + "</div>";
			     iwContent += "<span class=\"pay\">"+positions[i].payorfree_div+"</span>";
			     iwContent += "<div class=\"buttonBox\">";
			     iwContent += "<div class=\"bookmarkBox\">";
			     iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"boomarkBtn\" class=\"boomarkBtn\">";
			     iwContent += "</div>";
			     iwContent += "<div class=\"shareBox\">";
			     iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
			     iwContent += "</div>";
			     iwContent += "<div class=\"compareBox\">";
			     iwContent += "<button class=\"compareBoxBtn\" onclick=\"carDetail("+positions[i].car_num+")\">상세보기</button>"; // 객체라서 positions[i]로 바로 못보냄!
			     iwContent += "</div>"
			     iwContent += "</div>"
			     iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    	iwRemoveable = true;
				    
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
				    removable : iwRemoveable
				});  
				 
				 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			     // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			     (function(marker, infowindow) {
			    	 // 마커에 클릭이벤트를 등록합니다
					 kakao.maps.event.addListener(marker, 'click', function() {
						  // 다른 마커를 클릭했을때, 이전 팝업창 닫힘
						  $("img[alt='close']").click();//개발자도구에서 x버튼의 속성에 접근한것.
							 infowindow.open(map, marker);
					      // 마커 위에 인포윈도우를 표시합니다
					 });
			     })(marker, infowindow);		 
				}//for
				
				// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
				var bounds = new kakao.maps.LatLngBounds();    
				var i, marker;
				for (i = 0; i < points.length; i++) {// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
				    bounds.extend(points[i]);// LatLngBounds 객체에 좌표를 추가합니다
				}//for
				
				map.setBounds(bounds);
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	});//ajax
} 	 	

//주유소 카테고리 지도에 마커 function
function gasStationList(list){
	
	var positions = new Array();
	var points = new Array();
	 
	for(var data of list) {
		 positions.push({
		 	title: data.CUL_LIFE,
			phone: data.PHONE,
			address: data.ADDRESS,
			fee_rate:data.FEE_RATE, //기본 주차 요금
			locx : data.LOCX,
			locy : data.LOCY,
			
			latlng:new kakao.maps.LatLng(data.LOCX, data.LOCY)
		 });
		 
		 points.push(new kakao.maps.LatLng(data.LOCX, data.LOCY));
	 }
	 
	// 마커 이미지의 이미지 주소입니다
	// 없으면 기본 마커, 파란색
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_theme.png"; 
   // 마커 이미지의 이미지 크기 입니다
   imageSize = new kakao.maps.Size(40, 41),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new kakao.maps.Size(30, 910), // 스프라이트 이미지의 크기
        spriteOrigin : new kakao.maps.Point(0, 350), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    }
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
    
    $("img[alt='close']").click();
	
    list.forEach(function(data) {
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(data.PARCEL_NUM, function(result, status) {
			
			  // 정상적으로 검색이 완료됐으면 
	 	    if (status === kakao.maps.services.Status.OK) {

	 	    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	 	    	
				// 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image : markerImage // 마커 이미지 
		        });
				
		        markers.push(marker);
		        
		        const p = proj4(grs80, wgs84, [(positions[i].locx* 1).toFixed(1) * 1, (positions[i].locy* 1).toFixed(1) * 1]);				
		     	
		        var iwContent = "<input type=\"hidden\" id=\"gasStation1\" value="+ data.GAS_STATION_NUM +" />";
		        	iwContent += "<div class=\"bg\"><div class=\"title\">" +  data.GAS_NM +"</div>";
			     	iwContent += "<div class=\"phone\">" + data.PHONE +"</div>";
			    	iwContent += "<div class=\"address\">" + data.PARCEL_NUM +"</div>"; 
			    	iwContent += "<input type=\"hidden\" name=\"locx\" id=\"locx\" value=\""+data.LOCX+"\">";
			    	iwContent += "<input type=\"hidden\" name=\"locy\" id=\"locy\" value=\""+data.LOCY+"\">";
			    	iwContent += "<div class=\"buttonBox\">";
			    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"gasStation\">";
			    	$(".gasstation_bookmark_wrap .result_area").each(function() {
			               if($(this).html().match(data.GAS_STATION_NUM)){
			                  iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
			               } else {
			                  iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
			               }
			         });
			    	iwContent += "</div>";
			    	iwContent += "<div class=\"shareBox\">";
			    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
			    	iwContent += "</div>";
			    	iwContent += "<div class=\"compareBox\">";
			    	iwContent += "<button class=\"compareBoxBtn\" onclick=\"getShortDistance('"+data.GAS_NM+"',"+p[1]+","+p[0]+")\">최단거리비교</button>";
			    	iwContent += "</div>";
			    	iwContent += "</div>";
			    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    	iwRemoveable = true; // 인포윈도우의 X버튼
			    
			    
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
				    removable : iwRemoveable
				
				}); 
				 
				// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
				// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				(function(marker, infowindow) {
					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
						// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
						$("img[alt='close']").click();
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);  
					});
				
				})(marker, infowindow);		 
		 	}
		}); 	     			 
	});
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($("#sido1").val() + " " + $("#gugun1").val(), function(result, status) {
		if (status === kakao.maps.services.Status.OK) { 

 	    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
 	    	
 	    	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
			map.setLevel(5);
		}
	}); 
	
	
}

//영화관 카테고리 지도에 마커 function
function cinemaList(list){
	
	var positions = new Array();
	var points = new Array();
	 
	for(var data of list) {
		 positions.push({
			title: data.CUL_LIFE,
			phone: data.PHONE,
			address: data.ADDRESS,
			fee_rate:data.FEE_RATE, //기본 주차 요금
			locx : data.LOCX,
			locy : data.LOCY,
			
			latlng:new kakao.maps.LatLng(data.LOCX, data.LOCY)
		 });
		 
		 points.push(new kakao.maps.LatLng(data.LOCX, data.LOCY));
	 }
	 
	// 마커 이미지의 이미지 주소입니다
	// 없으면 기본 마커, 파란색
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_theme.png"; 
   // 마커 이미지의 이미지 크기 입니다
    imageSize = new kakao.maps.Size(40, 41),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new kakao.maps.Size(30, 910), // 스프라이트 이미지의 크기
        spriteOrigin : new kakao.maps.Point(0, 520), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    }
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
    
    $("img[alt='close']").click();
	
    list.forEach(function(data) {
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(data.PARCEL_NUM, function(result, status) {
			
			  // 정상적으로 검색이 완료됐으면 
	 	    if (status === kakao.maps.services.Status.OK) {

	 	    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	 	    	
				// 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image : markerImage // 마커 이미지 
		        });
				
		        markers.push(marker);
		     	
		        const p = proj4(grs80, wgs84, [(positions[i].locx* 1).toFixed(1) * 1, (positions[i].locy* 1).toFixed(1) * 1]);
		        
		        var iwContent = "<input type=\"hidden\" id=\"cinemaNum1\" value="+ data.CINEMA_MAG_NUM +" />" 
		        	iwContent += "<div class=\"bg\"><div class=\"title\">" +  data.ENT_NM +"</div>";
			     	iwContent += "<div class=\"phone\">" + data.PHONE +"</div>";
			    	iwContent += "<div class=\"address\">" + data.PARCEL_NUM +"</div>"; 
			    	iwContent += "<input type=\"hidden\" name=\"locx\" id=\"locx\" value=\""+data.LOCX+"\">";
			    	iwContent += "<input type=\"hidden\" name=\"locy\" id=\"locy\" value=\""+data.LOCY+"\">";
			    	iwContent += "<div class=\"buttonBox\">";
			    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"cinema\">";
			    	$(".cinema_bookmark_wrap .result_area").each(function() {
		               if($(this).html().match(data.CINEMA_MAG_NUM)){ //cultureNum로 하면, cultureNum가 단순한 번호라서 html주소나 번호에 걸리는 경우 있음 
		                  iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
		               } else {
		                  iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
		               }
		            });
			    	iwContent += "</div>";
			    	iwContent += "<div class=\"shareBox\">";
			    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
			    	iwContent += "</div>";
			    	iwContent += "<div class=\"compareBox\">";
			    	iwContent += "<button class=\"compareBoxBtn\" onclick=\"getShortDistance('"+data.ENT_NM+"',"+p[1]+","+p[0]+")\">최단거리비교</button>";
			    	iwContent += "</div>";
			    	iwContent += "</div>";
			    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    	iwRemoveable = true; // 인포윈도우의 X버튼
			    
			    
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
				    removable : iwRemoveable
				
				}); 
				 
				// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
				// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				(function(marker, infowindow) {
					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
						// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
						$("img[alt='close']").click();
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);  
					});
				
				})(marker, infowindow);		 
		 	}
		}); 	     			 
	});
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($("#sido1").val() + " " + $("#gugun1").val(), function(result, status) {
		if (status === kakao.maps.services.Status.OK) { 

 	    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
 	    	
 	    	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
			map.setLevel(5);
		}
	}); 
}


// 음식점 카테고리 지도에 마커 function
function restaurantList(list){
	
	var positions = new Array();
	var points = new Array();
	 
	 for(var data of list) {
		 positions.push({
			title: data.CUL_LIFE,
			phone: data.PHONE,
			address: data.ADDRESS,
			fee_rate:data.FEE_RATE, //기본 주차 요금
			locx : data.LOCX,
			locy : data.LOCY,
			
			latlng:new kakao.maps.LatLng(data.LOCX, data.LOCY)
		 });
		 
		 points.push(new kakao.maps.LatLng(data.LOCX, data.LOCY));
	 }
	
	// 마커 이미지의 이미지 주소입니다
	// 없으면 기본 마커, 파란색
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_theme.png"; 
   // 마커 이미지의 이미지 크기 입니다
   imageSize = new kakao.maps.Size(40, 41),  // 마커 이미지의 크기
   imgOptions =  {
        spriteSize : new kakao.maps.Size(30, 910), // 스프라이트 이미지의 크기
        spriteOrigin : new kakao.maps.Point(0, 150), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    }
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
    
    $("img[alt='close']").click();

	list.forEach(function(data) {
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(data.PARCEL_NUM, function(result, status) {
			
			  // 정상적으로 검색이 완료됐으면 
	 	    if (status === kakao.maps.services.Status.OK) {

	 	    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	 	    	
				// 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		            image : markerImage // 마커 이미지 
		        });
				
		        markers.push(marker);
		     	
		        const p = proj4(grs80, wgs84, [(positions[i].locx* 1).toFixed(1) * 1, (positions[i].locy* 1).toFixed(1) * 1]);
		        
		        var iwContent = "<input type=\"hidden\" id=\"restaurantNum1\" value="+ data.RESTAURANT_NO +" />" 
		        	iwContent += "<div class=\"bg\"><div class=\"title\">" +  data.ENT_NM +"</div>";
			     	iwContent += "<div class=\"phone\" id=\"phone\">" + data.PHONE +"</div>";
			    	iwContent += "<div class=\"address\">" + data.PARCEL_NUM +"</div>"; 
			    	iwContent += "<div class=\"buttonBox\">";
			    	iwContent += "<div class=\"bookmarkBox\" cateNm=\"restaurant\">";
			    	$(".restaurant_bookmark_wrap .result_area").each(function() {
			               if($(this).html().match(data.RESTAURANT_NO)){
			                  iwContent += "<img src=\"resources/icons/star1.png\" id=\"bookmarkBtn\">";
			               } else {
			                  iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"bookmarkBtn\">";
			               }
			         });
			    	iwContent += "</div>";
			    	iwContent += "<div class=\"shareBox\">";
			    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
			    	iwContent += "</div>";
			    	iwContent += "<div class=\"compareBox\">";
			    	iwContent += "<button class=\"compareBoxBtn\" onclick=\"getShortDistance('"+data.ENT_NM+"',"+p[1]+","+p[0]+")\">최단거리비교</button>";
			    	iwContent += "</div>";
			    	iwContent += "</div>";
			    	iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    	iwRemoveable = true; // 인포윈도우의 X버튼
			      
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					content : iwContent,
				    removable : iwRemoveable
				
				}); 	 
				// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
				// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				(function(marker, infowindow) {
					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'click', function() {
						// 다른 마커를 클릭했을때, 이전 팝업창 닫힘
						$("img[alt='close']").click();
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);  
					});
				})(marker, infowindow);	
		 	}
		}); 	     			 
	});
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($("#sido1").val() + " " + $("#gugun1").val(), function(result, status) {
		if (status === kakao.maps.services.Status.OK) { 

 	    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
 	    	
 	    	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
			map.setLevel(5);
		}
	});
}


//주차창 즐겨찾기
function parkingBookmarkReloadList() {
	var params = $("#headerForm").serialize();
	
	$.ajax({
		url : "parkingBookmarkList",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			parkingBookmarkDrawList(res.list);
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); 
}

 function parkingBookmarkDrawList(list) {
		var html = "";
		
		if(list.length == 0){
			html += "<div class=\"text\">즐겨찾기 된 장소가 없습니다.</div> ";
		} 
		for(var data of list){			
			
			html += "<div class=\"box\" id=\"parkingBox\" locx=\"" + data.LOCX + "\" locy=\"" + data.LOCY + "\" parkingNm=\"" + data.CAR_PARK_NM +"\" address=\"" + data.ADDRESS + "\">";
            html += "<div class=\"close_i\" id=\"close_i\" parkingNo=\"" + data.CAR_PARK_MAG_NUM  + "\" cateNm=\"parking\" ></div>";
            html += "<div class=\"content\">";
            html += "<div class=\"main\">";
            html += "<div class=\"parking_name\">" + data.CAR_PARK_NM+"</div>";
            html += "<div class=\"address\">" + data.STARTTIME + "~" + data.ENDTIME + " " +data.PAYORFREE_DIV +"</div>"; 
            html += "<div class=\"address\">" + data.ADDRESS + "</div>";       
            html += "</div>";
            html += "</div>";
           	html += "</div>";
           	html += "</div>";
		}
			$(".parking_bookmark_wrap .result_area").html(html);
	}
 
 
// 문화생활 즐겨찾기
function cultureBookmarkReloadList() {
	var params = $("#headerForm").serialize();
	
	$.ajax({
		url : "cultureBookmarkList",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			cultureBookmarkDrawList(res.list);
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); 
	
}

 function cultureBookmarkDrawList(list) {
		var html = "";
		
		if(list.length == 0){
			html += "<div class=\"text\">즐겨찾기 된 장소가 없습니다.</div> ";
		} 
		
		for(var data of list){			
			
			html += "<div class=\"box\" id=\"cultureBox\" locx=\"" + data.LOCX + "\" locy=\"" + data.LOCY + "\" cultureNm=\"" + data.CUL_LIFE +"\"  phone=\"" + data.PHONE + "\"  address=\"" + data.ADDRESS + "\">";
            html += "<div class=\"close_i\" id=\"close_i\" cultureNo=\"" + data.CUL_LIFE_NUM  + "\" cateNm=\"culture\" ></div>";
            html += "<div class=\"content\">";
            html += "<div class=\"main\">";
            html += "<div class=\"parking_name\">" + data.CUL_LIFE+"</div>";
            html += "<div class=\"parking_info\">";
            html += "<div class=\"phone\">"+ data.PHONE +"</div>";
            html += "<div class=\"address\">" + data.ADDRESS + "</div>";       
            html += "</div>";
            html += "</div>";
           	html += "</div>";
           	html += "</div>";
		}
			$(".cultrue_bookmark_wrap .result_area").html(html);
	}
 
 
//영화관 즐겨찾기
 function cinemaBookmarkReloadList() {
 	var params = $("#headerForm").serialize();
 	
 	$.ajax({
 		url : "cinemaBookmarkList",
 		type : "POST", 
 		dataType: "json", 
 		data: params, 
 		success : function(res) { 
 			cinemaBookmarkDrawList(res.list);
 		},
 		error : function(request, status, error) { 
 			console.log(request.responseText); 
 		}
 	}); 
 	
 }

  function cinemaBookmarkDrawList(list) {	  
 		var html = "";	
 		
 		if(list.length == 0){
			html += "<div class=\"text\">즐겨찾기 된 장소가 없습니다.</div> ";
		} 

 		for(var data of list){		
	
 			 html += "<div class=\"box\" id=\"cinemaBox\" cinemaNm=\"" + data.ENT_NM +"\"  phone=\"" + data.PHONE + "\"  address=\"" + data.PARCEL_NUM + "\">";
             html += "<div class=\"close_i\" id=\"close_i\" cinemaNo=\"" + data.CINEMA_MAG_NUM  + "\" cateNm=\"cinema\"></div>";
             html += "<div class=\"content\">";
             html += "<div class=\"main\">";
             html += "<div class=\"parking_name\">" + data.ENT_NM+"</div>";
             html += "<div class=\"parking_info\">";
             if(data.PHONE != null){
            	 html += "<div class=\"phone\">"+ data.PHONE +"</div>"; 
             }
             html += "<div class=\"address\">" + data.PARCEL_NUM + "</div>";       
             html += "</div>";
             html += "</div>";
             html += "</div>";
             html += "</div>";
 		}
 			$(".cinema_bookmark_wrap .result_area").html(html);
 	}


  // 주유소 즐겨찾기
 function gasstationBookmarkReloadList() {
 	var params = $("#headerForm").serialize();
 	
 	$.ajax({
 		url : "gasstationBookmarkList",
 		type : "POST", 
 		dataType: "json", 
 		data: params, 
 		success : function(res) { 
 			gasstationBookmarkDrawList(res.list);
 		},
 		error : function(request, status, error) { 
 			console.log(request.responseText); 
 		}
 	}); 
 	
 }

  function gasstationBookmarkDrawList(list) {
 		var html = "";
 		
 		if(list.length == 0){
			html += "<div class=\"text\">즐겨찾기 된 장소가 없습니다.</div> ";
		} 

 		for(var data of list){		
	
 			 html += "<div class=\"box\" id=\"gasstationBox\" gasstationNm=\"" + data.GAS_NM +"\"  phone=\"" + data.PHONE + "\"  address=\"" + data.PARCEL_NUM + "\">";
             html += "<div class=\"close_i\" id=\"close_i\" gasstationNo=\"" + data.GAS_STATION_NUM  + "\" cateNm=\"gasStation\"></div>";
             html += "<div class=\"content\">";
             html += "<div class=\"main\">";
             html += "<div class=\"parking_name\">" + data.GAS_NM+"</div>";
             html += "<div class=\"parking_info\">";
             html += "<div class=\"phone\">"+ data.PHONE +"</div>";
             html += "<div class=\"address\">" + data.PARCEL_NUM + "</div>";       
             html += "</div>";
             html += "</div>";
             html += "</div>";
             html += "</div>";
 		}
 			$(".gasstation_bookmark_wrap .result_area").html(html);
 	}


  // 음식점 즐겨찾기
 function restaurantBookmarkReloadList() {
 	var params = $("#headerForm").serialize();
 	
 	$.ajax({
 		url : "restaurantBookmarkList",
 		type : "POST", 
 		dataType: "json", 
 		data: params, 
 		success : function(res) { 
 			restaurantBookmarkDrawList(res.list);
 		},
 		error : function(request, status, error) { 
 			console.log(request.responseText); 
 		}
 	}); 
 	
 }

  function restaurantBookmarkDrawList(list) {
 		var html = "";	
 		
 		if(list.length == 0){
			html += "<div class=\"text\">즐겨찾기 된 장소가 없습니다.</div> ";
		} 

 		for(var data of list){		
 			
 			 html += "<div class=\"box\" id=\"restaurantBox\" restaurantNm=\"" + data.ENT_NM +"\"  phone=\"" + data.PHONE + "\"  address=\"" + data.PARCEL_NUM + "\">";
             html += "<div class=\"close_i\" id=\"close_i\" restaurantNo=\"" + data.RESTAURANT_NO  + "\" cateNm=\"restaurant\"></div>";
             html += "<div class=\"content\">";
             html += "<div class=\"main\">";
             html += "<div class=\"parking_name\">" + data.ENT_NM+"</div>";
             html += "<div class=\"parking_info\">";
             html += "<div class=\"phone\">"+ data.PHONE +"</div>";
             html += "<div class=\"address\">" + data.PARCEL_NUM + "</div>";       
             html += "</div>";
             html += "</div>";
             html += "</div>";
             html += "</div>";
 		}
 			$(".restaurant_bookmark_wrap .result_area").html(html);
 	}
  
  
  function goDetail(car_num){
	 	//잘 넘어오면 금액표 팝업을 보여주자.
	 	$("#fee_car_num").val(car_num);
	 	var html = "";
		
	 	var params = $("#goForm").serialize();
		$.ajax({
			url : "parkFeeDetail", //경로
			type : "POST", //전송방식(GET: 주소형태, Post : 주소 헤더형태)
			dataType : "json", //데이터 형태
			data : params, //보낼 데이터
			success : function(res){// 성공했을때 겨로가를 res에 받고 함수실행
				html += "<tr>";
		      	html += "<th colspan=\"2\" style=\"background-color:lightgray;\">"+res.data.CAR_PARK_NM+"</th>";
		      	html += "</tr>";
				html += "<tr>";
		      	html += "<th>평일 유/무료구분</th>";
		      	html += "<td>"+res.data.PAYORFREE_DIV+"</td>";
		      	html += "</tr>";
		        html += "<tr>";
		      	html += "<th>토요일 유/무료 구분</th>";
		      	html += "<td>"+res.data.SATURDAY_PAYORFREE_DIV+"</td>";
		        html += "</tr>";
		        html += "<tr>";
		        html += "<th>공휴일 유/무료 구분</th>";
		      	html += "<td>"+res.data.HOLIDAY_PAYORFREE_DIV+"</td>";
		        html += "</tr>";
		        html += "<tr>";
		      	html += "<th>정액권</th>";
		      	html += "<td>"+res.data.FULLTIME_MONTHLY+"</td>";
		        html += "</tr>";
		        html += "<tr>";
		      	html += "<th>기본 주차 시간</th>";
		      	html += "<td>"+res.data.TIME_RATE+"</td>";
		        html += "</tr>";
		        html += "<tr>";
		      	html += "<th>기본 요금</th>";
		      	html += "<td>"+res.data.FEE_RATE+"</td>";
		        html += "</tr>";
		        html += "<tr>";
		      	html += "<th>추가 단위 시간</th>";
		      	html += "<td>"+res.data.ADD_TIME_RATE+"</td>";
		        html += "</tr>";
		        html += "<tr>";
		      	html += "<th>추가 요금</th>";
		      	html += "<td>"+res.data.ADD_FEE+"</td>";
		        html += "</tr>";
		        
		        $("#feeTablePopup tbody").html(html);
				$("#feeTablePopup").show();
				
			},
			error : function(request, status, error){
				makeAlert("알림", "빠른 시일 내에 준비하겠습니다.");
				console.log(request.responseText);
			}
		});
		
		
	}
	 
	function feeCom(car_num,starttime,endtime,payorfree_div, fee_rate, add_time_rate, time_rate, add_fee, re_fee_rate, re_add_fee, title) {//요금비교하려고 배열에 담았다.
	 	//1583756 '00:00' '00:00' '유료' '150' '5' '5' '150' '150' '150' '민속의집 공영주차장(구)'
	 	var cnt = 0;
	 	
	 	for(var data of feeComArray) {
			if(data.car_num == car_num) { //이미 데이터가 있다면 더 추가 못하게.(중복 피하기)
				cnt++;
			}
			
		}
	 	
	 	if(cnt == 0) {
			feeComArray.push({car_num: car_num, starttime: starttime, endtime: endtime, payorfree_div:payorfree_div, fee_rate:fee_rate, add_time_rate:add_time_rate, time_rate:time_rate, add_fee:add_fee ,re_fee_rate:re_fee_rate, re_add_fee:re_add_fee, title: title});
		}
	 	
	 	var html = "";
		for(var data of feeComArray){
			 html +="<div class=\"box\">";
	         html +="<div class=\"close_i\" no=\""+data.car_num+"\"></div>";
	         html +="<div class=\"parking_name\">"+data.title+"</div>";
	         html +="<div class=\"parking_info\">";
	         html +="<span class=\"time\">"+data.starttime+"~"+data.endtime+"</span>";
	         html +="   <span style=\"color:black;\">₩"+ data.re_fee_rate +"(5분단위)</span>";
	         html +="<br/><span class=\"pay\">"+data.payorfree_div+"</span> ";
	         html +="<span class=\"detail\" onclick=\"goDetail("+data.car_num+")\">금액표</span>";
	         html +="</div>";
	         html +="<div class=\"box_inner_i\">";
	         html +="<div class=\"bookmark_i\"></div>";
	         /* html +="<div class=\"share_i\"></div>"; */
	         html +="</div>";
	         html +="</div>";
		}
		$("#feeComArea").html(html); 
	}

	function feeComx(){
		var html = "";
		for(var data of feeComArray){
			 html +="<div class=\"box\">";
	         html +="<div class=\"close_i\" no=\""+data.car_num+"\"></div>";
	         html +="<div class=\"parking_name\">"+data.title+"</div>";
	         html +="<div class=\"parking_info\">";
	         html +="<span class=\"time\">"+data.starttime+"~"+data.endtime+"</span>";
	         html +="   <span style=\"color:black;\">₩"+ data.re_fee_rate +"(5분단위)</span>";
	         html +="<br/><span class=\"pay\">"+data.payorfree_div+"</span> ";
	         html +="<span class=\"detail\" onclick=\"goDetail("+data.car_num+")\">금액표</span>";
	         html +="</div>";
	         html +="<div class=\"box_inner_i\">";
	         html +="<div class=\"bookmark_i\"></div>";
	         html +="<div class=\"share_i\"></div>";
	         html +="</div>";
	         html +="</div>";
		}
		$("#feeComArea").html(html); 
	}
	
	// 카카오 공유하기
	 Kakao.init('e41934107d35da0fcd73a47e8bc1ca9e'); // 사용하려는 앱의 JavaScript 키 입력

	 function shareMessage(num) {
	   Kakao.Share.sendDefault({
	     objectType: 'feed',
	     content: {
	       title: '공영주차장 상세보기',
	       description: '#주차장 #리뷰 #나만의P',
	       imageUrl:
	          '', 
	       link: {
	         mobileWebUrl: 'http://localhost:8090/MyP/parkinfodetail?no='+num,
	         webUrl: 'http://localhost:8090/MyP/parkinfodetail?no='+num
	       },
	     }/* ,
	     social: {
	       likeCount: 286,
	       commentCount: 45,
	       sharedCount: 845,
	     } *//* ,
	      buttons: [
	       {
	         title: '웹으로 보기',
	         link: {
	           mobileWebUrl: 'https://developers.kakao.com',
	           webUrl: 'https://developers.kakao.com',
	         },
	       },
	       {
	         title: '앱으로 보기',
	         link: {
	           mobileWebUrl: 'https://developers.kakao.com',
	           webUrl: 'https://developers.kakao.com',
	         },
	       },
	     ],  */
	   });
	 }
			 
</script>
</head>
<body>
<form action="#" id="bookmarkForm" method="post">
	<input type="hidden" id="sendRestaurantNum" name="restaurantNum"  /> <!-- 영화관번호 -->
	<input type="hidden" id="sendGasStationNum" name="gasStationNum"  /> <!-- 주유소변호 -->
	<input type="hidden" id="sendCinemaNum" name="cinemaNum"  /> 		 <!-- 영화관번호 -->
	<input type="hidden" id="sendCultureNum" name="cultureNum"  />       <!-- 문화생화번호 -->
	<input type="hidden" id="sendParkingNum" name="parkingNum"  />       <!-- 주차장번호 -->
	<input type="hidden" id="sendMemNum" name="memNum" />                <!-- 회원번호 -->
</form>
<form action="#" id="disForm" method="post">
	<input type="hidden" id="locx" name="locx" />
	<input type="hidden" id="locy" name="locy" />
	<input type="hidden" id="carnum" name="carnum" />
</form>
<form action="#" id="carDetailForm" method="post">
	<!-- 상세보기 페이지로 이동하려고 -->
	<input type="hidden" id="car_num" name="car_num">
</form>
<form action="#" id="goForm" method="post">
	<!-- 요금계산 - 금액표 팝업 -->
	<input type="hidden" id="fee_car_num" name="fee_car_num">
</form>
<!-- 상세보기 팝업창 -->
<div id="detailTablePopup" class="detailTablePopup" style="display: none;">
	<div class="close_i">
      	<img src="${pageContext.request.contextPath}/resources/icons/close.png" alt="">
   	</div>
	<table>
	     <colgroup>
	     	<col width="200">
	     	<col width="150">
	     </colgroup>
	   	<caption>상세보기</caption>
	   	<tbody>
	   	</tbody>
    </table>
</div>
<!-- 요금표 팝업창 -->
<div id="feeTablePopup" class="feeTablePopup" style="display: none;">
	<div class="close_i">
      	<img src="${pageContext.request.contextPath}/resources/icons/close.png" alt="">
   	</div>
	<table>
	     <colgroup>
	     	<col width="200">
	     	<col width="150">
	     </colgroup>
	   	<caption>상세보기</caption>
	   	<tbody>
	   	</tbody>
    </table>
</div>
<c:import url="/header"></c:import>
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
              <select name="sido1" id="sido1"></select>
              <select name="gugun1" id="gugun1"></select>
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
                      <div class="swiper-wrapper"></div>
                      <div class="swiper-button-prev"></div>
                      <div class="swiper-button-next"></div>
                  </div>
              </div>
          </div>
          </div>
        </div>
         <!-- 요금계산 -->
        <div class="calc_wrap">
         	<c:import url="/calc_wrap"/>
        </div>
         <!-- 최단거리 비교 -->
        <div class="distance_wrap">
          <div class="title">최단거리 비교</div>
          <div class="result_area" id="shortDistanceArea">
          <div class="text">거리를 비교할 장소를 선택해주세요</div>
        </div>
        </div>
        <!-- 북마크 -->
        <c:choose>
			<c:when test="${empty sMemNm}">
				<div class="bookmark_wrap">
			       <div class="title">즐겨찾기</div>
			       <div class="result_area">
			          <div class="text">로그인 후 이용 가능합니다.</div> 
			        </div>
			     </div> 
			</c:when>
			<c:otherwise>
				<div class="bookmark_wrap">
			       <div class="title">즐겨찾기</div>
			       <div class="result_area">
			          <div class="file" id="parkingBookmark">
			             <div class="file_i"></div>
			             <div class="file_txt">주차장</div>
			          </div>
			          <div class="file" id="restaurantBookmark">
			             <div class="file_i"></div>
			             <div class="file_txt">음식점</div>
			          </div>
			          <div class="file" id="cultrueBookmark">
			             <div class="file_i"></div>
			             <div class="file_txt">문화생활</div>
			           </div>
			           <div class="file" id="gasstationBookmark">
			             <div class="file_i"></div>
			             <div class="file_txt">주유소</div>
			           </div>
			           <div class="file" id="cinemaBookmark">
			             <div class="file_i"></div>
			             <div class="file_txt">영화관</div>
			           </div>
			        </div>
			     </div>  
			</c:otherwise>
	  </c:choose>
	   <div class="parking_bookmark_wrap">
          <div class="title p40">주차장 즐겨찾기</div>
          <div class="result_area">
          	<div class="text">즐겨찾기 된 장소가 없습니다.</div>
          </div>
      </div>
      <div class="restaurant_bookmark_wrap">
          <div class="title p40">음식점 즐겨찾기</div>
          <div class="result_area">
          	<div class="text">즐겨찾기 된 장소가 없습니다.</div>
          </div>
      </div>
      <div class="cultrue_bookmark_wrap">
          <div class="title p40">문화생활 즐겨찾기</div>
          <div class="result_area">
          	<div class="text">즐겨찾기 된 장소가 없습니다.</div>
          </div>
      </div>
      <div class="gasstation_bookmark_wrap">
          <div class="title p40">주유소 즐겨찾기</div>
          <div class="result_area">
          	<div class="text">즐겨찾기 된 장소가 없습니다.</div>
          </div>
      </div>
      <div class="cinema_bookmark_wrap">
          <div class="title p40">영화관 즐겨찾기</div>
          <div class="result_area">
          	<div class="text">즐겨찾기 된 장소가 없습니다.</div>
          </div>
      </div>
      <!-- 리뷰 -->
        <div class="review_wrap">
         <div class="title">리뷰</div>
          <div class="select_box">
          <select id="selectx" name="selectx">
              <option value="1">높은별점순</option><!-- ㅎㅎ -->
              <option value="2">최신순</option>
            </select>
          </div>
          <div class="standard" id="car_park_nm" style="text-align: center; font-size: 16px; padding: 20px 0px 5px 0px;"></div>
          <input type="hidden" id="carparknum" value="" />
          <div class="result_area">
          <!-- 리뷰 비동기화처리 -->
          </div>
          <div class="btn_wrap">
          	<c:choose>
				<c:when test="${empty sMemNo}"></c:when>
				<c:otherwise>
            		<input type="button" class="bottom_btn review_btn" id="writeReview" value="리뷰 작성" />
            	</c:otherwise>
            </c:choose>
          </div>
        </div>
        <div class="accident_wrap">
          <div class="result_area">
          	<div class="title">사건, 사고 정보</div>
         	 <div class="result_box">0건</div>
			<div class="text">조회중입니다. 잠시만 기달려주세요...</div>
          </div>
        </div>
      </div>
    </div>
    <div class="right_area1">
      <div id="map"></div>
      <ul id="category">
        <li id="restaurant"> 
        	<img alt="" width="20" height="20" src="https://map.pstatic.net/res/category/image/00023-00032.png">
            음식점
        </li>       
        <li id="gasStation"> 
           	<img alt="" width="20" height="20" src="https://map.pstatic.net/res/category/image/00023-00078.png">
            주유소
        </li>  
        <li id="cinema"> 
            <img class="movies" alt="" width="20" height="20" src="https://map.pstatic.net/res/category/image/00023-00046.png">
            영화관
        </li>  
        <li id="culture"> 
            <img alt="" width="20" height="20" src=" https://map.pstatic.net/res/category/image/00023-00058.png">
            문화생활
        </li>      
    </ul> 
    </div>
  </main>
<c:import url="/footer"></c:import>
 
<!-- 가이드(챗봇 아님)-->
<c:import url="/guideMain"/>

<!-- 리뷰 팝업 -->
<c:import url="/reviewPopup2"/> <!-- raty가 이 안에 있음. -->

<!-- 신고하기 팝업 -->
<div id="warning_popup">
    <form action="#" id="actionForm2" method="post">
      <input type="hidden" name="memno" id="memno" value="${sMemNo}" />
      <input type="hidden" name="send" id="send" /><!-- review_num -->
      <div class="close_i">
          <img src="${pageContext.request.contextPath}/resources/icons/close.png" alt="">
      </div>
      
      <div class="popup_top">
          <div class="title">💥신고💥</div>
      </div>
      <hr/>
      <div class="popup_content"></div>
      <hr/>
      <div class="warningBtn_wrap" style="text-align: center">
          <input type="button" value="신고" id="warningBtn">
      </div>
  </form>
</div>
</body>
</html>