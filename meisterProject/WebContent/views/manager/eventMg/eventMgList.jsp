<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
	
		<!-- 메뉴바 include여기에 해주세요 -->
		<%@ include file="../../common_manager/ImMenubar.jsp"%>
		<!-- 메뉴바 include여기에 해주세요 -->
		
		
       <!-- 모달 부트스트랩-->
        <link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <!-- 모달 부트스트랩 -->

<style>
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


	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">이벤트</h1>
			<br>

			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 이벤트 관리
				</div>
				<div class="card-body">

					<div align="right">
						<button class="button" onclick="" data-toggle="modal"
							data-target="#eventEnrollModal">이벤트 등록</button>
					</div>

					<table id="eventListTable" align="center">
						<tr>
							<td><img
								src="../../resources/admin/img_meister/eventThumbnail/20200331_wCMr6nqu.jpg">
								<div align="center">
									신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
									<p class="bannerStatus" style="color: red">배너 등록중</p>
									<div align="center">
										<button class="button" onclick="" data-toggle="modal"
											data-target="#eventUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
								</div></td>
							<td><img
								src="../../resources/admin/img_meister/eventThumbnail/20200331_lYlQ96T4.jpg">
								<div align="center">
									신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
									<p class="bannerStatus" style="color: red"></p>
									<div align="center">
										<button class="button" onclick="" data-toggle="modal"
											data-target="#eventUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
								</div></td>
						</tr>
						<tr>
							<td><img
								src="../../resources/admin/img_meister/eventThumbnail/20200311_K62y1s4N.jpg">
								<div align="center">
									신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
									<p class="bannerStatus" style="color: red">배너 등록중</p>
									<div align="center">
										<button class="button" onclick="" data-toggle="modal"
											data-target="#eventUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
								</div></td>
							<td><img
								src="../../resources/admin/img_meister/eventThumbnail/20200327_4X39ZmU4.jpg">
								<div align="center">
									신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
									<p class="bannerStatus" style="color: red"></p>
									<div align="center">
										<button class="button" onclick="" data-toggle="modal"
											data-target="#eventUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
								</div></td>
						</tr>
						<tr>
							<td><img
								src="../../resources/admin/img_meister/eventThumbnail/20200331_wCMr6nqu.jpg">
								<div align="center">
									신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
									<p class="bannerStatus" style="color: red"></p>
									<div align="center">
										<button class="button" onclick="" data-toggle="modal"
											data-target="#eventUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
								</div></td>
							<td><img
								src="../../resources/admin/img_meister/eventThumbnail/20200120_ZdUq5370.jpg">
								<div align="center">
									신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
									<p class="bannerStatus" style="color: red"></p>
									<div align="center">
										<button class="button" onclick="" data-toggle="modal"
											data-target="#eventUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
								</div></td>
						</tr>
						<tr>
							<td><img
								src="../../resources/admin/img_meister/eventThumbnail/20200131_Npy27D5Z.jpg">
								<div align="center">
									신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
									<p class="bannerStatus" style="color: red"></p>
									<div align="center">
										<button class="button" onclick="" data-toggle="modal"
											data-target="#eventUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
								</div></td>
							<td><img
								src="../../resources/admin/img_meister/eventThumbnail/20200120_h72eVUM8.jpg">
								<div align="center">
									신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
									<p class="bannerStatus" style="color: red"></p>
									<div align="center">
										<button class="button" onclick="" data-toggle="modal"
											data-target="#eventUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
								</div></td>
						</tr>
					</table>

				</div>
			</div>

		</div>
		</main>
	</div>

	<!-- 등록 버튼 모달 시작 -->
	<div class="modal fade" id="eventEnrollModal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin: auto; padding: 0;">이벤트
						등록</h4>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" name="eventEnrollForm">
						<table id="eventEnrollTable">
							<tr>
								<th>제목</th>
								<td><input type="text" placeholder="내용을 입력해주세요" size="40px">
								</td>
							</tr>
							<tr>
								<th>이벤트 기간</th>
								<td><input type="date"> ~ <input type="date">
								</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>상세 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>배너 등록여부</th>
								<td><input type="radio" style="margin-left: 10px;"></td>
							</tr>
						</table>

						<br>
						<br>

						<!-- 버튼 영역 -->
						<div class="faqBtns" style="align-content: right;" align="center">
							<button type="submit" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">등록</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록 버튼 모달 끝 -->

	<!-- 수정 버튼 모달 시작 -->
	<div class="modal fade" id="eventUpdateModal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin: auto; padding: 0;">이벤트
						수정</h4>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" name="eventUpdateForm">
						<table id="eventUpdateTable">
							<tr>
								<th>제목</th>
								<td><input type="text" size="40px" value="기존 이벤트 제목">
								</td>
							</tr>
							<tr>
								<th>이벤트 기간</th>
								<td><input type="date"> ~ <input type="date">
								</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>상세 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>배너 등록여부</th>
								<td><input type="radio" style="margin-left: 10px;"></td>
							</tr>
						</table>

						<br>
						<br>

						<!-- 버튼 영역 -->
						<div class="faqBtns" style="align-content: right;" align="center">
							<button type="submit" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">수정</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정 버튼 모달 끝 -->


	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="menubar_im.html"
			style="font-style: italic;">Meister Pizza</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- 검색바 -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<!-- <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div> -->
				<b id="adminPage"> 통합관리자페이지 접속중</b>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="login.html">Logout</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">관리</div>
						<a class="nav-link" href=""><div class="sb-nav-link-icon">
								<i class="fas fa-map-marker-alt"></i>
							</div>지점관리</a> <a class="nav-link" href=""><div
								class="sb-nav-link-icon">
								<i class="fas fa-user-alt"></i>
							</div>회원관리</a> <a class="nav-link" href=""><div
								class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div>메뉴관리</a> <a class="nav-link" href=""><div
								class="sb-nav-link-icon">
								<i class="fas fa-ticket-alt"></i>
							</div>쿠폰관리</a>

						<div class="sb-sidenav-menu-heading">게시판</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts"><div
								class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 공지사항
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="">지점</a><a class="nav-link" href="">고객</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href=""><div
								class="sb-nav-link-icon">
								<i class="fas fa-gift"></i>
							</div>이벤트</a>

						<div class="sb-sidenav-menu-heading">문의</div>
						<a class="nav-link" href="">
							<div class="sb-nav-link-icon">
								<i class="fa fa-question-circle"></i>
							</div>FAQ
						</a> <a class="nav-link" href="">
							<div class="sb-nav-link-icon">
								<i class="fa fa-reply"></i>
							</div>1:1문의
						</a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid">
				<h1 class="mt-4">이벤트</h1>
				<br>

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i> 이벤트 관리
					</div>
					<div class="card-body">

						<div align="right">
							<button class="button" onclick="" data-toggle="modal"
								data-target="#eventEnrollModal">이벤트 등록</button>
						</div>

						<table id="eventListTable" align="center">
							<tr>
								<td><img
									src="../../resources/admin/img_meister/eventThumbnail/20200331_wCMr6nqu.jpg">
									<div align="center">
										신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
										<p class="bannerStatus" style="color: red">배너 등록중</p>
										<div align="center">
											<button class="button" onclick="" data-toggle="modal"
												data-target="#eventUpdateModal">수정</button>
											<button class="button" onclick="deleteConfirm();">삭제</button>
										</div>
									</div></td>
								<td><img
									src="../../resources/admin/img_meister/eventThumbnail/20200331_lYlQ96T4.jpg">
									<div align="center">
										신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
										<p class="bannerStatus" style="color: red"></p>
										<div align="center">
											<button class="button" onclick="" data-toggle="modal"
												data-target="#eventUpdateModal">수정</button>
											<button class="button" onclick="deleteConfirm();">삭제</button>
										</div>
									</div></td>
							</tr>
							<tr>
								<td><img
									src="../../resources/admin/img_meister/eventThumbnail/20200311_K62y1s4N.jpg">
									<div align="center">
										신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
										<p class="bannerStatus" style="color: red">배너 등록중</p>
										<div align="center">
											<button class="button" onclick="" data-toggle="modal"
												data-target="#eventUpdateModal">수정</button>
											<button class="button" onclick="deleteConfirm();">삭제</button>
										</div>
									</div></td>
								<td><img
									src="../../resources/admin/img_meister/eventThumbnail/20200327_4X39ZmU4.jpg">
									<div align="center">
										신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
										<p class="bannerStatus" style="color: red"></p>
										<div align="center">
											<button class="button" onclick="" data-toggle="modal"
												data-target="#eventUpdateModal">수정</button>
											<button class="button" onclick="deleteConfirm();">삭제</button>
										</div>
									</div></td>
							</tr>
							<tr>
								<td><img
									src="../../resources/admin/img_meister/eventThumbnail/20200331_wCMr6nqu.jpg">
									<div align="center">
										신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
										<p class="bannerStatus" style="color: red"></p>
										<div align="center">
											<button class="button" onclick="" data-toggle="modal"
												data-target="#eventUpdateModal">수정</button>
											<button class="button" onclick="deleteConfirm();">삭제</button>
										</div>
									</div></td>
								<td><img
									src="../../resources/admin/img_meister/eventThumbnail/20200120_ZdUq5370.jpg">
									<div align="center">
										신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
										<p class="bannerStatus" style="color: red"></p>
										<div align="center">
											<button class="button" onclick="" data-toggle="modal"
												data-target="#eventUpdateModal">수정</button>
											<button class="button" onclick="deleteConfirm();">삭제</button>
										</div>
									</div></td>
							</tr>
							<tr>
								<td><img
									src="../../resources/admin/img_meister/eventThumbnail/20200131_Npy27D5Z.jpg">
									<div align="center">
										신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
										<p class="bannerStatus" style="color: red"></p>
										<div align="center">
											<button class="button" onclick="" data-toggle="modal"
												data-target="#eventUpdateModal">수정</button>
											<button class="button" onclick="deleteConfirm();">삭제</button>
										</div>
									</div></td>
								<td><img
									src="../../resources/admin/img_meister/eventThumbnail/20200120_h72eVUM8.jpg">
									<div align="center">
										신학기 기념 3월 신메뉴 행사<br> 2020-02-10 ~ 2020-03-10
										<p class="bannerStatus" style="color: red"></p>
										<div align="center">
											<button class="button" onclick="" data-toggle="modal"
												data-target="#eventUpdateModal">수정</button>
											<button class="button" onclick="deleteConfirm();">삭제</button>
										</div>
									</div></td>
							</tr>
						</table>

					</div>
				</div>

			</div>
			</main>

			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2019</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<!-- 등록 버튼 모달 시작 -->
	<div class="modal fade" id="eventEnrollModal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin: auto; padding: 0;">이벤트
						등록</h4>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" name="eventEnrollForm">
						<table id="eventEnrollTable">
							<tr>
								<th>제목</th>
								<td><input type="text" placeholder="내용을 입력해주세요" size="40px">
								</td>
							</tr>
							<tr>
								<th>이벤트 기간</th>
								<td><input type="date"> ~ <input type="date">
								</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>상세 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>배너 등록여부</th>
								<td><input type="radio" style="margin-left: 10px;"></td>
							</tr>
						</table>

						<br>
						<br>

						<!-- 버튼 영역 -->
						<div class="faqBtns" style="align-content: right;" align="center">
							<button type="submit" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">등록</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록 버튼 모달 끝 -->

	<!-- 수정 버튼 모달 시작 -->
	<div class="modal fade" id="eventUpdateModal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin: auto; padding: 0;">이벤트
						수정</h4>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" name="eventUpdateForm">
						<table id="eventUpdateTable">
							<tr>
								<th>제목</th>
								<td><input type="text" size="40px" value="기존 이벤트 제목">
								</td>
							</tr>
							<tr>
								<th>이벤트 기간</th>
								<td><input type="date"> ~ <input type="date">
								</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>상세 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>배너 등록여부</th>
								<td><input type="radio" style="margin-left: 10px;"></td>
							</tr>
						</table>

						<br>
						<br>

						<!-- 버튼 영역 -->
						<div class="faqBtns" style="align-content: right;" align="center">
							<button type="submit" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">수정</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정 버튼 모달 끝 -->

	<script>
            function deleteConfirm(){
                confirm('해당 이벤트를 삭제하시겠습니까?');
            };
        </script>


	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../resources/admin/dist/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>

</body>
</html>