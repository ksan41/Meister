<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="java.util.ArrayList, com.meister.menu.model.vo.Pizza, com.meister.order.model.vo.*, com.meister.common.PageInfo"%>
<%
	ArrayList<Pizza> pizzaList = (ArrayList<Pizza>)request.getAttribute("pizzaList");
	ArrayList<Orders> ordersList = (ArrayList<Orders>)request.getAttribute("ordersList");
	ArrayList<Price> priceList = (ArrayList<Price>)request.getAttribute("priceList");

		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageOrder</title>
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
#order-info {
	width: 1000px;
	height: 250px;
	border: 1px solid rgb(76, 60, 60);
	background-color: rgb(76, 60, 60);
	margin-top: 20px;
	color: white;
}

.bline {
	background-color: skyblue;
	height: 2px;
	border: 0px;
	width: 270px;
}

.pagination div {
	margin: auto;
}

.pagination a {
	color: black;
	padding: 5px 10px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 2px;
	font-size: 12px;
}

.pagination a.active {
	background-color: orange;
	color: white;
	border: 1px solid orange;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

#noticeList>tbody td {
	text-align: center;
}

#noticeList * {
	height: 30px;
	font-size: 12px;
	border-bottom: 1px solid lightgray;
}

#noticeList {
	border-top: 1px solid black;
}

#noticeList>thead th {
	font-size: 14px;
	font-weight: 750;
}

#noticeList tr{height:50px;}

.small_btn {
	display: block;
	height: 25px;
	width: 60px;
	margin: 0 auto;
	font-size: 10px;
	font-weight: bolder;
	color: white;
	background-color: rgb(76, 60, 60);
	border: 0;
	border-radius: 5px;
	cursor:pointer;
}
</style>
</head>
<body>

	<%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp"%>

	<div class="outer">
		<!-- 서브메뉴 타이틀 -->
		<h1>나의 정보</h1>
		<br>
		<!-- 서브메뉴 우측 인덱스 -->
		<div id="index-area">
			<a href="<%=contextPath%>">홈</a> &gt; <a href="<%=contextPath%>/myOrderList.my">나의 정보</a> &gt; 주문내역
		</div>
		<div class="sub-menu-area">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="<%=contextPath%>/myOrderList.my" style="color: orange">주문내역</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href="<%=contextPath%>/myCouponList.my">쿠폰함</a>
			<span style="color: lightgray; font-size: 17px;">|</span> <a href="<%=contextPath%>/myOneList.my">1:1문의</a>
			<span style="color: lightgray; font-size: 17px;">|</span> <a href="<%=contextPath%>/myInfoUpdateCheck.my">정보수정</a>
		</div>
		<hr>

		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">

			<div id="order-info">

				<table id="table1" style="font-size: 16px;" width="1000px" height="250px">
					<tr>
						<th rowspan="2" width="50%" height="100px"
							style="text-align: center;"><b
							style="font-weight: bold; font-size: 1.5em;"><%=loginUser.getMemberName()%></b>님이 주문하신
							내역입니다.
							<hr class="bline">
							<p style="font-size: 0.7em; color: white">주문을 취소하시려면 해당 매장으로
								전화하셔야 합니다.</p></th>
						<th width="300px" height="50%" style="padding-top: 10px">
							<p align="left" style="color: white;">
								총 주문<br>(가입일~현재일)
							</p>
						</th>

						<th width="25%" style="padding-top: 10px">
							<p align="left" style="color: white;">
								총 주문금액<br>(가입일~현재일)
							</p>
						</th>
					</tr>
					<tr>
						<th 
							style="font-weight: bold; font-size: 4.0em; padding-bottom: 30px">0</th>
						<th
							style="font-weight: bold; font-size: 4.0em; padding-bottom: 30px">0</th>
					</tr>

				</table>

			</div>

			<div class="inner">
				<br> <br>
				<div align="left"
					style="font-size: 22px; font-weight: 700; padding-bottom: 15px;">주문내역</div>

				<table class="orderList" id="orderList" align="center" width="1000px">
					<thead>
						<tr style="text-align: center;">
							<th style="width: 80px;">포장(배달)</th>
							<th style="width: 430px;">주문</th>
							<th style="width: 200px;">주문번호</th>
							<th style="width: 100px;"></th>
						</tr>
					</thead>
					<tbody>
						<% for(int i=0; i<ordersList.size(); i++){ %>
						<tr>
							<td>
								<% if(ordersList.get(i).getDeliveryStatus().equals("F")) { %>
									주문처리중
								<% }else { %>
									수령완료
								<% } %>
							</td>
							<td>
								<% String pizzaName = ""; %>
								<% switch(priceList.get(i).getPizzaNo().charAt(0)+""){
								case "1": pizzaName = pizzaList.get(0).getPizzaName(); break;
								case "2": pizzaName = pizzaList.get(1).getPizzaName(); break;
								case "3": pizzaName = pizzaList.get(2).getPizzaName(); break;
								case "4": pizzaName = pizzaList.get(3).getPizzaName(); break;
								case "5": pizzaName = pizzaList.get(4).getPizzaName(); break;
								case "6": pizzaName = pizzaList.get(5).getPizzaName(); break;
								case "7": pizzaName = pizzaList.get(6).getPizzaName(); break;
								case "8": pizzaName = pizzaList.get(7).getPizzaName(); break;
								case "9": pizzaName = pizzaList.get(8).getPizzaName(); break;
								}
								%>
								<%= pizzaName %>
							</td>
							<td><%=ordersList.get(i).getOrderNo() %></td>
							<td><button class="small_btn detailBtn">상세보기</button></td>
						</tr>
						<% } %>
					</tbody>
				</table>

				<br> <br>
	
				<!--
				<div class="pagination" align="center">
					<div>
						<a href="#">&laquo;</a> <a href="#" class="active">1</a> <a
							href="#">&raquo;</a>
					</div>
				</div>
				-->
			</div>
		</div>
	</div>
	
	<Script>
		$(function(){
			
			$(".detailBtn").click(function(){
				var ono = $(".orderList>tbody>tr").children().eq(2).text();
				
				location.href="<%=contextPath%>/myOrderDetail.my?ono=" + ono;
			});
			
		});
	</Script>

	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>