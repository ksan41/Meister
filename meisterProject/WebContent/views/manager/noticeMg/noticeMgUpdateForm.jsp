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
    <title>meister_통합 - 고객공지사항 수정</title>
    
    <!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
    
    <link href="../resources/admin/dist/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">고객 공지사항</h1>
			<br>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 고객 공지사항 수정
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<form id="updateForm" action="<%= contextPath %>/imNoticeMupdate.nom" method="post">
							<input type="hidden" name="nno" value="<%=n.getNoticeNo()%>">
							<table class="table table-bordered" id="dataEnrollTable" width="100%" cellspacing="0">
								<tr>
									<th style="height: 50px; width: 100px; text-align: center;">제목</th>
									<td><input type="text" size="90" value="<%= n.getNoticeTitle() %>" name="title" required></td>
								</tr>
								<tr>
									<th style="height: 500px; width: 100px; text-align: center;">내용</th>
									<td><textarea name="content"cols="100" rows="19" style="resize: none;" required><%= n.getNoticeContent() %></textarea></td>
								</tr>
							</table>
							
							<div align="center">
								<button class="button" type="submit">수정</button>
								<button class="button" onclick="location.href='<%= contextPath %>/imNoticeMdetail.nom';">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
</body>
</html>