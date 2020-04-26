<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.meister.order.model.vo.*, com.meister.coupon.model.vo.*, com.meister.menu.model.vo.*, java.util.ArrayList"%>
<%
	Delivery dInfo = (Delivery)request.getAttribute("dInfo");
	Orders oInfo = (Orders)request.getAttribute("oInfo");
	Payment pInfo = (Payment)request.getAttribute("pInfo");
	
	Price order = (Price)request.getAttribute("order");
	
	Coupon discountInfo = (Coupon)request.getAttribute("discountInfo");
	
	String[] pizzaSize = order.getPizzaSize().split(",");
	String[] pizzaNo = order.getPizzaNo().split(",");
	String[] pizzaCount = order.getPizzaCount().split(",");
	String[] doughNo = order.getDoughNo().split(",");
	
	ArrayList<Pizza> pList = (ArrayList<Pizza>)request.getAttribute("pList");
	
	ArrayList<PizzaSize> sizeList = (ArrayList<PizzaSize>)request.getAttribute("sizeList");
	
	ArrayList<Side> sList = (ArrayList<Side>)request.getAttribute("sList");
	ArrayList<Etc> eList = (ArrayList<Etc>)request.getAttribute("eList");
	ArrayList<Dough> dList = (ArrayList<Dough>)request.getAttribute("dList");
	
	String pName = "";
	String pSize = "";
	int pCount = 0;
	int doughPrice = 0;
	int pPrice = 0;
	
	String sName = "";
	int sCount = 0;
	int sPrice = 0;
	
	String eName = "";
	int eCount = 0;
	int ePrice = 0;
	
	int basketPrice = 0;
	int discountPrice = 0;
	double dRate = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageOrderDetail</title>
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
	height: auto;
	border: 0px;
	background-color: #F6F6F6;
	margin-top: 40px;
	margin-bottom: 40px;
	color: black;
}

#order-title, #order-status {
	margin-left: 25px;
}

.xo {
	width: 0;
	height: 150px;
}

.middle_btn {
	display: block;
	height: 40px;
	width: 150px;
	margin: 0 auto;
	font-size: 15px;
	font-weight: bolder;
	color: white;
	background-color: rgb(76, 60, 60);
	border: 0;
	border-radius: 5px;
	margin-top: 10px;
}

#dbtn {
	margin-right: 3%;
	margin-right: 3%;
	box-sizing: border-box;
}

#mbtn {
	margin-left: 3%;
	margin-right: 2%;
	box-sizing: border-box;
}

#lbtn {
	margin-left: 3%;
	box-sizing: border-box;
}

#order-info2-table td {
	padding: 4px;
}
#order-info2-table tr{height:38px;}

#order-info2-table>tr>td {
	color: red;
}

.order-info2-td {
	font-weight: bolder;
}

