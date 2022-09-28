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
    <link rel="stylesheet" href="resources/rety/jquery.raty.css">
    <script src="resources/jquery/jquery.xml2json.js"></script>
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="resources/rety/jquery.raty.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		
		url :"http://openapi.seoul.go.kr:8088/7067696175776b6437334374514f54/xml/AccInfo/1/10/", 
		type :"GET", 
		dataType :"xml", 
		success : function(xml) { 
			console.log(xml);

			
			var xmlData = $(xml).find("row");
			var listLength = xmlData.length;
			
			console.log(listLength);
			
			if(listLength > 0) {
				var html = "";
				$(xmlData).each(function() {
					
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
					
		  			
					html += "<div class=\"box\">";
		            html += "  <div class=\"accident_title " + $(this).find("acc_type").text() + "\"></div>";
		            html += "  <div class=\"accident_period\">"+ sdate1 +" "+ sdate2 +" "+ sdate3 +" "+"/"+" "+ stime1 +" "+":"+" "+ stime2 +" "+"~"+" "+ edate1 +" "+ edate2 +" "+ edate3 +" "+"/"+" "+ etime1 +" "+":"+" "+ etime2 +"</div>";
		            html += "  <div class=\"accident_info\">"+ $(this).find("acc_info").text() +"</div>";
		            html += "</div>	";
					
		            
				})
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
      <div class="left_section">
        <div class="accident_wrap on">
          <div class="search_box">
            <div class="box_top">
              <select name="gu">
                <option value="" disabled selected>전체</option>
                <option value="">강남구</option>
              </select>
              <select name="dong">
                <option value="" disabled selected>전체</option>
                <option value="">논현동</option>
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
    </div>
  </main>
<c:import url="/footer"></c:import>
</body>
</html>