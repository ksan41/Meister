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
	width: 350px;
	height: auto;
}

#menu-img>img:hover {
	cursor: pointer;
	opacity: 70%;
}

#menu-img2 {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 90%;
	height: 70%;
	margin: auto;
	border-radius: 50%;
}

#menu-img2>img {
	width: 350px;
	height: auto;
}

#menu-img2>img:hover {
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
				style="color: lightgray; font-size: 17px;">|</span> <a href="<%= contextPath %>/sideList.men">사이드디시</a>
			<span style="color: lightgray; font-size: 17px;">|</span> <a href="<%= contextPath %>/etcList.men">음료&기타</a>
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
				
				<% for(int i=0; i<list1.size();i++) {  Pizza p = list1.get(i);%>
					<% if(p.getPizzaType().equals("1")) {%>
						<div id="menu-thumb">
							<div id="menu-img" class="menu-img">
								<input type="hidden" value="<%= p.getPizzaNo()%>">
								<img src= "<%=contextPath %>/resources/siteImgs/menuImg/pizza/<%= p.getPizzaImg() %>" alt="">
							</div>
							<div id="menu-info">
								<h3>
									<%= p.getPizzaName() %><img id="menu-detail"
										src="/Meister/resources/siteImgs/PageIcons/baseline_search_black_18dp.png"
										alt="" data-toggle="modal" data-target="#menu-detail-modal<%=i%>">
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
				
				<% for(int i = 0; i<list1.size();i++) { Pizza p = list1.get(i);%>
					<% if(p.getPizzaType().equals("2")) {%>
						<div id="menu-thumb">
							<div id="menu-img2" class="menu-img2">
								<input type="hidden" value="<%= p.getPizzaNo() %>">
								<img src= "<%=contextPath %>/resources/siteImgs/menuImg/pizza/<%= p.getPizzaImg() %>" alt="">
							</div>
							<div id="menu-info">
								<h3>
									<%= p.getPizzaName() %><img id="menu-detail"
										src="/Meister/resources/siteImgs/PageIcons/baseline_search_black_18dp.png"
										alt="" data-toggle="modal" data-target="#menu-detail-modal<%=i%>">
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
			<!-- 클래식 -->
		</div>
		
		
		
		
		<!-- 모달 시작(프리미엄피자) -->
		
		<% for(int i=0;i<list1.size();i++) { Pizza p = list1.get(i); %>
			<% if(p.getPizzaType().equals("1")) {%>
				<div class="modal fade" id="menu-detail-modal<%=i%>">
					<!-- modal별 id 변경해주세요-->
					<div class="modal-dialog"
						style="max-width: 100%; width: auto; display: table;">
						<div class="modal-content">
							
							<!-- Modal Header -->
							<div class="modal-header">
								<h2 class="modal-title" style="margin: auto; padding: 0;"><%= p.getPizzaName() %>
									피자</h2>
								<button type="button" class="close" data-dismiss="modal"
									style="margin: 0; padding: 0;">&times;</button>
							</div>
		
							<!-- Modal body -->
							<div class="modal-body">
								<div id="menu-detail1-modal">
									<div id="menu-detail1-modal-img">
										<img id="menu-detail-img" src="<%=contextPath %>/resources/siteImgs/menuImg/pizza/<%= p.getPizzaImg() %>"
											alt="">
									</div>
									<div id="menu-detail1-modal-info">
										<h2>메인토핑</h2>
										<hr>
										<span id="modal-topping-info"><%= p.getPizzaTopping() %></span>
										<h2>원산지</h2>
										<hr>
										<span id="modal-origin-info"><%= p.getPizzaOrigin() %></span>
									</div>
								</div>
								<div id="menu-detail1-moda2">
									<hr>
									<h2>메뉴소개</h2>
									<hr>
									<span id="modal-menu-info"> <%= p.getPizzaContent() %> </span>
								</div>
							</div>
								
							<!-- Modal footer -->
							<div class="modal-footer" style="margin: auto;">
								<!-- 하단버튼 영역-->
								<input type="hidden" value="<%= p.getPizzaNo()%>">
								<button class="middle_btn order-btn" id="order-btn">주문하기</button>
								<button class="middle_btn" id="close-btn" data-dismiss="modal">닫기</button>
							</div>
		
						</div>
					</div>
				</div>
			<% } %>
		<% } %>
		<!-- 모달 끝1 -->
		<!-- 모달 시작(클래식피자) -->
		<% for(int i=0;i<list1.size();i++) { Pizza p = list1.get(i); %>
			<% if(p.getPizzaType().equals("2")) {%>
				<div class="modal fade" id="menu-detail-modal<%=i%>">
					<!-- modal별 id 변경해주세요-->
					<div class="modal-dialog"
						style="max-width: 100%; width: auto; display: table;">
						<div class="modal-content">
							
							<!-- Modal Header -->
							<div class="modal-header">
								<h2 class="modal-title" style="margin: auto; padding: 0;"><%= p.getPizzaName() %>
									피자</h2>
								<button type="button" class="close" data-dismiss="modal"
									style="margin: 0; padding: 0;">&times;</button>
							</div>
		
							<!-- Modal body -->
							<div class="modal-body">
								<div id="menu-detail1-modal">
									<div id="menu-detail1-modal-img">
										<img id="menu-detail-img" src="<%=contextPath %>/resources/siteImgs/menuImg/pizza/<%= p.getPizzaImg() %>"
											alt="">
									</div>
									<div id="menu-detail1-modal-info">
										<h2>메인토핑</h2>
										<hr>
										<span id="modal-topping-info"><%= p.getPizzaTopping() %></span>
										<h2>원산지</h2>
										<hr>
										<span id="modal-origin-info"><%= p.getPizzaOrigin() %></span>
									</div>
								</div>
								<div id="menu-detail1-moda2">
									<hr>
									<h2>메뉴소개</h2>
									<hr>
									<span id="modal-menu-info"> <%= p.getPizzaContent() %> </span>
								</div>
							</div>
								
							<!-- Modal footer -->
							<div class="modal-footer" style="margin: auto;">
								<!-- 하단버튼 영역-->
								<input type="hidden" value="<%= p.getPizzaNo()%>">
								<button class="middle_btn order-btn2" id="order-btn">주문하기</button>
								<button class="middle_btn" id="close-btn" data-dismiss="modal">닫기</button>
							</div>
		
						</div>
					</div>
				</div>
			<% } %>
		<% } %>
		<!-- 모달 끝2 -->
	</div>
	
	
	<script>
		$(function(){
			$(".menu-img").click(function(){
				var pno = $(this).children().eq(0).val();
				//var pno = $()
				//console.log(pno);
				location.href="<%=contextPath%>/pizzaDetail.men?pno=" + pno;
				
			});
		});
		$(function(){
			$(".order-btn").click(function(){
				var pno = $(this).prev().val();
				//console.log(pno);
				location.href="<%=contextPath%>/pizzaDetail.men?pno=" + pno;
				
			});
		});
	</script>
	
	<script>
		$(function(){
			$(".menu-img2").click(function(){
				var pno = $(this).children().eq(0).val();
				//console.log(pno);
				location.href="<%=contextPath%>/pizzaDetail.men?pno=" + pno;
				
			});
		});
		
		$(function(){
			$(".order-btn2").click(function(){
				var pno = $(this).prev().val();
				//console.log(pno);
				location.href="<%=contextPath%>/pizzaDetail.men?pno=" + pno;
				
			});
		});
	</script>
	
	
	
	
	
	<%@ include file="../../common_user/footer.jsp"%>

</body>
</html>