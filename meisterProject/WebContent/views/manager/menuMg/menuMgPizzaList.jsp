<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.menu.model.vo.*"%>
<%
	ArrayList<Pizza> pList = (ArrayList<Pizza>)request.getAttribute("pList");
	ArrayList<PizzaSize> psList = (ArrayList<PizzaSize>)request.getAttribute("psList");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>meister_통합-피자리스트</title>

<!-- 메뉴바 include여기에 해주세요 -->
<%@ include file="../../common_manager/imMenubar.jsp"%>
<!-- 메뉴바 include여기에 해주세요 -->

<!-- 모달 부트스트랩-->
<link rel="stylesheet" type="text/css"
	href="<%=contextPath %>/resources/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- 모달 부트스트랩 -->

<style>
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
#layoutSidenav_content {
	width: 1300px;
	height: auto;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 100px;
}

tr {
	text-align: center;
}

select {
	width: 200px; /* 원하는 너비설정 */
	padding: .8em 1.5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 0px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.button5 {
	background-color: #343a40;
	border: none;
	color: white;
	padding: 12px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}

#search {
	padding: 10px;
}

input[type=checkbox] {
	cursor: pointer;
	width: 18px;
	height: 18px;
}
/* 네비게이션 바 스타일 시작 */
#ulNavi {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: white;
	width: 500px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

#ulNavi li {
	float: left;
	width: 33%;
}

#ulNavi li a {
	display: block;
	color: black;
	font-weight: bold;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

#ulNavi li a.active {
	background-color: #343a40;
	color: white;
}
/* 네비게이션 바 스타일 끝 */
#couponEnrollTable tr {
	height: 70px;
	font-size: 17px;
}

/* 메뉴 */
/* 서브메뉴 스타일 시작 (위에 웹폰트 링크도 복붙해주세요)*/
div {
	box-sizing: border-box;
}

.outer {
	width: 1000px;
	box-sizing: border-box;
}

.outer * {
	font-family: 'NanumSquare';
}

.outer a {
	text-decoration: none;
}

.inner {
	margin-left: 100px;
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
	display: inline-block;
}

.menu-thumb {
	width: 250px;
	height: 300px;
	box-sizing: border-box;
	margin-top: 50px;
	margin-bottom: 60px;
	margin-right: 20px;
	margin-left: 50px;
}

.menu-img {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 90%;
	height: 70%;
	margin: auto;
	border-radius: 50%;
}

.menu-detail {
	width: 25px;
	padding-left: 5px;
}

.menu-detail:hover {
	cursor: pointer;
}

.menu-img>img {
	width: 350px;
	height: auto;
}

.menu-img>img:hover {
	cursor: pointer;
	opacity: 70%;
}

