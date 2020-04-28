<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.meister.menu.model.vo.*"%>

<%
ArrayList<Pizza> list = (ArrayList<Pizza>)request.getAttribute("list");
ArrayList<PizzaSize> list2 = (ArrayList<PizzaSize>)request.getAttribute("list2");
ArrayList<Side> list3 = (ArrayList<Side>)request.getAttribute("list3");
ArrayList<Etc> list4 = (ArrayList<Etc>)request.getAttribute("list4");
ArrayList<Dough> list5 = (ArrayList<Dough>)request.getAttribute("list5");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>menuPizzaDetail</title>

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
	height: 1500px;
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

.dough-select {
	font-size: 16px;
	text-align: left;
}

.dough-price {
	text-align: right;
	color: gray;
	font-weight: bolder;
}

/* 메뉴수량 큰버튼 */
.cntBtn-big .menu_cnt_p {
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

/* 사이드디시 영역 */
.side-area {
	margin: auto;
	border: 1px solid lightgray;
	width: 400px;
	height: 350px;
	overflow: scroll;
	overflow-x: hidden;
}

.side-menu {
	height: 100px;
	width: 100%;
}

.side-menu>div {
	float: left;
}

.side-info {
	width: 60%;
	height: 100%;
}

.side-info>* {
	float: left;
	height: 100%;
	padding-top: 13px;
	padding-left: 13px;
}

.side-info>img {
	width: 70px;
	height: 70px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: auto;
}

.side-info-text {
	margin-left: 20px;
	padding-top: 30px;
	width: 50%;
	text-align: left;
	height: 100%;
}

.side-btn {
	width: 40%;
	height: 100%;
}

.side-btn>div {
	margin: auto;
	margin-top: 35px;
}
/* 사이드디시 영역 */

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

/*라디오버튼 숨김*/
#price1, #price2 {
	display: none;
}

label {
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 0px;
	font-weight: 600;
	text-align: center;
	color: black;
	/* border: 1px solid transparent; */
}

label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
input:checked+label {
	color: white;
	background-color: red;
	/* border-radius: 5px; */
	/* border: 1px solid #ddd;
      border-top: 2px solid #2e9cdf;
      border-bottom: 1px solid #ffffff; */
}

#price1:checked ~ #content1, #price2:checked ~ #content2 {
	display: block;
}

