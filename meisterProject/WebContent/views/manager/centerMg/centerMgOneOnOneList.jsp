<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.center.model.vo.Center"%>
<%
	ArrayList<Center> list = (ArrayList<Center>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_통합 - 1:1문의 리스트</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->

    <style>
        tr{text-align: center;}
    </style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">1:1 문의</h1>
			<br>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 1:1 문의
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table id="dataListTable" class="table table-bordered" id="dataListTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th width="5%">No</th>
									<th width="15%">문의유형</th>
									<th width="15%">매장명</th>
									<th width="35%">제목</th>
									<th width="10%">아이디</th>
									<th width="10%">등록일</th>
									<th width="10%">처리상태</th>
								</tr>
							</thead>
							<tbody>
								<% if(list.isEmpty()){ // 리스트가 비어있을 경우 %>
									<tr>
										<td colspan="7">존재하는 1:1 문의가 없습니다.</td>
									</tr>
								<% }else{ // 리스트가 비어있지 않을 경우 %>
								
									<% for(Center c : list){ %>
										<tr>
											<td><%= c.getInquiryNo() %></td>
											<td>
												<% String inquiryType = ""; %>
												<% switch(c.getInquiryType()){
													case 1: inquiryType="제품관련"; break;
													case 2: inquiryType="배달서비스 관련"; break;
													case 3: inquiryType="직원 서비스 관련"; break;
													case 4: inquiryType="콜센타 관련"; break;
													case 5: inquiryType="칭찬"; break;
													case 6: inquiryType="제안"; break;
													case 7: inquiryType="단순문의"; break;
													case 8: inquiryType="기타";
												 } %>
												 <%= inquiryType %>
											</td>
											<td><%= c.getInquiryStore() %></td>
											<td><%= c.getInquiryTitle() %></td>
											<td><%= c.getMemberId() %></td>
											<td><%= c.getRegistDate() %></td>
											<td>
												<% if(c.getInquiryProStatus().equals("Y")){ %>
													답변완료
												<% } else { %>
													처리중
												<% } %>
											</td>
										</tr>
									<% } %>
								<%} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	
	<script>
	
		// 1:1문의 상세조회
		$(function(){
			$("#dataListTable>tbody>tr").click(function(){
				// 현재 클릭했을 때의 해당 1:1문의의 번호
				var ino = $(this).children().eq(0).text();
				// 쿼리스트링 이용해서 전달값 전달
				location.href="<%= contextPath %>/ceMgOneDetail.cem?ino=" + ino;
			});
		});
	
	</script>
</body>
</html>