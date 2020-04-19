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
    <title>meister_통합 - 고객공지사항 상세</title>
    
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
					<i class="fas fa-table mr-1"></i> 고객 공지사항 상세보기
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr>
								<th style="height: 50px;">연극 <환상동화> 이벤트 당첨자 안내</th>
							</tr>
							<tr>
								<td style="height: 500px; font-size: 13px;">안녕하세요 고객님<br>
									언제나 저희 도미노피자를 사랑해주셔서 감사의 말씀 드리며<br> 2월 연극 <환상동화>
									이벤트 당첨자 안내를 드립니다.(1인 2매)<br>
									<br>
									당첨자 여러분 모두 축하 드리며, 자세한 안내는 개별문자로 안내드릴 예정입니다.<br>
									<br>
									앞으로도 도미노피자에 많은 관심 부탁 드립니다. 감사합니다.<br>
									<br>
									<br>
									당첨자리스트(ABC 순)<br>
									*F3를 눌러 아이디 검색, 확인하시면 됩니다.<br>
									<br>
									ajach***<br>
									anacn***<br>
									bboya0***<br>
									cksdn9***<br>
									enterpr***<br>
									eunseon0***<br>
									guswl9***<br>
									hanhee7***<br>
									hape***<br>
									hee***<br>
									hehaery***<br>
									hjba***<br>
									hsl0***<br>
									jarchiv***<br>
									jhj841***<br>
									jiyoun***<br>
									keem***<br>
									kir***<br>
									kkh6***<br>
									koornd***<br>
									kspri***<br>
									kyttt0***<br></td>
							</tr>
						</table>

						<div align="center">
							<button class="button" onclick="">목록</button>
							<button class="button" onclick="">수정</button>
							<button class="button" onclick="">삭제</button>
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