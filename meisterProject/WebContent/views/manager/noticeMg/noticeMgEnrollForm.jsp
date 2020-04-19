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
    <title>meister_통합 - 고객공지사항 등록</title>
    
    <!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/ImMenubar.jsp"%>
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
			<!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="menubar_im.html">홈</a></li>
                            <li class="breadcrumb-item active">고객 공지사항</li>
                        </ol> -->
			<!-- <div class="card mb-4">
                            <div class="card-body">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>.</div>
                        </div> -->
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 고객 공지사항 등록
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataEnrollTable"
							width="100%" cellspacing="0">
							<tr>
								<th style="height: 50px; width: 100px; text-align: center;">제목</th>
								<td><input type="text" size="90"></td>
							</tr>
							<tr>
								<th style="height: 500px; width: 100px; text-align: center;">내용</th>
								<td><textarea name="" id="" cols="100" rows="19"
										style="resize: none;"></textarea></td>
							</tr>
						</table>

						<div align="center">
							<button class="button" onclick="">등록</button>
							<button class="button" onclick="">취소</button>
						</div>

					</div>
				</div>
			</div>
		</div>
		</main>
	</div>

	</div>
</body>
</html>