.menu-info {
	width: 100%;
	height: 30%;
	text-align: center;
	margin-top: 15px;
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

/* 모달 메뉴스타일 */
.modal-body {
	width: 900px;
	height: 900px;
}

.modal-body>div {
	width: 100%;
}

.menu-detail1-modal {
	height: 60%;
}

.menu-detail1-modal>div {
	float: left;
	height: 100%;
	/* border: 1px solid red; */
	padding: 10px;
}

.menu-detail1-modal-img {
	width: 50%
}

.menu-detail-img {
	padding-top: 50px;;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
	height: 300px;
	margin: auto;
}

.menu-detail1-modal-info {
	width: 50%;
}

.menu-detail1-moda2 {
	height: 40%;
	padding: 10px;
}

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

/* 메뉴수정 모달 스타일 */
.menuUpdateForm {
	width: 950px;
	height: 600px;
}

.menuUpdateForm>div {
	width: 50%;
	height: 100%;
	float: left;
	box-sizing: border-box;
}

.menuUpdateTable {
	width: 100%;
	height: 100%;
}

.menuUpdateTable th {
	font-size: 18px;
}

.menuUpdateTable tr {
	text-align: left;
}

.menu-update-img-area {
	width: 250px;
	height: 250px;
	border: 1px solid gray;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: auto;
}

.menu-upImg {
	height: auto;
	max-width: 150%;
}

.inputs {
	border-radius: 5px;
	margin-left: 20px;
}

.inputs[type=text] {
	width: 200px;
	height: 30px;
}
/* 메뉴수정 모달 스타일 */
</style>
</head>
<body class="sb-nav-fixed">




	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">메뉴관리</h1>
			<br>
			<ul id="ulNavi">
				<li><a class="active" href="">피자</a></li>
				<li><a href="">사이드디시</a></li>
				<li><a href="">음료&기타</a></li>
			</ul>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-book-open"></i> 피자 리스트
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<div align="right">
							<button class="button" onclick="location.href='<%=contextPath %>/pizzaEnForm.meng';"
								style="background-color: orange; width: 100px; height: 40px; font-size: 15px;">메뉴등록</button>
						</div>
						<div class="inner">
							<!-- 프리미엄 -->
							<div class="menu-area premium">
								<h1 align="center">프리미엄</h1>
								<% if(!pList.isEmpty()){ %>
									<%for(int i=0;i<pList.size();i++){ %>
										<% if(pList.get(i).getPizzaType().equals("1")){ %>
										<div class="menu-thumb">
											<div class="menu-img">
												<img src="<%=contextPath%>/resources/siteImgs/menuImg/pizza/<%=pList.get(i).getPizzaImg()%>" alt="">
											</div>
											<div class="menu-info">
												<h4>
													<%=pList.get(i).getPizzaName() %><img class="menu-detail"
														src="<%=contextPath %>/resources/siteImgs/PageIcons/baseline_search_black_18dp.png" alt=""
														data-toggle="modal" data-target="#menu-detail-modalP<%=i%>">
												</h4>
												<p>
													<%for(int j=0;j<psList.size();j++){ %>
														<% if(pList.get(i).getPizzaNo()==psList.get(j).getPizzaNo()){ %>
															<%if(psList.get(j).getPizzaSize().equals("L")){ %>
																<b>L</b> <%=psList.get(j).getPizzaPrice() %>원 
															<%} %>
															&nbsp;&nbsp;
															<%if(psList.get(j).getPizzaSize().equals("M")){ %>
																<b>M</b> <%=psList.get(j).getPizzaPrice() %>원
															<%} %>
														<%} %>
													<%} %>
												</p>
												<button class="button" data-toggle="modal"
													data-target="#menu-update-ModalP<%=i%>">수정</button>
												<button class="button" onclick="">삭제</button>
											</div>
										</div>
										<%} %>
									<%} %>
								<%} %>
							</div>
							<!-- 프리미엄 -->
							<!-- 클래식 -->
							<br>
							<br>
							<div class="menu-area classic">
								<h1 align="center">클래식</h1>
								<% if(!pList.isEmpty()){ %>
									<%for(int i=0;i<pList.size();i++){ %>
										<% if(pList.get(i).getPizzaType().equals("2")){ %>
										<div class="menu-thumb">
											<div class="menu-img">
												<img src="<%=contextPath%>/resources/siteImgs/menuImg/pizza/<%=pList.get(i).getPizzaImg()%>" alt="">
											</div>
											<div class="menu-info">
												<h4>
													<%=pList.get(i).getPizzaName() %><img class="menu-detail"
														src="<%=contextPath %>/resources/siteImgs/PageIcons/baseline_search_black_18dp.png" alt=""
														data-toggle="modal" data-target="#menu-detail-modalC<%=i%>">
												</h4>
												<p>
													<%for(int j=0;j<psList.size();j++){ %>
														<% if(pList.get(i).getPizzaNo()==psList.get(j).getPizzaNo()){ %>
															<%if(psList.get(j).getPizzaSize().equals("L")){ %>
																<b>L</b> <%=psList.get(j).getPizzaPrice() %>원 
															<%} %>
															&nbsp;&nbsp;
															<%if(psList.get(j).getPizzaSize().equals("M")){ %>
																<b>M</b> <%=psList.get(j).getPizzaPrice() %>원
															<%} %>
														<%} %>
													<%} %>
												</p>
												<button class="button" data-toggle="modal"
													data-target="#menu-update-ModalC<%=i%>">수정</button>
												<button class="button" onclick="">삭제</button>
											</div>
										</div>
										<%} %>
									<%} %>
								<%} %>

							</div>
							<!-- 클래식 -->
						</div>



					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	</div>


	<!-- 프리미엄- 메뉴상세 모달 시작 -->
	<% if(!pList.isEmpty()){ %>
		<%for(int i=0;i<pList.size();i++){ %>
			<% if(pList.get(i).getPizzaType().equals("1")){ %>	
				<div class="modal fade" id="menu-detail-modalP<%=i%>">
					<!-- modal별 id 변경해주세요-->
					<div class="modal-dialog"
						style="max-width: 100%; width: auto; display: table;">
						<div class="modal-content">
			
							<!-- Modal Header -->
							<div class="modal-header">
								<h2 class="modal-title" style="margin: auto; padding: 0;"><%=pList.get(i).getPizzaName() %></h2>
								<button type="button" class="close" data-dismiss="modal"
									style="margin: 0; padding: 0;">&times;</button>
							</div>
			
							<!-- Modal body -->
							<div class="modal-body">
								<div class="menu-detail1-modal">
									<div class="menu-detail1-modal-img">
										<img class="menu-detail-img" src="<%=contextPath%>/resources/siteImgs/menuImg/pizza/<%=pList.get(i).getPizzaImg() %>"
											alt="">
									</div>
									<div class="menu-detail1-modal-info">
										<h2>메인토핑</h2>
										<hr>
										<span class="modal-topping-info"><%=pList.get(i).getPizzaTopping() %></span>
										<h2>원산지</h2>
										<hr>
										<span class="modal-origin-info"><%=pList.get(i).getPizzaOrigin() %></span>
									</div>
								</div>
								<div class="menu-detail1-moda2">
									<hr>
									<h2>메뉴소개</h2>
									<hr>
									<span class="modal-menu-info"><%=pList.get(i).getPizzaContent() %></span>
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
			<%} %>
		<%} %>
	<%} %>		
	<!-- 프리미엄-메뉴상세 모달 끝 -->
	
	
	<!-- 클래식- 메뉴상세 모달 시작 -->
	<% if(!pList.isEmpty()){ %>
		<%for(int i=0;i<pList.size();i++){ %>
			<% if(pList.get(i).getPizzaType().equals("2")){ %>	
				<div class="modal fade" id="menu-detail-modalC<%=i%>">
					<!-- modal별 id 변경해주세요-->
					<div class="modal-dialog"
						style="max-width: 100%; width: auto; display: table;">
						<div class="modal-content">
			
							<!-- Modal Header -->
							<div class="modal-header">
								<h2 class="modal-title" style="margin: auto; padding: 0;"><%=pList.get(i).getPizzaName() %></h2>
								<button type="button" class="close" data-dismiss="modal"
									style="margin: 0; padding: 0;">&times;</button>
							</div>
			
							<!-- Modal body -->
							<div class="modal-body">
								<div class="menu-detail1-modal">
									<div class="menu-detail1-modal-img">
										<img class="menu-detail-img" src="<%=contextPath%>/resources/siteImgs/menuImg/pizza/<%=pList.get(i).getPizzaImg() %>"
											alt="">
									</div>
									<div class="menu-detail1-modal-info">
										<h2>메인토핑</h2>
										<hr>
										<span class="modal-topping-info"><%=pList.get(i).getPizzaTopping() %></span>
										<h2>원산지</h2>
										<hr>
										<span class="modal-origin-info"><%=pList.get(i).getPizzaOrigin() %></span>
									</div>
								</div>
								<div class="menu-detail1-moda2">
									<hr>
									<h2>메뉴소개</h2>
									<hr>
									<span class="modal-menu-info"><%=pList.get(i).getPizzaContent() %></span>
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
			<%} %>
		<%} %>
	<%} %>	
	<!-- 클래식-메뉴상세 모달 끝 -->


	<!-- 프리미엄-메뉴수정 모달 시작 -->
	<% int pIndex=0; %>
	<% if(!pList.isEmpty()){ %>
		<%for(int i=0;i<pList.size();i++){ %>
			<% if(pList.get(i).getPizzaType().equals("1")){ %>
			<%pIndex++; %>
					<div class="modal fade" id="menu-update-ModalP<%=i%>">
						<!-- modal별 id 변경해주세요-->
						<div class="modal-dialog"
							style="max-width: 100%; width: auto; display: table;">
							<div class="modal-content">
				
								<!-- Modal Header -->
								<div class="modal-header">
									<h2 class="modal-title" style="margin: auto; padding: 0;">메뉴수정</h2>
									<button type="button" class="close" data-dismiss="modal"
										style="margin: 0; padding: 0;">&times;</button>
								</div>
				
								<!-- Modal body -->
				<div class="modal-body" style="width: 1100px; height: 700px">

					<form class="menuUpdateFormP" action="<%=contextPath%>/pizzaUp.meng" method="post" enctype="multipart/form-data">
						<input type="hidden" name="pNo" value="<%= pList.get(i).getPizzaNo() %>">
						<table class="menuUpdateTable">
							<tr>
								<th>메뉴명</th>
								<td><input name="pName" type="text" class="inputs"
									value="<%=pList.get(i).getPizzaName()%>" required></td>
								<th rowspan="2">이미지첨부 <input class="menuFile" name="menuImg" onchange="loadImg(this,<%=pIndex %>);"
									type="file" style="display: none;" value="<%=pList.get(i).getPizzaImg()%>">
								</th>
								<td rowspan="2">
									<div class="menu-update-img-area">
										<img class="menu-upImg"
											src="<%=contextPath%>/resources/siteImgs/menuImg/pizza/<%=pList.get(i).getPizzaImg()%>"
											alt="">
									</div>
								</td>
							</tr>
							<tr>
								<th>메뉴소개</th>
								<td><textarea name="contents" class="inputs" cols="50"
										rows="8" style="resize: none;" required><%=pList.get(i).getPizzaContent() %></textarea></td>
							</tr>
							<tr>
								<th>토핑</th>
								<td><textarea name="toppings" class="inputs" cols="50"
										rows="8" style="resize: none;" required><%=pList.get(i).getPizzaTopping() %></textarea></td>
							</tr>
							<tr>
								<th rowspan="2">원산지</th>
								<td rowspan="2"><textarea name="origins" class="inputs"
										cols="50" rows="8" style="resize: none;" required><%=pList.get(i).getPizzaOrigin() %></textarea></td>
								<%for(int j=0;j<psList.size();j++){ %>
								<%if(pList.get(i).getPizzaNo()== psList.get(j).getPizzaNo()){ %>
								<%if(psList.get(j).getPizzaSize().equals("L")){ %>
								<input type="hidden" name="psNo" value="<%=psList.get(j).getSizeNo() %>">
								<th>L 사이즈 가격</th>
								<td><input name="priceL" type="text" class="inputs"
									value="<%=psList.get(j).getPizzaPrice()%>" required> 원</td>
								<%} %>
							</tr>
							<%if(psList.get(j).getPizzaSize().equals("M")){ %>
							<tr>
								<th>M 사이즈 가격</th>
								<td><input name="priceM" type="text" class="inputs"
									value="<%=psList.get(j).getPizzaPrice()%>" required> 원<br></td>
								<%} %>
							</tr>
							<%} %>
							<%} %>
						</table>
					</form>

				</div>

				<!-- Modal footer -->
							<div class="modal-footer" style="margin: auto;">
								<!-- 하단버튼 영역-->
								<button class="updateBtn big_btn" style="background: orange;">수정하기</button>
							</div>
			
						</div>
					</div>
				</div>
			<%} %>
		<%} %>
	<%} %>	
	<!-- 프리미엄-메뉴수정 모달 끝 -->

	
<script>
	$(function(){
		$(".menu-update-img-area").click(function(){
			var index = $(".menu-update-img-area").index(this);
			$(".menuFile:eq("+index+")").click();
		});
	})
</script>


	<script>
		$(document).on("click",".updateBtn",function(){
			var index = $(".updateBtn").index(this);		
			//console.log(index +"번 폼 실행");
			$(".menuUpdateFormP:eq("+index+")").submit();
		});
	
			
		
		function loadImg(inputFile,index) {
				
				// 파일을 읽어들일 FileReader 객체 생성(자바스크립트 제공객체)
				var reader = new FileReader();

				// 파일을 읽어주는 메소드 --> 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
				reader.readAsDataURL(inputFile.files[0]);
				
					console.log("인덱스");
					console.log(index);
				// 파일 읽기가 다 완료되었을때 실행할 메소드
				reader.onload = function(e) {//e : 이벤트객체
					// attr 해당 요소에 속성 부여
					console.log("이벤트실행");
						$(".menu-upImg:eq("+index+")").attr("src", e.target.result);
				}
		};
	</script>
</body>
</html>