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
	
	function relodeList() {
		var params = $("#guideForm").serialize();
		$.ajax({
			url : "GuideListAjax",
			type : "POST", 
			dataType: "json", 
			data: params, 
			success : function(res) {
				img(res.data);
				img1Relod();
			},
			error : function(request, status, error) { 
				console.log(request.responseText); 
			}
		}); //Ajax End
	}


});
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
        <div class="response">
            <div class="icons">
                <div class="img"></div>
            </div>
            <div class="text_wrap">
                <div class="text">안녕하세요<br/>주차장의 모든것을 제공하는 <span class="bold">나만의 P</span> 입니다<br/>문의사항 선택해주세요</div>
                <!--  
                <div class="b">
                    <input type="button" value="환경설정"/>
                    <input type="button" value="정기권"  />
                    <input type="button" value="이용안내" />
                    <input type="button" value="요금감면"  />
                </div>
                -->
                <div class="time">오후 2:00</div>
            </div>
        </div>  
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
       
        <div class="footer">
            <input type="button" value="새 질문하기" />
        </div>   
    </div>

</div>
</div>
</body>
</html>