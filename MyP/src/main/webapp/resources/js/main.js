var logx = [];
var logy = [];
var title = [];
var feeComArray  = [];//추가 khj
var feeSort = [];
$(document).ready(function () {
		
    // 메인 페이지 아이콘 클릭시 왼쪽영역 변경
    // 메인 페이지 아이콘 클릭시 왼쪽영역 변경
        $('.icons .first').click(function () {
            $('.first').parent().addClass('on');
            $('.first').parent().siblings().removeClass('on')
            $('.search_warp').addClass('on');
            $('.search_warp').siblings().removeClass('on');
        })
        $('.icons .second').click(function () {
            $('.second').parent().addClass('on');
            $('.second').parent().siblings().removeClass('on')
            $('.calc_wrap').addClass('on');
            $('.calc_wrap').siblings().removeClass('on');  
        })
        $('.icons .third').click(function () {
            $('.third').parent().addClass('on');
            $('.third').parent().siblings().removeClass('on')
            $('.distance_wrap').addClass('on');
            $('.distance_wrap').siblings().removeClass('on');  
        })
        $('.icons .fourth').click(function () {
            $('.fourth').parent().addClass('on');
            $('.fourth').parent().siblings().removeClass('on')
            $('.bookmark_wrap').addClass('on');
            $('.bookmark_wrap').siblings().removeClass('on');  
        })
        $('.icons .fifth').click(function () {
            $('.fifth').parent().addClass('on');
            $('.fifth').parent().siblings().removeClass('on')
            $('.review_wrap').addClass('on');
            $('.review_wrap').siblings().removeClass('on');  
        })
        $('.icons .sixth').click(function () {
            $('.sixth').parent().addClass('on');
            $('.sixth').parent().siblings().removeClass('on')
            $('.accident_wrap').addClass('on');
            $('.accident_wrap').siblings().removeClass('on');  
        })
        // 하단 화살표 아이콘 클릭시 왼쪽영역 감추기
        $('.icons .end').click(function () {
            var index = $('.left_section').children('.on').index() + 1;
            console.log(index);

            var hasOn2 = $('.icons .end').hasClass('on')
            if (hasOn2) {
                $('.icons .end').removeClass('on');
                $('.left_section').css({'display' : 'none'});
                $('.left_area').css({'width' : '50px'});
                $('.rigth_area1').css({'width' : '100%'});
                $('#map').css({'width' : '100%'});
                $('.icons .end').parent().siblings().removeClass('on')
            } else {
                $('.icons .end').addClass('on');
                $('.left_area').css({'width' : '400px'});
                $('.left_section').css({'display' : 'block'});
                switch(index) {
                    case 1:  $('.icons .first').parent().addClass('on')
                        break;
                    case 2:  $('.icons .second').parent().addClass('on')
                        break;
                    case 3:  $('.icons .third').parent().addClass('on')
                        break;
                    case 4:  $('.icons .fourth').parent().addClass('on')
                        break;
                    case 5:  $('.icons .fifth').parent().addClass('on')
                        break;
                    case 6:  $('.icons .sixth').parent().addClass('on')
                        break;
                  }
            }
        })
        
    // 구현중
    // $(".icon.end").click(function () {
    //     $('.left_area').css({"width" : "50px"});
    //     $('#map').css({"width" : "100%"});
    //     $('.right_area').css({"width" : "100%"});
    // })
	
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
		  
	$("#search_i").on("click", function(){
		//feeComArray  = [];//요금비교 영역 모두 지우기
		//feeSort = [];
		//$("#feeComArea").children().remove(); //UI에서 지우기(주석처리 한 이유는 여러곳에서 선택할 수 있어서)
		$("#time_rate").val(0);
		
		var params = $("#actionForm").serialize();
		$.ajax({
			url : "HomeAjax",
			type : "POST",
			dataType: "json",
			data: params,
			success : function(res){
				//console.log(res);
				//console.log(res.cnt);
				searchList(res.list);
				mapList(res.list);
				//console.log(res.list.length);
			},
			error : function(request, status, error) { 
				console.log(request.responseText); 
			}
		})
		
	});

    $(".review_btn").click(function () {
        document.getElementById("review_popup").style.display = "block";
        $('main').css({"opacity" : "0.5","pointer-events":"none"});
        $('header').css({"opacity" : "0.5","pointer-events":"none"});
    })

    $("#review_popup .close_i").click(function () {
        document.getElementById("review_popup").style.display = "none";
        $('main').css({"opacity" : "1","pointer-events":"auto"});
        $('header').css({"opacity" : "1","pointer-events":"auto"});
    })

   
    $("#warning_popup .close_i").click(function () {
        document.getElementById("warning_popup").style.display = "none";
        $('main').css({"opacity" : "1","pointer-events":"auto"});
        $('header').css({"opacity" : "1","pointer-events":"auto"});
    })

    $(".refuseBtn").click(function () {
        document.getElementById("refuse_popup").style.display = "block";
        $('main').css({"opacity" : "0.5","pointer-events":"none"});
        $('header').css({"opacity" : "0.5","pointer-events":"none"});
    })

    $("#refuse_popup .close_i").click(function () {
        console.log("1");
        document.getElementById("refuse_popup").style.display = "none";
        $('main').css({"opacity" : "1","pointer-events":"auto"});
        $('header').css({"opacity" : "1","pointer-events":"auto"});
    })

    // header
    //서브메뉴 다운
    $('.main_menu > li').hover(function () {
        h = $(this).find('.sub_menu').outerHeight();
        t = $("header").outerHeight();
        $('.header_bg').addClass('on').css({
            height: h,
            top : t - 0.1
        });
        $('.header_bg').addClass('on').css({
            height: 80
        });
        $(this).find('.sub_menu').show();

        var positionLeft = $(this).position().left;
        var w = $(this).outerWidth();

        $('.curr_bar').addClass('on').css({
            left: positionLeft,
            width: w,
          
        })
       /* $(this).find('.sub_menu').css({
            // * 10 추가함
            width: w * 4
        });
        
 
*/
    }, function () {
        $('.sub_menu').hide()
        $('.header_bg').addClass('on').css({
            height: 0
        });
        $('.curr_bar').removeClass('on')
    })
    

    // 챗봇
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
    
     // 툴팁
    //tooltip 생성
   /* $(".tooltip_event").tooltip();*/

    /*$('#contents').summernote({
        placeholder: '게시글을 작성하시오',
        width:900,
        height: 700,
        maxHeight: 400,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
          ]
    });*/
/*$("#feeCompareBtn").on("click", function(){//사이드바에 있는 요금 비교 버튼
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
*/
});//document.ready


