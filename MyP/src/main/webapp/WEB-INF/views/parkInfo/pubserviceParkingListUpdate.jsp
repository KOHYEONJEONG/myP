<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyP</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/font.css">
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript" src="resources/script/common/popup.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>  
<style type="text/css">
	.rigth_contents{
		width: 900px;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
	}

	table {
		width: 800px;
		box-sizing: border-box;
		border: 1px #a39485 solid;
		font-size: 14px;
		box-shadow: 0 2px 5px rgba(0,0,0,.25);
		border-collapse: collapse;
		border-radius: 5px;
		overflow: hidden;

	}

	th {
		text-align: center;
	}

	thead {
		font-weight: bold;
		color: #000;
		background: #eeeeee;
		border-bottom: 1px solid rgba(0,0,0,.1);
	}

	td, th {
		padding: 15px 5px;
		vertical-align: middle; 
	}

	td {
		border-right: 1px solid rgba(0,0,0,.1);
		border-bottom: 1px solid rgba(0,0,0,.1);
		background: #fff;
		text-align: center;
	}

	tr td:nth-child(odd){
		background-color:#eeeeee; 
		font-weight: bold;
	}

	td.money > div{
		display: flex;
		justify-content: space-between;
		padding: 0 50px;
		box-sizing: border-box;
	}
	.btn_wrap1{
		 display: flex;
		 justify-content: flex-end;
		 margin-bottom:10px;
	}

	.btn {
		 width: 70px;
		 height: 35px;
		 font-size: 14px;
		 color: #fff;
		 cursor: pointer;
		 box-sizing: border-box;
		 line-height: 35px;
		 text-align: center;
	}

	.update {
		 margin: 0px 8px 0px 0px;
		 background: #595959;
		 border: solid 1px #595959;
		 margin-left:5px;
	}

	.delete {
		 background: #00af80;
		 border: solid 1px #00af80;
	}

	.num{
		 width:30px;
		 height:20px;
		 border: solid 1px #eeeeee;
	}
	.time {
		width:110px;
		border: solid 1px #eeeeee;
	}
.box{
	height:20px;
	border: solid 1px #eeeeee;
}
    </style>  
	<script type="text/javascript">
	$(document).ready(function() {
		
		/*노상/노외 체크하기*/
		$("#tpnm option").each(function(){
			if($(this).html() == $("#CAR_PARK_TP_NM").val()){
				$(this).prop("selected", true);
			}
		})
		
		/*유료/무료 체크하기*/
		$("#div option").each(function(){
			if($(this).html() == $("#PAYORFREE_DIV").val()){
				$(this).prop("selected", true);
			}
		})
		
		/*시간 체크하기*/
		$("#wkdaystart").each(function(){
			if($(this).html() == $("#wkdaystart").val()){
				$(this).prop("input", true);
			}
		})
		
		$("#cancelBtn").on("click", function () {
			$("#backForm").submit();
		});
		
		$("#updateBtn").on("click", function () {
			if($.trim($("#parknm").val()) == ""){
				makeAlert("알림","주차장명을 입력하세요." , function () {
					$("#parknm").focus();
				})
			} else if($.trim($("#phone").val()) == ""){
				makeAlert("알림","전화번호를 입력하세요." , function () {
					$("#phone").focus();
				})
			} else if($.trim($("#add").val()) == ""){
				makeAlert("알림","주소를 입력하세요." , function () {
					$("#add").focus();
				})
			} else if($.trim($("#div").val()) == ""){
				makeAlert("알림","유무료구분을 입력하세요." , function () {
					$("#div").focus();
				})
			} else if($.trim($("#wkdaystart").val()) == ""){
				makeAlert("알림","평일운영시작 시간을 입력하세요." , function () {
					$("#wkdaystart").focus();
				})
			} else if($.trim($("#wkdayend").val()) == ""){
				makeAlert("알림","평일운영종료 시간을 입력하세요." , function () {
					$("#wkdayend").focus();
				})
			} else if($.trim($("#wkendstart").val()) == ""){
				makeAlert("알림","주말운영시작 시간을 입력하세요." , function () {
					$("#wkendstart").focus();
				})
			} else if($.trim($("#wkendend").val()) == ""){
				makeAlert("알림","주말운영종료 시간을 입력하세요." , function () {
					$("#wkendend").focus();
				})
			} else if($.trim($("#fee").val()) == ""){
				makeAlert("알림","기본요금을 입력하세요." , function () {
					$("#fee").focus();
				})
			} else if($.trim($("#time").val()) == ""){
				makeAlert("알림","기본시간을 입력하세요." , function () {
					$("#time").focus();
				})
			} else if($.trim($("#addtime").val()) == ""){
				makeAlert("알림","추가요금을 입력하세요." , function () {
					$("#addtime").focus();
				})
			} else if($.trim($("#addfee").val()) == ""){
				makeAlert("알림","추가시간을 입력하세요." , function () {
					$("#addfee").focus();
				})
			}else {
				var params = $("#backForm").serialize();
				
				$.ajax({
					url : "INFOAction/update", 
					type : "POST", 
					dataType: "json", 
					data: params, 
					success : function(res) { 
						switch(res.msg){
						case "success" : 
							// 카테고리를 유지하고 나머지 정보 초기화
							$("#page").val("1");
							$("#searchGbn").val("0");
							$("#searchText").val("");
						
							$("#backForm").submit();
							break;
						case "fail" :
							makeAlert("알림" , "등록에 실패하였습니다.");
							break;
						case "error" :
							makeAlert("알림" , "등록 중 문제가 발생하였습니다.");
							break;
						}
					},
					error : function(request, status, error) { 
						console.log(request.responseText); 
					}
				});  
			}
		})
	});
	</script>
