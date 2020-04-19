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
	<title>meister_통합-사이드등록</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/ImMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	
	<link href="resources/admin/dist/css/styles.css" rel="stylesheet" />
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


    


  
        /* 메뉴 등록폼 스타일 */

        #menuInsertForm{
            margin-top: 50px;
            width:950px;
            height:auto;
        }

        #menuInsertForm>div{
            width:50%;
            height:100px;
            float: left;
            box-sizing: border-box;
        }

        #menuInsertTable{
            width:100%;
            height:100%;
        }

        #menuInsertTable th{
            font-size: 18px;
        }
        #menuInsertTable *{
            margin: 10px;
        }
        #menu-insert-img-area{
            width:250px;
            height:250px;
            border:1px solid gray;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: auto;
        }

        #menu-img{
            height:auto;
            max-width:150%;
        }

        .inputs{
            border-radius: 5px;
            margin-left: 30px;
        }
        .inputs[type=text]{
            width:200px;
            height:30px;
        }


        #menuInsertBtns{
            margin-left: 350px;
        }

        /* 중간버튼 스타일 */
         .middle_btn{
            display: block;
            height:40px;
            width:150px;
            margin: 0 auto;
            font-size: 15px;
            font-weight: bolder;
            color:white;
            background-color: rgb(76, 60, 60);
            border:0;
            border-radius: 5px;
            margin: 10px;
            float: left;
        }
         /* 중간버튼 스타일 */



        /* 메뉴 등록폼 스타일 */
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
					<i class="fas fa-book-open"></i> 사이드디시 등록
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<div class="inner">
							<form id="menuInsertForm" action="">
								<table id="menuInsertTable">
									<tr>
										<th>메뉴명</th>
										<td><input type="text" class="inputs"></td>
										<th rowspan="2">이미지첨부 <input name="menuImg" type="file"
											style="display: none;">
										</th>
										<td rowspan="2">
											<div id="menu-insert-img-area">
												<img id="menu-img" src="" alt="">
											</div>
										</td>
									</tr>
									<tr>
										<th>토핑</th>
										<td><textarea name="toppings" class="inputs" cols="50"
												rows="9" style="resize: none;"></textarea></td>

									</tr>
									<tr>
										<th rowspan="2">원산지</th>
										<td rowspan="2"><textarea name="origins" class="inputs"
												cols="50" rows="9" style="resize: none;"></textarea></td>
										<th rowspan="2">가격</th>
										<td rowspan="2"><input name="priceM" type="text"
											class="inputs"> 원<br></td>
									</tr>
								</table>
								<br>
								<div id="menuInsertBtns">
									<button type="submit" class="middle_btn" id="#"
										style="background: orange;">등록하기</button>
									<button type="button" class="middle_btn" id="#">목록으로</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>

</body>
</html>