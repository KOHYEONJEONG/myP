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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script><!--추가-->
  <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script> <!--추가-->
  <script src="resources/js/weather.js"></script><!--추가-->
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=e41934107d35da0fcd73a47e8bc1ca9e&libraries=services"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <script src="resources/js/main.js"></script>
   <script src="resources/js/header.js"></script>
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
<script type="text/javascript" src="resources/script/common/popup.js"></script>      
<script type="text/javascript">
 
  var logx = [];
  var logy = [];
  var title = [];
  
  $(document).ready(function() {
	
	
	   var area0 = ["구","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area1 = ["동","개포동","논현동","도곡동","대치동","삼성동","수서동","신사동","세곡동","압구정동","역삼동","율현동","일원동","자곡동","청담동"];
	   var area2 = ["동","강일동","고덕동","길동","둔촌동","명일동","상일동","성내동","암사동","천호동"];
	   var area3 = ["동","미아동","번동","수유동","우이동"];
	   var area4 = ["동","가양동","개화동","공항동","과해동","내발산동","등촌동","마곡동","방화동","염창동","오곡동","오쇠동","외발산동","화곡동"];
	   var area5 = ["동","남현동","봉천동","신림동"];
	   var area6 = ["동","광장동","구의동","군자동","능동","자양동","중곡동","화양동"];
	   var area7 = ["동","가리봉동","개봉동","고척동","구로동","궁동","신도림동","오류동","온수동","천왕동","항동"];
	   var area8 = ["동","가산동","독산동","시흥동"];
	   var area9 = ["동","공릉동","상계동","월계동","중계동","하계동"];
	   var area10 = ["동","도봉동","방학동","쌍문동","창동"];
	   var area11 = ["동","답십리동","신설동","용두동","이문동","장안동","전농동","제기동","청량리동","회기동","휘경동"];
	   var area12 = ["동","노량진동","대방동","동작동","본동","사당동","상도동","신대방동","흑석동"];
	   var area13 = ["동","공덕동","구수동","노고산동","당인동","대흥동","도화동","동교동","마포동","망원동","상수동","상암동","서교동","성산동","신수동","아현동","연남동","염리동","용강동","중동","창전동","토정동","합정동"];
	   var area14 = ["동","남가좌동","북가좌동","북아현동","신촌동","연희동","홍은동","홍제동"];
	   var area15 = ["동","내곡동","반포동","방배동","서초동","신원동","양재동","우면동","원지동","잠원동"];
	   var area16 = ["동","금호동1가","금호동2가","금호동3가","금호동4가","도선동","마장동","사근동","상왕십리동","성수동1가","성수동2가","송정동","옥수동","용답동","응봉동","하왕십리동","홍익동","행당동"];
	   var area17 = ["동","길음동","돈암동","동선동","보문동","삼선동","석관동","성북동","안암동","월곡동","장위동","정릉동","종암동"];
	   var area18 = ["동","가락동","거여동","마천동","문정동","방이동","삼전동","석촌동","송파동","신천동","오금동","장지동","잠실동","풍납동"];
	   var area19 = ["동","목동","신월동","신정동"];
	   var area20 = ["동","당산동","대림동","도림동","문래동","신길동","양평동","여의도","영등포동"];
	   var area21 = ["동","남영동","보광동","서빙고동","용문동","용산동","이촌동","이태원동","청파동","한강로","한남동","효창동","후암동"];
	   var area22 = ["동","갈현동","구산동","녹번동","대조동","불광동","수색동","신사동","역촌동","응암동","증산동","진관동"];
	   var area23 = ["동","가회동","무악동","부암동","사직동","삼청동","숭인동","이화동","종로1.2.3.4가동","창신동","청운동","평창동","혜화동"];
	   var area24 = ["동","다산동","동화동","소공동","신당동","을지로","장충동","중림동","필동","황학동","회현동"];
	   var area25 = ["동","망우동","면목동","묵동","상봉동","신내동","중화동"];
	   
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
						  break;
					  case "fail":
						  makeAlert("알림","신고에 실패하였습니다.");
						  break;
					  case "error":
						  makeAlert("알림","신고등록 중 문제가 발생하였습니다.");
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
	  
	  
	  $("body").on("click", ".warning_i", function () {
	        document.getElementById("warning_popup").style.display = "block";
	        $('main').css({"opacity" : "0.5","pointer-events":"none"});
	        $('header').css({"opacity" : "0.5","pointer-events":"none"});
	  });
	    
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
		  
		  
		 $("body").on("click", ".phone2", function(){//리뷰 버튼
			 $("#carparknum").val($(this).attr("no"));
			 $("#car_park_nm").html($(this).attr("nm"));
			 reviewReload();
			/*  $("img[alt='close']").click(); */
		 });
		  

		$("#search_i").on("click", function(){//검색 버튼
			mapReload();
  		});
		
});//document
  
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
 
  function warningPopup(review_num) {
   	 $("#send").val(review_num); //actionForm2에 있는 send <-- review_num담기
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
         html += "</div>";
         html += "<div class=\"box_inner_i\">";
         html += "<div class=\"bookmark_i\"></div>";
         html += "<div class=\"share_i\"></div>";
         html += "</div>";
         html += "</div>";
	 }
	 $('.result_area2').html(html);
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
		 	carparknum: data.CAR_PARK_MAG_NUM
		 });
		
		 
		 points.push(new kakao.maps.LatLng(data.LOCX, data.LOCY));
	 }

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "resources/icons/park_marker4.png"; 
		    
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
		        image : markerImage, // 마커 이미지 
		        clickable: true
		    });
		    
			 
		    var iwContent = "<div class=\"bg\"><div class=\"title\">" + positions[i].title +"</div>";
		    	iwContent += "<input type=\"hidden\" id=\"carparknum\" value=\"" + positions[i].carparknum + "\" />";
	        	iwContent += "<span class=\"Star\" data-score=\"" +positions[i].starscore +"\"></span>";
		    	iwContent += "<span class=\"phone2\" no=\""+positions[i].carparknum+"\" nm=\""+positions[i].title+"\"> "+"리뷰"+" " + positions[i].review + "</span>";
		    	iwContent += "<div class=\"address\">"+ positions[i].starttime + " "+"~"+" " + positions[i].endtime + "</div>";
		    	iwContent += "<span class=\"pay\">유료</span>";
		    	iwContent += "<div class=\"buttonBox\">";
		    	iwContent += "<div class=\"bookmarkBox\">";
		    	iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"boomarkBtn\" class=\"boomarkBtn\">";
		    	iwContent += "</div>";
		    	iwContent += "<div class=\"shareBox\">";
		    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
		    	iwContent += "</div>";
		    	iwContent += "<div class=\"compareBox\">";
		    	iwContent += "<button class=\"compareBoxBtn\">최단거리비교</button>";
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
  </script>
