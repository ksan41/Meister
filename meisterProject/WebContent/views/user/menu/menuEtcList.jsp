<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.menu.model.vo.*"%>
<%
	ArrayList<Etc> list = (ArrayList<Etc>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>menuEtcList</title>

<!-- 메뉴바 여기에 include -->
<%@ include file="../../common_user/menubar.jsp"%>
<%@ include file="../../common_user/menubarMenuIMG.jsp"%>
<!-- 메뉴바 여기에 include -->


<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
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

/* 메뉴 스타일 */
.menu-area {
	width: 1000px;
	height: auto;
	margin-top: 50px;
}

.menu-area>div {
	margin: auto;
	display: inline-block;
}

#menu-thumb {
	width: 250px;
	height: 300px;
	box-sizing: border-box;
	margin-top: 50px;
	margin-bottom: 60px;
	margin-right: 20px;
	margin-left: 50px;
}

#menu-img {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 90%;
	height: 70%;
	margin: auto;
	border-radius: 50%;
}

#menu-detail {
	width: 25px;
	padding-left: 5px;
}

#menu-detail:hover {
	cursor: pointer;
}

#menu-img>img {
	width: 150px;
	height: auto;
}

#menu-img>img:hover {
	cursor: pointer;
	opacity: 70%;
}

#menu-info {
	width: 100%;
	height: 30%;
	text-align: center;
}
/* 메뉴스타일 */

/* 작은버튼 스타일 */
.small_btn {
	height: 25px;
	width: 60px;
	margin: 0 auto;
	font-size: 10px;
	font-weight: bolder;
	color: white;
	background-color: orange;
	border: 0;
	border-radius: 5px;
}
/* 작은버튼 스타일 */

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
			<a href="<%= contextPath %>/pizzaList.men">피자</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="<%= contextPath %>/sideList.men">사이드디시</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href=""
				style="color: orange">음료&기타</a>
		</div>
		<hr>
		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">
			<!-- 프리미엄 -->
			<div class="menu-area">
				<!-- 
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="etc/0020020000032.png" alt="">
					</div>
					<div id="menu-info">
						<h3>콜라 1.25L</h3>
						<p>2000원</p>
						<div class="cntBtn-small">
							<button class="cnt_down">-</button>
							<input class="menu-cnt" type="text" name="count" value="1"
								readonly>
							<button class="cnt_up">+</button>
						</div>
						<br>
						<button class="small_btn" id="#">주문</button>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="etc/0020020000032.png" alt="">
					</div>
					<div id="menu-info">
						<h3>콜라 1.25L</h3>
						<p>2000원</p>
						<div class="cntBtn-small">
							<button class="cnt_down">-</button>
							<input class="menu-cnt" type="text" name="count" value="1"
								readonly>
							<button class="cnt_up">+</button>
						</div>
						<br>
						<button class="small_btn" id="#">주문</button>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="etc/0020020000032.png" alt="">
					</div>
					<div id="menu-info">
						<h3>콜라 1.25L</h3>
						<p>2000원</p>
						<div class="cntBtn-small">
							<button class="cnt_down">-</button>
							<input class="menu-cnt" type="text" name="count" value="1"
								readonly>
							<button class="cnt_up">+</button>
						</div>
						<br>
						<button class="small_btn" id="#">주문</button>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="etc/0020020000032.png" alt="">
					</div>
					<div id="menu-info">
						<h3>콜라 1.25L</h3>
						<p>2000원</p>
						<div class="cntBtn-small">
							<button class="cnt_down">-</button>
							<input class="menu-cnt" type="text" name="count" value="1"
								readonly>
							<button class="cnt_up">+</button>
						</div>
						<br>
						<button class="small_btn" id="#">주문</button>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="etc/0020020000032.png" alt="">
					</div>
					<div id="menu-info">
						<h3>콜라 1.25L</h3>
						<p>2000원</p>
						<div class="cntBtn-small">
							<button class="cnt_down">-</button>
							<input class="menu-cnt" type="text" name="count" value="1"
								readonly>
							<button class="cnt_up">+</button>
						</div>
						<br>
						<button class="small_btn" id="#">주문</button>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="etc/0020020000032.png" alt="">
					</div>
					<div id="menu-info">
						<h3>콜라 1.25L</h3>
						<p>2000원</p>
						<div class="cntBtn-small">
							<button class="cnt_down">-</button>
							<input class="menu-cnt" type="text" name="count" value="1"
								readonly>
							<button class="cnt_up">+</button>
						</div>
						<br>
						<button class="small_btn" id="#">주문</button>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="etc/0020020000032.png" alt="">
					</div>
					<div id="menu-info">
						<h3>콜라 1.25L</h3>
						<p>2000원</p>
						<div class="cntBtn-small">
							<button class="cnt_down">-</button>
							<input class="menu-cnt" type="text" name="count" value="1"
								readonly>
							<button class="cnt_up">+</button>
						</div>
						<br>
						<button class="small_btn" id="#">주문</button>
					</div>
				</div> -->
				<% for(Etc e : list) {%>
					<div id="menu-thumb">
						<div id="menu-img">
							<img src="<%= e.getEtcImg() %>" alt="">
						</div>
						<div id="menu-info">
							<h3><%= e.getEtcName() %></h3>
							<p><%= e.getEtcPrice() %>원</p>
							<div class="cntBtn-small">
								<button class="cnt_down">-</button>
								<input class="menu-cnt" type="text" name="count" value="1"
									readonly>
								<button class="cnt_up">+</button>
							</div>
							<br>
							<button class="small_btn" id="#">주문</button>
						</div>
					</div>
				<% } %>
				
				
			</div>

		
		</div>

	</div>


	<!-- 메뉴수량버튼 jquery -->
	<script>
		$(function() {

			$(".cnt_down").click(function() {
				var cntIndex = $(".cnt_down").index(this);
				var num = $(".menu-cnt:eq(" + cntIndex + ")").val();

				num = $(".menu-cnt:eq(" + cntIndex + ")").val(num * 1 - 1);
				console.log(num.val());

				if (num.val() <= 0) {
					num = $(".menu-cnt:eq(" + cntIndex + ")").val(1);
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