<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.menu.model.vo.*"%>
<%
	ArrayList<Side> list = (ArrayList<Side>)request.getAttribute("list");
	ArrayList<Etc> list2 = (ArrayList<Etc>)request.getAttribute("list2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menuSideDetail</title>

<!-- 메뉴바 여기에 include -->
<%@ include file="../../common_user/menubar.jsp"%>
<%@ include file="../../common_user/menubarMenuIMG.jsp"%>
<!-- 메뉴바 여기에 include -->


<!-- 모달 부트스트랩-->
<link rel="stylesheet" type="text/css"
	href="<%= contextPath %>/resources/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- 밑에 이거 삭제해주세요.(menubar에 중복) -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->

<!-- 모달 부트스트랩 -->

<style>
/* 서브메뉴 스타일 시작 (위에 웹폰트 링크도 복붙해주세요)*/
div {
	box-sizing: border-box;
}

.outer {
	width: 1000px;
	box-sizing: border-box;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 150px;
}

/* 부트스트랩 덮어씌우기용 스타일 */
a {
	text-decoration: none !important;;
}

h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
	margin-bottom: 0;
	font-weight: 500;
	line-height: 1.2;
}

h1, .h1 {
	font-size: 2em;
	display: block;
	margin-block-start: 0.67em;
	margin-block-end: 0.67em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

h2, .h2 {
	display: block;
	font-size: 1.5em;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
	font-family: 'nanumsquare';
	
}

h3, .h3 {
	display: block;
	font-size: 1.17em;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

h4, .h4 {
	font-size: 1rem;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

/* 부트스트랩 덮어씌우기용 스타일 */
.outer * {
	font-family: 'NanumSquare';
}

.outer a {
	text-decoration: none;
}

#index-area {
	text-align: right;
	font-size: 12px;
}

#index-area a {
	color: gray
}

.sub-menu-area * {
	padding: 5px;
}

.sub-menu-area>a {
	font-size: 17px;
	color: black;
	font-weight: bolder;
}

/* 서브메뉴 스타일 끝 */

/* 중간버튼 스타일 */
.middle_btn {
	height: 40px;
	width: 150px;
	margin-right: 10px;
	font-size: 15px;
	font-weight: bolder;
	color: white;
	background-color: rgb(76, 60, 60);
	border: 0;
	border-radius: 5px;
}

.middle_btn:hover {
	cursor: pointer;
}
/* 중간버튼 스타일 */
.menuArea {
	width: 900px;
	height: 850px;
	margin: auto;
	margin-top: 50px;
}

.menuArea>div {
	float: left;
	width: 50%;
	height: 100%;
	padding: 10px;
}

#menu-img {
	width: 375px;
	height: 375px;
}

#infoArea {
	text-align: center;
}

/* 메뉴수량 큰버튼 */
.cntBtn-big #menu_cnt_p {
	height: 30px;
	width: 100px;
	text-align: center;
	font-size: 18px;
}

.cntBtn-big button {
	height: 32px;
	width: 35px;
	font-size: 18px;
	border: 0px;
	background-color: orange;
	/* 용도에따라 적절하게 orange 나 rgb(76, 60, 60) 골라쓰세요 */
	font-weight: bolder;
	color: white;
}

.cntBtn-big button:hover {
	cursor: pointer;
}
/* 메뉴수량 큰버튼 */

/* 메뉴수량 작은버튼 */
.cntBtn-small>.menu-cnt {
	height: 26px;
	width: 60px;
	text-align: center;
	font-size: 16px;
}

.cntBtn-small button {
	height: 26px;
	width: 25px;
	font-size: 16px;
	border: 0px;
	background-color: rgb(76, 60, 60);
	/* 용도에따라 적절하게 orange 나 rgb(76, 60, 60) 골라쓰세요 */
	font-weight: bolder;
	color: white;
}

.cntBtn-small button:hover {
	cursor: pointer;
}

/* 메뉴수량 작은버튼 */

/* 음료기타영역 */
.etc-area {
	margin: auto;
	border: 1px solid lightgray;
	width: 400px;
	height: 350px;
	overflow: scroll;
	overflow-x: hidden;
}

.etc-menu {
	height: 100px;
	width: 100%;
}

.etc-menu>div {
	float: left;
}

.etc-info {
	width: 60%;
	height: 100%;
}

.etc-info>* {
	float: left;
	height: 100%;
	padding-top: 13px;
	padding-left: 13px;
}

.etc-info>img {
	width: 70px;
	height: 70px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: auto;
}

.etc-info-text {
	margin-left: 20px;
	padding-top: 30px;
	width: 50%;
	text-align: left;
	height: 100%;
}

.etc-btn {
	width: 40%;
	height: 100%;
}

