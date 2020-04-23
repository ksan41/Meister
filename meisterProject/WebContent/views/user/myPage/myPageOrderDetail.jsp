<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageOrderDetail</title>
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
	border: 0px;
	background-color: #F6F6F6;
	margin-top: 40px;
	margin-bottom: 40px;
	color: black;
}

#order-title, #order-status {
	margin-left: 25px;
}

.xo {
	width: 0;
	height: 150px;
}

.middle_btn {
	display: block;
	height: 40px;
	width: 150px;
	margin: 0 auto;
	font-size: 15px;
	font-weight: bolder;
	color: white;
	background-color: rgb(76, 60, 60);
	border: 0;
	border-radius: 5px;
	margin-top: 10px;
}

#dbtn {
	margin-right: 3%;
	margin-right: 3%;
	box-sizing: border-box;
}

#mbtn {
	margin-left: 3%;
	margin-right: 2%;
	box-sizing: border-box;
}

#lbtn {
	margin-left: 3%;
	box-sizing: border-box;
}

#order-info2-table td {
	padding: 4px;
}

#order-info2-table>tr>td {
	color: red;
}

.order-info2-td {
	font-weight: bolder;
}

#infoTable{
	width:95%; 
	height:18px;
	font-size:16px;
	margin:auto;
}
</style>
</head>
<body>

	<%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp"%>

	<div class="outer">
		<!-- 서브메뉴 타이틀 -->
		<h1>나의정보</h1>
		<br>
		<!-- 서브메뉴 우측 인덱스 -->
		<div id="index-area">
			<a href="<%=contextPath%>">홈</a> &gt; <a href="<%=contextPath%>/myOrderList.my">나의 정보</a> &gt; 주문내역
		</div>
		<div class="sub-menu-area">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="<%=contextPath%>/myOrderList.my" style="color: orange">주문내역</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href="<%=contextPath%>/myCouponList.my">쿠폰함</a>
			<span style="color: lightgray; font-size: 17px;">|</span> <a href="<%=contextPath%>/myOneList.my">1:1문의</a>
			<span style="color: lightgray; font-size: 17px;">|</span> <a href="<%=contextPath%>/myInfoUpdateCheck.my">정보수정</a>
		</div>

		<hr>

		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">
			<!-- 테이블 -->
			<table id="infoTable">
				<tr>
					<td width="7%"><b style="color:black;">포장</b></td>
					<td width="7%"><b style="color:black;">주문일시</b></td>
					<td width="20%">2019-08-08 20:04</td>
					<td width="7%"><b style="color:black;">주문번호</b></td>
					<td width="30%">000000000</td>
					<td width="29%"></td>
				</tr>
			</table>
			<hr>
			<b style="padding-left:25px; font-size:20px; color:black;">수령완료</b>
			<hr>

			<div id="order-info">
				<table style="font-size: 15px;" width="1000px" height="200px">
					<tr>
						<th width="495px" style="padding-left: 2px;">
							<p class="order_text_left"
								style="text-align: left; margin-left: 80px; color: black;">
								<b style="font-size: 17px;">주문내역</b> <br>
								<br> 블랙타이거 슈림프 L X 1 / 35,900원<br> 코카콜라 1.25L x 1 /
								2000원
							</p>
						</th>
						<th width="10px"><hr class="xo" style="margin-right: 50px;"></th>
						<th style="padding-right: 5%;">
							<div>
								<table style="width: 100%; height: 100%;" border="1">
									<tr>
										<td style="text-align: left;">주문금액</td>
										<td style="font-size: 16px;">37,900 원</td>
									</tr>
									<tr>
										<td style="text-align: left;">할인금액</td>
										<td style="padding-right: 8px; color: orangered; font-size: 16px;">
											-14,360원
										</td>
									</tr>
									<tr>
										<td colspan="2"><hr></td>
									</tr>
									<tr style="font-weight: bolder;">
										<td style="text-align: left;">결제금액</td>
										<td style="font-size: 18px;">23,540 원</td>
									</tr>
								</table>
							</div>
						</th>
					</tr>
				</table>
			</div>


			<hr>
			<p id="order-title"
				style="font-size: 16px; font-weight: 600; color: black;">주문정보</p>
			<hr>

			<div id="order-info2">

				<table id="order-info2-table">
					<tr>
						<td class="order-info2-td"
							style="width: 200px; padding-left: 25px;">결제방법</td>
						<td>신용카드</td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">수령인</td>
						<td>절대미각</td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">수령인
							연락처</td>
						<td>010-xxxx-xxxx</td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">매장주소</td>
						<td>마이스터역삼점</td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">매장정보</td>
						<td>마이스터역삼점 02-xxx-xxxx</td>
					</tr>
					<tr>
						<td class="order-info2-td" style="padding-left: 25px;">추가요청</td>
						<td>토핑 많이요~</td>
					</tr>
				</table>

			</div>

			<hr><br>

			<div id="btns">
				<button class="middle_btn" id="listBack" style="cursor: pointer;">목록으로</button>
			</div>

		</div>
	</div>


	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>