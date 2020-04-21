<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageOneOnOneDetail</title>
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

.xo {
	width: 0;
	height: 150px;
}

.bline {
	background-color: skyblue;
	height: 2px;
	border: 0px;
	width: 300px;
}

/* .pagination {
            display: inline-block;
        } */
.pagination a {
	color: black;
	padding: 5px 10px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 2px;
	font-size: 12px;
}

.pagination a.active {
	background-color: orange;
	color: white;
	border: 1px solid orange;
}

.pagination a:hover:not (.active ) {
	background-color: #ddd;
}

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

#noticeList>tbody :nth-child(2) {
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
	background-color: rgb(76, 60, 60);
	border: 0;
	border-radius: 5px;
	cursor:pointer;
}
/* 중간버튼 스타일 */
#contentArea {
	width: 500px;
	height: 300px;
	resize: none;
	border-radius: 2%;
	padding-left: 10px;
	padding-top: 10px;
}

#btns {
	display: flex;
}

#dbtn {
	margin-right: 3%;
	margin-right: 2%;
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
</style>
</head>
<body>

	<%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp"%>

	<div class="outer">
		<!-- 서브메뉴 타이틀 -->
		<h1>나의 정보</h1>
		<br>
		<!-- 서브메뉴 우측 인덱스 -->
		<div id="index-area">
			<a href="">홈</a> &gt; <a href="">나의 정보</a> &gt; 1:1문의
		</div>
		<div class="sub-menu-area">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="">주문내역</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="">쿠폰함</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="" style="color: orange">1:1문의</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href="">정보수정</a>
		</div>
		<hr>

		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">
			<div id="order-info">
				<table style="font-size: 16px;" width="1000px" height="200px">
					<tr>
						<th width="65%" style="padding-left: 2px; text-align:center;">
							<b style="font-weight: bold; font-size: 1.5em;">절대미각</b>님께서 문의하신 내용입니다.
							<hr class="bline">
						</th>
						<th width="35%" style="text-align:left;">
							<p style="color:white;">
								문의하신 내용은 <b style="font-weight: bold; font-size: 1.5em;">총 2건</b>입니다.
							</p>
						</th>
					</tr>
				</table>
			</div>

			<div class="inner">
				<br><br>
				<table id="middleTable" width="900px" height="500px" align="center">
					<tr>
						<td width="270px" height="50px" align="center"
							style="font-size: 1.2em; font-weight:700; color: gray;">아이디</td>
						<td style="padding-left: 1%; font-size: 1.3em;">MeisterPizza</td>
					</tr>
					<tr>
						<td width="270px" height="50px" align="center"
							style="font-size: 1.2em; font-weight:700; color: gray;">연락처</td>
						<td style="padding-left: 1%; font-size: 1.3em;">010-7777-7777</td>
					</tr>
					<tr>
						<td width="270px" height="50px" align="center"
							style="font-size: 1.2em; font-weight:700; color: gray;">이메일</td>
						<td style="padding-left: 1%; font-size: 1.3em;">MeisterPizza@naver.com</td>
					</tr>
					<tr>
						<td width="270px" height="50px" align="center"
							style="font-size: 1.2em; font-weight:700; color: gray;">문의유형</td>
						<td style="padding-left: 1%; font-size: 1.3em;">단순문의</td>
					</tr>
					<tr>
						<td width="270px" height="50px" align="center"
							style="font-size: 1.2em; font-weight:700; color: gray;">제목</td>
						<td style="padding-left: 1%; font-size: 1.3em;">왜 이렇게 맛있나요??</td>
					</tr>
					<tr>
						<td width="270px" height="200px" align="center" valign="top"
							style="font-size: 1.2em; font-weight:700; color: gray; padding-top: 2%;">내용</td>
						<td style="padding-left: 1%; font-size: 1.3em; padding-top: 1%;"
							valign="top"><textarea id="contentArea"
								style="font-size: 1.1em;" disabled>너무 맛있는데요 비결이 뭐에요??</textarea>
						</td>
					</tr>
					<tr>
						<td width="270px" height="200px" align="center" valign="top"
							style="font-size: 1.2em; font-weight:700; color: gray; padding-top: 2%;">답변</td>
						<td style="padding-left: 1%; font-size: 1.3em; padding-top: 1%;"
							valign="top"><textarea id="contentArea"
								style="font-size: 1.0em; color: cornflowerblue" disabled>처리중...</textarea>
						</td>
					</tr>
					<tr>
						<td width="270px" height="50px" align="center"
							style="font-size: 1.2em; font-weight:700; color: gray;">첨부파일</td>
						<td style="padding-left: 1%; font-size: 1.3em;">
							<a href="" style="color:black; text-decoration:none;">파일명</a>
						</td>						
					</tr>
					<tr>
						<th colspan="2" align="left" style="text-align:center;">
						<br><br> 
						<b style="font-size: 1.0em; color: gray;">등록하신 내용 및
								답변은 회원정보상의 이메일로도 발송이 됩니다. 상담원과 통화를 원하시면</b><br>
						<b style="color: darkslategrey;">고객만족 센터</b>
						<b style="font-size: 1.2em; color: skyblue;"> 080-888-8888</b></th>
					</tr>
				</table>

				<br><br><br>

				<div id="btns">
					<button class="middle_btn" id="dbtn" style="background: orangered;">삭제</button>
					<button
						style="background: white; color: black; border: 1px solid darkgray"
						class="middle_btn" id="mbtn">수정</button>
					<button class="middle_btn" id="lbtn">목록</button>
				</div>
			</div>
		</div>
		</div>

		<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>