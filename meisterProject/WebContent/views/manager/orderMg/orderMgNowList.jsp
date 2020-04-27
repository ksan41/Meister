<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.order.model.vo.*, com.meister.coupon.model.vo.*, com.meister.menu.model.vo.*" %>
<%
	ArrayList<Orders> list = (ArrayList<Orders>)request.getAttribute("list");
	
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
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_지점 - 주문현황</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/bmMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	
	<!-- 모달 부트스트랩-->
	<link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!-- 모달 부트스트랩 -->
	
	<style>
		.layoutSidenav_content {
			margin: auto;
			margin-top: 100px;
			width: 1200px;
			height: auto;
		}
		
		tr {
			text-align: center;
		}
		
		#index-area {
			text-align: right;
			font-size: 12px;
		}
		
		#index-area a {
			color: gray
		}
		
		/* 부트스트랩 덮어씌우기용 스타일 */
        a{
        	text-decoration: none !important;;
        }
        
        h1, h2, h3, h4, h5, h6,
		.h1, .h2, .h3, .h4, .h5, .h6 {
  			margin-bottom:0;
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
	</style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content" id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">주문현황</h1>
			<!-- 제목-->
			<div id="index-area">
				<a href="">홈</a> &gt; <a href="">현재 들어온 주문</a>
			</div>
			<br>
			<div class="card mb-4">
				<!-- 아이콘은 위에 메뉴에서 해당 i태그 가져오세요-->
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 현재 들어온 주문
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<!-- 내용작성-->
						<table class="table table-bordered" id="dataListTable" width="60%" cellspacing="0";>
							<thead>
								<tr>
									<th width="10%">주문번호</th>
									<th width="10%">고객명</th>
									<th width="48%">주문정보</th>
									<th width="20%">주문일</th>
									<th width="12%">접수상태</th>
								</tr>
							</thead>
							<tbody>
							<!-- 
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2011/12/12 13:24</td>
									<th>
										<button class="button" onclick="" style="background-color: yellowgreen;">접수</button>
									</th>
								</tr>
							 -->
							 	<% if(list.isEmpty()){ // 리스트가 비어있을 경우 %>
									<tr>
										<td colspan="5">존재하는 주문내역이 없습니다.</td>
									</tr>
								<% }else{ // 리스트가 비어있지 않을 경우 %>
								
									<% for(Orders o : list){ %>
									 	<tr data-toggle="modal" data-target="#myModal">
											<td><%= o.getReceiptNo() %></td>
											<td><%= o.getMemberId() %></td>
											<td>
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
											</td>
											<td><%= o.getOrderDate() %></td>
											<th>
											<!-- <button class="button" onclick="" style="background-color: yellowgreen;">접수</button> -->
												<% if(oInfo.getOrderStatus().equals("T")) { %>
													주문접수완료
												<% }else { %>
													주문처리중
												<% } %>
											</th>
										</tr>
									<% } %>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	
	
	<% if(list.isEmpty()){%>
	<%}else{ %>
	
		<%for(int k=0; k<list.size(); k++){ %>
		
			<!-- 주문 상세 모달 시작 -->
			<div class="modal fade" id="myModal">
				<!-- modal별 id 변경해주세요-->
				<div class="modal-dialog">
					<div class="modal-content">
		
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title" style="margin: auto; padding: 0;">주문
								상세정보</h4>
							<button type="button" class="close" data-dismiss="modal" style="margin: 0; padding: 0;">&times;</button>
						</div>
		
						<!-- Modal body -->
						<div class="modal-body">
							<table>
								<tr>
									<td>주문번호 :</td>
									<td><%= list.get(k).getReceiptNo() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">주문일시 :</td>
									<td><%= list.get(k).getOrderDate() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">고객명 :</td>
									<td><%= list.get(k).getOrderName() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">연락처 :</td>
									<td><%= list.get(k).getOrderPhone() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">배달주소 :</td>
									<td style="padding-top: 8px;"><%= list.get(k).getMemAddress1() %> + <%= list.get(k).getMemAddress2() %></td>
								</tr>
								<tr></tr>
								<tr>
									<td style="padding-top: 8px;">주문내용 :</td>
									<td style="height: 100px;">
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
									</td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">요청사항 :</td>
									<td style="padding-top: 10px; height: 100px; padding-left: 10px;">
										<%= list.get(k).getOrderRequest() %>
									</td>
								</tr>
							</table>
						</div>
						<!-- Modal footer -->
						<div class="modal-footer" style="margin: auto;">
							<!-- 하단버튼 영역-->
							<button onclick="orderManage();" type="button" class="btn btn-danger" class="orderManage" style="width: 200px; height: 50px; background: yellowgreen; border-color: yellowgreen;">
								주문접수
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달 끝 -->
		<% } %>
	<% } %>
	
	<!-- 
	<form id="postFormOrders" action="<%=contextPath%>/bmOrderStatus.orm" method="post">
		<input type="hidden" name="ono" value="<%= list.get(k).getReceiptNo() %>">
	</form>
	 -->
	
	<script>
		
		function orderManage(){
			$("#postFormOrders").submit();
		};
		
	</script>
</body>
</html>