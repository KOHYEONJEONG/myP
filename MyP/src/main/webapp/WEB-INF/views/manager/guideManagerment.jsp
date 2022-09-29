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
	
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script type="text/javascript" src="resources/script/common/popup.js"></script>

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
/* 
.insert_btn {
	width: 58px;
	height: 30px;
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
	float: right;
	padding: 5px 10px;
}
 */
#jstree {
	width: 300px;
	height: 450px;
	border: 1px solid black;
	overflow: scroll;
    font-size: 10pt;
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
	left: 65%;
	width: 300px;
}

#menuText{
    width: 292px;
    height: 20px;
    margin-top: 30px;
    margin-bottom: 15px;
    padding: 4px;
    border-radius: 2px;
    border: 1px solid black;
}
#conText{
	width: 292px;
	height: 437px;
	padding: 4px;
}

#plugins4_q {
	width: 292px;
	height: 20px;
	margin-top: 15px;
	display: block;
	padding: 4px;
	border-radius: 2px;
	border: 1px solid black;
}

.update_btn{
	width: 58px;
	height: 30px;
	border: 1px solid #00af80;
	background: #00af80;
	color: #fff;
	font-size: 20px;
	text-align: center;
	box-sizing: border-box;
	text-align: center;
	font-size: 14px;
	line-height: 33px;
	cursor: pointer;
	float: right;
	padding: 5px 10px;
}

.btn{
    border: 1px solid transparent;
    margin-bottom: 2px;
    margin-right: 2px;
}
.btn-sm, .btn-xs {
    padding: 5px 10px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}

.btn-success {
    color: #fff;
    background-color: #5cb85c;
    border-color: #4cae4c;
        cursor: pointer;
}

.btn-warning {
    color: #fff;
    background-color: #f0ad4e;
    border-color: #eea236;
        cursor: pointer;
}

.btn-danger {
    color: #fff;
    background-color: #d9534f;
    border-color: #d43f3a;
    cursor: pointer;
}

.btn-uncheck{
   color: #000;
   background-color: #fff;
   border-color: #000;
   cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
  var menu = "";
  //ajax
  reloadeGuideList();
  
  var to = false;
  $('#plugins4_q').keyup(function () { //검색
    if(to) { clearTimeout(to); }
    to = setTimeout(function () {
      var v = $('#plugins4_q').val();
      $('#jstree').jstree(true).search(v);
    }, 250);
  });

  $("#update_btn").on("click", function() {//내용수정
	//con  <들을 웹문자로 변환
    $("#conText").val($("#conText").val().replace(/</gi, "&lt;"));
  	//con dml <들을 웹문자로 변환
    $("#conText").val($("#conText").val().replace(/>/gi, "&gt;"));
  	
  	$("#con").val($("#conText").val());
  	
	action("conUpdate");
  });
  
  $("#btn_create").on("click", function() {//메뉴추가
	  node_create();
	});  
  
  $("#btn_rename").on("click", function() {//메뉴수정
	  node_rename();
	});
  
  $("#btn_delete").on("click", function() {//메뉴삭제
	  node_delete();
	});  
  
  $('#btn_unCheck').on("click", function() {//체크해제
	  $('#jstree').jstree("deselect_all");
  })
  
 
  
  });//function()
 
var msg ={
	"menuInsert" : "메뉴 등록",
	"conUpdate" : "내용 수정",
	"menuUpdate" : "메뉴 수정",
	"menuDelete" : "삭제"
}
  
function action(flag){
  	var params = $("#managerGuideForm").serialize();
  	
  	   $.ajax({
	  		url : "managerGuideAction/"+flag,
	  		type : "POST",
	        dataType : "json", 
	        data : params, 
	        success : function(res) { 
	       	 switch(res.msg){
	            case "success":
	            	console.log("성공");
	            break;
	            case "fail":
	                makeAlert("알림", msg[flag] + "에 실패하였습니다.");
	               break;
	            case "error":
	                makeAlert("알림", msg[flag] +" 중 문제가 발생하였습니다.");
	            break;
	         }
	      },
	      error : function(request, status, error) {
	         console.log(request); 
	      }
	}); //action(flag) function End
  }
