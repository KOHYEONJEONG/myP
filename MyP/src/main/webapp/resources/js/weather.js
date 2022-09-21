$(document).ready(function(){
    /*5시간 일기예보..하지만 더 늘여야할듯??*/
    var dt = new Date(); //이게 현재시간은 더 정확하당
    var month = dt.getMonth() +1 +".";
    var day = dt.getDate();
    
    $(".day2").html(month+day);

    $.getJSON('http://openapi.seoul.go.kr:8088/75554e67576b6f303133366941626663/json/ListAvgOfSeoulAirQualityService/1/5/'
 ,function(result){
        /*서울시 실시간 대기환경 평균 현황(미세먼지)*/
        $('.fineDust2').html(result.ListAvgOfSeoulAirQualityService.row[0].GRADE);    
        if((result.ListAvgOfSeoulAirQualityService.row[0].GRADE) == "보통"){
            $('.fineDust2').css({"color" : "#00b686"});
        }  
    });

    $.getJSON('http://api.openweathermap.org/data/2.5/forecast?id=1835848&APPID=ab4b94596d87701c72ecaf24d6f9e37c&units=metric&lang=KR'
 ,function(result){
        /*현재 시간, 날씨, 강수확률, 습도*/

        var cIcon = '<img src="http://openweathermap.org/img/wn/'+result.list[0].weather[0].icon+'.png" alt="'+result.list[0].weather[0].description+'" >';    
        var ctype=result.list[0].weather[0].description;
        $('.icon').html(cIcon);
        $('.iconMean').html(ctype);
        $('.probability2').html(result.list[0].clouds.all+"%");
        $('.humidity2').html(result.list[0].main.humidity+"%");

       // $('.temp_min').html(Math.round(result.list[0].main.temp_min)+"°");//최저
       // $('.temp_max').html(Math.round(result.list[0].main.temp_max)+"°");//최고
});

    $.getJSON('https://api.openweathermap.org/data/2.5/onecall?lat=37.5683&lon=126.9778&appid=ab4b94596d87701c72ecaf24d6f9e37c&units=metric&lang=KR',
    function(result){//result는 날씨 예보 값
        
        for(var i = 0; i<8; i++){ 
            var ctime = result.daily[i].dt; 
            var cMin = result.daily[i].temp.min;
            var cMax = result.daily[i].temp.max;
            
            //현재 시간(보기 쉽게 변경)
            function convertTime(ctime){ 
                var ot = new Date(ctime*1000); //밀리초여서 1000을 곱했다.
                
                var dt = ot.getDate();//날짜
                var hr = ot.getHours();//시간

                return dt+"-"+hr;
            }
            
            //var currentTime = convertTime(ctime,cM);
            var currentTime = convertTime(ctime);
            var time = currentTime.split('-');

            //오늘인지 확인
            var dt = new Date();
            var day = dt.getDate();
            if(day == time[0]){
                day = "오늘";
            }else{
                day = time[0]+"일";
            }

            var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+result.daily[i].weather[0].icon+'.png" alt="'+result.hourly[i].weather[0].description+'" >';
            

            if(day=="오늘"){
                $('.temp_min').html(Math.round(cMin)+"°");//최저
                $('.temp_max').html(Math.round(cMax)+"°");//최고
            }else{
                var bottomHtml = '<div class="swiper-slide">' + 
                    '<div class="weather">'+
                    '<div>'+day+'</div>'+
                    '<div>'+wiconUrl+'</div>'+
                    '<div>' +
                    '<span class="blue">' + Math.round(cMin)+"°" + '</span>' +
                    '<span>' + "/" + '</span>' +
                    '<span class="red">' + Math.round(cMax)+"°"+'</span>'+
                    '</div>' +
                    '</div>' +
                '</div>';
                $('.mySwiper .swiper-wrapper').append(bottomHtml);  
            }
            
    }

    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 4,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        }
    });

    });


});