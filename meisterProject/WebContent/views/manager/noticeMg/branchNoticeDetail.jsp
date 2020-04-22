<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.meister.notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("n");
	// 제목, 작성일, 조회수,내용
	//Notice prevN = (Notice)request.getAttribute("prevN");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_통합 - 지점공지사항 상세</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	
	<!-- 모달 부트스트랩-->
	<link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!-- 모달 부트스트랩 -->
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">지점 공지사항</h1>
			<br>
			<!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="menubar_im.html">홈</a></li>
                            <li class="breadcrumb-item active">지점 공지사항</li>
                        </ol> -->
			<!-- <div class="card mb-4">
                            <div class="card-body">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>.</div>
                        </div> -->
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i>지점 공지사항 상세보기
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr>
								<th style="height: 50px;"><%= n.getNoticeTitle() %></th>
							</tr>
							<tr>
								<td style="height: 500px; font-size: 13px;"><%= n.getNoticeContent() %></td>
							</tr>
						</table>

						<div align="center">
							<button class="button" onclick="location.href='<%= contextPath %>/imNoticeBlist.nom';">목록</button>
							<button class="button" onclick="">수정</button>
							<button class="button" onclick="">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
</body>
</html>