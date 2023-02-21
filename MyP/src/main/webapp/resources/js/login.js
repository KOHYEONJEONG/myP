$(document).ready(function() {
	$("#join").on("click", function() {
		location.href="join";
	});
	
	// 로고 클릭시 메인화면으로 이동
	 $("#logo").on("click", function() {
	  	location.href = "home";		 
	}); 
	
	$("#actionForm").on("keypress", "input", function(event){
		if(event.keyCode == 13){ //이벤트 코드가 엔터가들어오면
			//직접함수호출
			//login();
		
		//버튼 이벤트 발생
		$("#loginBtn").click();
			return false;
		}
	});
	$("#loginBtn").on("click",function(){
		
		frm_check();
		
		if($.trim($("#id").val())==""){
			makeAlert("알림" , "아이디를 입력하세요.", function(){
				$("#id").focus();
			});
			
		}else if($.trim($("#pw").val())==""){
			makeAlert("알림" , "비밀번호를 입력하세요.", function(){
				$("#pw").focus();	
			});	
		}else{
			var params = $("#actionForm").serialize();
			$.ajax({
				url : "checkMemAjax", // 경고수 3회이상인 회원 체크
				type : "POST", 
				dataType : "json", 
				data : params,
				success : function(res){// 성공했을때 겨로가를 res에 받고 함수실행
				console.log(res.msg);
					if(res.msg == "success"){
				
						var params = $("#actionForm").serialize();
						$.ajax({
							url : "loginAjax", //경로
							type : "POST", //전송방식(GET: 주소형태, Post : 주소 헤더형태)
							dataType : "json", //데이터 형태
							data : params, //보낼 데이터
							success : function(res){// 성공했을때 겨로가를 res에 받고 함수실행
								if(res.msg == "success"){
									location.href = "home"
								}else{
									makeAlert("알림", "탈퇴한 회원이거나 아이디나 비밀번호가 틀립니다.");
									$("#id").val("");
									$("#pw").val("");
									$("#id").focus();
								}
							},
							error : function(request, status, error){//실패했을때 함수실행
								console.log(request.responseText);//실패상세내역
							}
						});
					}else{
						makeAlert("알림", "죄송합니다. 회원님은 경고수 3회 초과로 로그인이 불가합니다.");
						$("#id").val("");
						$("#pw").val("");
					}
					
				},
				error : function(request, status, error){//실패했을때 함수실행
					console.log(request.responseText);//실패상세내역
				}
			});
		}//else
		
	});
	
	$("#idFind").on("click", function(){
		location.href = "idFind";
	});
	
	$("#pwFind").on("click", function(){
		location.href = "pwFind";
	});
	
	
	
});