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
    <title>meister_통합 - 지점공지사항 수정</title>
    <link href="../resources/admin/dist/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="menubar_im.html" style="font-style:italic;">Meister Pizza</a><button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- 검색바 -->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
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
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="login.html">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">관리</div>
                            <a class="nav-link" href=""><div class="sb-nav-link-icon">
                                <i class="fas fa-map-marker-alt"></i></div>지점관리</a>
                            <a class="nav-link" href=""><div class="sb-nav-link-icon">
                                <i class="fas fa-user-alt"></i></div>회원관리</a>
                            <a class="nav-link" href=""><div class="sb-nav-link-icon">
                                <i class="fas fa-book-open"></i></div>메뉴관리</a>
                            <a class="nav-link" href=""><div class="sb-nav-link-icon">
                                <i class="fas fa-ticket-alt"></i></div>쿠폰관리</a>

                            <div class="sb-sidenav-menu-heading">게시판</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts"
                                ><div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                공지사항
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                            ></a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav"><a class="nav-link" href="">지점</a><a class="nav-link" href="">고객</a></nav>
                            </div>
                            <a class="nav-link collapsed" href=""><div class="sb-nav-link-icon">
                                <i class="fas fa-gift"></i></div>이벤트</a>

                            <div class="sb-sidenav-menu-heading">문의</div>
                            <a class="nav-link" href="">
                                <div class="sb-nav-link-icon"><i class="fa fa-question-circle"></i></div>FAQ</a>
                            <a class="nav-link" href="">
                                <div class="sb-nav-link-icon"><i class="fa fa-reply"></i></div>1:1문의</a>
                        </div>
                    </div>
                </nav>
            </div>

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
                            <div class="card-header"><i class="fas fa-table mr-1"></i> 지점 공지사항 수정</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataEnrollTable" width="100%" cellspacing="0">  
                                        <tr>
                                            <th style="height:50px; width:100px; text-align:center;">제목</th>
                                            <td><input type="text" size="90" value="원글제목"></td>
                                        </tr>
                                        <tr>
                                            <th style="height: 500px; width:100px; text-align:center;">내용</th>
                                            <td>
                                                <textarea name="" id="" cols="100" rows="19" style="resize:none;">원글내용</textarea>
                                            </td>
                                        </tr>
                                    </table>

                                    <div align="center">
                                        <button class="button" onclick="">수정</button>
                                        <button class="button" onclick="">취소</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </main>                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2019</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/admin/dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>

</body>
</html>