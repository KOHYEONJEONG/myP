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
	reGuideList();
	var flag= false;
	$('.contents').on("click",".footer input[type='button']",function(){//동적으로 만들었기에 이렇게 접근해야한다.
		//var tNo = $(this).parent().parent().parent().children().eq(2).html();
		//var tNo = $(this).parent().parent().children().eq(1).children().eq(1).attr("no");
		//console.log($(this).parent().parent().children().eq(1).children().eq(1).children().eq(0).html());
		//console.log(tNo);
		
		//console.log($(".contents:nth-last-child(4)"));//왜 안될까???
		if($(this).attr("back")=='-2'){//처음으로
			$(".contents").html('');
			$("#oldAcon").val('');
			$('#top_num').val('');
			flag= false
			reGuideList();
		}
	});
	
	$('.contents').on("click",".response input[type='button']",function(){//동적으로 만들었기에 이렇게 접근해야한다.
		if($(this).attr("cnt") > 0){
			
			if($(this).attr("no") == 'undefined'){
				$('#top_num').val('');
			}else{
				$('#top_num').val($(this).attr("no"));
			}
			
			$("#oldNum").val($(this).attr("top")); 
			$("#oldAcon").val($(this).attr("con"));
			
			var answer = "<div class=\"answer\">";
			answer += "<div class=\"icons\">";
			answer +="<div class=\"img\"></div>";
			answer +="</div>";
			answer +="<div class=\"text_wrap\">";
			answer +="<div class=\"b\">";
			answer +="<input type=\"button\" no=\""+$(this).attr("no")+"\" value=\""+$(this).val()+"\"/>";//이전으로 돌아갈때 사용할 no
			answer +="</div>";
			answer +="<div class=\"time\">"+formatAMPM()+"</div>";
			answer +="</div>";
			answer +="</div>";
			
			$(".contents").append(answer);		
			reGuideList();
			
		}else{
			
			if($(this).attr("no") == '6'){
				window.open('parkinfo');//새창에서 띄울려고
			}else if($(this).attr("no") == '7'){
				window.open('rankingSystemGoodParking');
			}else if($(this).attr("no") == '25'){
				window.open('qna');//새창에서 띄울려고
			}else if($(this).attr("no") == '26'){
				window.open('faq');
			}else{
				var html ="";
	        	html += "<div class=\"response\">";
	        	html += "<div class=\"icons\">";
	        	html += "<div class=\"img\"></div>";
	        	html += "</div>";
	        	html += "<div class=\"text_wrap\">";
	        	html += "<div class=\"text\">준비중인 메뉴입니다. 양해부탁드리겠습니다.</div>";
	        	html += "<div class=\"time\">"+formatAMPM()+"</div>";
	        	html += " </div>";
	        	html += " </div>";
				html += "<div class=\"footer\">";
				html += "<input back=\"-2\" cnt=\""+0+"\" type=\"button\" value=\"[처음으로]\"/>";
				html += "</div>";
	        
				$(".contents").append(html);
			}
		}
		
		flag = false;
	});

});
function reGuideList() {
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
	
	var oldNum = $("#oldNum").val();
	
	var html = "<div class=\"response\">";
	html += "<div class=\"icons\">";
	html +="<div class=\"img\"></div>";
	html +="</div>";
	html +="<div class=\"text_wrap\">";
	if($("#oldAcon").val() == 'undefined' || $("#oldAcon").val() == '' ){
		html +="<div class=\"text\">안녕하세요<br/>주차장의 모든것을 제공하는 <span class=\"bold\">나만의 P</span> 입니다<br/>문의사항 선택해주세요</div>";
	}else{
		html +="<div class=\"text\">"+$("#oldAcon").val()+"</div>";
	}
	
	html +="<div class=\"b\">";
	var backHtml ="";
	for(var data of list){
		html += "<input top=\""+data.TOP_CHATBOT_NUM+"\" no=\""+data.GUIDE_NUM+"\" cnt=\""+data.CNT+"\" con=\""+data.ANSWER_CON+"\" type=\"button\" value=\""+data.MENU+"\"/>";
		
		if(data.TOP_CHATBOT_NUM != null){
			backHtml = "<input no=\""+oldNum+"\" cnt=\"1\" type=\"button\" value=\"[이전으로]\"/>";	
		}
	}
	//flag = true;	
	html += backHtml;
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

<input type="hidden" id="oldNum" value=""/>  
<input type="hidden" id="oldAcon" value=""/>

<form action="#" id="guideForm" method="post">
	<input type="hidden" id="top_num" name="top_num"/>
</form>

<div class="guide_wrap">
	<img src="${pageContext.request.contextPath}/resources/icons/chatrobot.svg" alt="" class="guideButton">
	<div class="guide">
		<div class="header" style="font-size: 14px;">나만의 P 가이드</div>
		<div class="contents"></div>
	</div>
</div>
</body>
</html>