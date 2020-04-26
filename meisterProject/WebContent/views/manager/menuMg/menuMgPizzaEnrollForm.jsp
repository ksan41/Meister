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
	<title>meister_통합-피자등록하기</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
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
				<li><a class="active" href="">피자</a></li>
				<li><a href="">사이드디시</a></li>
				<li><a href="">음료&기타</a></li>
			</ul>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-book-open"></i> 피자 등록
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<div class="inner">
							<form id="menuInsertForm" action="<%=contextPath%>/pizzaInsert.meng" method="post" enctype="multipart/form-data">
								<table id="menuInsertTable">
									<tr>
										<th>메뉴구분</th>
										<td><input type="radio" name="pizzaType" value="1">
											프리미엄 <input type="radio" name="pizzaType" value="2">
											클래식</td>
									</tr>
									<tr>
										<th>메뉴명</th>
										<td><input name="pizzaName" type="text" class="inputs"></td>
										<th rowspan="2">이미지첨부 <input name="menuImg" type="file"
											style="display: none;" onchange="loadImg(this);">
										</th>
										<td rowspan="2">
											<div id="menu-insert-img-area">
												<img id="menu-img" src="" alt="">
											</div>
										</td>
									</tr>
									<tr>
										<th>메뉴소개</th>
										<td><textarea name="contents" class="inputs" cols="50"
												rows="9" style="resize: none;"></textarea></td>
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
										<th>M 사이즈 가격</th>
										<td><input name="priceM" type="text" class="inputs">
											원<br></td>
									</tr>
									<tr>
										<th>L 사이즈 가격</th>
										<td><input name="priceL" type="text" class="inputs">
											원</td>
									</tr>
								</table>
								<br>
								<div id="menuInsertBtns">
									<button type="submit" class="middle_btn"
										style="background: orange;">등록하기</button>
									<button type="button" class="middle_btn" onclick="location.href='<%=contextPath%>/menuMgPizzaList.meng';">목록으로</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>


	<script>
		// 미리보기 영역을 클릭하면 바로 파일 첨부할수있도록 함
		$(function() {
			$("#menu-insert-img-area").click(function() {
				$("input[name=menuImg]").click();//해당 영역을 클릭하면 첫번째 파일첨부 클릭됨(첨부하기)
			});
		});

		function loadImg(inputFile) {
			// inputFile : 현재 변화가 생긴 input type="file" 요소
			// num : 몇번째 input요소인지 확인 후 해당 영역에 미리보기 하기 위한 번호

			// [참고] https://developer.mozilla.org/ko/docs/Web/API/FileReader

			// file이 존재할 경우 --> input요소의 files속성인 배열의 0번 인덱스에 담김

				// 파일을 읽어들일 FileReader 객체 생성(자바스크립트 제공객체)
				var reader = new FileReader();

				// 파일을 읽어주는 메소드 --> 해당 파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
				reader.readAsDataURL(inputFile.files[0]);

				// 파일 읽기가 다 완료되었을때 실행할 메소드
				reader.onload = function(e) {//e : 이벤트객체
						$("#menu-img").attr("src", e.target.result);
					}

				};

	</script>

</body>
</html>