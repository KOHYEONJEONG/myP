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
/* 
.restaurant_marker{
	background: url('resources/icons/marker_normal.png') no-repeat -10px -700px;
	width: 34px;
	height: 37px;
} */

		
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
  <script src="resources/jquery/jquery-1.12.4.js"></script>
  <script type="text/javascript">
 
  var logx = [];
  var logy = [];
  var title = [];
  var markers = new Array();
  
  $(document).ready(function() {
	  
	  
	  cultureBookmarkReloadList();

		  
	  
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

		  
		$("#search_i").on("click", function(){
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
			})
			
			
		});
		
		// 문화생활 카테고리 지도에 마커
		$("#culture").on("click", function(){
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
			
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "cultureAjax",
				type : "POST",
				dataType: "json",
				data: params,
				success : function(res){
					// 구, 동 선택 안될시 팝업
					if($("#sido1").val() == "전체" || $("#gugun1").val() == "동" || $("#gugun1").val() == "전체" ){
						makePopup({
					         title : "알림",
					         contents : "구와 동을 선택해주세요",
					         buttons : [{
					            name : "확인",
					         }]
						});
					} else {
						cultureList(res.list);
					}
						
				},
				error : function(request, status, error) { 
					console.log(request.responseText); 
				}
			})
	
		});
		
		//  주유소 카테고리 지도에 마커
		$("#gasStation").on("click", function(){
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
			
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "gasStationAjax",
				type : "POST",
				dataType: "json",
				data: params,
				success : function(res){
					// 구, 동 선택 안될시 팝업
					if($("#sido1").val() == "전체" || $("#gugun1").val() == "동" || $("#gugun1").val() == "전체" ){
						makePopup({
					         title : "알림",
					         contents : "구와 동을 선택해주세요",
					         buttons : [{
					            name : "확인",
					         }]
						});
					} else {
						gasStationList(res.list);
					}
						
				},
				error : function(request, status, error) { 
					console.log(request.responseText); 
				}
			})
	
		});
		
		
		// 음식점 카테고리 지도에 마커
		$("#restaurant").on("click", function(){
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
			
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "restaurantAjax",
				type : "POST",
				dataType: "json",
				data: params,
				success : function(res){
					// 구, 동 선택 안될시 팝업
					if($("#sido1").val() == "전체" || $("#gugun1").val() == "동" || $("#gugun1").val() == "전체" ){
						makePopup({
					         title : "알림",
					         contents : "구와 동을 선택해주세요",
					         buttons : [{
					            name : "확인",
					         }]
						});
					} else {
						restaurantList(res.list);
					}
						
				},
				error : function(request, status, error) { 
					console.log(request.responseText); 
				}
			})
	
		});
		

		// 영화관 카테고리 지도에 마커
		$("#cinema").on("click", function(){
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
			
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "cinemaAjax",
				type : "POST",
				dataType: "json",
				data: params,
				success : function(res){
					// 구, 동 선택 안될시 팝업
					if($("#sido1").val() == "전체" || $("#gugun1").val() == "동" || $("#gugun1").val() == "전체" ){
						makePopup({
					         title : "알림",
					         contents : "구와 동을 선택해주세요",
					         buttons : [{
					            name : "확인",
					         }]
						});
					} else {
						cinemaList(res.list);
					}
						
				},
				error : function(request, status, error) { 
					console.log(request.responseText); 
				}
			})
	
		});
		
		
		$("body").on("click", ".bookmarkBox", function() {
			// 로그인 안된상태,
			if($("#mem_num").val() == ""){ // 헤더에서 세션정보 가지고 있음
			
			
			} else { // 로그인 상태
				
				// 로그인 되면은 세션 회원정보를 넣어줌
				$("#send_mem_num").val($("#mem_num").val());
			
				if($(this).children("img").attr("src") == "resources/icons/bookmark.png" ){
					
				 	var params = $("#cultureForm").serialize();
					$.ajax({
						url : "cultureBookmarkAction/insert",
						type : "POST",
						dataType: "json",
						data: params,
						success : function(res) { 
							switch(res.msg){
							case "success" : 
								// 별이미지 변경하기, 북마크 된 상태 이미지로
								//$(this).children("img").attr("src", "resources/icons/star1.svg")
								// 북마크 리스트 로드
								cultureBookmarkReloadList()
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
					
					var params = $("#cultureForm").serialize();
					$.ajax({
						url : "cultureBookmarkAction/delete",
						type : "POST",
						dataType: "json",
						data: params,
						success : function(res) { 
							switch(res.msg){
							case "success" : 
								// 별이미지 변경하기, 북마크 안 된 상태 이미지로
								//$(this).children("img").attr("src", "resources/icons/bookmark.png")
								// 북마크 리스트 로드
								cultureBookmarkReloadList()
								
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
		
		
		
		
 });
  

    
  
 function searchList(list){
	 console.log("aaaa");
	 var html = "";
	 html += "<div class=\"result_box\">" +list.length+ "</div>";
	 for(var data of list){
		  /* html += "<div class=\"box\">";
		 html +="  <div class=\"accident_title\">"+ data.CAR_PARK_NM  +"</div>";
		 html += "  <div class=\"accident_period\"> " + data.STARTTIME + " "+"~"+" " + data.ENDTIME + "</div>";
		 html += "</div>"; */
		
		 html += "<div class=\"box\">";
         html += "<div class=\"close_i\"></div>";
         html += "<div class=\"parking_name\">" + data.CAR_PARK_NM + "</div>";
         html += "<div class=\"parking_info\">";
         html += "<span class=\"time\">" + data.STARTTIME + " "+"~"+" " + data.ENDTIME + "</span>";
         html += "<span class=\"pay\">유료</span>";
         html += "<span class=\"detail\">상세보기</span>"; 
         html += "</div>";
         html += "</div>";
	 }
	 console.log(html);
	console.log(list.length);
	 $('.result_area2').html(html);
 } 
 
 function mapList(list){
	 
	 var positions = new Array();
	 var points = new Array();
	 for(var data of list) {
		 positions.push({
			title: data.CAR_PARK_NM,
			latlng:new kakao.maps.LatLng(data.LOCX, data.LOCY)
		 });
		 
		 points.push(new kakao.maps.LatLng(data.LOCX, data.LOCY));
	 }

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "re"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
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
			   
		    var iwContent = "<form action=\"#\" id=\"cultureForm\" method=\"post\">";
		    	iwContent += "<input type=\"hidden\" id=\"cultureNum\" name=\"cultureNum\" value="+ positions[i].cultureNum +" />";
		    	iwContent += "<input type=\"hidden\" id=\"send_mem_num\" name=\"memNum\" />";
		    	iwContent += "</form>";
		    	iwContent += "<div class=\"bg\"><div class=\"title\">" + positions[i].title +"</div>";
		    	iwContent += "<div class=\"phone\">" + positions[i].phone +"</div>";
		    	iwContent += "<div class=\"address\">" + positions[i].address +"</div>";
		    	iwContent += "<div class=\"buttonBox\">";
		    	iwContent += "<div class=\"bookmarkBox\">";
		    	iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"boomarkBtn\" class=\"boomarkBtnImg\">";
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

 	}
 	
 	

//주유소 카테고리 지도에 마커 function
function gasStationList(list){
	
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
		     	
		        var iwContent = "<div class=\"bg\"><div class=\"title\">" +  data.GAS_NM +"</div>";
			     	iwContent += "<div class=\"phone\">" + data.PHONE +"</div>";
			    	iwContent += "<div class=\"address\">" + data.PARCEL_NUM +"</div>"; 
			    	iwContent += "<div class=\"buttonBox\">";
			    	iwContent += "<div class=\"bookmarkBox\">";
			    	iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"boomarkBtn\" class=\"boomarkBtnImg\">";
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
		     	
		        var iwContent = "<div class=\"bg\"><div class=\"title\">" +  data.ENT_NM +"</div>";
			     	iwContent += "<div class=\"phone\">" + data.PHONE +"</div>";
			    	iwContent += "<div class=\"address\">" + data.PARCEL_NUM +"</div>"; 
			    	iwContent += "<div class=\"buttonBox\">";
			    	iwContent += "<div class=\"bookmarkBox\">";
			    	iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"boomarkBtn\" class=\"boomarkBtn\">";
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
		     	
		        var iwContent = "<div class=\"bg\"><div class=\"title\">" +  data.ENT_NM +"</div>";
			     	iwContent += "<div class=\"phone\" id=\"phone11\">" + data.PHONE +"</div>";
			    	iwContent += "<div class=\"address\">" + data.PARCEL_NUM +"</div>"; 
			    	iwContent += "<div class=\"buttonBox\">";
			    	iwContent += "<div class=\"bookmarkBox\">";
			    	iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"boomarkBtn\" class=\"boomarkBtn\">";
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
			console.log(res);
			console.log(res.list);
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); 
	
}

 function cultureBookmarkDrawList(list) {
		var html = "";
		
		for(var data of list){
			
			html += "<div class=\"box\">";
            html += "<div class=\"close_i\"></div>";
            html += "<div class=\"content\">";
            html += "<div class=\"main\">";
            html += "<div class=\"parking_name\">" + data.CUL_LIFE+"</div>";
            html += "<div class=\"parking_info\">";
            html += "<div class=\"time\">"+ data.PHONE +"</div>";
            html += "<div class=\"detail mt8\">" + data.ADDRESS + "</div>";       
            html += "</div>";
            html += "</div>";
           	html += "</div>";
		}
		
		$(".cultrue_bookmark_wrap .result_area").html(html);

	}

			 
</script>
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
    <!--     <div class="bookmark_wrap">
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
        </div>  -->
      <div class="cultrue_bookmark_wrap">
          <div class="title p40">문화생활 즐겨찾기</div>
          <div class="result_area">
            
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
          
              <select name="sido1" id="sido1">
               
              </select>
              <select name="gugun1" id="gugun1">
               
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
      </div>
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
     
 
 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 mapOption = { 
  center: new kakao.maps.LatLng(37.5642135, 127.0016985), // 지도의 중심좌표, 서울로맞춰놓음
     level: 3 // 지도의 확대 레벨
 };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



  </script>
  

</body>

</html>