</head>
<body>
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
          <select id="selectx" name="selectx">
              <option value="1">높은별점순</option>
              <option value="2">최신순</option>
            </select>
          </div>
          
          
          <div class="standard" id="car_park_nm" style="text-align: center; font-size: 16px; padding: 20px 0px 5px 0px;"></div>
          <input type="hidden" id="carparknum" value="" />
          <div class="result_area">
          <!-- 리뷰 비동기화처리 -->
          </div>
          
          
          <div class="btn_wrap">
            <input type="button" class="bottom_btn review_btn" id="writeReview" value="리뷰 작성" />
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
 
<!-- 가이드(챗봇 아님)-->
<c:import url="/guideMain"/>

<!-- 리뷰 팝업 -->
<c:import url="/reviewPopup2"/>

<!-- 신고하기 팝업 -->
<div id="warning_popup">
  <form action="#" id="actionForm2" method="post">

  	<input type="hidden" name="send" id="send" />
      <div class="close_i">
          <img src="${pageContext.request.contextPath}/resources/icons/close.png" alt="">
      </div>
      <div class="popup_top">
          <div class="title">제목</div>
          <div class="input">
              <input type="text" name="title" class="txt_title" >
              <input type="hidden" name="memno" value="${sMemNo}"/>
          </div>
      </div>
      <div class="popup_middle">
          <div class="writer">작성자</div>
          <div class="input">
              <input type="text" name="writer" class="txt_writer" value="${sMemNm}" readonly>
          </div>
      </div>
      <hr/>
      <div class="popup_content">
          <div class="note">※여러사유에 해당하는 경우 대표적인 사유 1개만 골라주세요.</div>
          <div class="choice_label"> <사유선택> </div>
          <div>
              <input type="radio" name="selete" value="4" checked>
              <label style="font-size:12px;">부적절한 홍보 게시글</label>
          </div>
          <div>
              <input type="radio" name="selete" value="5" checked>
              <label style="font-size:12px;">음란성 및 청소년에게 부적절한 게시글</label>
          </div>
          <div>
              <input type="radio" name="selete" value="6" checked>
              <label style="font-size:12px;">명예훼손/사생활 침해 및 저작권침해 등</label>
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