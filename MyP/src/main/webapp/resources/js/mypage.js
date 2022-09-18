$(document).ready(function () {
	
	imgRelod();
	
	$("#mypage_modify").click(function(){
		//개인정보 수정하기 버튼
		$("#sendForm").attr("action", "memModify");
        $("#sendForm").submit();   
	});
	
	//memPwUpdate
	$("#password_modify").click(function(){
		//개인정보 수정하기 버튼
		$("#sendForm").attr("action", "memPwUpdate");
        $("#sendForm").submit();   
	});
	
	$("#savefile").click(function(){
		if($.trim($("#pic").val())==""){
		   makeAlert("알림","사진을 첨부해주세요.", function(){
			   return false;
		   });
	    }else{
			form.ajaxForm({
				   success:function(res){
				   if(res.result == "SUCCESS"){
					   if(res.fileName.length > 0){
						   $("#img").val(res.fileName[0]);//올라간 파일명 보관(서버에서 파일이름 알맞게 바꿔서 보내줌.)
					   }
						   
				   /*글 저장*/
				   var params = $("#actionForm").serialize();
				   $.ajax({
					   url : "memAction/insert",
					   type:"POST",
					   dataType:"json",
					   data : params, 
					   success: function(res){
							switch (res.msg) {
							case "success":
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
	
});

function imgRelod() {
	var params = $("#sendForm").serialize();
	$.ajax({
		url : "memListAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) {
			console.log("성공")
			img(res.data);
		
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
}


function img(data){
	var html = "";
	
	
	
}