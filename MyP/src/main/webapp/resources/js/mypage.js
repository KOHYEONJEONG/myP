$(document).ready(function () {
	
	reloadList();
	
	$("#info_modify").click(function(){
		//개인정보 수정하기 버튼
		$("#sendForm").attr("action", "memModify");
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
						   $("#att").val(res.fileName[0]);//올라간 파일명 보관(서버에서 파일이름 알맞게 바꿔서 보내줌.)
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
								reloadList();
								break;
							case "fail":
								makeAlert("알림","등록에 실패하였습니다");
								break;
							case "error":
								makeAlert("알림","등록 중 문제가 발생하였습니다");
								break;
		
							}
					   },
					   error : function(resques) {
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

function reloadList(){
	//사진때문에 리로드 해야할듯.
}