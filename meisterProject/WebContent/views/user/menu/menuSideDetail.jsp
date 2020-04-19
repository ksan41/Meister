<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="../../../resources/css/bootstrap.css">
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
	width: 90%;
	height: 300px;
	margin-top: 50px;
	padding-left: 25px;
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
		<div class="inner">
			<div class="menuArea">
				<div id="imgArea">
					<img id="menu-img" src="side/close-up-1854245_1280.jpg" alt="">
					<br>
					<br>
					<p id="menu-detail-btn" data-toggle="modal"
						data-target="#menu-detail-modal">메뉴정보 상세</p>
				</div>
				<div id="infoArea">
					<div id="info-title">
						<h2>그리니시 샐러드</h2>
							<hr>
					</div>
					<div id="info-amount">
						<h2>수량 선택</h2>
						<div class="cntBtn-big">
							<button id="cnt_down_p">-</button>
							<input id="menu_cnt_p" type="text" name="사이드번호" value="1"
								readonly>
							<button id="cnt_up_p">+</button>
						</div>
						<hr>
					</div>

					<!-- 음료&기타영역 -->
					<br>
					<h2>음료&기타</h2>
					<div class="etc-area">
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
						</div>
					</div>
					<br>
					<br>
					<br>
					<button class="big_btn" id="#">장바구니에 추가</button>
				</div>
			</div>


		</div>


	</div>


	<!-- 모달 시작 -->
	<div class="modal fade" id="menu-detail-modal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title" style="margin: auto; padding: 0;">그리니시
						샐러드</h2>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div id="menu-detail1-modal">
						<div id="menu-detail1-modal-img">
							<img id="menu-detail-img" src="pizzas/pizza-2802332_1280.jpg"
								alt="">
						</div>
						<div id="menu-detail1-modal-info">
							<h2>메인토핑</h2>
							<hr>
							<span id="modal-topping-info">모차렐라, 프로볼로네, 체더, 크리미 고르곤졸라,
								갈릭 크림 소스, 토마토 콩피(confit), 뉴욕 스트립 스테이크, 15가지 믹스 슈레드 치즈(화이트 체더,
								몬터레이 잭, 에그몬트, 크림치즈, 에멘탈, 카망베르, 블루 치즈, 스모크 치즈, 숙성 체더, 유기농 체더, 고다,
								리코타, 파르메산, 그뤼에르, 로마노), 11가지 믹스 옐로우 치즈(부라타, 콜비잭, 만체고, 탈레지오, 보코치니,
								페터, 브리, 에담, 마스카포네, 그라나파다노, 미몰레트), 파슬리 드라이</span>
							<h2>원산지</h2>
							<hr>
							<span id="modal-origin-info">오리지널, 나폴리 도우(밀) : 미국산+캐나다산 /
								씬 도우(밀) : 미국산 / 슈퍼시드 함유 도우(밀) : 미국산+캐나다산, (흑미) : 국내산 / 뉴욕 스트립
								스테이크(쇠고기) : 호주산 / 체더치즈 : 미국, 뉴질랜드, 호주</span>
						</div>
					</div>
					<div id="menu-detail1-moda2">
						<hr>
						<h2>메뉴소개</h2>
						<hr>
						<span id="modal-menu-info"> 청춘 않는 행복스럽고 아니다. 인생의 부패를 천하를
							그들에게 청춘 싹이 피다. 장식하는 미묘한 않는 할지라도 위하여, 있는가? 얼마나 우는 자신과 만물은 가치를 실로
							넣는 인간의 가진 운다. 고동을 품에 가치를 있다. 꾸며 피는 천지는 위하여서. 굳세게 심장은 속에 대한 있다.
							따뜻한 유소년에게서 일월과 봄날의 않는 하는 꽃이 커다란 끓는다. 그들의 크고 방황하였으며, 간에 뿐이다. 평화스러운
							영락과 찾아다녀도, 힘차게 밝은 풀밭에 같이, 소리다.이것은 때문이다. 실현에 이 날카로우나 청춘이 타오르고 끓는
							있을 것이다.보라, 것이다. </span>
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