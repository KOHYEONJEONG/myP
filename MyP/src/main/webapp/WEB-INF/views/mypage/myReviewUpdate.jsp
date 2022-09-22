<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyP</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/font.css">
<script src="resources/jquery/jquery-1.12.4.js"></script>
<script src="resources/js/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/rety/jquery.raty.js"></script> <!-- 별 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/rety/jquery.raty.css"><!-- 별 -->
<style>
.rigth_contents {
	width: 900px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 900px;
	box-sizing: border-box;
	border: 1px #a39485 solid;
	font-size: 14px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
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
	border-bottom: 1px solid rgba(0, 0, 0, .1);
}

td, th {
	padding: 15px 5px;
	vertical-align: middle;
}

td {
	border-right: 1px solid rgba(0, 0, 0, .1);
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
	text-align: center;
}

tr td:nth-child(odd) {
	background-color: #eeeeee;
	font-weight: bold;
}

td.money>div {
	display: flex;
	justify-content: space-between;
	padding: 0 50px;
	box-sizing: border-box;
}

.btn_wrap1 {
	    display: flex;
    justify-content: flex-end;
    width: 907px;
    margin-bottom: 10px;
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
	background: #FD9A29;
	border: solid 1px #FD9A29;
	margin-left: 5px;
}

.delete {
	background: #00af80;
	border: solid 1px #00af80;
}
td.con{
	background-color: #fff;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#deleteBtn").on("click",function(){
		action("delete");
	});
	
	$("#updateBtn").on("click",function(){
		action("update");
	});
});

var msg ={
		"update" : "수정",
		"delete" : "삭제",
	}
	
//분류명 테이블의 action
function action1(flag) {
	console.log(msg[flag]);
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "myReviewAction/" + flag,
		type : "POST", 
		dataType: "json", 
		data: params, 
		success : function(res) { 
			switch(res.msg){
			case "success" :
				// 목록 재조회
				switch(flag){
					case "delete" :
						$("#actionForm").attr("action","mypageReviewBoard");
						$("#actionForm").submit();
						break;
					case "update" :
						$("#actionForm").attr("action","mypageReviewUpdate");
						$("#actionForm").submit();
						break; 
				}
				break;
			case "fail" :
				makeAlert("알림" ,  msg[flag] + "에 실패하였습니다.");
				break;
			case "error" :
				makeAlert("알림" , msg[flag] + " 중 문제가 발생하였습니다.");
				break;
			}
		},
		error : function(request, status, error) { 
			console.log(request.responseText); 
		}
	}); //Ajax End
} // action Function End
</script>
</head>
<body>
	<c:import url="/header1"></c:import>
	<form action="#" id="actionForm">
		<input type="hidden" name="review_num" id="review_num" value="${param.review_num}"/>
		<input type="hidden" name="no" id="no" value="${sMemNo}"/>
		   <!--  전 화면에서 넘어온 페이지 정보 -->
		   <input type="hidden" name="page" id="page" value="${param.page}"/>
		   <!--  전 화면에서 넘어온 검색 정보 -->
		   <input type="hidden" id="searchGbn" name="searchGbn" value="${param.searchGbn}"/>
		   <input type="hidden" id="searchTxt" name="searchTxt" value="${param.searchTxt}"/>
	</form>
	<main>
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">주차장 안내</div>
				<div class="inner">
					<div class="on">공영 주차장 조회</div>
				</div>
			</div>

			<div class="right_area">
				<div class="rigth_contents">
					<div class="btn_wrap1">
						<div class="btn delete" id="deleteBtn">삭제</div>
						<div class="btn update" id="updateBtn">수정</div>
					</div>
					<table>
						<thead>
							<tr>
								<th colspan="4">[나의 리뷰]</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>CCTV별점</td>
								<td>
									<input type="hidden" id="ENV_STAR_SCORE" value="${data.CCTV_STAR_SCORE}"/>
									<div class="cctvStar"></div>
									<script type="text/javascript">
										$('.cctvStar').raty({ readOnly: true, score: $("#CCTV_STAR_SCORE").val(), 
											path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"	
										});
									</script>
									
								</td>
								<td>환경별점</td>
								<td>
									<input type="hidden" id="ENV_STAR_SCORE" value="${data.ENV_STAR_SCORE}"/>
									<div class="envStar"></div>
									<script type="text/javascript">
									$('.envStar').raty({ readOnly: true, score: $("#ENV_STAR_SCORE").val(), 
										path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"	
									});
									</script>
								</td>
							</tr>
							<tr>
								<td>요금별점</td>
								<td>
									<input type="hidden" id="FEE_STAR_SCORE" value="${data.FEE_STAR_SCORE}"/>
									<div class="feeStar"></div>
									<script type="text/javascript">
									$('.feeStar').raty({ readOnly: true, score: $("#FEE_STAR_SCORE").val(), 
										path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"	
									});
									</script>
								</td>
								<td>할인정보별점</td>
								<td>
									<input type="hidden" id="DIS_STAR_SCORE" value="${data.DIS_STAR_SCORE}"/>
									<div class="disStar"></div>
									<script type="text/javascript">
									$('.disStar').raty({ readOnly: true, score: $("#DIS_STAR_SCORE").val(), 
										path : "https://cdn.jsdelivr.net/npm/raty-js@2.8.0/lib/images"	
									});
									</script>
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td class="con" colspan="3">
									<textarea name="con" id="con" class="con">
										${data.CON}
									</textarea>
								</td>
							</tr>
						</tbody>
					</table>

				</div>

			</div>

		</div>
	</main>
	<c:import url="/footer"></c:import>
</body>
</html>