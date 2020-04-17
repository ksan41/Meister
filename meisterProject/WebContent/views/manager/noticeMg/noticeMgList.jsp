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
    <title>meister_통합 - 고객공지사항 리스트</title>
    <link href="../resources/admin/dist/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
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
	<%@ include file="../../common_manager/ImMenubar.jsp"%>
	
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
                        <h1 class="mt-4">고객 공지사항</h1>
                        <div align="right">
                            <button class="button" onclick="">등록</button>
                            <button class="button" onclick="">수정</button>
                            <button class="button" onclick="">삭제</button>
                        </div>
                        <!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="menubar_im.html">홈</a></li>
                            <li class="breadcrumb-item active">지점 공지사항</li>
                        </ol> -->
                        <!-- <div class="card mb-4">
                            <div class="card-body">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>.</div>
                        </div> -->
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i> 고객 공지사항</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataListTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th width="5%"><input type="checkbox"></th>
                                                <th width="10%">No</th>
                                                <th width="50%">제목</th>
                                                <th width="20%">등록일</th>
                                                <th width="15%">조회수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>35</td>
                                                <td>New York</td>
                                                <td>2011/12/12</td>
                                                <td>21</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>34</td>
                                                <td>Sidney</td>
                                                <td>2010/09/20</td>
                                                <td>23</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>33</td>
                                                <td>London</td>
                                                <td>2009/10/09</td>
                                                <td>47</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>32</td>
                                                <td>Edinburgh</td>
                                                <td>2010/12/22</td>
                                                <td>42</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>31</td>
                                                <td>Singapore</td>
                                                <td>2010/11/14</td>
                                                <td>28</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>30</td>
                                                <td>San Francisco</td>
                                                <td>2011/06/07</td>
                                                <td>28</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>29</td>
                                                <td>San Francisco</td>
                                                <td>2010/03/11</td>
                                                <td>48</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>28</td>
                                                <td>Tokyo</td>
                                                <td>2011/08/14</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>27</td>
                                                <td>Sidney</td>
                                                <td>2011/06/02</td>
                                                <td>37</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>26</td>
                                                <td>London</td>
                                                <td>2009/10/22</td>
                                                <td>53</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>25</td>
                                                <td>London</td>
                                                <td>2011/05/07</td>
                                                <td>27</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>24</td>
                                                <td>San Francisco</td>
                                                <td>2008/10/26</td>
                                                <td>22</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>23</td>
                                                <td>Edinburgh</td>
                                                <td>2011/03/09</td>
                                                <td>46</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>22</td>
                                                <td>San Francisco</td>
                                                <td>2009/12/09</td>
                                                <td>47</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>21</td>
                                                <td>San Francisco</td>
                                                <td>2008/12/16</td>
                                                <td>51</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>20</td>
                                                <td>San Francisco</td>
                                                <td>2010/02/12</td>
                                                <td>41</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>19</td>
                                                <td>San Francisco</td>
                                                <td>2009/02/14</td>
                                                <td>62</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>18</td>
                                                <td>London</td>
                                                <td>2008/12/11</td>
                                                <td>37</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>17</td>
                                                <td>New York</td>
                                                <td>2008/09/26</td>
                                                <td>65</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>16</td>
                                                <td>Singapore</td>
                                                <td>2011/02/03</td>
                                                <td>64</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>15</td>
                                                <td>London</td>
                                                <td>2011/05/03</td>
                                                <td>38</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>14</td>
                                                <td>Tokyo</td>
                                                <td>2009/08/19</td>
                                                <td>37</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>13</td>
                                                <td>New York</td>
                                                <td>2013/08/11</td>
                                                <td>61</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>12</td>
                                                <td>San Francisco</td>
                                                <td>2009/07/07</td>
                                                <td>47</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>11</td>
                                                <td>Singapore</td>
                                                <td>2012/04/09</td>
                                                <td>64</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>10</td>
                                                <td>New York</td>
                                                <td>2010/01/04</td>
                                                <td>63</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>9</td>
                                                <td>San Francisco</td>
                                                <td>2012/06/01</td>
                                                <td>56</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>8</td>
                                                <td>Edinburgh</td>
                                                <td>2013/02/01</td>
                                                <td>43</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>7</td>
                                                <td>New York</td>
                                                <td>2011/12/06</td>
                                                <td>46</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>6</td>
                                                <td>London</td>
                                                <td>2011/03/21</td>
                                                <td>47</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>5</td>
                                                <td>London</td>
                                                <td>2009/02/27</td>
                                                <td>21</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>4</td>
                                                <td>San Francisco</td>
                                                <td>2010/07/14</td>
                                                <td>30</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>3</td>
                                                <td>Edinburgh</td>
                                                <td>2008/11/13</td>
                                                <td>51</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>2</td>
                                                <td>Singapore</td>
                                                <td>2011/06/27</td>
                                                <td>29</td>
                                            </tr>
                                            <tr>
                                                <td><input type="checkbox"></td>
                                                <td>1</td>
                                                <td>New York</td>
                                                <td>2011/01/25</td>
                                                <td>27</td>
                                            </tr>
                                        </tbody>
                                    </table>
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