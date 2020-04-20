<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageCoupon</title>
<style>
/* 서브메뉴 스타일 시작 (위에 웹폰트 링크도 복붙해주세요)*/
div {
	box-sizing: border-box;
}

.outer {
	width: 1000px;
	box-sizing: border-box;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 150px;
}

.outer * {
	font-family: 'NanumSquare';
}

.outer a {
	text-decoration: none;
}

#index-area {
	text-align: right;
	font-size: 12px;
}

#index-area a {
	color: gray
}

.sub-menu-area * {
	padding: 5px;
}

.sub-menu-area>a {
	font-size: 17px;
	color: black;
	font-weight: bolder;
}

/* 서브메뉴 스타일 끝 */
#order-info {
	width: 1000px;
	height: 200px;
	border: 1px solid rgb(76, 60, 60);
	background-color: rgb(76, 60, 60);
	margin-top: 20px;
	color: white;
}

.bline {
	background-color: skyblue;
	height: 2px;
	border: 0px;
	width: 370px;
}

/* .pagination {
	    display: inline-block;
	}
	.pagination a {
	    color: black;
	    padding: 5px 10px;
	    text-decoration: none;
	    transition: background-color .3s;
	    border: 1px solid #ddd;
	    margin: 0 2px;
	    font-size:12px;
	}
	
	.pagination a.active {
	    background-color: orange;
	    color: white;
	    border: 1px solid orange;
	}
	.pagination a:hover:not(.active) {background-color: #ddd;}
	*/
#noticeList>tbody td {
	text-align: center;
}

#noticeList * {
	height: 30px;
	font-size: 12px;
	border-bottom: 1px solid lightgray;
}

#noticeList {
	border-top: 1px solid black;
}

#noticeList>thead th {
	font-size: 14px;
	font-weight: 750;
}

#noticeList>tbody :nth-child(1) {
	cursor: pointer;
}

/* 중간버튼 스타일 */
.middle_btn {
	display: block;
	height: 40px;
	width: 150px;
	margin: 0 auto;
	font-size: 15px;
	font-weight: bolder;
	color: white;
	background-color: rgb(192, 57, 43);
	border: 0;
	border-radius: 5px;
	cursor:pointer;
}
/* 중간버튼 스타일 */
</style>
</head>
<body>
<body>
	<%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp"%>

	<div class="outer">
		<!-- 서브메뉴 타이틀 -->
		<h1>나의 정보</h1>
		<br>
		<!-- 서브메뉴 우측 인덱스 -->
		<div id="index-area">
			<a href="">홈</a> &gt; <a href="">나의 정보</a> &gt; 쿠폰함
		</div>
		<div class="sub-menu-area">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="">주문내역</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="" style="color: orange">쿠폰함</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href="">1:1문의</a>
			<span style="color: lightgray; font-size: 17px;">|</span> <a href="">정보수정</a>
		</div>
		<hr>



		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">

			<div id="order-info">

				<table style="font-size: 16px;" width="1000px" height="200px">
					<tr>
						<th width="495px" style="padding-left: 2px; text-align: center;">
							<b style="font-weight: bold; font-size: 1.5em;">절대미각</b>님께서 보유하고
							있는 할인쿠폰 내역입니다.
							<hr class="bline">
							<p style="font-size: 0.7em; color: white;">쿠폰을 사용하여 피자를 주문해
								보세요!</p>
						</th>
						<th width="10px"><hr class="xo"></th>
						<th style="padding-right: 5%; text-align: center;">보유하고 있는
							쿠폰은 <b style="font-weight: bold; font-size: 1.5em;">총 2장</b>입니다.
						</th>
					</tr>

				</table>

			</div>

			<div class="inner">
				<br> <br>
				<table id="noticeList" align="center" width="1000px;">
					<thead>
						<tr>
							<th style="width: 60%; text-align: center;">쿠폰명</th>
							<th style="width: 40%; text-align: center;">유효기간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>[매니아]프리미엄 피자 포장 35% 할인</td>
							<td>2020.03.23 ~ 2020.03.31</td>
						</tr>
						<tr>
							<td>[마이키친] REGULAR 배달 20% 할인</td>
							<td>2020.03.06 ~ 2020.04.02</td>
						</tr>
					</tbody>
				</table>

				<br>
				<br>

				<!--
                <div class="pagination" align="center">
                    <a href="#">&laquo;</a>
                    <a href="#" class="active">1</a>
                    <a href="#">&raquo;</a>
                </div>
                -->
				<br>
				<br>
				<br>

				<div id="btns" align="center">
					<button class="middle_btn" id="#">피자 주문하기</button>
				</div>

			</div>
		</div>
		</div>

		<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>