.etc-btn>div {
	margin: auto;
	margin-top: 35px;
}
/* 음료기타영역 */
/* 큰버튼 스타일 */
.big_btn {
	display: block;
	height: 50px;
	width: 280px;
	margin: 0 auto;
	font-size: 20px;
	font-weight: bolder;
	color: white;
	background-color: orange;
	border: 0;
	border-radius: 5px;
}
/* 큰버튼 스타일 */

/* 모달 스타일 시작*/
.modal-body {
	margin: auto;
}

/* 모달 스타일 끝*/
/* 모달 메뉴스타일 */
.modal-body {
	/* border: 1px solid red; */
	width: 800px;
	height: 800px;
}

.modal-body>div {
	/* border: 1px solid red; */
	width: 100%;
}

#menu-detail1-modal {
	height: 60%;
}

#menu-detail1-modal>div {
	float: left;
	height: 100%;
	/* border: 1px solid red; */
	padding: 10px;
}

#menu-detail1-modal-img {
	width: 50%
}

#menu-detail-img {
	padding-top: 50px;;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: 300px;
	margin: auto;
}

#menu-detail1-modal-info {
	width: 50%;
}

#menu-detail1-moda2 {
	height: 40%;
	padding: 10px;
}

#menu-detail-btn {
	color: orange;
	text-align: right;
	padding-right: 40px;
}
</style>