function reloadeGuideList() {
	var params = $("#managerGuideForm").serialize();
	$.ajax({
		url : "managerGuideAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) {
			console.log(res.list);

			//jsTree Api 가져와서 사용 : 무조건 jsTree 사이트 참고하고 참고해야해!!!(기본 충실)
			var data = new Array();//array를 사용하여 list를 담아주기!~
			for(var item of res.list) {
				var tcn = "#";//jsTree 사이트에서 맨처음 부모에는 #을 넣어줬기에 똑같이 해줬음
				if(typeof(item.TOP_CHATBOT_NUM) != "undefined") {
					tcn = item.TOP_CHATBOT_NUM;
				}
				
				//
				data.push({id:item.GUIDE_NUM, parent:tcn, text:item.MENU, cnt:item.CNT, type:"default"});// 현재 no, 상위 no, menu
			}
			
			console.log(data);
			
			$('#jstree').jstree({ 'core' : {  
				"animation" : 0,
			    "check_callback" : true,
			    'data' : data  //비동기화로 가져온 데이터 넣어주기
			    },
			  "types" : {
			    "#" : {
			      "max_children" : 1,
			      "max_depth" : 4,
			      "valid_children" : ["root"]
			    },
			    "root" : {
			      "icon" : "/static/3.3.12/assets/images/tree_icon.png",
			      "valid_children" : ["default"]
			    },
			    "default" : {
			      "valid_children" : ["default","file"]
			    },
			    "file" : {
			      "icon" : "glyphicon glyphicon-file",
			      "valid_children" : []
			    }
			  },
			  "plugins" : [
				  "search"
			  ]
			 }).on('changed.jstree', function (e, data) { //오ㅑ 여기서 오류가 터질까????(삭제시)
			    var i, j, r = [];
			    for(i = 0, j = data.selected.length; i < j; i++) {
			    	console.log(data.instance.get_node(data.selected[i]));
			    	$("#guide_num").val(data.instance.get_node(data.selected[i]).id);//선택한 guide_num
			    	
				    	if($("#guide_num").val() != null || $("#guide_num").val() != "undefined"){
					    	reloadSelect();//선택한 메뉴에 '답변내용' 출력하려고
				    	}
			    	
 				    }
		  	}); 

			
			
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
} 	  
  
function node_create() {
	var ref = $("#jstree").jstree(true);
	var sel = ref.get_selected();//id
	//if(!sel.length) { return false; } <-- 아무것도 선택 안했을 때 작동 안하겠다 인데 나는 큰 밖았 폴더도 만들고 싶어서!!! 해제함.
	sel = sel[0];
	if(sel == "undefined" || sel == null){
		sel = '#';
	}
	sel = ref.create_node(sel, {"type":"file"});
	
	console.log(sel);
	if(sel) {
		ref.edit(sel);
	}
	
	$("#top_num").val(ref.get_node(sel).original.parent);
	console.log("부모 : "+ $("#top_num").val());
	
	//action("menuInsert");
	
};
function node_rename() {
	var ref = $("#jstree").jstree(true);
	var sel = ref.get_selected();
	
	console.log(ref.get_selected());
	
	if(!sel.length) { return false; }
	
	sel = sel[0];
	
	//(*)callBack 함수 사용해야함 : 엔터를 누르면 바로 작동되게. 그렇기에 사용해야 했음.
	//그전에 jsTree 사이트와, 해외 구글링해서 callBack 사용법 찾아봤음.
	ref.edit(sel, null, function(node) {
		//console.log(node.text);
		$("#menu").val(node.text);
		action("menuUpdate"); 
	});
	
};

function node_delete() {
	var ref = $("#jstree").jstree(true);
	var sel = ref.get_selected();
	
	console.log(ref.get_node(sel).original.cnt);
	if(!sel.length) { return false; }
	//ref.delete_node(sel);
	if(ref.get_node(sel).original.cnt > 0){
		makeAlert("알림", "하위 메뉴가"+ref.get_node(sel).original.cnt+ "개 있어 삭제 못함.");
	}else{
		action("menuDelete");
		reloadeGuideList();
	}
	
};
function reloadSelect() {
	var params = $("#managerGuideForm").serialize();
	$.ajax({
		url : "managerSelectAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) {
			console.log(res.data);
			if(res.data.ANSWER_CON != "undefined" && res.data.ANSWER_CON != null ){ //undefined가 아니면 null도 아니여야한다.(&& <-- 중요, ||로 하면 안됨.)
				$("#conText").val(res.data.ANSWER_CON);
			}else{
				$("#conText").val('');
				//html()을 사용하면 안되고, val()를 사용하자.(근데 안쓸거임)
				//jquery가 알아서 엔티티를 교체해준다.(근데 안쓸거임)
			}
			
		},error : function(request, status, error) { 
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
		<input type="hidden" id="menu" name="menu"/>
		<input type="hidden" id="top_num" name="top_num" value=""/>
		<input type="hidden" id="sno" name="sno" value="${sMemNo}"/> <!-- 답변내용 책임자 -->
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
					<div id="event_result"></div>
					
						<!-- <button type="button" class="btn btn-success btn-sm" onclick="demo_create();"><i class="glyphicon glyphicon-asterisk"></i> Create</button>
						<button type="button" class="btn btn-warning btn-sm" onclick="demo_rename();"><i class="glyphicon glyphicon-pencil"></i> Rename</button>
						<button type="button" class="btn btn-danger btn-sm" onclick="demo_delete();"><i class="glyphicon glyphicon-remove"></i> Delete</button> -->
						
						<button type="button" class="btn btn-success btn-sm" id="btn_create"><i class="glyphicon glyphicon-asterisk"></i> Create</button>
						<button type="button" class="btn btn-warning btn-sm" id="btn_rename"><i class="glyphicon glyphicon-pencil"></i> Rename</button>
						<button type="button" class="btn btn-danger btn-sm" id="btn_delete"><i class="glyphicon glyphicon-remove"></i> Delete</button>
						<button type="button" class="btn btn-uncheck btn-sm" id="btn_unCheck"><i class="glyphicon glyphicon-remove"></i>Uncheck</button>
					<div id="jstree">
					</div>
					
					<input type="text" id="plugins4_q" class="input"
						placeholder="카테고리 검색">
				</div>

				<div class="table_wrap second">
					<!-- <div class="insert_btn btn btn-sm" id="insert_btn">추가</div> -->
					<div class="update_btn btn btn-sm" id="update_btn">수정</div>
					<textarea name="conText" id="conText" placeholder="답변내용을 입력해주세요."></textarea>
					
				</div>
			</div>


		</div>

	</main>

	<c:import url="/footer"></c:import>
</body>
</html>