#infoTable{
	width:95%; 
	height:18px;
	font-size:16px;
	margin:auto;
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
			<!-- 테이블 -->
			<table id="infoTable">
				<tr>
					<td width="8%">
						<b style="color:black;">
						<% if(dInfo.getDeliveryMethod().equals("D")) { %>
							배달
						<% }else { %>
							포장
						<% } %>
						</b>
					</td>
					<td width="6%"><b style="color:black;">주문일</b></td>
					<td width="15%"><%=oInfo.getOrderDate() %></td>
					<td width="7%"><b style="color:black;">주문번호</b></td>
					<td width="30%"><%=oInfo.getOrderNo() %></td>
					<td width="35%"></td>
				</tr>
			</table>
			<hr>
			<b style="padding-left:25px; font-size:20px; color:black;">
				<% if(oInfo.getDeliveryStatus().equals("T")) { %>
					수령완료
				<% }else { %>
					주문처리중
				<% } %>
			</b>
			<hr>

			<div id="order-info">
				<table style="font-size: 15px;" width="1000px" height="200px">
					<tr>
						<th width="495px" style="padding-left: 2px;">
							<p class="order_text_left"
								style="text-align: left; margin-left: 80px; margin-top:40px; margin-bottom:20px; color: black;">
								<b style="font-size: 17px;">주문내역</b> <br><br> 
								<% for(int i=0; i<pizzaSize.length; i++){ // 주문한 피자 내용 %>
									<% for(int j=0; j<pList.size(); j++){ %>
										<% if(pList.get(j).getPizzaNo() == Integer.parseInt(pizzaNo[i])){ %>
											<% pName = pList.get(j).getPizzaName(); %>
										<% } %>
									<% } %>
									<% for(int j=0; j<sizeList.size(); j++){ %>
										<% if(sizeList.get(j).getSizeNo() == Integer.parseInt(pizzaSize[i])){ %>
											<% pSize = sizeList.get(j).getPizzaSize(); %>
											<% pPrice = sizeList.get(j).getPizzaPrice(); %>
										<% } %>
									<% } %>
									<% for(int j=0; j<dList.size(); j++){ %>
										<% if(dList.get(j).getDoughNo() == Integer.parseInt(doughNo[i])){ %>
											<% if(dList.get(j).getDoughAddPrice()+"" != null) {%>
												<% doughPrice = dList.get(j).getDoughAddPrice(); %>
											<% } %>
										<% } %>
									<% } %>
									<% pCount = Integer.parseInt(pizzaCount[i]); %>
									<% pPrice = (pPrice + doughPrice) * pCount; %>
									
									<%=pName%> <%=pSize%> x <%=pCount%> / <%=pPrice %>원<br>
									<%basketPrice += pPrice; %>
								<% } %>
								
								<% if(order.getSideNo() != null && order.getSideCount() != null) { // 주문한 사이드 내용 %>
									<% String[] sideNo = order.getSideNo().split(","); %>
									<% String[] sideCount = order.getSideCount().split(","); %>
									
									<% for(int i=0; i<sideNo.length; i++) { %>
										<% for(int j=0; j<sList.size(); j++){ %>
											<% if(sList.get(j).getSideNo() == Integer.parseInt(sideNo[i])){ %>
												<% sName = sList.get(j).getSideName(); %>
												<% sPrice = sList.get(j).getSidePrice(); %>
											<% } %>
										<% } %>
										
										<% sCount = Integer.parseInt(sideCount[i]); %>
										<% sPrice = sPrice * sCount; %>
										
										<%=sName %> x <%=sCount %> / <%=sPrice %>원<br>
										<%basketPrice += sPrice; %>
									<% } %>
								<% } %>
								
								<% if(order.getEtcNo() != null && order.getEtcCount() != null) { // 주문한 기타상품 내용 %>
									<% String[] etcNo = order.getEtcNo().split(","); %>
									<% String[] etcCount = order.getEtcCount().split(","); %>
									
									<% for(int i=0; i<etcNo.length; i++) { %>
										<% for(int j=0; j<eList.size(); j++){ %>
											<% if(eList.get(j).getEtcNo() == Integer.parseInt(etcNo[i])){ %>
												<% eName = eList.get(j).getEtcName(); %>
												<% ePrice = eList.get(j).getEtcPrice(); %>
											<% } %>
										<% } %>
										
										<% eCount = Integer.parseInt(etcCount[i]); %>
										<% ePrice = ePrice * eCount; %>
										
										<%=eName %> x <%=eCount %> / <%=ePrice %>원<br>
										<%basketPrice += ePrice; %>									
									<% } %>
								<% } %>
								
								<br>
							</p>
						</th>
						
						<th width="10px"><hr class="xo" style="margin-right: 50px;"></th>
						<th style="padding-right: 5%;">
							<div>
								<table style="width: 100%; height: 100%;">
									<tr>
										<td style="text-align: left;">주문금액</td>
										<td style="font-size: 16px; padding-left:9px;">
											<%=basketPrice %> 원
										</td>
									</tr>
									<tr>
										<td style="text-align: left;">할인금액</td>
										<td style="padding-right: 8px; color: orangered; font-size: 16px;">
											<% if(discountInfo != null){ %>
												<% dRate = discountInfo.getCouponDiscount() * 0.01; %>
											<% } %>
											<%discountPrice = ((int)(basketPrice * dRate)); %>
											-<%=discountPrice %> 원
										</td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr style="font-weight: bolder;">
										<td style="text-align: left;">결제금액</td>
										<td style="font-size: 18px; padding-left:9px;"><%=basketPrice-discountPrice%> 원</td>
									</tr>
								</table>
							</div>
						</th>
					</tr>
				</table>
			</div>


			<hr>
			<p id="order-title"
				style="font-size: 16px; font-weight: 600; color: black;">주문정보</p>
			<hr>

			<div id="order-info2">

				<table id="order-info2-table">
					<tr>
						<td class="order-info2-td"
							style="width: 200px; padding-left: 25px;">결제방법</td>
						<td><%=pInfo.getPaymentType()%></td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">수령인</td>
						<td><%=oInfo.getOrderName()%></td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">수령인 연락처</td>
						<td><%=oInfo.getOrderPhone()%></td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">매장주소</td>
						<td><%=dInfo.getBranchAddress() %></td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">매장정보</td>
						<td><%=dInfo.getBranchName()%> <%=dInfo.getBranchPhone()%></td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">추가요청</td>
						<td><%=oInfo.getOrderRequest() %></td>
					</tr>
				</table>

			</div>

			<hr><br>

			<div id="btns">
				<button class="middle_btn" id="listBack" style="cursor: pointer;"
						onclick="location.href='<%=contextPath%>/myOrderList.my';">목록으로
				</button>
			</div>

		</div>
	</div>


	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>