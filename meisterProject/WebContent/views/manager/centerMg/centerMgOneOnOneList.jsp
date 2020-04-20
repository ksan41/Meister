<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<link href="../resources/admin/dist/css/styles.css" rel="stylesheet" />
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
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
						<table class="table table-bordered" id="dataListTable"
							width="100%" cellspacing="0">
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
								<tr>
									<td>35</td>
									<td>제품관련</td>
									<td>역삼점</td>
									<td>피자가 너무 보기좋은데요?</td>
									<td>user1</td>
									<td>2020/03/12</td>
									<td>처리중</td>
								</tr>
								<tr>
									<td>34</td>
									<td>배달서비스관련</td>
									<td>역삼점</td>
									<td>배달이 너무 빨라요~</td>
									<td>user4</td>
									<td>2020/01/20</td>
									<td>답변완료</td>
								</tr>
								<tr>
									<td>33</td>
									<td>단순문의</td>
									<td>역삼점</td>
									<td>장인은 피자 경력이?</td>
									<td>user5</td>
									<td>2019/11/09</td>
									<td>답변완료</td>
								</tr>
								<tr>
									<td>32</td>
									<td>단순문의</td>
									<td>역삼점</td>
									<td>절대미각 인가요?</td>
									<td>user6</td>
									<td>2019/10/22</td>
									<td>답변완료</td>
								</tr>
								<tr>
									<td>31</td>
									<td>기타</td>
									<td>역삼점</td>
									<td>흔들리는 꽃들속에서~</td>
									<td>user7</td>
									<td>2019/08/14</td>
									<td>답변완료</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
</body>
</html>