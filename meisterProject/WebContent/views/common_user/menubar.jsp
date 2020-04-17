<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	//String msg = (String)session.getAttribute("msg");
	//Member loginUser = (Member)session.getAttribute("loginUser");

%>    
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tasty Recipes</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->

    <!-- CSS here -->
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/themify-icons.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/nice-select.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/flaticon.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/gijgo.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/animate.min.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/slick.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/slicknav.css">
    <link rel="stylesheet" href="<%=contextPath %>/views/common_user/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

    <style>

        #user-area{
            margin-top:15px;
            width:200px;
            height:100px;
            position: absolute;
            left:1500px;
            
        }
        #user-area *{
         color:white;
         padding-right:10px;
         float: left;
         margin: auto;
         font-family: 'nanumsquare';
        }

    </style>
</head>
<body style="margin:0; padding:0;">

    <!-- 메인메뉴바 시작-->
     <!-- header-start -->
     <header style="margin: 0;padding: 0;"> 
        <div class="header-area "  style="margin: 0;padding: 0;">
            <div id="sticky-header" class="main-header-area "  style="margin: 0;padding: 0;">
                    <div class="row align-items-center" style="margin: 0;padding: 0;">
                        <div class="col-xl-3 col-lg-2" style="margin: 0;padding: 0;">
                            <div id="user-area">
                                <a href="#"><img src="<%=contextPath %>/views/common_user/img/icons/add_cart.png" alt=""></a>
                                <a href="#">로그인</a>
                                <a href="#">회원가입</a>
                                <!-- 로그인정보 없을시(회원로그인x시) 로그아웃,마이페이지 보여지도록 -->
                            </div>
                            <div class="logo" style="margin-left:105%;">
                                <a href="index.html">
                                    <img src="<%=contextPath %>/views/common_user/img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-7" style="margin: 0;padding: 0;">
                            <div class="main-menu   d-none d-lg-block" style="margin: 0;padding: 0;margin-top: 5%;">
                                <nav style="margin: 0;padding: 0;">
                                    <ul id="navigation">
                                        <li><a href="#">메뉴</a></li>
                                        <li><a href="#">이벤트</a></li>
                                        <li><a href="#">매장검색</a>                                    
                                        </li>
                                        <li><a href="#">고객센터</a></li>
                                        <li><a href="#">공지사항</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->
    <!-- 메인메뉴바 끝-->   
    <!-- JS here -->
    <script src="<%=contextPath %>/views/common_user/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/popper.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/bootstrap.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/owl.carousel.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/isotope.pkgd.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/ajax-form.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/waypoints.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/jquery.counterup.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/scrollIt.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/jquery.scrollUp.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/wow.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/nice-select.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/jquery.slicknav.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/plugins.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/gijgo.min.js"></script>

    <!--contact js-->
    <!-- 모달이랑 같이 적용했을때 오류나서 주석해뒀습니다. 혹시 문제생길 시 말씀해주세요 (산)-->
 <!--   <script src="<%=contextPath %>/views/common_user/js/contact.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/jquery.ajaxchimp.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/jquery.form.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/jquery.validate.min.js"></script>
    <script src="<%=contextPath %>/views/common_user/js/mail-script.js"></script>

    <script src="<%=contextPath %>/views/common_user/js/main.js"></script> -->
</body>

</html>