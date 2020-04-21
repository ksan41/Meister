<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "com.meister.notice.model.vo.Notice"%>
	
<%
	Notice n = (Notice)request.getAttribute("n");
	// 제목, 작성일, 조회수,내용
	//Notice prevN = (Notice)request.getAttribute("prevN");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- 메뉴바 여기에 include -->
<%@ include file="../../common_user/menubar.jsp"%>
<%@ include file="../../common_user/menubarMenuIMG.jsp"%>
<!-- 메뉴바 여기에 include -->

<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
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

/* 공지사항 상세페이지 스타일 시작 */
#noticeTitle {
	font-size: 14px;
	padding: 10px;
	padding-left: 25px;
}

#noticeContent {
	font-size: 12px;
	padding-top: 15px;
	padding-left: 25px;
	line-height: 30px;
}

#previousNotice, #nextNotice {
	margin-left: 10px;
	font-size: 12px;
}

#previousNotice th, #nextNotice th {
	width: 50px;
	text-align: center;
}

#previousNotice td, #nextNotice td {
	cursor: pointer;
	width: 500px;
}

.listBtn {
	padding: 15px 70px;
	background-color: rgb(76, 60, 60);
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	border-radius: 6px;
	display: inline-block;
	font-size: 13px;
	margin: 4px 2px;
	cursor: pointer;
}
/* 공지사항 상세페이지 스타일 시작 */
</style>
</head>
<body>
	<div class="outer">
		<!-- 서브메뉴 타이틀 -->
		<h1>공지사항</h1>
		<br>
		<!-- 서브메뉴 우측 인덱스 -->
		<div id="index-area">
			<a href="">홈</a> &gt; 공지사항
		</div>
		<!-- <div class="sub-menu-area">
            현재 페이지는 orange 로 표시
            <a href="" style="color:orange">아이디찾기</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href="" >비밀번호찾기</a>
        </div> -->
		<hr>



		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">
			<div id="noticeTitle">
				<table>
					<tr>
						<td style="width: 850px; font-weight: 600;"><%= n.getNoticeTitle() %></td>
						<td style="width: 70px; text-align: center; font-size: 12px;"><%= n.getCreateDate() %></td>
						<td style="width: 70px; text-align: center; font-size: 12px;">조회
							<%= n.getCount() %></td>
					</tr>
				</table>
			</div>
			<hr>
			<div id="noticeContent">
				<%= n.getNoticeContent() %>
			</div>

			<br>
			<br>
			<hr>

			<div>
				<table id="previousNotice">
					<tr>
						<th>이전</th>
						<td>이전글 없다</td>
					</tr>
				</table>
			</div>
			<hr>
			<div>
				<table id="nextNotice">
					<tr>
						<th>다음</th>
						<td>수퍼소닉 예매권 증정 이벤트 1차 당첨자 안내</td>
					</tr>
				</table>
			</div>
			<hr>
		</div>

		<br>

		<div align="center">
			<button class="listBtn" onclick="location.href='<%= contextPath %>/nList.no';">목록</button>
		</div>

	</div>
	

	
	
	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>