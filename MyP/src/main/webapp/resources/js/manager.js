
 $(document).ready(function() {
	
   	reloadList();
  
  	console.log("체크박스 길이 : "+$("tbody [type='checkbox']").length);
	
	//검색구분 유지
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}else{
		$("#oldGbn").val("0");//없으면 0으로 고정
	}
	   
	// 페이징 클릭시
	 $(".page_nation").on("click", "a", function () {
		$("#page").val($(this).attr("page"));
		//기존 값 유지
		$("#searchGbn").val($("#oldGbn").val());
		$("#searchText").val($("#oldText").val());
		
		reloadList();
	});
	
	 $("#searchBtn").on("click", function () {
		 console.log("검색버튼")
		$("#page").val("1");
		//기존 값 새값으로 변경
		$("#oldGbn").val($("#searchGbn").val());
		$("#oldText").val($("#searchText").val());
		
		reloadList();
	});
	 
	 $("tbody").on("click",".cb", function() {
		//셀렉터 중 : checked => 체크 됨을 나타냄.
		console.log("체크된 길이:", $("tbody .cb:checked").length); //tbody안에 체크된 것의 개수
		
		//console.log($("tbody .cb:checked").val());/*tbody안에 체크된 것의 값
													/*한개만 가져옴...*/
													
		//30라인 단점을 보안해줌 , 추천) 
		//객체.each(함수) : 해당 객체만큼 돌면서 함수를 실행
		var arr = [];
		$("tbody .cb:checked").each(function() {
			//현제 꺼낸 값을 넣어라!!
			arr.push($(this).val());//배열에 현재순번의 체크된 체크박스 값 넣기.
		});
			
	   
		console.log("현재선택된 체크박스를 배열 인덱스 : ",arr);
		
		$("#res").html(arr.toString());//덮어씌움.(누적x)
			
		if(arr.length == $("tbody .cb").length){
			//상태값과 관련된 경우 attr을 사용 시 한번만 적용(한번만 해도 되는거면 상관없지만,
			//여러번 왔다갔다(체크박스는 그렇지?)이럴경우 attr이 아닌 prop를 사용해야함.)
			//$("thead .cb").attr("checked","checked");
			
			//prop(상태, boolean) : 해당 상태를 boolean에 맞추어 적용
			$("thead .cb").prop("checked", true);
			//3개가 되면 테스트에 체크박스가 체크됨.
			$("#res").html(arr.toString());
		}else{
			$("thead .cb").prop("checked", false);
			//3개가 안되면 테스트에 체크박스가 풀림.
		}
	 });//tbody .cb click end
	 
	 $("thead").on("click",".cb", function() {
			//전체선택, 해제 클릭 시
			//if($(this).prop("checked")){//클릭 대상이 현재 체크된 상태일 때
				
			//객체.is(셀렉터) : 객체가 셀렉터에 해당하는지를 확인
			if($(this).is(":checked")){ //간접적으로 checked된 객체이냐
				$("tbody .cb").prop("checked", true);//tbody에 .cd들을 체크상태로
			}else{
				//아닐 때
				$("tbody .cb").prop("checked", false);//tbody에 .cd들을 체크해제 상태로
			}
			
			var arr = [];
			$("tbody .cb:checked").each(function() {
				//현제 꺼낸 값을 넣어라!!
				arr.push($(this).val());//배열에 현재순번의 체크된 체크박스 값 넣기.
			});
			
			console.log("현재선택된 체크박스를 배열 인덱스 : ",arr);
			
			$("#res").html(arr.toString());//덮어씌움.(누적x)
			
		});
		
		$("tbody").on("click","tr", function() {//tr에 자식을 주겠다. 
			//console.log($(this).children().eq(0));//tr의 자식 중 인덱스 0번째 자식을 취득
			//console.log($(this).children(":nth-child(2)"));//tr의 자식 중 2번재 자식을 취득
			//tr의 자식 중 2번째 자식의 엔티티를 취득
			console.log($(this).children(":nth-child(2)").html());//tr의 자식 중 2번재 자식의 엔티티를 가져와라
		});
		
		
		 $(".autority_btn").click(function () {
		    $("#autority_popup").show();
		    $('main').css({"opacity" : "0.5","pointer-events":"none"});
		    $('header').css({"opacity" : "0.5","pointer-events":"none"});
		});
		
		$("#autority_popup .close_i").click(function () {
			$("#autority_popup").hide();
		    $('main').css({"opacity" : "1","pointer-events":"auto"});
		    $('header').css({"opacity" : "1","pointer-events":"auto"});
		});
});//$(document)
   
  var msg ={
	"update" : "수정",
}
  
  function reloadList() {
	var params = $("#searchForm").serialize();
	$.ajax({
		url : "memManagementListAjax",
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) {
			console.log("성공")
			drawList(res.list);
			drawPaging(res.pd);
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
}

function drawList(list) {
	var html = "";
	var i = 1;
	for(var data of list){		
		html +="<tr no=\"" + data.MEM_NUM+ "\">";
		html +="<th><input type=\"checkbox\" class=\"cb\" value=\""+i+"\" /></th>";
		html +="<td>" + data.MEM_NUM+ "</td>";
		html +="<td>" + data.ID+ "</td>";
		html +="<td>" + data.NM+ "</td>";
		html +="<td>" + data.EMAIL+ "</td>";
		html +="<td>" + data.WARNING+ "</td>";
		html +="<td>" + data.AUTORITY_NM+ "</td>";
		html +="</tr>";
		i++;
		//html +="<div class=\"delete_btn\">삭제</div>";
		//html +="<div class=\"delete_btn\">수정</div><br/>";
	}
	
	$("tbody").html(html);
}
  
  function drawPaging(pd) {
  	var html = "";
  	
  	html +=
  	html += "<a class=\"parrow pprev\" page=\"1\"></a>";
  	// 이전
  	if($("#page").val() == "1"){
  		html += "<a class=\"arrow prev\" page=\"1\"></a>";
  	} else{
  		// 문자열을 숫자로 바꾸기위해 *1
  		html += "<a class=\"arrow prev\" page=\"" + ($("#page").val() *1 - 1) + "\"></a>";
  	}
  	
  	for(var i = pd.startP; i <= pd.endP; i++){
  		if($("#page").val() * 1 == i){ // 현재 페이지
  			html += "<a class=\"active\" page=\"" + i + "\">" + i + "</a>";
  		} else { // 다른 페이지
  			html += "<a page=\"" + i + "\">" + i + "</a>";
  		}
  		
  	}
  	
  	if($("#page").val() *1 == pd.endP){ // 현재페이지가 마지막 페이지라면
  		html += "<a class=\"arrow next\" page=\"" +pd.maxP+ "\"></a>";
  	} else {
  		html += "<a class=\"arrow next\" page=\"" + ($("#page").val() *1 + 1) + "\"></a>";
  	}
  	
  	html += "<a class=\"arrow nnext\" page=\"" +pd.maxP+ "\"></a>";
  	
  	$(".page_nation").html(html);
                                                                       
  }
  
 