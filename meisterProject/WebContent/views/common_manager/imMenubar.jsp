<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meister.member.model.vo.Manager"%>
<%
	String contextPath = request.getContextPath();
	//String msg = (String)session.getAttribute("msg");
	Manager loginUser = (Manager)session.getAttribute("loginManager");
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>meister_통합</title>
    <link href="<%=contextPath %>/views/common_manager/resources/admin/dist/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>

    <style>
        #layoutSidenav_content{
            width:1300px;
            height:auto;
            margin: auto;
            margin-top: 100px;
            margin-bottom: 100px;
        }

    </style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="#" style="font-style: italic;">Meister Pizza</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- 검색바 -->
		<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<b id="adminPage"> 통합관리자페이지 접속중</b>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown">
				<a class="dropdown-item" href="<%=contextPath%>/logoutM.me" style="background: orange">Logout</a>
			</li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">관리</div>
						<a class="nav-link" href="<%=contextPath%>/branchList.br">
							<div class="sb-nav-link-icon">
								<i class="fas fa-map-marker-alt"></i>
							</div>
							지점관리
						</a>
						<a class="nav-link" href="<%=contextPath%>/memberList.memg">
							<div class="sb-nav-link-icon">
								<i class="fas fa-user-alt"></i>
							</div>
							회원관리
						</a>
						<a class="nav-link" href="<%=contextPath%>/menuMgPizzaList.meng">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div>
							메뉴관리
						</a>
						<a class="nav-link" href="<%=contextPath%>/couponList.cm">
							<div class="sb-nav-link-icon">
								<i class="fas fa-ticket-alt"></i>
							</div>
							쿠폰관리
						</a>

						<div class="sb-sidenav-menu-heading">게시판</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div>
							공지사항
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=contextPath%>/imNoticeBlist.nom">지점</a>
								<a class="nav-link" href="<%=contextPath%>/imNoticeMlist.nom">고객</a>
							</nav>
						</div>

						<a class="nav-link" href="<%=contextPath%>/evMgList.evm">
							<div class="sb-nav-link-icon">
								<i class="fas fa-gift"></i>
							</div>
							이벤트
						</a>

						<div class="sb-sidenav-menu-heading">문의</div>
						<a class="nav-link" href="<%=contextPath%>/ceMgFaqList.cem">
							<div class="sb-nav-link-icon">
								<i class="fa fa-question-circle"></i>
							</div>
							FAQ
						</a>
						<a class="nav-link" href="<%=contextPath%>/ceMgOneList.cem">
							<div class="sb-nav-link-icon">
								<i class="fa fa-reply"></i>
							</div>
							1:1문의
						</a>
					</div>
				</div>
			</nav>
		</div>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="<%=contextPath%>/views/common_manager/resources/admin/dist/js/scripts.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
		<script src="assets/demo/chart-area-demo.js"></script>
		<script src="assets/demo/chart-bar-demo.js"></script>
		<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
		<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
		<script src="assets/demo/datatables-demo.js"></script>
	</div>
</body>
</html>
    