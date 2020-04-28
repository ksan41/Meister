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
	<title>meister_통합-기타리스트</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
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
        #layoutSidenav_content{
            width:1300px;
            height:auto;
            margin: auto;
            margin-top: 100px;
            margin-bottom: 100px;
        }
        tr{text-align: center;}
        select { 
            width: 200px; /* 원하는 너비설정 */
            padding: .8em 1.5em; /* 여백으로 높이 설정 */ 
            font-family: inherit; /* 폰트 상속 */ 
            background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
            border: 1px solid #999; 
            border-radius: 0px; /* iOS 둥근모서리 제거 */ 
            -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
            -moz-appearance: none; 
            appearance: none; 
        }
        .button5 {
            background-color: #343a40;
            border: none;
            color: white;
            padding: 12px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: 4px 2px;
            cursor: pointer;
            
        }
        #search{padding: 10px;}
        input[type=checkbox]{
            cursor:pointer;
            width:18px;
            height:18px;
        }
        /* 네비게이션 바 스타일 시작 */
        #ulNavi {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: white;
        width:500px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        }

        #ulNavi li{
        float: left;
        width:33%;
        }

        #ulNavi li a{
        display: block;
        color: black;
        font-weight: bold;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        }

        #ulNavi li a.active{
        background-color: #343a40;
        color:white;
        }
        /* 네비게이션 바 스타일 끝 */
        #couponEnrollTable tr{
            height:70px;
            font-size:17px;
        }



        /* 메뉴 */
        /* 서브메뉴 스타일 시작 (위에 웹폰트 링크도 복붙해주세요)*/
        div{box-sizing: border-box;}
        .outer{
            width:1000px;
            box-sizing: border-box;
        }
        
        .outer *{
            font-family: 'NanumSquare';
        }

        .outer a{text-decoration: none;}

        .inner{
            margin-left: 100px;
        }
        #index-area{
           text-align: right;
           font-size: 12px;
        }
        #index-area a{color:gray}


        .sub-menu-area *{
            padding: 5px;
        }
        .sub-menu-area>a{
            font-size: 17px;
            color:black;
            font-weight: bolder;
        }

        /* 서브메뉴 스타일 끝 */


        /* 메뉴 스타일 */
        .menu-area{
            width:1000px;
            height:auto;
            margin-top: 50px;
        }
        .menu-area>div{
            margin: auto;
            display: inline-block;
        }

        #menu-thumb{
            width:250px;
            height:300px;
            box-sizing: border-box;
            margin-top: 50px;
            margin-bottom: 60px;
            margin-right: 20px;
            margin-left: 50px;
        }

        #menu-img{
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            width:90%;
            height:70%;
            margin: auto;
            border-radius: 50%;
        }
        
        #menu-detail{
            width:25px;
            padding-left:5px;
        }

        #menu-detail:hover{
            cursor: pointer;
        }

        #menu-img>img{
            width: 150px;
            height: auto;
            
        }
        #menu-img>img:hover{
            cursor: pointer;
            opacity: 70%;
        }
        #menu-info{
            width:100%;
            height:30%;
            text-align: center;
            margin-top: 15px;
        }
        /* 메뉴스타일 */


   
       

        /* 중간버튼 스타일 */
        .middle_btn{
            display: block;
            height:40px;
            width:150px;
            margin-right:5px;
            font-size: 15px;
            font-weight: bolder;
            color:white;
            background-color: rgb(76, 60, 60);
            border:0;
            border-radius: 5px;
        }
    	/* 중간버튼 스타일 */

    	#order-btn{background-color: orange;}


    	/* 큰버튼 스타일 */
        .big_btn{
            display: block;
            height:50px;
            width:280px;
            margin: 0 auto;
            font-size: 20px;
            font-weight: bolder;
            color:white;
            background-color: orange;
            border:0;
            border-radius: 5px;
        }
    	/* 큰버튼 스타일 */ 



        /* 모달 스타일 시작*/
        .modal-body{
            margin:auto;
        }

        #menuUpdateForm{
            width:500px;
            height:400px;
            margin-left: 50px;
        }

        #menuUpdateForm>div{
            width:50%;
            height:100%;
            float: left;
            box-sizing: border-box;
        }

        #menuUpdateTable{
            width:100%;
            height:100%;
        }

        #menuUpdateTable th{
            font-size: 18px;
        }

        #menuUpdateTable tr{text-align: left;}

        #menu-update-img-area{
            width:200px;
            height:200px;
            border:1px solid gray;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-left: 113px;
        }

        #menu-upImg{
            height:auto;
            max-width:150%;
        }

        .inputs{
            border-radius: 5px;
            margin-left: 20px;
        }
        .inputs[type=text]{
            width:200px;
            height:30px;
        }
        /* 메뉴수정 모달 스타일 */
	</style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">메뉴관리</h1>
			<br>
			<ul id="ulNavi">
				<li><a href="<%=contextPath%>/menuMgPizzaList.meng">피자</a></li>
				<li><a href="<%=contextPath%>/menuMgSideList.meng">사이드디시</a></li>
				<li><a class="active">음료&기타</a></li>
			</ul>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-book-open"></i> 음료&기타 리스트
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<div align="right">
							<button class="button" onclick="" data-toggle="modal"
								data-target="#couponEnrollModal"
								style="background-color: orange; width: 100px; height: 40px; font-size: 15px;">메뉴등록</button>
						</div>
						<div class="inner">
							<!-- 음료&기타 영역 -->
							<div class="menu-area premium">
								<div id="menu-thumb">
									<div id="menu-img">
										<img src="etc/0020020000032.png" alt="">
									</div>
									<div id="menu-info">
										<h4>콜라 1.25L</h4>
										<p>2000원</p>
										<button class="button" data-toggle="modal"
											data-target="#menu-update-Modal">수정</button>
										<button class="button" onclick="">삭제</button>
									</div>
								</div>
								<div id="menu-thumb">
									<div id="menu-img">
										<img src="etc/0020020000032.png" alt="">
									</div>
									<div id="menu-info">
										<h4>콜라 1.25L</h4>
										<p>2000원</p>
										<button class="button" data-toggle="modal"
											data-target="#menu-update-Modal">수정</button>
										<button class="button" onclick="">삭제</button>
									</div>
								</div>
								<div id="menu-thumb">
									<div id="menu-img">
										<img src="etc/0020020000032.png" alt="">
									</div>
									<div id="menu-info">
										<h4>콜라 1.25L</h4>
										<p>2000원</p>
										<button class="button" data-toggle="modal"
											data-target="#menu-update-Modal">수정</button>
										<button class="button" onclick="">삭제</button>
									</div>
								</div>
							</div>
							<!-- 음료&기타 영역 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>

	<!-- 메뉴수정 모달 시작 -->
	<div class="modal fade" id="menu-update-Modal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title" style="margin: auto; padding: 0;">메뉴수정</h2>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<form id="menuUpdateForm" action="">
						<table id="menuUpdateTable">
							<tr>
								<th>메뉴명</th>
								<td><input type="text" class="inputs"></td>
							</tr>
							<tr>
								<th colspan="2">이미지첨부 <input name="menuImg" type="file"
									style="display: none;">
								</th>
							</tr>
							<tr>
								<td colspan="2">
									<div id="menu-update-img-area">
										<img id="menu-upImg" src="pizza/pizza-1949183_1280.jpg" alt="">
									</div>
								</td>
							</tr>
							<tr>
								<th>가격</th>
								<td><input name="price" type="text" class="inputs">
									원<br>
							</tr>
						</table>

					</form>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer" style="margin: auto;">
					<!-- 하단버튼 영역-->
					<button class="big_btn" id="menuUpdateBtn" data-dismiss="modal"
						style="background: orange;">수정하기</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 메뉴수정 모달 끝 -->
</body>
</html>