</head>
<body>
<c:import url="/header1"></c:import>
    	<form action="parkinfodetail" id="backForm" method="post">
      <main>
    <input type="hidden" name="no" value="${data.CAR_PARK_MAG_NUM}">
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
	<input type="hidden" name="memNum" value="${sMemNo}"/>

	<input type="hidden" name="CAR_PARK_TP_NM" id="CAR_PARK_TP_NM" value="${data.CAR_PARK_TP_NM}"/>
	
	
        <div class="main_wrap">
                <div class="side_bar">
        <div class="title">주차장 안내</div>
        <div class="inner">
            <div class="on">공영 주차장 조회</div>
        </div> 
            </div>
            <div class="right_area">      
                <div class="register_wrap">
                    <div class="title">
                        주차장 안내
                    </div>
                   <table>
                <thead>
                <tr>
                <c:set var="gu" value="${fn:split(data.ADDRESS,' ')}" /> <!-- 주소 구만 가져오기 -->
                    <th colspan="4">${gu[0]}</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>주차장명</td>
                    <td><input type="text" name="parknm" id="parknm" 
                    value="${data.CAR_PARK_NM}" class="box"></td>
                    <td>연락처</td>
                    <td><input type="text" name="phone" id="phone" 
                    value="${data.PHONE}" class="box"></td>
                </tr>
                <tr>
                    <td>노상/노외</td>
                    <td>
                    <select id="tpnm" name="tpnm" class="box">
                   		<option value="0">노외</option>
                   		<option value="1">노상</option>
                   </select>
                    <td>무료/유료</td>
                    <td>
                    <select id="div" name="div" class="box">
                   		<option value="0">무료</option>
                   		<option value="1">유료</option>
                   </select>
                   </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td colspan="3"><input type="text" name="add" 
                    id="add" value="${data.ADDRESS}" class="box"></td>
                </tr>
                <tr>
                    <td>운영시간</td>
                    	<td>매일<input type="time" name="wkdaystart" id="wkdaystart" 
                    	value="${data.WEEKDAY_START_TIME}" class="time">~
                    	<input type="time" name="wkdayend" id="wkdayend" 
                    	value="${data.WEEKDAY_END_TIME}" class="time"> <br/>
                    	공휴일 
                    	<input type="time" name="wkendstart" id="wkendstart" 
                    	value="${data.WEEKEND_START_TIME}" class="time">~
                    	<input type="time" name="wkendend" id="wkendend" 
                    	value="${data.WEEKEND_END_TIME}" class="time">
                    	</td>
                    <td>주차요금</td>
                    
                        <td>기본요금
                        <input type="text" name="time" id="time" value="${data.TIME_RATE}" class="num">분
                        <input type="text" name="fee" id="fee" value="${data.FEE_RATE}" class="num">원 <br/>
                        추가요금
                        <input type="text" name="addtime" id="addtime" value="${data.ADD_TIME_RATE}" class="num">분
                        <input type="text" name="addfee" id="addfee" value="${data.ADD_FEE}" class="num">원 <br/>
                        </td>
                </tr>
                <tr>
                    <td>방문자데이터</td>
                    <td colspan="3">
        
                    <canvas id="myChart"></canvas>
        
                    </td>
                </tr>
                </tbody>
                </table>
					<div class="btn_wrap">
                        <input type="button" value="취소" class="btn update" id="cancelBtn">
                        <input type="button" value="수정" class="btn regi" id="updateBtn">
                    </div>
                </div>
                </div>
        </div>
</main>
   </form>
<c:import url="/footer"></c:import>
</body>
</html>