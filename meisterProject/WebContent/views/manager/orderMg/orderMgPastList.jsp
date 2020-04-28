<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.order.model.vo.*, com.meister.coupon.model.vo.*, com.meister.menu.model.vo.*" %>
<%
	ArrayList<Orders> orderList = (ArrayList<Orders>)request.getAttribute("orderList");
	ArrayList<Price> priceList = (ArrayList<Price>)request.getAttribute("priceList");
	
	// 조건처리용 메뉴정보들
	ArrayList<Pizza> pList = (ArrayList<Pizza>)request.getAttribute("pList");
	ArrayList<PizzaSize> sizeList = (ArrayList<PizzaSize>)request.getAttribute("sizeList");
	ArrayList<Dough> dList = (ArrayList<Dough>)request.getAttribute("dList");
	ArrayList<Side> sList = (ArrayList<Side>)request.getAttribute("sList");
	ArrayList<Etc> eList = (ArrayList<Etc>)request.getAttribute("eList");
	
	String pizzaName="";
	
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
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_지점 - 지난 주문내역</title>
	
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
  
          tr {text-align: center;}
  
          #index-area {
              text-align: right;
              font-size: 12px;
          }
  
          #index-area a {color: gray}
  
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
}s

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

	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">지난 주문내역</h1>
			<!-- 제목-->
			<div id="index-area">
				<a href="">홈</a> &gt; <a href="">지난 주문내역</a>
			</div>
			<br>
			<div class="card mb-4">
				<!-- 아이콘은 위에 메뉴에서 해당 i태그 가져오세요-->
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 지난 주문내역 조회
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table style="margin: auto;">
							<tr>
								<td><input type="date" style="width: 150px; text-align: center;" name="startDay" placeholder="0000-00-00"> ~</td>
								<td><input type="date" style="width: 150px; text-align: center;" name="lastDay" placeholder="0000-00-00"></td>
								<td><input type="text" style="width: 150px; margin-left: 10px;" name="userName" placeholder="  고객명"></td>
								<td><button style="margin-left: 10px;">검색</button></td>
							</tr>
						</table>
						<br>
						<!-- 내용작성-->
						<table class="table table-bordered" id="dataListTable" width="60%" cellspacing="0";>
							<thead>
								<tr>
									<th width="15%">주문번호</th>
									<th width="13%">고객명</th>
									<th width="50%">주문정보</th>
									<th width="22%">주문일시</th>
								</tr>
							</thead>
							<tbody>
								<% if(orderList.isEmpty()){ // 리스트가 비어있을 경우 %>
									<tr>
										<td colspan="5">존재하는 주문내역이 없습니다.</td>
									</tr>
								<% }else{ // 리스트가 비어있지 않을 경우 %>
									<% for(int i=0; i<orderList.size(); i++){ %>
										<tr data-toggle="modal" data-target="#myModal">
											<td><%= orderList.get(i).getReceiptNo() %></td>
											<td><%= orderList.get(i).getOrderName()%></td>
											<td>
												<!-- 주문 정보 -->
												<% String[] pizzaNoList = priceList.get(i).getPizzaNo().split(","); %>
												<% for(int j=0; j<pList.size(); j++){ %>
													<% if(pList.get(j).getPizzaNo() == Integer.parseInt(pizzaNoList[0])){ %>
														<% pizzaName = pList.get(j).getPizzaName(); %>
													<% } %>
												<% } %>
												
												<%
													int pizzaCount = 0;
													int sideCount = 0;
													int etcCount = 0;
													
													String[] pStr = priceList.get(i).getPizzaCount().split(",");
													for(int j=0; j<pStr.length; j++){
														pizzaCount += Integer.parseInt(pStr[j]);
													}
													
													if(priceList.get(i).getSideCount() != null){
														String[] sStr = priceList.get(i).getSideCount().split(",");
														for(int j=0; j<sStr.length; j++){
															sideCount += Integer.parseInt(sStr[j]);
														}
													}
													
													if(priceList.get(i).getEtcCount() != null){
														String[] eStr = priceList.get(i).getEtcCount().split(",");
														for(int j=0; j<eStr.length; j++){
															etcCount += Integer.parseInt(eStr[j]);
														}
													}
													
													int totalCount = pizzaCount + sideCount + etcCount;
												%>
												
												<%= pizzaName %> 외 <%=totalCount-1%>건 
											</td>
											<td><%= orderList.get(i).getOrderDate() %></td>
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

	<% if(orderList.isEmpty()){%>
	<%}else{ %>
		<% int upIndex = 0; %>
		<%for(int k=0; k<orderList.size(); k++){ %>
			<% upIndex++; %>
			<!-- 모달 시작 -->
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
									<td><%= orderList.get(k).getReceiptNo() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">주문일시 :</td>
									<td style="padding-top: 8px; padding-left: 10px;"><%= orderList.get(k).getOrderDate() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">고객명 :</td>
									<td style="padding-top: 8px;"><%= orderList.get(k).getOrderName() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">연락처 :</td>
									<td style="padding-top: 8px;"><%= orderList.get(k).getOrderPhone() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">배달주소 :</td>
									<td style="padding-top: 8px;">
										<%= orderList.get(k).getMemAddress1() %><br>
										<%= orderList.get(k).getMemAddress2() %>
									</td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">주문내용 :</td>
									<td style="padding-top: 8px;">
										<!-- 주문내용 -->
										<%
											String[] pizzaSize = priceList.get(k).getPizzaSize().split(",");
											String[] pizzaNo = priceList.get(k).getPizzaNo().split(",");
											String[] pizzaCount = priceList.get(k).getPizzaCount().split(",");
											String[] doughNo = priceList.get(k).getDoughNo().split(",");
										%>
										<% for(int l=0; l<pizzaSize.length; l++){ // 주문한 피자 내용 %>
											<% for(int m=0; m<pList.size(); m++){ %>
												<% if(pList.get(m).getPizzaNo() == Integer.parseInt(pizzaNo[l])){ %>
													<% pName = pList.get(m).getPizzaName(); %>
												<% } %>
											<% } %>
											<% for(int m=0; m<sizeList.size(); m++){ %>
												<% if(sizeList.get(m).getSizeNo() == Integer.parseInt(pizzaSize[l])){ %>
													<% pSize = sizeList.get(m).getPizzaSize(); %>
													<% pPrice = sizeList.get(m).getPizzaPrice(); %>
												<% } %>
											<% } %>
											<% for(int m=0; m<dList.size(); m++){ %>
												<% if(dList.get(m).getDoughNo() == Integer.parseInt(doughNo[l])){ %>
													<% if(dList.get(m).getDoughAddPrice()+"" != null) {%>
														<% doughPrice = dList.get(m).getDoughAddPrice(); %>
													<% } %>
												<% } %>
											<% } %>
											<% pCount = Integer.parseInt(pizzaCount[l]); %>
											<% pPrice = (pPrice + doughPrice) * pCount; %>
											
											<%=pName%> <%=pSize%> x <%=pCount%> / <%=pPrice %>원<br>
										<% } %>
										
										<% if(priceList.get(k).getSideNo() != null && priceList.get(k).getSideCount() != null) { // 주문한 사이드 내용 %>
											<% String[] sideNo = priceList.get(k).getSideNo().split(","); %>
											<% String[] sideCount = priceList.get(k).getSideCount().split(","); %>
											
											<% for(int l=0; l<sideNo.length; l++) { %>
												<% for(int m=0; m<sList.size(); m++){ %>
													<% if(sList.get(m).getSideNo() == Integer.parseInt(sideNo[l])){ %>
														<% sName = sList.get(m).getSideName(); %>
														<% sPrice = sList.get(m).getSidePrice(); %>
													<% } %>
												<% } %>
												
												<% sCount = Integer.parseInt(sideCount[l]); %>
												<% sPrice = sPrice * sCount; %>
												
												<%=sName %> x <%=sCount %> / <%=sPrice %>원<br>
											<% } %>
										<% } %>
										
										<% if(priceList.get(k).getEtcNo() != null && priceList.get(k).getEtcCount() != null) { // 주문한 기타상품 내용 %>
											<% String[] etcNo = priceList.get(k).getEtcNo().split(","); %>
											<% String[] etcCount = priceList.get(k).getEtcCount().split(","); %>
											
											<% for(int l=0; l<etcNo.length; l++) { %>
												<% for(int m=0; m<eList.size(); m++){ %>
													<% if(eList.get(m).getEtcNo() == Integer.parseInt(etcNo[l])){ %>
														<% eName = eList.get(m).getEtcName(); %>
														<% ePrice = eList.get(m).getEtcPrice(); %>
													<% } %>
												<% } %>
												
												<% eCount = Integer.parseInt(etcCount[l]); %>
												<% ePrice = ePrice * eCount; %>
												
												<%=eName %> x <%=eCount %> / <%=ePrice %>원<br>								
											<% } %>
										<% } %>
									</td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">요청사항 :</td>
									<td style="height: 100px; padding-top: 8px;">
										<%=orderList.get(k).getOrderRequest()%>
									</td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">배달일시 :</td>
									<td style="height: 100px; padding-top: 8px;"><%=orderList.get(k).getOrderDate()%></td>
								</tr>
							</table>
						</div>
						<!-- Modal footer -->
						<div class="modal-footer" style="margin: auto;">
							<!-- 하단버튼 영역-->
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								style="width: 200px; height: 50px; background: #343a40; border-color: #343a40;">확인</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 모달 끝 -->

</body>
</html>