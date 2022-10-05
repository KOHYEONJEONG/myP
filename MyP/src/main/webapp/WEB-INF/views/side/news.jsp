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
    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=e41934107d35da0fcd73a47e8bc1ca9e&libraries=services"></script>
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="resources/js/proj4.js"></script>
<script type="text/javascript">
$(document).ready(function() {
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
	
	$(".result_area").on("click", function() {
		
		// 기존 검색상태 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchTxt").val($("#oldTxt").val());
		
		$("#actionForm").attr("action", "ATDetail");
		$("#actionForm").submit();
	});
	
	$("#search_i").on("click", function() {
		
	$.ajax({
		
		url :"http://openapi.seoul.go.kr:8088/7067696175776b6437334374514f54/xml/AccInfo/1/20/", 
		type :"GET", 
		dataType :"xml", 
		success : function(xml) { 
			console.log(xml);
			
			var logx = [];
			var logy = [];
			// xml 형식 json으로 바꿈
			var xmlData = $(xml).find("row");
			console.log(xmlData);
			var listLength = xmlData.length;
			
			console.log(listLength);
			
			if(listLength > 0) {
				
				var html = "";				
		
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
				   console.log(($(this).find("grs80tm_x").text() * 1).toFixed(1)); 
				   const p = proj4(grs80, wgs84, [($(this).find("grs80tm_x").text() * 1).toFixed(1) * 1, ($(this).find("grs80tm_y").text() * 1).toFixed(1) * 1]);				 

				   console.log(p); 

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
				
				$(".result_area").html(html);
				
				
				
 				 $.ajax({
		         type:"post",
		         url:"trafficAccidentList", 
		         dataType : "json",
		         success : function(res) {
		        	 console.log(res.list);
		        	 console.log(res.list[0].ACC_TYPE);
		        	 console.log(res.list.length);
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
        <div class="accident_wrap on">
          <div class="search_box">
            <div class="box_top">
              <select name="sido1" id="sido1">

              </select>
              <select name="gugun1" id="gugun1">
           
              </select>
            </div>
            <div class="box_bottom">
              <input type="text" class="search_txt" placeholder="검색어를 입력하세요" />
              <div class="search_i" id= "search_i"></div>
            </div>
          </div>
          </form>
          
          <div class="result_area">
            <div class="result_box"></div>           
          </div>
        </div>
      </div>
    </div>
    <div class="right_area1">
      <div id="map"></div>
    </div>
  </main>
<c:import url="/footer"></c:import>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	 center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
</script>

</body>
</html>