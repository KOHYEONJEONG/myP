$(document).ready(function () {
	
	// 헤더
		// 로그인 아이콘 클릭시, 마이페이지, 로그아웃
       if($(".login_comment").hasClass("on")){
			var sessionData = $("#sMemAuto").val();

			console.log("sessionData==>"+sessionData);
            $(".login_i1").off().click(function () {
               
                var hasOn1 = $("#login_box").hasClass("on");
                console.log("hasOn1--> "+hasOn1);
                if (hasOn1) {
					$("#login_box").removeClass("on");
					
                } else {
					console.log("관리자");
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
    
    