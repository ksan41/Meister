<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.menu.model.vo.*"%>
	
<%
	ArrayList<Pizza> list1 = (ArrayList<Pizza>)request.getAttribute("list1");

	ArrayList<PizzaSize> list2 = (ArrayList<PizzaSize>)request.getAttribute("list2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>menuPizzaList</title>

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
	width: 350px;
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

/* 모달 스타일 시작*/
.modal-body {
	margin: auto;
}

/* 모달 스타일 끝*/

/* 중간버튼 스타일 */
.middle_btn {
	display: block;
	height: 40px;
	width: 150px;
	margin-right: 5px;
	font-size: 15px;
	font-weight: bolder;
	color: white;
	background-color: rgb(76, 60, 60);
	border: 0;
	border-radius: 5px;
}
/* 중간버튼 스타일 */
#order-btn {
	background-color: orange;
}

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
			<a href="" style="color: orange">피자</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href="">사이드디시</a>
			<span style="color: lightgray; font-size: 17px;">|</span> <a href="">음료&기타</a>
		</div>
		<hr>
		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">
			<!-- 프리미엄 -->
			<div class="menu-area premium">
				<h1 align="center">프리미엄</h1>
				<!-- 
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="pizzas/pizza-2802332_1280.jpg" alt="">
					</div>
					<div id="menu-info">
						<h3>
							치즈케이크 피자<img id="menu-detail"
								src="/Meister/resources/siteImgs/PageIcons/baseline_search_black_18dp.png"
								alt="" data-toggle="modal" data-target="#menu-detail-modal">
						</h3>
						<p>
							<b>L</b> 30000원 &nbsp;&nbsp;<b>M</b> 18000원
						</p>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="pizzas/pizza-2802332_1280.jpg" alt="">
					</div>
					<div id="menu-info">
						<h3>
							치즈케이크 피자<img id="menu-detail"
								src="/Meister/resources/siteImgs/PageIcons/baseline_search_black_18dp.png"
								alt="" data-toggle="modal" data-target="#menu-detail-modal">
						</h3>
						<p>
							<b>L</b> 30000원 &nbsp;&nbsp;<b>M</b> 18000원
						</p>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="pizzas/pizza-2802332_1280.jpg" alt="">
					</div>
					<div id="menu-info">
						<h3>
							치즈케이크 피자<img id="menu-detail"
								src="/Meister/resources/siteImgs/PageIcons/baseline_search_black_18dp.png"
								alt="" data-toggle="modal" data-target="#menu-detail-modal">
						</h3>
						<p>
							<b>L</b> 30000원 &nbsp;&nbsp;<b>M</b> 18000원
						</p>
					</div>
				</div> -->
				
				<% for(Pizza p : list1) { %>
					<% if(p.getPizzaType().equals("1")) {%>
						<div id="menu-thumb">
							<div id="menu-img">
								<input type="hidden" value="<%= p.getPizzaNo() %>">
								<img src= "<%= p.getPizzaImg() %>" alt="">
							</div>
							<div id="menu-info">
								<h3>
									<%= p.getPizzaName() %><img id="menu-detail"
										src="/Meister/resources/siteImgs/PageIcons/baseline_search_black_18dp.png"
										alt="" data-toggle="modal" data-target="#menu-detail-modal">
								</h3>
								<% for(PizzaSize ps : list2) { %>
									<p>
									<% if(p.getPizzaNo() == ps.getPizzaNo()) { %>
										
										<b><%=ps.getPizzaSize() %></b> <%=ps.getPizzaPrice() %>원 
											
									<% } %>
									</p>
								<% } %>
							</div>
						</div>
					<% } %>
				<% } %>
				
				
			</div>
			<!-- 프리미엄 -->
			<!-- 클래식 -->
			<br>
			<br>
			<div class="menu-area classic">
				<h1 align="center">클래식</h1>
				<!-- 
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="pizzas/pizza-2802332_1280.jpg" alt="">
					</div>
					<div id="menu-info">
						<h3>
							치즈케이크 피자<img id="menu-detail"
								src="/Meister/resources/siteImgs/PageIcons/baseline_search_black_18dp.png"
								alt="" data-toggle="modal" data-target="#menu-detail-modal">
						</h3>
						<p>
							<b>L</b> 30000원 &nbsp;&nbsp;<b>M</b> 18000원
						</p>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="pizzas/pizza-2802332_1280.jpg" alt="">
					</div>
					<div id="menu-info">
						<h3>
							치즈케이크 피자<img id="menu-detail"
								src="/Meister/resources/siteImgs/PageIcons/baseline_search_black_18dp.png"
								alt="" data-toggle="modal" data-target="#menu-detail-modal">
						</h3>
						<p>
							<b>L</b> 30000원 &nbsp;&nbsp;<b>M</b> 18000원
						</p>
					</div>
				</div>
				<div id="menu-thumb">
					<div id="menu-img">
						<img src="pizzas/pizza-2802332_1280.jpg" alt="">
					</div>
					<div id="menu-info">
						<h3>
							치즈케이크 피자<img id="menu-detail"
								src="/Meister/resources/siteImgs/PageIcons/baseline_search_black_18dp.png"
								alt="" data-toggle="modal" data-target="#menu-detail-modal">
						</h3>
						<p>
							<b>L</b> 30000원 &nbsp;&nbsp;<b>M</b> 18000원
						</p>
					</div>
				</div>-->
				
				
				
			</div> 
			<!-- 클래식 -->
		</div>
		<!-- 모달 시작 -->
		<div class="modal fade" id="menu-detail-modal">
			<!-- modal별 id 변경해주세요-->
			<div class="modal-dialog"
				style="max-width: 100%; width: auto; display: table;">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h2 class="modal-title" style="margin: auto; padding: 0;">치즈케이크
							피자</h2>
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
									몬터레이 잭, 에그몬트, 크림치즈, 에멘탈, 카망베르, 블루 치즈, 스모크 치즈, 숙성 체더, 유기농 체더,
									고다, 리코타, 파르메산, 그뤼에르, 로마노), 11가지 믹스 옐로우 치즈(부라타, 콜비잭, 만체고, 탈레지오,
									보코치니, 페터, 브리, 에담, 마스카포네, 그라나파다노, 미몰레트), 파슬리 드라이</span>
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
								따뜻한 유소년에게서 일월과 봄날의 않는 하는 꽃이 커다란 끓는다. 그들의 크고 방황하였으며, 간에 뿐이다.
								평화스러운 영락과 찾아다녀도, 힘차게 밝은 풀밭에 같이, 소리다.이것은 때문이다. 실현에 이 날카로우나 청춘이
								타오르고 끓는 있을 것이다.보라, 것이다. </span>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer" style="margin: auto;">
						<!-- 하단버튼 영역-->
						<button class="middle_btn" id="order-btn">주문하기</button>
						<button class="middle_btn" id="close-btn" data-dismiss="modal">닫기</button>
					</div>

				</div>
			</div>
		</div>
		<!-- 모달 끝 -->
	</div>
	<%@ include file="../../common_user/footer.jsp"%>

</body>
</html>