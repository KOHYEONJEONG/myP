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
#jstree {
	width: 400px;
	height: 500px;
	border: 1px solid black;
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
	left: 75%
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		// 6 create an instance when the DOM is ready

		$('#jstree').jstree();
		// 7 bind to events triggered on the tree
		$('#jstree').on("changed.jstree", function(e, data) {
			console.log(data.selected);
		});
		// 8 interact with the tree - either way is OK
		$('button').on('click', function() {
			$('#jstree').jstree(true).select_node('child_node_1');
			$('#jstree').jstree('select_node', 'child_node_1');
			$.jstree.reference('#jstree').select_node('child_node_1');
		});
	});//document
</script>
</head>
<body>
	<c:import url="/header1"></c:import>
	<main>
		<div class="main_wrap">
			<div class="side_bar">
				<div class="title">관리자페이지</div>
				<div class="inner">
					<div>회원관리</div>
					<div class="on">가이드관리</div>
					<div>데이터관리</div>
					<div>신고리뷰관리</div>
				</div>
			</div>
			<div class="right_area">
				<div class="table_wrap first">
					<div id="jstree">
						<ul>
							<li>사용안내
								<ul>
									<li>주차장검색
										<ul>
											<li>주차장안내</li>
										</ul> <!-- 주차장안내 end -->
									</li>
									<li>리뷰작성</li>
									<li>랭킹
										<ul>
											<li>랭킹페이지</li>
										</ul> <!-- 랭킹 end -->
									</li>
								</ul>
							</li>
						</ul>
						<!-- 사용안내 end -->
						<ul>
							<li>정기권
								<ul>
									<li>정기권 이용기간 안내</li>
									<li>유의사항/발급제한 안내</li>
									<li>정기권 변경안내
										<ul>
											<li>단순변경(개인)</li>
											<li>단순변경(사업자)</li>
											<li>사고 및 수리로 인한 변경</li>
											<li>폐차/매매/렌트가 계약만료 변경</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						<!-- 정기권 end -->
						<ul>
							<li>요금감면
								<ul>
									<li>국가유공자/독립유공자
										<ul>
											<li>감면요건 안내</li>
											<li>증빙서류 안내</li>
										</ul>
									</li>
									<li>경차환승/저공해환승
										<ul>
											<li>경차/저공해차량 기준안내</li>
											<li>환승이용 방법안내</li>
										</ul>
									</li>
									<li>환승
										<ul>
											<li>환승용 방법 안내</li>
											<li>정기권 환승 안내</li>
										</ul>
									</li>
									<li>경차/저공해자동차</li>
									<li>전기자동차 충전시</li>
									<li>다둥이 행복카드 소지자</li>
									<li>한부모가족</li>
									<li>5.18 민주유공자</li>
									<li>보훈보상대상자</li>
									<li>성실납세자 차량</li>
									<li>참전유공자</li>
								</ul>
							</li>
						</ul>
						<!-- 사용안내 end -->
						<ul>
							<li>기타문의
								<ul>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</li>
						</ul>
						<!-- 사용안내 end -->
					</div>
				</div>
			</div>
		</div>
	</main>

	<c:import url="/footer"></c:import>
</body>
</html>