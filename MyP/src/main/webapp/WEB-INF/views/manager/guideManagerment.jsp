<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지(챗봇관리)</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/chatbot.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font.css">
<script src="resources/jquery/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<style type="text/css">
.proton-demo {
	max-width: 100%;
	padding: 10px;
	border-radius: 3px;
}

.table_wrap .search_box {
	width: 70px;
	height: 35px;
	border: 1px solid #e6e6e6;
	background: rgb(255, 255, 255);
	background: linear-gradient(to bottom, rgb(255, 255, 255) 0%,
		rgb(229, 229, 229) 100%);
	font-size: 20px;
	text-align: center;
	box-sizing: border-box;
	text-align: center;
	font-size: 14px;
	line-height: 33px;
	cursor: pointer;
}

.insert_btn {
	width: 70px;
	height: 35px;
	border: 1px solid #FD9A29;
	background: #FD9A29;
	color: #fff;
	font-size: 20px;
	text-align: center;
	box-sizing: border-box;
	text-align: center;
	font-size: 14px;
	line-height: 33px;
	cursor: pointer;
	margin-top: 10px;
	float: right;
}

#jstree {
	width: 300px;
	height: 450px;
	border: 1px solid black;
	overflow: scroll;
}

.s_title {
	width: 200px;
	height: 40px;
	line-height: 40px;
	margin-left: 5px;
	font-size: 24px;
}

.table_wrap {
	width: 400px;
	top: 230px;
	left: 50%;
	transform: translateX(-50%);
	position: absolute;
}

.table_wrap table {
	width: 400px;
}

.table_wrap.first {
	left: 30%
}

.table_wrap.second {
	left: 75%;
}

#plugins4_q {
	width: 292px;
	height: 20px;
	margin-bottom: 15px;
	display: block;
	padding: 4px;
	border-radius: 2px;
	border: 1px solid black;
}
</style>
<script type="text/javascript">
$(function() {

  var to = false;
  $('#plugins4_q').keyup(function () {
    if(to) { clearTimeout(to); }
    to = setTimeout(function () {
      var v = $('#plugins4_q').val();
      $('#jstree').jstree(true).search(v);
    }, 250);
  });
  
  //ajax
  reloadeGuideList();
  

  });//function()
  
function reloadeGuideList() {
	var params = $("#managerGuideForm").serialize();
	$.ajax({
		url : "managerGuideAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) {
//			console.log(res.list);

			//jsTree Api 가져와서 사용 : 무조건 jsTree 사이트 참고하고 참고해야해!!!(기본 충실)
			var data = new Array();//array를 사용하여 list를 담아주기!~
			for(var item of res.list) {
				var tcn = "#";//jsTree 사이트에서 맨처음 부모에는 #을 넣어줬기에 똑같이 해줬음
				if(typeof(item.TOP_CHATBOT_NUM) != "undefined") {
					tcn = item.TOP_CHATBOT_NUM;
				}
				data.push({id:item.GUIDE_NUM, parent:tcn, text:item.MENU});// 현재 no, 상위 no, menu
			}
			
			console.log(data);
			
			$('#jstree').jstree({ 'core' : { 'data' : data }, //데이터 넣어주기
			 	"plugins" : [ "search" ] //검색
			 }); 
			
			
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
} 	  
</script>
</head>
<body>
	<c:import url="/header1"></c:import>
	
	<form action="#" id="managerGuideForm" method="post">
		<!-- 클릭하면 해당 글에 CON 보이게 하려고-->
		<input type="hidden" id="guide_num" name="guide_num"/>
		<input type="hidden" id="con" name="con"/>
	</form>
	
	<main>
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">관리자페이지</div>
				<div class="inner">
					<div onclick="location.href='memManagement'">회원관리</div>
					<div class="on">가이드관리</div>
					<div>데이터관리</div>
					<div>신고리뷰관리</div>
					<div>카테고리관리</div>
				</div>
			</div>
			<div class="right_area">
				<div class="table_wrap first">
					<input type="text" id="plugins4_q" class="input"
						placeholder="카테고리 검색">
					<div id="jstree">
					</div>
				</div>

				<div class="table_wrap second">

					<div class="insert_btn" id="insertBtn">추가</div>
					<textarea></textarea>

				</div>
			</div>


		</div>

	</main>

	<c:import url="/footer"></c:import>
</body>
</html>