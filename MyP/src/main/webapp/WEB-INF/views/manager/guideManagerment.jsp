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
$(document).ready(function() {
	$('#jstree').jstree({ 'core' : {  
			"animation" : 0,
			"check_callback" : true
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
	}).on('select_node.jstree', function (e, data) { 
		var i, j, r = [];
		
		for(i = 0, j = data.selected.length; i < j; i++) {
			console.log(data.instance.get_node(data.selected[i]));
			$("#guide_num").val(data.instance.get_node(data.selected[i]).id);//선택한 guide_num
				
			if($("#guide_num").val() != null || $("#guide_num").val() != "undefined"){
				reloadSelect();//선택한 메뉴에 '답변내용' 출력하려고
			}
		}
	});
	
  //ajax
  reloadeGuideList();
  
  var to = false;
  $('#plugins4_q').keyup(function () { //jstree 플러그 검색
    if(to) { clearTimeout(to); }
    to = setTimeout(function () {
      var v = $('#plugins4_q').val();
      $('#jstree').jstree(true).search(v);
    }, 250);
  });
  

  $("#update_btn").on("click", function() {//내용수정
	//con <들을 웹문자로 변환
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
  
});
 
var msg ={
	"menuInsert" : "메뉴 등록",
	"conUpdate" : "내용 수정",
	"menuUpdate" : "메뉴 수정",
	"menuDelete" : "삭제"
}
  
function action(flag){
  	var params = $("#managerGuideForm").serialize();
  	console.log(params);
  	
  	   $.ajax({
	  		url : "managerGuideAction/"+flag,
	  		type : "POST",
	        dataType : "json", 
	        data : params, 
	        success : function(res) { 
	       	 switch(res.msg){
	       	 
	       	   //guide_num
	            case "success":
	            	switch (flag) {
	            	case "menuInsert":
	            		reloadeGuideList();
	            		break;
					case "menuDelete":
						reloadeGuideList();
					break;
					}
	            	
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
			//jsTree Api 가져와서 사용 : 무조건 jsTree 사이트 참고하고 참고해야해!!!(기본 충실)
			var data = new Array();//array를 사용하여 list를 담아주기!~
			for(var item of res.list) {
				var tcn = "#";//jsTree 사이트에서 맨처음 부모에는 #을 넣어줬기에 똑같이 해줬음
				if(typeof(item.TOP_CHATBOT_NUM) != "undefined") {
					tcn = item.TOP_CHATBOT_NUM;
				}
				
				//list에 데이터 넣기
				data.push({id:item.GUIDE_NUM, parent:tcn, text:item.MENU, cnt:item.CNT, type:"default"});// 현재 no, 상위 no, 명칭 , 개수
			}
			
			//삭제와 생성할때 오류가 엄청났다... 행결방안 이렇다.
			//reloade할때만다 chaged.jstree를 주었는데 이걸 지우고 -> documnet.ready안에 넣어주기로 했다.
			//==> (왜? 삭제하거나, 새로 생성할때 자꾸 감지를 하여 on~~jstree 오류가 계속 생성됐다. 계속 클릭하고 있는곳을 감지했기때문이다.)
			//그래서 따로 data를 만든 다음에 아래 두줄처럼 데이터를 별도로 준후 새로고침함수 주기.(만들어놓고 refresh()주기.)
			$('#jstree').jstree(true).settings.core.data = data;
			$('#jstree').jstree(true).refresh();//새로고침
			
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
} 	  
  
function node_create() { //제일 오래 걸렸음... 리로드를 해줘야한다.
	
	var ref = $('#jstree').jstree(true), sel = ref.get_selected();
	var tno = "";//밑에 sel값을 바꿔주니까 id값을 담아주려고 만들었다.

	//console.log(" v sel => "+sel);//선택한 id
	
	/* if(!sel.length) { return false; } <-- 맨 바깥 폴더를 만들기 위해서는 주석 처리해야한다.*/
	
	tno = sel;//id
	
	if(sel == "undefined" || sel == null || sel == ""){// 맨 바깥 폴더는 부모ID가 없겠지?? 그렇기에 #을 넣어줌,(tno는 디비에 null넣으면 오류나서 ''이렇게 처리해줬음.)
		sel = '#';
		tno = '';
	}
	
	sel = ref.create_node(sel, {"type":"default"}); //true, false 반환
	
	if(sel) {
		ref.edit(sel, null, function(node) {//엔터누르면 바로 실행되게(callback 함수 사용해야 함.)
			$("#top_num").val(tno);
			$("#menu").val(node.text);
			action("menuInsert"); 
		});
	}
	
};
function node_rename() {
	var ref = $("#jstree").jstree(true);
	var sel = ref.get_selected();
	
	if(!sel.length) { return false; }
	
	sel = sel[0];
	
	//(*)callBack 함수 사용해야함 : 엔터를 누르면 바로 작동되게. 그렇기에 사용해야 했음.(이걸 안쓰면 엔터를 두번 눌러야함.(기본으로 설정된 엔터와, 디비에 넣기위한 엔터.. 그래서 한번만으로 모두 가능하게 하려고))
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
	
	//console.log(ref.get_node(sel).original.parent);
	
	if(!sel.length) { return false; } //선택한 값이 없으면 삭제 안됨.
	
	if(ref.get_node(sel).original.cnt > 0){
		makeAlert("알림", "하위 메뉴가"+ref.get_node(sel).original.cnt+ "개 있어 삭제 못함.");
	}else{
		ref.delete_node(sel);//위치 중요
		action("menuDelete");//삭제(리로드 필요없음) 
	}
	
};
function reloadSelect() {
	var params = $("#managerGuideForm").serialize();
	$.ajax({
		url : "managerSelectAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { //res.data.ANSWER_CON : 답변내용
			if(res.data.ANSWER_CON != "undefined" && res.data.ANSWER_CON != null ){ //undefined가 아니면 null도 아니여야한다.(&& <-- 중요, ||로 하면 안됨.)
				$("#conText").val(res.data.ANSWER_CON);
			}else{
				$("#conText").val('');
				//아래 주석은 그냥 보고 지나가면 됌.
				//만약 textarea태그에 기능을 넣어주려면
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
		<input type="hidden" id="top_num" name="top_num"/>
		<input type="hidden" id="sno" name="sno" value="${sMemNo}"/> <!-- 답변내용 책임자 -->
	</form>
	
	<main>
		<div class="main_wrap">
			<c:import url="/sidebar">
				<c:param name="link" value="guideManagement"></c:param>
			</c:import>
			<div class="right_area">
				<div class="table_wrap first">
					<div id="event_result"></div>
						
						<button type="button" class="btn btn-success btn-sm" id="btn_create"><i class="glyphicon glyphicon-asterisk"></i> Create</button>
						<button type="button" class="btn btn-warning btn-sm" id="btn_rename"><i class="glyphicon glyphicon-pencil"></i> Rename</button>
						<button type="button" class="btn btn-danger btn-sm" id="btn_delete"><i class="glyphicon glyphicon-remove"></i> Delete</button>
						<button type="button" class="btn btn-uncheck btn-sm" id="btn_unCheck"><i class="glyphicon glyphicon-remove"></i>Uncheck</button>
						
						<div id="jstree"></div> <!-- 스크립트로 동적으로해서 데이터를 넣어줌 -->
					
					<input type="text" id="plugins4_q" class="input" placeholder="카테고리 검색">
				</div>

				<div class="table_wrap second">
					<div class="update_btn btn btn-sm" id="update_btn">수정</div>
					<textarea name="conText" id="conText" placeholder="답변내용을 입력해주세요."></textarea>
				</div>
			</div>

		</div>

	</main>

	<c:import url="/footer"></c:import>
	
</body>
</html>