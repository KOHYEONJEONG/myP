$(document).ready(function () {
		
    // 메인 페이지 아이콘 클릭시 왼쪽영역 변경
    $(".icons.first").click(function () {
        $('.search_warp').addClass('on');
        $('.search_warp').siblings().removeClass('on');
    })
    $(".icons.second").click(function () {
        $('.calc_wrap').addClass('on');
        $('.calc_wrap').siblings().removeClass('on');  
    })
    $(".icons.third").click(function () {
        $('.distance_wrap').addClass('on');
        $('.distance_wrap').siblings().removeClass('on');  
    })
    $(".icons.fourth").click(function () {
        $('.bookmark_wrap').addClass('on');
        $('.bookmark_wrap').siblings().removeClass('on');  
    })
    $(".icons.fifth").click(function () {
        $('.review_wrap').addClass('on');
        $('.review_wrap').siblings().removeClass('on');  
    })
    $(".icons.sixth").click(function () {
        $('.accident_wrap').addClass('on');
        $('.accident_wrap').siblings().removeClass('on');  
    })
    // 구현중
    // $(".icon.end").click(function () {
    //     $('.left_area').css({"width" : "50px"});
    //     $('#map').css({"width" : "100%"});
    //     $('.right_area').css({"width" : "100%"});
    // })

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

    $(".warning_i").click(function () {
        document.getElementById("warning_popup").style.display = "block";
        $('main').css({"opacity" : "0.5","pointer-events":"none"});
        $('header').css({"opacity" : "0.5","pointer-events":"none"});
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


});