<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	relodeList();
	
	$('.contents').on("click",".response input[type='button']",function(){//동적으로 만들었기에 이렇게 접근해야한다.
		console.log("click");
		
		//$(this).attr(cnt)
		
		if($(this).attr("cnt") > 0){
	
			$('#top_num').val($(this).attr("no"));
			var answer = "<div class=\"answer\">";
			answer += "<div class=\"icons\">";
			answer +="<div class=\"img\"></div>";
			answer +="</div>";
			answer +="<div class=\"text_wrap\">";
			answer +="<div class=\"text_wrap\">";
			answer +="<div class=\"b\">";
			answer +="<input type=\"button\" value=\""+$(this).val()+"\"/>";
			answer +="</div>";
			answer +="<div class=\"time\">"+formatAMPM()+"</div>";
			answer +="</div>";
			answer +="</div>";
			
			$(".contents").append(answer);		
			relodeList();
		
			if($(this).attr("no") == 25){
				window.open('qna');//새창에서 띄울려고
			}else if($(this).attr("no") == 26){
				window.open('faq');
			}
		}else{
			var reset = "<div class=\"preparing\">준비중...</div>"
			reset += "<div class=\"footer\">";
			reset += "<input type=\"button\" value=\"[이전으로]\"/>";
			reset += "<input type=\"button\" value=\"[처음으로]\"/>";
			reset += "</div>";
        
			$(".contents").append(reset);	
		}
		
		
	});

});
function relodeList() {
	var params = $("#guideForm").serialize();
	$.ajax({
		url : "GuideListAjax", 
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) {
			drawList(res.list);
			
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
}

function drawList(list) {
	console.log("list===>"+list);
	var html = "<div class=\"response\">";
	html += "<div class=\"icons\">";
	html +="<div class=\"img\"></div>";
	html +="</div>";
	html +="<div class=\"text_wrap\">";
	html +="<div class=\"text\">안녕하세요<br/>주차장의 모든것을 제공하는 <span class=\"bold\">나만의 P</span> 입니다<br/>문의사항 선택해주세요</div>";
	html +="<div class=\"b\">";
		
	for(var data of list){
		html += "<input no=\""+data.GUIDE_NUM+"\" cnt=\""+data.CNT+"\" type=\"button\" value=\""+data.MENU+"\"/>"
	}
	html += "</div>";
	html += "<div class=\"time\">"+formatAMPM()+"</div>";
	html += "</div>";
	html += "</div>";
	
	$(".contents").append(html);	
}

function formatAMPM(){//am 2 : 00
	var date = new Date();
	var minutes = date.getMinutes();
	var hours = date.getHours();
	var ampm = hours >= 12 ? '오후': '오전';
	hours = hours % 12;
	hours = hours ? hours : 12; // the hour '0' should be '12'
	minutes = minutes < 10 ? '0'+minutes : minutes;
	return ampm+' '+ hours + ':' + minutes;
}
</script>
</head>
<body>

<form action="#" id="guideForm" method="post">
	<input type="hidden" id="top_num" name="top_num"/>
</form>

<div class="chatbot_wrap">
  <img src="${pageContext.request.contextPath}/resources/icons/chatrobot.svg" alt="" class="chatrobot">
  <div class="chatbot">
    <div class="header">나만의 P 챗봇</div>
    <div class="contents">
    
     <!--    <div class="response">
            <div class="icons">
                <div class="img"></div>
            </div>
            <div class="text_wrap">
            	기본 멘트
                <div class="text">안녕하세요<br/>주차장의 모든것을 제공하는 <span class="bold">나만의 P</span> 입니다<br/>문의사항 선택해주세요</div>
                <div class="b"></div>
                <div class="time"></div>
            </div>
        </div>   -->
        
         <!-- 
        <div class="answer">
            <div class="icons">
                <div class="img"></div>
            </div>
            <div class="text_wrap">
            <div class="b">
                <input type="button" value="정기권"  />
            </div>
            <div class="time">오후 2:01</div>
            </div>
        </div>
        <div class="response">
            <div class="icons">
                <div class="img"></div>
            </div>
            <div class="text_wrap">
                <div class="text">정기권 관련하여 안내해 드릴게요. <br/> 상세 질문을 선택해 주세요.</div>
                <div class="b">
                   <input type="button" value="1. 취소,환불"/>
                    <input type="button" value="2. 비용문의"  />
                    <input type="button" value="3. 일일주차장"  />
                    <input type="button" value="4. 할인방법"  />
                </div>
                <div class="time">오후 2:02</div>
            </div>
        </div>
        -->
          
    </div>
<!-- 	<div class="footer">
	            <input type="button" value="새 질문하기" />
	        </div>  -->
</div>
</div>
</body>
</html>