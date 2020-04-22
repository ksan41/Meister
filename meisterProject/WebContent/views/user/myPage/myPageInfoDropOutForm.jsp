<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageInfoDropOutForm</title>
<meta charset="UTF-8">
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

/* 중간버튼 스타일 */
#btns {
	text-align: center;
}

.middle_btn {
	/* display: block; */
	height: 40px;
	width: 150px;
	margin: 0 auto;
	font-size: 15px;
	font-weight: bolder;
	color: white;
	background-color: rgb(76, 60, 60);
	border: 0;
	border-radius: 5px;
	margin-left: 10px;
	cursor:pointer;
}
/* 중간버튼 스타일 */
#middleTable td {
	margin-left: 10px;
}

/* 내용 테이블 */
.aa {
	margin: auto;
	margin-left: 25px;
	margin-bottom: 30px;
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
			<a href="<%=contextPath%>">홈</a> &gt; <a href="<%=contextPath%>/myOrderList.my">나의 정보</a> &gt; 정보수정
		</div>
		<div class="sub-menu-area">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="<%=contextPath%>/myOrderList.my">주문내역</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="<%=contextPath%>/myCouponList.my">쿠폰함</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="<%=contextPath%>/myOneList.my">1:1문의</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href="<%=contextPath%>/myInfoUpdateCheck.my"
				style="color: orange">정보수정</a>
		</div>





		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">
			<div id="order-info">
				<table style="font-size: 16px;" width="1000px" height="200px">
					<tr>
						<th width="495px" style="padding-left: 30px; padding-top:32px;">
							<b style="font-weight: bold; font-size: 1.5em; float: left; margin-left: 48px;">회원탈퇴</b>
							<hr class="bline">
							<p style="font-size: 0.9em; color:lightgray; float: left; margin-left: 48px; margin-bottom: 45px;">
								마이스터 피자를 이용해주셔서 감사합니다. 불편하셨던 점이나 불만사항을 알려주시면 적극 반영하도록 노력하겠습니다.</p>
						</th>
					</tr>
				</table>
			</div>
		</div>

			<br><br><hr><br>

			<form id="updateForm" action="<%=contextPath%>/deleteMember.me" method="post">
			<table id="middleTable">
				<tr class="middleTable_tr" style="height:35px;">
					<th style="font-size: 20px; width: 80px;">탈퇴사유</th>
					<td style="width: 276px; padding-left: 85px;">
						<input id="reason1" type="radio" name="group"
						style="vertical-align: text-bottom;" value="관리자 답변 불만"> 관리자 답변 불만</td>
					<td style="width: 276px; padding-left: 77px;">
						<input id="reason2" type="radio" name="group" 
						style="vertical-align: text-bottom;" value="회사 서비스에 대한 불만"> 회사 서비스에 대한 불만
					</td>
					<td style="width: 276px; padding-left: 77px;">
						<input id="reason3" type="radio"name="group" 
						style="vertical-align: text-bottom;" value="시스템 성능 불만"> 시스템 성능 불만
					</td>
				</tr>
				<tr class="middleTable_tr" style="height:35px;">
					<td></td>
					<td style="padding-left: 85px;">
					<input id="reason4" value="사이트 정보 미흡" 
						type="radio" name="group" style="vertical-align: text-bottom;"> 사이트
						정보 미흡</td>
					<td style="padding-left: 77px;"><input id="reason5" type="radio" name="group"
						style="vertical-align: text-bottom;" value="광고 메일 수신"> 광고 메일 수신</td>
					<td style="padding-left: 77px;"><input id="reason6" type="radio" name="group"
						style="vertical-align: text-bottom;" value="개인 정보 보호"> 개인 정보 보호</td>
				</tr>
				<tr class="middleTable_tr" style="height:35px;">
					<td></td>
					<td style="padding-left: 85px;"><input id="reason7" value="기타" 
						type="radio" name="group" style="vertical-align: text-bottom;"> 기타</td>
				</tr>
				<tr>
					<td valign="top"
						style="padding-top: 3%; width: 80px; font-size: 20px; padding-left: 7px;"><b>내용</b>
					</td>
					<td style="padding-top: 3%; width: 920px; padding-right: 30px;" colspan="3">
						<textarea class="aa" name="content" id="" cols="97" rows="30"
							style="margin-left: 83px; resize:none;"></textarea>
					</td>
				</tr>
			</table>

			<div id="btns">
				<button type="reset" style="background: white; color: black; border: 1px solid darkgray"
					class="middle_btn" id="cbtn">취소</button>
				<button type="submit" class="middle_btn" id="mbtn">탈퇴</button>
			</div>
			</form>
			
			
		</div>
		
	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>