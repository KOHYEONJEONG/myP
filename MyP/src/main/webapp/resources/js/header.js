$(document).ready(function () {
	if($("#mem_num").val() != null && $("#mem_num").val() != ""){
		img1Relod();
	}
	
	notireload();
	
	// 헤더
	// 로그인 아이콘 클릭시, 마이페이지, 로그아웃
   if($(".login_comment").hasClass("on")){
		var sessionData = $("#sMemAuto").val();//세션가져옴.

        $(".login_i1").off().click(function () {
           
            var hasOn1 = $("#login_box").hasClass("on");

            if (hasOn1) {
				$("#login_box").removeClass("on");
				
            } else {
				$("#login_box").addClass("on");
				
				if(sessionData == "관리자"){
					$("#login_box").removeClass();
					$("#login_box").addClass('login_box2 on');
				}
            }
            
        });//$(".login_i1").off()
        
    } else {
        $(".login_i").click(function () {
        location.href = "login";
        })
    }
    
    $("#logoutBtn").on("click", function () {
		location.href = "logout";
	});
	
	$("#myPage").on("click", function () {
		location.href = "myPage";
	});
		
		
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
    
	//header, header1 공통사항
    //클릭시 페이지 이동
    $("#logo").click(function() {
		location.href = "home";
	})
    
    $("#parkinfo").click(function() {
		location.href = "parkinfo";
	})
	
	$("#notice").click(function() {
		location.href = "notice";
	})
	
	$("#faq").click(function() {
		location.href = "faq";
	})
	
	$("#qna").click(function() {
		location.href = "qna";
	})
	
	$("#system").click(function() {
		location.href = "rankingSystemGoodParking";
	})
	
	$("#system2").click(function() {
		location.href = "rankingSystemGoodParking";
	})
	
	$("#fee").click(function() {
		location.href = "rankingFeeReasonableBoard";
	})
	
	$("#fee2").click(function() {
		location.href = "rankingFeeReasonableBoard";
	})
   
		
	//관리자 페이지
	$("#managerPage").click(function(){
		location.href = "memManagement"; //수정해야함.
	});
	
	
	
});

function notireload() {
	var params = $("#headerNotiForm").serialize();
	
	$.ajax({
		url : "hnoticeList",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			notidraw(res.list);
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); 
	
}

 function notidraw(list) {
		var html = "";
	
		for(var data of list){
			html +="<div class=\"swiper-slide\">" + data.TITLE+ "</div>"
		}
		
		$(".swiper-container1 .swiper-wrapper").html(html);
		
		
	const mySwiper = new Swiper('.swiper-container1', {
		   direction: "vertical",
		  autoplay: {
		    delay: 5000,
		    disableOnInteraction: true // 쓸어 넘기거나 버튼 클릭 시 자동 슬라이드 정지.
		  },
		  loop: true,
		  on: {
			click: function(){
				// activeIndex는 현재 슬라이드 되는 인덱스, 화면상 3개의 리스트가 보이지만
				// 실제로는 5개로 돌아간다, 그래서 % 3 해
				var index = this.activeIndex % 3
				var notiNo = "";
				// data.NOTICE_NUM 는 가져오는 리스트의 가장 적은 숫자로 가져옴
				if(index == 1){
					console.log(data.NOTICE_NUM + 2);
					notiNo = data.NOTICE_NUM + 2;
				} else if(index == 2){
					 console.log(data.NOTICE_NUM + 1);
					 notiNo = data.NOTICE_NUM + 1;
				} else {
					 console.log(data.NOTICE_NUM);
					 notiNo = data.NOTICE_NUM;
				}
				$("#notiNo").val(notiNo);
				
				$("#headerNotiForm").attr("action", "noticeDetail");
				$("#headerNotiForm").submit();
			}
		}
		})

	}
    
//사진 영역만 비동기화
function img1Relod() {
	var params = $("#headerForm").serialize();
	$.ajax({
		url : "memImgAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) {
			img1(res.data);
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
}
//<img class=\"memImg\" rel=\"group1\" src=\"resources/upload/"+img+"\" data-link=\"resources/upload/"+img+"\"/>
function img1(data){
	var img = data.IMG;
	var html = "";
	
	if(img != null && !img.length == 0){
		html += "<img id=\"myImg\" class=\"memImg\" rel=\"group1\" src=\"resources/upload/"+img+"\" data-link=\"resources/upload/"+img+"\"/>";
	}else{
		html += "<img id=\"myImg\" src=\"resources/icons/person3.png\" alt=\"이미지\">";
	}
	
	$(".login_i1").html(html);
}