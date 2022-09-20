$(document).ready(function () {
	
	// 로고 클릭시 메인화면으로 이동
	 $("#logo").on("click", function() {
	  	location.href = "home";		 
	}); 
	
   	var send_num = "";
	
	
   $('#mail-Check-Btn').click(function() {//인증번호 전송 버튼
	   const email = $('#account').val()+ '@' + $('#domain').val(); //이메일 주소값 얻어오기
	   $("#email").attr('value', email);
	   console.log('완성된 이메일 : ' + email); //이메일 오는지 확인
	   const checkInput = $('.inj') //인증번호 입력하는 곳
	   const warnMsg = $(".mail_input_box_warn");
	   var data = {email : email};
	   const str = window.location.pathname; // 현재 url 경로 ex) /MyP/idFind
	   const word = str.split("/")
	   console.log(word[2]);
	   
	  var id = $('#id').val();
	  var data1 = {id : id, email : email};
	   
	   // 유효성 검사 후,
	   if(mailFormCheck(email)) {
		
		// 비번 찾기에서, id랑 email 일치 ajax
		if(word[2] == 'pwFind'){
			  $.ajax({
		         type:"post",
		         url:"idEmailChackAjax", // 메일, id 체크
		         data : data1,
		         success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
		         	if(res == 'fail'){
		            	warnMsg.html("아이디와 이메일이 일치하지 않습니다. 다시 확인 부탁드립니다.");   
		                warnMsg.css("color","red");           
		            } else {
					   $.ajax({
						   type : 'get',
						   url : 'mailSend', //Get 방식이라 url뒤에 email을 묻힐수있다.
						   dateType : "json",
						   data : data,	   
					   	   success : function(result) {
					   		   console.log(result.send_num);
					   		   send_num = result.send_num;
					   		   warnMsg.html("인증번호가 발송 되었습니다.");
					   		   warnMsg.css("color","green");
					   	   }
					   }); //end ajax
		            }
		     
		         },
		         error : function(request, status, error) {// 실패했을 때 함수 실행
		            console.log(request.responseText);    //실패 상세 내역
		         }
		      }); //ajax
		      
		}else {
			// id 찾기, 회원가입에서 메일 중복성 체크 ajax
		   $.ajax({
		         type:"post",
		         url:"checkEmailAjax", // 메일 중복성 체크
		         data : data,
		         success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
		         
		         // id 찾기에서 메일 중복 체크
		         if(word[2] == 'idFind'){
					if(res == 'fail'){
		            	warnMsg.html("가입되지 않은 이메일 입니다. 다시 확인 부탁드립니다.");   
		                warnMsg.css("color","red");
		                warnMsg.show();
		            } else {
					//이메일
					   $.ajax({
						   type : 'get',
						   url : 'mailSend', //Get 방식이라 url뒤에 email을 묻힐수있다.
						   dateType : "json",
						   data : data,	   
					   	   success : function(result) {
					   		   console.log(result.send_num);
					   		   send_num = result.send_num;
					   		   warnMsg.html("인증번호가 발송 되었습니다.");
					   		   warnMsg.css("color","green");
					   		   warnMsg.show();
					   	   }
					   }); //end ajax
		            }
		        // 회원가입에서 메일 중복 체크
				} else {
					if(res != 'fail'){ 
		            	warnMsg.html("이미 가입된 이메일 입니다. 다시 확인 부탁드립니다.");   
		                warnMsg.css("color","red");
		                warnMsg.show();
		            } else {
					//이메일
					   $.ajax({
						   type : 'get',
						   url : 'mailSend', //Get 방식이라 url뒤에 email을 묻힐수있다.
						   dateType : "json",
						   data : data,	   
					   	   success : function(result) {
					   		   console.log(result.send_num);
					   		   send_num = result.send_num;
					   		   warnMsg.html("인증번호가 발송 되었습니다.");
					   		   warnMsg.css("color","green");
					   		   warnMsg.show();
					   	   }
					   }); //end ajax
		            }
					}
		         },
		         error : function(request, status, error) {// 실패했을 때 함수 실행
		            console.log(request.responseText);    //실패 상세 내역
		         }
		      }); //ajax
		      
		      }
		      
	   } else {
		   warnMsg.html("옳바르지 못한 이메일 형식입니다.");
		   warnMsg.css("display", "inline-block");
		   warnMsg.show();
		   return false;
	   }
	   
   }); //end send email
   
   //인증번호 비교
   //blur -> focus가 벗어나는 경우 발생
   $('#inj').blur(function (){
	   const inputCode = $(this).val();
	   const $resultMsg = $('.mail-check-warn');
	  
	   var inj = $("#inj").val();//사용자가 입력한 인증번호
	   
	   //입력한 인증번호
	   //발송번호(send_num)
	   var data = {auth_num : inj, send_num:send_num};
	    //이메일
	   $.ajax({
		   type : 'get',
		   url : 'mailCheck', 
		   data : data,	   
		   dataType : "json",//데이터 형태
	   	   success : function(result) {
	   		   console.log(result.msg);
	   		   if(result.msg === "success"){
	   			 $resultMsg.css('color', 'green');
		  		   $('#mail-Check-Btn').attr('disabled', true);
		  		   $resultMsg.html('인증번호가 일치합니다.');
		  		   $resultMsg.show();
		  		   $('#account').attr('readonly', true);
		  		   $('#domain').attr('readonly', true);
		  		   $('#domain').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		  		   $('#domain').attr('onChange', 'this.selectedIndex = this.initialSelect');
		  		   
		  		   $("#cert").val(1);//인증여부
		  		   
	   		   }else{
	   			  $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요.');
	   		      $resultMsg.css('color', 'red');
	   		      $resultMsg.show();
	   		   }
	   	   }
	   }); //end ajax
	    
   });
   
   $('#pwd').keyup(function () {
		
		var number = /([0-9])/;
        var alphabets = /([a-zA-Z])/;
        var special_characters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
        
        //숫자+영문자+특수문자 조합으로 6자리 이상 사용해야 합니다.
        if($("#pwd").val().length == 0){
        	$('#pw_ck_status').html("숫자+영문자+특수문자 조합으로 6자리 이상 사용해야 합니다.");
        	$('#pw_ck_status').removeClass();
            $('#pw_ck_status').addClass('basic-password');
        	
        }else if ($("#pwd").val().length < 6) {
            $('#pw_ck_status').removeClass();
            $('#pw_ck_status').addClass('weak-password');
            $('#pw_ck_status').html("6자리 이상으로 작성하세요.");
                        
        } else {
        	
            if ($("#pwd").val().match(number) && $("#pwd").val().match(alphabets) && $("#pwd").val().match(special_characters)) {
                $('#pw_ck_status').removeClass();
                $('#pw_ck_status').addClass('strong-password');
                $('#pw_ck_status').html("아주 좋은 비밀번호입니다!");
            } else {
                $('#pw_ck_status').removeClass();
                $('#pw_ck_status').addClass('medium-password');
                $('#pw_ck_status').html("보안 취약(특수문자,영문 대소문자와 숫자 혼합해주세요.)");
            }
        }
   });

   /*비밀번호 확인 일치 유효성 검사*/
   $('#rePw').on("change", function() {
	   var pwd = $('#pwd').val();
	   var rePw = $('#rePw').val();
	   
	   if(pwd != rePw) {
		   $('.pwck_input_re_2').show();
		   $('.pwck_input_re_1').hide();
		   
	   } else {
		   $('.pwck_input_re_2').hide();
		   $('.pwck_input_re_1').show();
	   }
		   
   });
   
   $("#joinBtn").on("click", function() {
	  
	   console.log("버튼 id==>"+ckId($("#id_input").val()));
	   if($.trim($("#id_input").val()) == "" ||!ckId($("#id_input").val())) {
		   alert("아이디를 형식에 맞게 작성해주세요.", function() {
			   $("#id_input").focus();
		   });
		   
		   return false;
	   }
	   
	   if($.trim($("#pwd").val()) == "" || $("#pwd").val().length < 6 ) {
		   alert("비밀번호 6자리 이상으로 작성해주세요.", function() {
			   $("#pwd").focus();
		   });
		   return false;
	   }
	   
	   if($.trim($("#rePw").val()) == "") {
		   alert("비밀번호 확인을 입력하세요.", function() {
			   $("#rePw").focus();
		   });
		   return false;
	   }
	   
	   if($.trim($("#nickname").val()) == "") {
		   alert("닉네임을 입력하세요.", function() {
			   $("#nickname").focus();
		   });
		   return false;
	   }
	   
	   if($.trim($("#account").val()) == "") {
		   alert("이메일을 입력하세요.", function() {
			   $("#account").focus();
		   });
		   return false;
	   }  
	   
	   if($.trim($("#inj").val()) == "") {
		   alert("인증번호를 입력하세요.", function() {
			   $("#inj").focus();
		   });
		   return false;
	   }
	   
	   
		var params = $("#joinform").serialize();
		$.ajax({
		url: "JAction/insert",
		type: "POST",
		dataType : "json",
		data: params,
		success : function(res) {
			console.log(res);
			console.log("res.msg:"+res.msg);
			if(res.msg == "success"){
				location.href = "login";
			}else if(res.msg == "fail"){
				makeAlert("알림", "등록에 실패하였습니다.");
			}else{
				makeAlert("알림", "등록 중 문제가 발생하였습니다.");
			}
		},
		error : function(request, status, error) {
			console.log(request.responseText);
		}
		});//ajax end
		 
	}); //join btn end
	
	
	
	 $("#idFindBtn").on("click", function() {	   
	   if($.trim($("#email1").val()) == "") {
		   alert("이메일을 입력하세요.", function() {
			   $("#email1").focus();
		   });
		   return false;
	   }  
	   
	   if($.trim($("#account").val()) == "") {
		   alert("이메일을 입력하세요.", function() {
			   $("#account").focus();
		   });
		   return false;
	   }  
	   
	   if($.trim($("#inj").val()) == "") {
		   alert("인증번호를 입력하세요.", function() {
			   $("#inj").focus();
		   });
		   return false;
	   }
	    $("#idFindform").attr("action", "idFindResult");
		$("#idFindform").submit();
		 
	}); //idFindBtn btn end
	
	$("#pwFindBtn").on("click", function() {	   
	   if($.trim($("#inj").val()) == "") {
		   alert("인증번호를 입력하세요.", function() {
			   $("#inj").focus();
		   });
		   return false;
	   }
	    $("#idFindform").attr("action", "idFindResult");
		$("#idFindform").submit();
		 
	}); //idFindBtn btn end
	
	$("#pwFindBtn").on("click", function() {	   
	   if($.trim($("#email1").val()) == "") {
		   alert("이메일을 입력하세요.", function() {
			   $("#email1").focus();
		   });
		   return false;
	   }  
	   
	   if($.trim($("#inj").val()) == "") {
		   alert("인증번호를 입력하세요.", function() {
			   $("#inj").focus();
		   });
		   return false;
	   }
	    $("#pwFindform").attr("action", "pwChange");
		$("#pwFindform").submit();
		 
	}); //idFindBtn btn end
	
	
	
	
	
}); 

/*입력 이메일 형식 유효성 검사*/
 function mailFormCheck(email) {
	 var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 return form.test(email);
}

function ckId(id) {
	const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,20}$/;//문자, 숫자 조합 4~20길이 필수 입력
	var status = $(".id_status");
	if(!id.match(exp)){
		console.log("실패");
		status.html("숫자와 소문자 포함 4~20자 이내로 작성");
		status.css("color","gray");
		return false;
	}else if(id.match(exp)) {
		console.log("성공");
		var data = {id : id};
		$.ajax({
			type:"post",
			url:"checkIdAjax",
			data : data,
			success : function(res) {//성공했을 때 결과를 res에 받고 함수 실행
				// console.log("성공 여부" + result);
				if(res != 'fail'){
					status.html("멋진 아이디네요!");
					status.css("color","green");
				} else {
					status.html("아이디가 이미 존재하거나 삭제된 아이디입니다.");	
					status.css("color","red");
				}		
			},
			error : function(request, status, error) {// 실패했을 때 함수 실행
				console.log(request.responseText);    //실패 상세 내역
			}
		});//ajax
		return true;
	}
}
