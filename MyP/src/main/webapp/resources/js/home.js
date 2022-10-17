const grs80 = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=0,0,0,0,0,0,0";
const wgs84 = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs";
var logx = [];
var logy = [];
var title = [];
var feeComArray  = [];//추가 khj
var feeSort = [];
var mapContainer = null;
var map = null;
var markers = new Array();
$(document).ready(function () {
	
	mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	   center: new kakao.maps.LatLng(37.5642135, 127.0016985), // 지도의 중심좌표, 서울로맞춰놓음
	   level: 3 // 지도의 확대 레벨
	};

	map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
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
	  
	  // 카테고리별 리스트 맵에 띄우기
	  cultureBookmarkReloadList(); 
	  cinemaBookmarkReloadList();
	  gasstationBookmarkReloadList();
	  restaurantBookmarkReloadList();
	  parkingBookmarkReloadList();
	  
	  // 카테고리별 북마크 영역 노출
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

	  
	
	/*리뷰 팝업 띄우기*/
    $(".review_btn").click(function () {
        document.getElementById("review_popup").style.display = "block";
        $('main').css({"opacity" : "0.5","pointer-events":"none"});
        $('header').css({"opacity" : "0.5","pointer-events":"none"});
    })

	/*리뷰 팝업 닫기 */
    $("#review_popup .close_i").click(function () {
        document.getElementById("review_popup").style.display = "none";
        $('main').css({"opacity" : "1","pointer-events":"auto"});
        $('header').css({"opacity" : "1","pointer-events":"auto"});
    })
    
      /*신고 팝업 띄우기 */
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
						  makeAlert("알림","로그인을 하셔야합니다.");
						  break;
					}
	            },
	            error : function(request, status, error) {
	               console.log(request.responseText); 
	            }
	       }); 
	  });
	 
		 

   /*신고 팝업 닫기 */
    $("#warning_popup .close_i").click(function () {
        document.getElementById("warning_popup").style.display = "none";
        $('main').css({"opacity" : "1","pointer-events":"auto"});
        $('header').css({"opacity" : "1","pointer-events":"auto"});
    })
    
    $("#selectx").change(function(){
			  reviewReload();
		  })
		  
	 //리뷰 버튼 클릭시, 리뷰 영역으로 이동
		   $("body").on("click", ".phone2", function(){
			 $("#carparknum").val($(this).attr("no"));
			 $("#car_park_nm").html($(this).attr("nm"));
			 reviewReload();
			/*  $("img[alt='close']").click(); */
		 });
		  
		  
		  // 리뷰에 신고하기 기능
		   $("body").on("click", ".warning_i", function () {
	        document.getElementById("warning_popup").style.display = "block";
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
			
	  });
		  
	
	/*home 검색 버튼 */
   $("#search_i").on("click", function(){
		mapReload();
	});
	
	//가이드
    //.off() 이벤트 버블링 방지
    $(".chatrobot").off().click(function () {
        var hasOn = $(".chatbot").hasClass("on")
        console.log(hasOn);
        if (hasOn) {
            $(".chatbot").removeClass("on");
            $(".chatrobot").attr("src", "resources/icons/chatrobot.svg");

        } else {
            $(".chatbot").addClass("on");
            $(".chatrobot").attr("src", "resources/icons/chat_close.svg");
        }
    });

		// 문화생활 카테고리 지도에 마커
		$("#culture").on("click", function(){
			$("#shortDistanceArea").html('');
			
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
						$("#culture").removeClass('on');
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
			$("#shortDistanceArea").html('');
			
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
						$("#gasStation").removeClass('on');
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
			$("#shortDistanceArea").html('');
			
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
						$("#restaurant").removeClass('on');
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
			$("#shortDistanceArea").html(''); //다시 검색했을때 최단거리 기록 지워짐
			
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
						$("#cinema").removeClass('on');
					} else {
						cinemaList(res.list);
					}	
				},
				error : function(request, status, error) { 
				}
			})
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
				$("#sendParkingNum").val($("#carparknum").val());
			
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
		
	
	/*주차장 팝업만 있음, 요금 비교 버튼 */
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
		         html +="   <span style=\"color:red;\">₩"+data.re_fee_rate*time+"</span>";
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
	
	/*금액표 팝업 닫기*/
	$("#feeTablePopup .close_i").click(function () {
		$("#feeTablePopup").hide();
	    $('main').css({"opacity" : "1","pointer-events":"auto"});
	    $('header').css({"opacity" : "1","pointer-events":"auto"});
	});
	
	/*금액표 사이드 box 삭제*/
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

});

 function reaviewList(reaviewList){
		 var html = "";
		 html += "<div class=\"standard\">"+reaviewList[0].CAR_PARK_NM +"</div>";
		 for(var data of reaviewList){
	     html += "<div class=\"box pr40\">                        ";
	     html += "<div class=\"nickname\">"+data.NM +"</div>              ";
	     html += "<div class=\"line\">                            ";
	     html += "<div class=\"stars\">                           ";
	     html += "<div class=\"star_i\"></div>                    ";
	     html += "<div class=\"star_i\"></div>                    ";
	     html += "<div class=\"star_i\"></div>                    ";
	     html += "<div class=\"star_i\"></div>                    ";
	     html += "<div class=\"star_i\"></div>                    ";
	     html += "</div>                                          ";
	     html += "<div class=\"date\">"+data.REG_DT +"</div>            ";
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
	     html += "<div class=\"warning_i\"></div>                 ";
	     html += "</div>                                          ";
	     html += "</div>                                          ";
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
	
	// 주차장
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
	     html += "<label style=\"font-size:12px;\">"+data.CATE_NM +"</label>";
	     html += "</div>";
	 }
    $('#warning_popup .popup_content').html(html);  
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
 
  
  
 
function mapList(list){
	 
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
	//console.log(positions);

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
    	
    	if(positions[i].starscore == 0){
    		iwContent += "<div class=\"phone\">" + " "+"별점없음"+" " + " "+"리뷰없음"+" " + "</div>";	
    	}else {
    	 	iwContent += "<div class=\"phone2\">" + positions[i].starscore + " "+"리뷰"+" " + positions[i].review + "</div>"; 
    	}
    	
    	iwContent += "<div class=\"address\">"+ positions[i].starttime + " "+"~"+" " + positions[i].endtime + "</div>";
    	iwContent += "<span class=\"pay\">"+positions[i].payorfree_div+"</span>";
    	iwContent += " <span class=\"detail\"  onclick=\"goDetail("+positions[i].carparknum+")\">상세보기</span>"; 
    	iwContent += "<div class=\"buttonBox\">";
    	iwContent += "<div class=\"bookmarkBox\">";
    	iwContent += "<img src=\"resources/icons/bookmark.png\" id=\"boomarkBtn\" class=\"boomarkBtn\">";
    	iwContent += "</div>";
    	iwContent += "<div class=\"shareBox\">";
    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
    	iwContent += "</div>";
    	iwContent += "<div class=\"compareBox\">";
    	iwContent += "<button id=\"feeCompareBtn\" class=\"compareBoxBtn\" onclick=\"feeCom("+positions[i].carparknum+",\'"+positions[i].starttime+"\',\'"+positions[i].endtime+"\', \'"+ positions[i].payorfree_div+"\', \'"+ positions[i].fee_rate+"\', \'"+ positions[i].add_time_rate+"\', \'"+ positions[i].time_rate+"\', \'"+ positions[i].add_fee+"\',\'"+positions[i].re_fee_rate+"\',\'"+positions[i].re_add_fee +"\', \'"+positions[i].title+"\')\">요금비교</button>"; // 객체라서 positions[i]로 바로 못보냄!
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
				  $("img[alt='close']").click();//개발자도구에서 x버튼의 속성에 접근한것.
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
		for (i = 0; i < points.length; i++) {// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
		    bounds.extend(points[i]);// LatLngBounds 객체에 좌표를 추가합니다
		}//for
		
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
		    	iwContent += "<button class=\"compareBoxBtn\"onclick=\"getShortDistance("+positions[i].locx+","+positions[i].locy+")\">최단거리비교</button>";
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
 	
function getShortDistance(locx,locy,carnum) { //클릭한거에 넣어줌 
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
				html += "<div class=\"share_i\"></div>";
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
			    	iwContent += "<button class=\"compareBoxBtn\" onclick=\"getShortDistance("+p[1]+","+p[0]+")\">최단거리비교</button>";
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
			    	iwContent += "<img src=\"resources/icons/share.png\" id=\"shareBtn\" class=\"shareBtn\">";
			    	iwContent += "</div>";
			    	iwContent += "<div class=\"compareBox\">";
			    	iwContent += "<button class=\"compareBoxBtn\" onclick=\"getShortDistance("+p[1]+","+p[0]+")\">최단거리비교</button>";
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
			    	iwContent += "<button class=\"compareBoxBtn\" onclick=\"getShortDistance("+p[1]+","+p[0]+")\">최단거리비교</button>";
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
 	$("#car_num").val(car_num);
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
         html +="<div class=\"share_i\"></div>";
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