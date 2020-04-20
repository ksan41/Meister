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
	<title>meister_통합-사이드리스트</title>
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
            width:350px;
            height:auto;
            
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


        /* 모달 스타일 시작*/
        .modal-body{
            margin:auto;
        }

   
        /* 모달 스타일 끝*/

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


    /* 모달 메뉴스타일 */
    .modal-body{
        width:900px;
        height:900px;
        
    }
    .modal-body>div{
        width:100%;
    }

    #menu-detail1-modal{
        height:60%;
    }
    #menu-detail1-modal>div{
        float: left;
        height:100%;
        /* border: 1px solid red; */
        padding: 10px;
    }
    #menu-detail1-modal-img{width:50%}
    #menu-detail-img{
        padding-top: 50px;;
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
        width:100%;
        height:300px;
        margin: auto;
    }
    #menu-detail1-modal-info{width:50%;}
    #menu-detail1-moda2{
        height:40%;
        padding: 10px;
    }

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



        /* 메뉴수정 모달 스타일 */
           #menuUpdateForm{
            width:950px;
            height:600px;
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
            width:250px;
            height:250px;
            border:1px solid gray;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: auto;
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
				<li><a href="">피자</a></li>
				<li><a class="active" href="">사이드디시</a></li>
				<li><a href="">음료&기타</a></li>
			</ul>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-book-open"></i> 사이드디시 리스트
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<div align="right">
							<button class="button" onclick="" data-toggle="modal"
								data-target="#couponEnrollModal"
								style="background-color: orange; width: 100px; height: 40px; font-size: 15px;">메뉴등록</button>
						</div>
						<div class="inner">
							<!-- 사이드디시 영역 -->
							<div class="menu-area premium">
								<div id="menu-thumb">
									<div id="menu-img">
										<img src="side/close-up-1854245_1280.jpg" alt="">
									</div>
									<div id="menu-info">
										<h4>
											그리니시 샐러드<img id="menu-detail"
												src="img/icons/baseline_search_black_18dp.png" alt=""
												data-toggle="modal" data-target="#menu-detail-modal">
										</h4>
										<p>10000원</p>
										<button class="button" data-toggle="modal"
											data-target="#menu-update-Modal">수정</button>
										<button class="button" onclick="">삭제</button>
									</div>
								</div>
								<div id="menu-thumb">
									<div id="menu-img">
										<img src="side/close-up-1854245_1280.jpg" alt="">
									</div>
									<div id="menu-info">
										<h4>
											그리니시 샐러드<img id="menu-detail"
												src="img/icons/baseline_search_black_18dp.png" alt=""
												data-toggle="modal" data-target="#menu-detail-modal">
										</h4>
										<p>10000원</p>
										<button class="button" data-toggle="modal"
											data-target="#menu-update-Modal">수정</button>
										<button class="button" onclick="">삭제</button>
									</div>
								</div>
								<div id="menu-thumb">
									<div id="menu-img">
										<img src="side/close-up-1854245_1280.jpg" alt="">
									</div>
									<div id="menu-info">
										<h4>
											그리니시 샐러드<img id="menu-detail"
												src="img/icons/baseline_search_black_18dp.png" alt=""
												data-toggle="modal" data-target="#menu-detail-modal">
										</h4>
										<p>10000원</p>
										<button class="button" data-toggle="modal"
											data-target="#menu-update-Modal">수정</button>
										<button class="button" onclick="">삭제</button>
									</div>
								</div>
							</div>
							<!-- 사이드디시 영역 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<!-- 메뉴상세 모달 시작 -->
	<div class="modal fade" id="menu-detail-modal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog"
			style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title" style="margin: auto; padding: 0;">그리니시
						샐러드</h2>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div id="menu-detail1-modal">
						<div id="menu-detail1-modal-img">
							<img id="menu-detail-img" src="pizzas/pizza-2802332_1280.jpg"
								alt="">
						</div>
						<div id="menu-detail1-modal-info">
							<h2>메인토핑</h2>
							<hr>
							<span id="modal-topping-info">모차렐라, 프로볼로네, 체더, 크리미 고르곤졸라,
								갈릭 크림 소스, 토마토 콩피(confit), 뉴욕 스트립 스테이크, 15가지 믹스 슈레드 치즈(화이트 체더,
								몬터레이 잭, 에그몬트, 크림치즈, 에멘탈, 카망베르, 블루 치즈, 스모크 치즈, 숙성 체더, 유기농 체더, 고다,
								리코타, 파르메산, 그뤼에르, 로마노), 11가지 믹스 옐로우 치즈(부라타, 콜비잭, 만체고, 탈레지오, 보코치니,
								페터, 브리, 에담, 마스카포네, 그라나파다노, 미몰레트), 파슬리 드라이</span>
							<h2>원산지</h2>
							<hr>
							<span id="modal-origin-info">오리지널, 나폴리 도우(밀) : 미국산+캐나다산 /
								씬 도우(밀) : 미국산 / 슈퍼시드 함유 도우(밀) : 미국산+캐나다산, (흑미) : 국내산 / 뉴욕 스트립
								스테이크(쇠고기) : 호주산 / 체더치즈 : 미국, 뉴질랜드, 호주</span>
						</div>
					</div>
					<div id="menu-detail1-moda2">
						<hr>
						<h2>메뉴소개</h2>
						<hr>
						<span id="modal-menu-info"> 청춘 않는 행복스럽고 아니다. 인생의 부패를 천하를
							그들에게 청춘 싹이 피다. 장식하는 미묘한 않는 할지라도 위하여, 있는가? 얼마나 우는 자신과 만물은 가치를 실로
							넣는 인간의 가진 운다. 고동을 품에 가치를 있다. 꾸며 피는 천지는 위하여서. 굳세게 심장은 속에 대한 있다.
							따뜻한 유소년에게서 일월과 봄날의 않는 하는 꽃이 커다란 끓는다. 그들의 크고 방황하였으며, 간에 뿐이다. 평화스러운
							영락과 찾아다녀도, 힘차게 밝은 풀밭에 같이, 소리다.이것은 때문이다. 실현에 이 날카로우나 청춘이 타오르고 끓는
							있을 것이다.보라, 것이다. </span>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer" style="margin: auto;">
					<!-- 하단버튼 영역-->
					<button class="big_btn" id="close-btn" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 메뉴상세 모달 끝 -->

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
				<div class="modal-body" style="width: 1100px; height: 600px">

					<form id="menuUpdateForm" action="">
						<table id="menuUpdateTable">
							<tr>
								<th>메뉴명</th>
								<td><input type="text" class="inputs"></td>
								<th rowspan="2">이미지첨부 <input name="menuImg" type="file"
									style="display: none;">
								</th>
								<td rowspan="2">
									<div id="menu-update-img-area">
										<img id="menu-upImg" src="pizza/pizza-1949183_1280.jpg" alt="">
									</div>
								</td>
							</tr>
							<tr>
								<th>토핑</th>
								<td><textarea name="toppings" class="inputs" cols="50"
										rows="8" style="resize: none;"></textarea></td>

							</tr>
							<tr>
								<th rowspan="2">원산지</th>
								<td rowspan="2"><textarea name="origins" class="inputs"
										cols="50" rows="8" style="resize: none;"></textarea></td>
								<th>가격</th>
								<td><input name="price" type="text" class="inputs">
									원<br></td>
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