</head>
<body>

	<div class="outer">
		<!-- 서브메뉴 타이틀 -->
		<h1>메뉴</h1>
		<br>
		<!-- 서브메뉴 우측 인덱스 -->
		<div id="index-area">
			<a href="">홈</a> &gt;메뉴
		</div>
		<div class="sub-menu-area">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="">피자</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="" style="color: orange">사이드디시</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href="">음료&기타</a>
		</div>
		<hr>



		<!-- inner영역에 콘텐츠 작성 -->
		<form action="<%= contextPath %>/insertSide.men" method="post">
			<div class="inner">
				<div class="menuArea">
					<div id="imgArea">
						<img id="menu-img" src="<%= list.get(0).getSideImg() %>" alt="">
						<br>
						<br>
						<p id="menu-detail-btn" data-toggle="modal"
							data-target="#menu-detail-modal">메뉴정보 상세</p>
					</div>
					<div id="infoArea">
						<div id="info-title">
							<h2><%= list.get(0).getSideName() %></h2>
							<%= list.get(0).getSidePrice() %>원
								<hr>
						</div>
						<!-- 
						<div id="info-pirce">
							<h2>가격</h2>
							<%= list.get(0).getSidePrice() %>
							<hr>
						</div> -->
						<div id="info-amount">
							<h2>수량 선택</h2>
							<div class="cntBtn-big">
								<button id="cnt_down_p">-</button>
								<input id="menu_cnt_p" type="text" name="<%= list.get(0).getSideNo() %>" value="1"
									readonly>
								<button id="cnt_up_p">+</button>
							</div>
							<hr>
						</div>
	
						<!-- 음료&기타영역 -->
						<br>
						<h2>음료&기타</h2>
						<div class="etc-area">
							<!-- 
							<div class="etc-menu">
								<div class="etc-info">
									<img src="etc/0020020000032.png" alt="">
									<div class="etc-info-text">
										<b>콜라 1.25L<br> 2000원
										</b>
									</div>
								</div>
								<div class="etc-btn">
									<div class="cntBtn-small">
										<button class="cnt_down">-</button>
										<input class="menu-cnt" type="text" name="음료기타번호" value="0"
											readonly>
										<button class="cnt_up">+</button>
									</div>
								</div>
							</div>
							<div class="etc-menu">
								<div class="etc-info">
									<img src="etc/0020020000032.png" alt="">
									<div class="etc-info-text">
										<b>콜라 1.25L<br> 2000원
										</b>
									</div>
								</div>
								<div class="etc-btn">
									<div class="cntBtn-small">
										<button class="cnt_down">-</button>
										<input class="menu-cnt" type="text" name="음료기타번호" value="0"
											readonly>
										<button class="cnt_up">+</button>
									</div>
								</div>
							</div>
							<div class="etc-menu">
								<div class="etc-info">
									<img src="etc/0020020000032.png" alt="">
									<div class="etc-info-text">
										<b>콜라 1.25L<br> 2000원
										</b>
									</div>
								</div>
								<div class="etc-btn">
									<div class="cntBtn-small">
										<button class="cnt_down">-</button>
										<input class="menu-cnt" type="text" name="음료기타번호" value="0"
											readonly>
										<button class="cnt_up">+</button>
									</div>
								</div>
							</div>
							<div class="etc-menu">
								<div class="etc-info">
									<img src="etc/0020020000032.png" alt="">
									<div class="etc-info-text">
										<b>콜라 1.25L<br> 2000원
										</b>
									</div>
								</div>
								<div class="etc-btn">
									<div class="cntBtn-small">
										<button class="cnt_down">-</button>
										<input class="menu-cnt" type="text" name="음료기타번호" value="0"
											readonly>
										<button class="cnt_up">+</button>
									</div>
								</div>
							</div>
							<div class="etc-menu">
								<div class="etc-info">
									<img src="etc/0020020000032.png" alt="">
									<div class="etc-info-text">
										<b>콜라 1.25L<br> 2000원
										</b>
									</div>
								</div>
								<div class="etc-btn">
									<div class="cntBtn-small">
										<button class="cnt_down">-</button>
										<input class="menu-cnt" type="text" name="음료기타번호" value="0"
											readonly>
										<button class="cnt_up">+</button>
									</div>
								</div>
							</div>
							<div class="etc-menu">
								<div class="etc-info">
									<img src="etc/0020020000032.png" alt="">
									<div class="etc-info-text">
										<b>콜라 1.25L<br> 2000원
										</b>
									</div>
								</div>
								<div class="etc-btn">
									<div class="cntBtn-small">
										<button class="cnt_down">-</button>
										<input class="menu-cnt" type="text" name="음료기타번호" value="0"
											readonly>
										<button class="cnt_up">+</button>
									</div>
								</div>
							</div>
							<div class="etc-menu">
								<div class="etc-info">
									<img src="etc/0020020000032.png" alt="">
									<div class="etc-info-text">
										<b>콜라 1.25L<br> 2000원
										</b>
									</div>
								</div>
								<div class="etc-btn">
									<div class="cntBtn-small">
										<button class="cnt_down">-</button>
										<input class="menu-cnt" type="text" name="음료기타번호" value="0"
											readonly>
										<button class="cnt_up">+</button>
									</div>
								</div>
							</div> -->
							
							<% for(Etc e : list2) { %>
								<div class="etc-menu">
									<div class="etc-info">
										<img src="<%= e.getEtcImg() %>" alt="">
										<div class="etc-info-text">
											<b style="color:black;"><%=e.getEtcName() %><br> <%= e.getEtcPrice() %>원
											</b>
										</div>
									</div>
									<div class="etc-btn">
										<div class="cntBtn-small">
											<button class="cnt_down">-</button>
											<input class="menu-cnt" type="text" name="<%=e.getEtcNo() %>" value="0"
												readonly>
											<button class="cnt_up">+</button>
										</div>
									</div>
								</div>
							<% } %>
							
							
						</div>
						<br>
						<br>
						<br>
						<button class="big_btn" id="#">장바구니에 추가</button>
					</div>
				</div>
	
	
			</div>

		</form>
	</div>

	<!-- 모달 시작 -->
	<div class="modal fade" id="menu-detail-modal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title" style="margin: auto; padding: 0;"><%= list.get(0).getSideName() %></h2>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div id="menu-detail1-modal">
						<div id="menu-detail1-modal-img">
							<img id="menu-detail-img" src="<%= list.get(0).getSideImg() %>"
								alt="">
						</div>
						<div id="menu-detail1-modal-info">
							<h2>메인토핑</h2>
							<hr>
							<span id="modal-topping-info"><%= list.get(0).getSideTopping() %></span>
							<h2>원산지</h2>
							<hr>
							<span id="modal-origin-info"><%= list.get(0).getSideOrigin() %></span>
						</div>
					</div>
					<div id="menu-detail1-moda2">
						<hr>
						<h2>메뉴소개</h2>
						<hr>
						<span id="modal-menu-info"><%= list.get(0).getSideContent() %></span>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer" style="margin: auto;">
					<!-- 하단버튼 영역-->
					<button class="big_btn" id="close-btn" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 모달 끝 -->

	<!-- 메뉴수량버튼 jquery -->
	<script>
		$(function() {

			// 사이드디시용 

			$("#cnt_down_p").click(function() {
				var num = $("#menu_cnt_p").val();

				num = $("#menu_cnt_p").val(num * 1 - 1);

				if (num.val() <= 0) {
					num = $("#menu_cnt_p").val(1);
				}

			});

			$("#cnt_up_p").click(function() {
				var num = $("#menu_cnt_p").val();

				num = $("#menu_cnt_p").val(num * 1 + 1);
			});

			//사이드디시용

			// etc용

			$(".cnt_down").click(function() {
				var cntIndex = $(".cnt_down").index(this);
				var num = $(".menu-cnt:eq(" + cntIndex + ")").val();

				num = $(".menu-cnt:eq(" + cntIndex + ")").val(num * 1 - 1);

				if (num.val() < 0) {
					num = $(".menu-cnt:eq(" + cntIndex + ")").val(0);
				}

			});

			$(".cnt_up").click(function() {
				var cntIndex = $(".cnt_up").index(this);
				var num = $(".menu-cnt:eq(" + cntIndex + ")").val();

				num = $(".menu-cnt:eq(" + cntIndex + ")").val(num * 1 + 1);
			});
		});
	</script>

	<!-- 메뉴수량버튼 jquery -->



	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>