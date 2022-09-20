$(document).ready(function () {
	selectCheck();
});

function selectCheck(){
	$(".row2 .input_box2.right #emailGbn option").each(function() {
		if($(this).html() == "${param.domain}") {//엔티티로 비교해야하기에 .html()
			$(this).prop("selected", true);
		}
	});
}

/*
function reloadList(){
	var params = $("#actionForm").serialize();
   $.ajax({
	   url : "memList/update",
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
   });
}
*/