<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageInfoUpdateCheck</title>
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
	width: 300px;
	margin-left: 0;
	margin: 50px;
	margin-bottom: 12px;
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

#noticeList>tbody :nth-child(1) {
	cursor: pointer;
}

#middleTable td {
	margin-left: 10px;
}

/* 내용 테이블 */
input {
	border-radius: 5px;
	width: 200px;
}

th {
	height: 50px;
	width: 100px;
}

table {
	font-size: 18px;
	margin: auto;
}

#doubleCheck {
	margin-left: 20px;
}

/* 작은버튼 스타일 */
.small_btn {
	display: block;
	height: 32px;
	width: 60px;
	margin: 0 auto;
	font-size: 13px;
	font-weight: bolder;
	color: white;
	background-color: rgb(76, 60, 60);
	border: 0;
	border-radius: 5px;
	cursor:pointer;
}
/* 작은버튼 스타일 */
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
			<a href="<%=contextPath%>">홈</a> &gt; <a href="<%=contextPath%>/myOrderList.my">나의 정보</a> &gt; 정보수정
		</div>
		<div class="sub-menu-area">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="<%=contextPath%>/myOrderList.my">주문내역</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="<%=contextPath%>/myCouponList.my">쿠폰함</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="<%=contextPath%>/myOneList.my">1:1문의</a> <span style="color: lightgray; font-size: 17px;">|</span> 
			<a href="<%=contextPath%>/myInfoUpdateCheck.my" style="color: orange">정보수정</a>
		</div>





		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">
			<div id="order-info">
				<table style="font-size: 16px;" width="1000px" height="200px">
					<tr>
						<th width="495px" style="padding-left: 30px; padding-top:32px;">
							<b style="font-weight: bold; font-size: 1.5em; float: left; margin-left: 48px;">본인여부확인</b>
							<hr class="bline">
							<p style="font-size: 0.9em; color:lightgray; float: left; margin-left: 48px; margin-bottom: 45px;">
								회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</p>
						</th>
					</tr>
				</table>

			</div>
		</div>

		<br><br><hr>
		
		<div class="inner">
			<form id="updateForm" action="<%=contextPath%>/myInfoUpdateForm.my" method="post">
			<table style="text-align: left;">
				<tr>
					<th>아이디</th>
					<td colspan="2"><%=loginUser.getMemberId() %></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="inputPwd"></td>
					<td><button type="submit" class="small_btn" id="#" style="margin: 10px">확인</button></td>
				</tr>
			</table>
			</form>
		</div>
	</div>

	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>