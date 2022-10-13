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
	
	
	/*관리자페이지 - 반려사유 버튼 */
    $(".refuseBtn").click(function () {
        document.getElementById("refuse_popup").style.display = "block";
        $('main').css({"opacity" : "0.5","pointer-events":"none"});
        $('header').css({"opacity" : "0.5","pointer-events":"none"});
    })
    
	/*관리자페이지 - 반려사유 팝업 닫기 */
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

	

});//document.ready



