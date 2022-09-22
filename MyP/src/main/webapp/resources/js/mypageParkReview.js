$(document).ready(function () {
	//행을 누르면 상세보기로 이동~
	$("tbody").on("click", "tr", function() {
      $("#review_num").val($(this).attr("no"));
	  $("#actionForm").attr("action","myReviewDetail");
	  $("#actionForm").submit();
   });
   
   
});