/* function searchList(list){
	 var html = "";
	 html += "<div class=\"result_box\">" +list.length+ "</div>";
	 for(var data of list){		
		 html += "<div class=\"box\">";
         html += "<div class=\"close_i\"></div>";
         html += "<div class=\"parking_name\">" + data.CAR_PARK_NM + "</div>";
         html += "<div class=\"parking_info\">";
         html += "<span class=\"time\">" + data.STARTTIME + " "+"~"+" " + data.ENDTIME + "</span>";
         html += "<span class=\"pay\">유료</span>";
         html += "<span class=\"detail\">상세보기</span>"; 
         html += "</div>";
         html += "<div class=\"box_inner_i\">";
         html += "<div class=\"bookmark_i\"></div>";
         html += "<div class=\"share_i\"></div>";
         html += "</div>";
         html += "</div>";
	 }
	 //console.log(html);
	 //console.log(list.length);
	 $('.result_area2').html(html);
 } */
 
/*function mapList(list){
	 
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
		 
		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
	     // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	     (function(marker, infowindow) {
	    	 // 마커에 클릭이벤트를 등록합니다
			 kakao.maps.event.addListener(marker, 'click', function() {
				  // 다른 마커를 클릭했을때, 이전 팝업창 닫힘
				  $("img[alt='close']").click();//개발자도구에서 x버튼의 속성에 접근한것.
			      // 마커 위에 인포윈도우를 표시합니다
		      	  infowindow.open(map, marker);
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

}*/
 
/*function goDetail(car_num){
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
}*/
