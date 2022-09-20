$(document).ready(function () {
	
	imgRelod();
	
	$("#mypage_modify").click(function(){
		//개인정보 수정하기 버튼
		console.log("도메인-->"+$("#domain").val());//2mypage.js:7 도메인-->naver.com
		$("#sendForm2").attr("action", "memModify");
        $("#sendForm2").submit();   
	});
	
	//memPwUpdate
	$("#password_modify").click(function(){
		//개인정보 수정하기 버튼
		$("#sendForm2").attr("action", "memPwUpdate");
        $("#sendForm2").submit();   
	});
	
	$("#savefile").click(function(){
		if($.trim($("#vPic").val())==""){
		   makeAlert("알림","사진을 첨부해주세요.", function(){
			   return false;
		   });
	    }else{
			var form = $("#actionForm");
			form.ajaxForm({
				   success:function(res){
				   if(res.result == "SUCCESS"){
					   if(res.fileName.length > 0){
						   $("#img").val(res.fileName[0]);//올라간 파일명 보관(서버에서 파일이름 알맞게 바꿔서 보내줌.)
					   }
						   
				   /*글 저장*/
				   var params = $("#actionForm").serialize();
				   $.ajax({
					   url : "memAction/update",
					   type:"POST",
					   dataType:"json",
					   data : params, 
					   success: function(res){
							switch (res.msg) {
							case "success":
								makeAlert("성공","사진 등록 성공");
								imgRelod();
								break;
							case "fail":
								makeAlert("알림","사진 등록 실패하였습니다");
								break;
							case "error":
								makeAlert("알림","사진 등록 중 문제가 발생하였습니다");
								break;
		
							}
					   },
					   error : function(request, status, error) {
							console.log(request.responseText);
					   }//error
				   });//ajax
				
				   
				}else{
					makeAlert("알림", "파일 업로드에<br/> 문제가 발생하였습니다.");
				}
			},error : function() {//에러시
				makeAlert("알림", "파일 업로드에<br/> 문제가 발생하였습니다.");
			}
			
		});//ajaxForm
		form.submit();
	  
	   }//else
	    
	});
	
	
	$("#btn_memWit").on("click", function(){
		//회원 탈퇴 버튼
		$("#sendForm2").attr("action", "withdraw");
        $("#sendForm2").submit();  
	});
	
	$("#myReview").on("click", function(){
		$("#sendForm2").attr("action", "memParkReview");
        $("#sendForm2").submit();  
	});
	
});

//사진 영역만 비동기화
function imgRelod() {
	var params = $("#sendForm2").serialize();
	$.ajax({
		url : "memImgAjax",
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


function img(data){
	var img = data.IMG;
	var html = "";
	
	if(img != null && !img.length == 0){
		html += "<img class=\"memImg\" rel=\"group1\" src=\"resources/upload/"+img+"\" data-link=\"resources/upload/"+img+"\"/>";
	}else{
		html += "<img src=\"resources/icons/person3.png\" alt=\"이미지\">";
	}
	
	$(".my_pic #imgRelod").html(html);
}