/* 탭 메뉴 끝 */
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
		<%-- <form action="<%= contextPath %>/insertSide.men" method="post"> --%>
		<div class="inner">
			<div class="menuArea">
				<div id="imgArea">
					<img id="menu-img" src="<%= list.get(0).getPizzaImg() %>" alt="">
					<br> <br>
					<p id="menu-detail-btn" data-toggle="modal"
						data-target="#menu-detail-modal">메뉴정보 상세</p>
				</div>
				<div id="infoArea">
					<div id="info-title">
						<h2><%= list.get(0).getPizzaName() %></h2>
						<hr>
					</div>
					<div id="info-size" class="info-size">
						<h2>사이즈 선택</h2>
						<input id="price1" type="radio" name="price"
							value="<%= list2.get(0).getSizeNo() %>"
							style="width: 40; height: 150;"> <label for="price1"
							style="width: 180px; border-radius: 10px; border: 1px solid gray;"><%= list2.get(0).getPizzaSize() %>
							<%= list2.get(0).getPizzaPrice() %>원</label>
						<%-- <button class="middle_btn" id="#"><%= list2.get(0).getPizzaSize() %> <%= list2.get(0).getPizzaPrice() %>원</button> --%>
						<input id="price2" type="radio" name="price"
							value="<%= list2.get(1).getSizeNo() %>"
							style="width: 40; height: 150;"> <label for="price2"
							style="width: 180px; border-radius: 10px; border: 1px solid gray;"><%= list2.get(1).getPizzaSize() %>
							<%= list2.get(1).getPizzaPrice() %>원</label>
						<%-- <button class="middle_btn" id="#"><%= list2.get(1).getPizzaSize() %> <%= list2.get(1).getPizzaPrice() %>원</button> --%>
						<hr>
					</div>
					<div id="info-dough">
						<h2>도우 선택</h2>
						<div class="dough-select">
							<% for(Dough d : list5){ %>
							<span class="dough-name"><input type="radio" name="dough"
								value="<%= d.getDoughNo() %>"><%= d.getDoughName() %> 도우</span>
							<span class="dough-price"> <% if(d.getDoughAddPrice() > 0){ %>
								+<%= d.getDoughAddPrice() %> <%} %></span><br>
							<% } %>
						</div>
						<hr>
					</div>
					<div id="info-amount">
						<h2>수량 선택</h2>
						<div class="cntBtn-big">
							<button class="cnt_down_p">-</button>
							<input class="menu_cnt_p" type="text"
								name="<%= list.get(0).getPizzaNo() %>" value="1" readonly>
							<button class="cnt_up_p">+</button>
						</div>
						<hr>
					</div>

					<!-- 사이드디시 영역 -->
					<h2>사이드디시</h2>
					<div class="side-area">
						<% for(Side s : list3){ %>
						<div class="side-menu">
							<div class="side-info">
								<img src="<%= s.getSideImg() %>" alt="">
								<div class="side-info-text">
									<b style="color: black;"><%= s.getSideName() %><br> <%=s.getSidePrice() %>원
									</b>
								</div>
							</div>
							<div class="side-btn">
								<div class="cntBtn-small">
									<button class="cnt_down">-</button>
									<input class="menu-cnt" type="text" name="<%=s.getSideNo() %>"
										value="0" readonly>
									<button class="cnt_up">+</button>
								</div>
							</div>
						</div>
						<% } %>
					</div>



					<!-- 사이드디시 영역 -->
					<br>
					<h2>음료&기타</h2>
					<div class="etc-area">

						<% for(Etc e : list4) { %>
						<div class="etc-menu">
							<div class="etc-info">
								<img src="<%= e.getEtcImg() %>" alt="">
								<div class="etc-info-text">
									<b style="color: black;"><%=e.getEtcName() %><br> <%= e.getEtcPrice() %>원
									</b>
								</div>
							</div>
							<div class="etc-btn">
								<div class="cntBtn-small">
									<button class="cnt_down">-</button>
									<input class="menu-cnt" type="text" name="<%=e.getEtcNo() %>"
										value="0" readonly>
									<button class="cnt_up">+</button>
								</div>
							</div>
						</div>
						<% } %>


					</div>
					<br> <br> <br>
					<br>

					<button class="big_btn" id="addCart">장바구니에 추가</button>
				</div>
			</div>


		</div>

		<!-- </form> -->
	</div>


	<!-- 모달 시작 -->
	<div class="modal fade" id="menu-detail-modal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title" style="margin: auto; padding: 0;"><%= list.get(0).getPizzaName() %></h2>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div id="menu-detail1-modal">
						<div id="menu-detail1-modal-img">
							<img id="menu-detail-img" src="<%= list.get(0).getPizzaImg() %>"
								alt="">
						</div>
						<div id="menu-detail1-modal-info">
							<h2>메인토핑</h2>
							<hr>
							<span id="modal-topping-info"><%= list.get(0).getPizzaTopping() %></span>
							<h2>원산지</h2>
							<hr>
							<span id="modal-origin-info"><%= list.get(0).getPizzaOrigin() %></span>
						</div>
					</div>
					<div id="menu-detail1-moda2">
						<hr>
						<h2>메뉴소개</h2>
						<hr>
						<span id="modal-menu-info"> <%= list.get(0).getPizzaContent() %></span>
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

	<form id="cart" action="insertPizza.men" method="get">
		<input type="hidden" name="pizzaNo"
			value="<%= list.get(0).getPizzaNo() %>"> <input type="hidden"
			name="pizzaSize" value=""> <input type="hidden" name="dough"
			value=""> <input type="hidden" name="pizzaAmount" value="">
		<input type="hidden" name="side" value="">
		<!-- 1, 2 -->
		<input type="hidden" name="sideAmount" value="">
		<!-- 1, 1 -->
		<input type="hidden" name="etc" value="">
		<!-- 5, 6 -->
		<input type="hidden" name="etcAmount" value="">
		<input type="submit" id="cartSub" name="sssub" style="display:none;">
		<!-- 2, 1 -->
	</form>

	<!-- 메뉴수량버튼 jquery -->
	<script>
		
			$(document).on("click","#addCart",function(){
				
				
				<% if( loginUser != null){%>
	 				var pizzaSize = $("#info-size input[type=radio]:checked").val();
					//console.log(pizzaSize);
					$("#cart input[name=pizzaSize]").val(pizzaSize);
					
					var dough = $(".dough-select input[type=radio]:checked").val();
					$("#cart input[name=dough]").val(dough);
					
					var pizzaAmount = $(".menu_cnt_p").val();
					$("#cart input[name=pizzaAmount]").val(pizzaAmount);
					
					
					var side = "";
					var sideAmount = "";
					$(".side-area .menu-cnt").each(function(i, item){
						if(item.value > 0){
							side += item.name + ",";
							sideAmount += item.value + ",";
						}
					});
					$("#cart input[name=side]").val(side);
					$("#cart input[name=sideAmount]").val(sideAmount);
					
					
					
					var etc = "";
					var etcAmount = "";
					$(".etc-area .menu-cnt").each(function(i, item){
						if(item.value > 0){
							etc += item.name + ",";
							etcAmount += item.value + ",";
						}
					});
					
					$("#cart input[name=etc]").val(etc);
					$("#cart input[name=etcAmount]").val(etcAmount);
					
					
					//$("#cart").submit();
					$("#cartSub").trigger("click");
				<%}else{%>
					//console.log("비회우ㅗㄴ");
					location.href="<%=contextPath%>/loginU.me";	
				<%}%>
					
				
				
			});
			
	

		
	</script>

	<!-- 메뉴수량버튼 jquery -->


	<script>
// 피자용 

$(document).on("click",".cnt_down_p",function() {
	//console.log("-쿨릭");
	var num = $(".menu_cnt_p").val();

	num = $(".menu_cnt_p").val(num * 1 - 1);

	if (num.val() <= 0) {
		num = $(".menu_cnt_p").val(1);
	}

});

$(document).on("click",".cnt_up_p",function() {
	//console.log("+쿨릭");
	var num = $(".menu_cnt_p").val();

	num = $(".menu_cnt_p").val(num * 1 + 1);
});

//피자용

// 사이드디시/etc용

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





</script>





	<%@ include file="../../common_user/footer.jsp"%>


</body>
</html>