
 $(document).ready(function() {
	var vCk = "";
	
   	reloadList();
  	$("#autority_popup").hide();//팝업창
	   
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
	 
		
	$("#autority_popup .close_i").click(function () {
		$("#autority_popup").hide();
	    $('main').css({"opacity" : "1","pointer-events":"auto"});
	    $('header').css({"opacity" : "1","pointer-events":"auto"});
	});
		
	//행을 누르면 상세보기로 이동~
	$("tbody").on("click", "tr", function() {
	      //Ajax
	      // 성공 시 #autority_popup에 html넣기
	      $("#no").val($(this).attr("no"));
	      var params = $("#searchForm").serialize();
	      
			$.ajax({
				url : "memDetailAjax",
				type : "POST", 
				dataType: "json", 
				data: params, 
				success : function(res) {//가져올 변수명
					//console.log("성공 " + res.data.MEM_NUM)//그 변수명 안에 있는 data.MEM_NUM
					drawAutoritySelectBox(res.gbn);
					drawPopup(res.data);
					selectChecked(res.data.AUTORITY_NM);
				},
				error : function(request, status, error) { 
					console.log(request.responseText); 
				}
			}); //Ajax End
	   });
	   
	   
	   $("#empower_btn").on("click",function() {

		console.log("권한부여 클릭");
		 // 기존 검색상태 유지
		  $("#no2").val($.trim($(".no2").text()));
		  
		  console.log("no ==>"+$("#no2").val());
	      
	      var params = $("#autorityForm").serialize();
	      
			$.ajax({
				url : "autoryUpdateAjax",
				type : "POST", 
				dataType: "json", 
				data: params, 
				success : function(res) {
					if(res.msg == "success"){
						console.log("권한 수정 완료");
						
						//팝업창 닫힘.
						$("#autority_popup").hide();
						
						reloadList();//재로드
					}else{
						console.log("권한 수정 실패");
					}				
					
				},
				error : function(request, status, error) { 
					console.log(request.responseText); 
				}
			}); //Ajax End
	      
	      
	      $("#searchGbn").val($("#oldGbn").val());
	      $("#searchText").val($("#oldTxt").val());
	  
	    	$("#autorityForm").attr("action", "autorityForm");
	     //$("#autorityForm").submit();
		
	  });
		
});//$(document)
  
  function drawAutoritySelectBox(gbn){
	 var html = "";
	 var i = 1;
	 for(var data of gbn){	
		 html += "<option value=\""+i+"\">"+data.AUTORITY_NM+"</option>";
		 i++;
	 }
	 $("#autority_popup .popup_right #autoritySelectBox").html(html);
  }
  
  function selectChecked(AUTORITY_NM){//팝업창에 권한 select(해당 회원에 권한으로 체크해준다.)
	console.log("selectChecked==>"+AUTORITY_NM);
	
	//(*)val로 비교하면 안돼. 나는 value로 option을 숫자로 넣어뒀고, option태그에 엔티티값으로 비교해야한다.
	$('#autority_popup .popup_right #autoritySelectBox option').each(function() {
		if($(this).html() == AUTORITY_NM) {//엔티티로 비교해야하기에 .html()
			$(this).prop("selected", true);
		}
	});
  }
  
  function drawPopup(data){ //권한 수정하려고 만든 팝업
		var html = "";
					
		html += "<tr>";
      	html += "<th>번호</th>";
      	html += "<td class=\"no2\">"+data.MEM_NUM+"</td>";
      	html += "</tr>";
      
        html += "<tr>";
      	html += "<th>아이디</th>";
      	html += "<td>"+data.ID+"</td>";
        html += "</tr>";
      
        html += "<tr>";
        html += "<th>닉네임</th>";
      	html += "<td>"+data.NM+"</td>";
        html += "</tr>";

        html += "<tr>";
      	html += "<th>경고수</th>";
      	html += "<td>"+data.WARNING+"</td>";
        html += "</tr>";
      
        html += "<tr>";
      	html += "<th>가입일</th>";
      	html += "<td>"+data.REG_DT+"</td>";
        html += "</tr>";
      
        html += "<tr>";
      	html += "<th>권한</th>";
      	html += "<td>"+data.AUTORITY_NM+"</td>";
      	
      	vCk = data.AUTORITY_NM;
      	
        html += "</tr>";
		
		$("#autority_popup").show();
		$("#autority_popup thead").html(html);
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
	for(var data of list){		
		html +="<tr no=\""+data.MEM_NUM+"\">";
		html +="<td>" + data.NORNK+ "</td>";
		html +="<td>" + data.ID+ "</td>";
		html +="<td>" + data.NM+ "</td>";
		html +="<td>" + data.EMAIL+ "</td>";
		html +="<td>" + data.WARNING+ "</td>";
		html +="<td>" + data.AUTORITY_NM+ "</td>";
		html +="</tr>";
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
  
 