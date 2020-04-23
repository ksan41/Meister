<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>meister_통합 - 고객공지사항 리스트</title>
    
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
    
    <link href="../resources/admin/dist/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    <style>
	    input[type=checkbox]{
	        cursor:pointer;
	        width:18px;
	        height:18px;
	    }
	    table tr{text-align: center;}
    </style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">고객 공지사항</h1>
			<div align="right">
				<button class="button" onclick="modify">등록</button>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 고객 공지사항
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataListTable"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th width="10%">No</th>
									<th width="55%">제목</th>
									<th width="20%">등록일</th>
									<th width="15%">조회수</th>
								</tr>
							</thead>
							<tbody>
								<% if(list.isEmpty()){ // 리스트가 비어있을 경우 %>
									<tr>
										<td colspan="4">존재하는 공지사항이 없습니다.</td>
									</tr>
								<% }else{ // 리스트가 비어있지 않을 경우 %>
								
									<% for(Notice n : list){ %>
										<tr>
											<td><%= n.getNoticeNo() %></td>
											<td><%= n.getNoticeTitle() %></td>
											<td><%= n.getCreateDate() %></td>
											<td><%= n.getCount() %></td>
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
	
	<script>
		// 공지사항 상세조회
		$(function(){
			$("#dataListTable>tbody>tr").click(function(){
				console.log("클릭");
				
				// 현재 클릭했을 때의 해당 공지사항의 번호
				var nno = $(this).children().eq(0).text();
				// 쿼리스트링 이용해서 전달값 전달
				location.href="<%= contextPath %>/imNoticeMdetail.nom?nno=" + nno;
			});
		});
	</script>
	
</body>
</html>