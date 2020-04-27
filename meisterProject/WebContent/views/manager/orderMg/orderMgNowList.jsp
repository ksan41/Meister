<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.order.model.vo.*, com.meister.coupon.model.vo.*, com.meister.menu.model.vo.*" %>
<%
	ArrayList<Orders> orderList = (ArrayList<Orders>)request.getAttribute("orderList");
	ArrayList<Price> priceList = (ArrayList<Price>)request.getAttribute("priceList");
	
	// 조건처리용 메뉴정보들
	ArrayList<Pizza> pList = (ArrayList<Pizza>)request.getAttribute("pList");
	ArrayList<Pizza> sizeList = (ArrayList<Pizza>)request.getAttribute("sizeList");
	ArrayList<Pizza> dList = (ArrayList<Pizza>)request.getAttribute("dList");
	ArrayList<Pizza> sList = (ArrayList<Pizza>)request.getAttribute("sList");
	ArrayList<Pizza> eList = (ArrayList<Pizza>)request.getAttribute("eList");
	
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
							 	<% if(orderList.isEmpty()){ // 리스트가 비어있을 경우 %>
									<tr>
										<td colspan="5">존재하는 주문내역이 없습니다.</td>
									</tr>
								<% }else{ // 리스트가 비어있지 않을 경우 %>
								
									<% for(Orders o : orderList){ %>
									 	
									 	<tr data-toggle="modal" data-target="#myModal">
											<td><%= o.getReceiptNo() %></td>
											<td><%= o.getMemberId() %></td>
											<td>
												<!-- 주문내용 -->
											</td>
											<td><%= o.getOrderDate() %></td>
											<th>
											<!-- <button class="button" onclick="" style="background-color: yellowgreen;">접수</button> -->
												<% if(o.getOrderStatus().equals("T")) { %>
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
	
	
	<% if(orderList.isEmpty()){%>
	<%}else{ %>
		<% int upIndex = 0; %>
		<%for(int k=0; k<orderList.size(); k++){ %>
			<% upIndex++; %>
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
									<td><%= orderList.get(k).getReceiptNo() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">주문일시 :</td>
									<td><%= orderList.get(k).getOrderDate() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">고객명 :</td>
									<td><%= orderList.get(k).getOrderName() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">연락처 :</td>
									<td><%= orderList.get(k).getOrderPhone() %></td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">배달주소 :</td>
									<td style="padding-top: 8px;"><%= orderList.get(k).getMemAddress1() %> + <%= orderList.get(k).getMemAddress2() %></td>
								</tr>
								<tr></tr>
								<tr>
									<td style="padding-top: 8px;">주문내용 :</td>
									<td style="height: 100px;">
										<!-- 주문내용 -->
									</td>
								</tr>
								<tr>
									<td style="padding-top: 8px;">요청사항 :</td>
									<td style="padding-top: 10px; height: 100px; padding-left: 10px;">
										<!-- 요청사항 -->
									</td>
								</tr>
							</table>
						</div>
						<!-- Modal footer -->
						<div class="modal-footer" style="margin: auto;">
							<!-- 하단버튼 영역-->
							<form class="orderStatusManage" action="<%=contextPath%>/bmOrderStatus.orm" method="post">
								<input type="hidden" name="faqNo" value="<%= orderList.get(k).getReceiptNo() %>">
								<button type="button" class="btn btn-danger orderManage" class="orderManage" style="width: 200px; height: 50px; background: yellowgreen; border-color: yellowgreen;">
									주문접수
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 모달 끝 -->
		<% } %>
	<% } %>
	
	
	<script>

		$(document).on("click",".orderManage",function(){
			console.log("클릭됨됨됨");
			var index = $(".orderManage").index(this);
			$(".orderStatusManage:eq("+index+")").submit();
		});
		
	</script>
</body>
</html>