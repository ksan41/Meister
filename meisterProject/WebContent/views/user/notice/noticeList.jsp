<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

/* 공지사항 목록 스타일 시작 */
#noticeSearchOption {
	height: 30px;
	width: 120px;
	padding-left: 7px;
	font-size: 12px;
	color: gray;
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
	width:1000px;
	border-top: 1px solid black;
	text-align:center;
}

#noticeList>thead th {
	font-size: 14px;
	font-weight: 750;
}

#noticeList>tbody :nth-child(2) {
	cursor: pointer;
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
.pagination
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
#ddd
;


}
.pagination div{
	margin:auto;
}
/* 공지사항 목록 스타일 끝 */
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
			<br>
			<br>
			<div align="center">
				<form>
					<select id="noticeSearchOption" name="" style="padding-top:3px;">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="title+content">제목+내용</option>
					</select> 
					<input type="text" name="" style="height: 30px; width: 300px;">
					<input type="submit" value="검색" style="height: 30px;">
				</form>
			</div>
			<br>
			<br>

			<table id="noticeList" align="center">
				<thead>
					<tr>
						<th style="width: 80px;">NO</th>
						<th style="width: 480px;">제목</th>
						<th style="width: 150px;">등록일</th>
						<th style="width: 100px;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<!-- 
					<tr>
						<td>338</td>
						<td>연극 <환상동화> 이벤트 당첨자 안내</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr>
					<tr>
						<td>337</td>
						<td>수퍼소닉 예매권 증정 이벤트 1차 당첨자 안내</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr>
					<tr>
						<td>336</td>
						<td>설 연휴(1월 25일) 영업매장 안내</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr>
					<tr>
						<td>335</td>
						<td>12월 31일 (화) 연장영업 안내</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr>
					<tr>
						<td>334</td>
						<td>크리스마스 이브 (24일) 연장영업 안내</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr>
					<tr>
						<td>333</td>
						<td>쥬만지: 넥스트레벨 예매권 증정 이벤트 당첨자 안내</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr>
					<tr>
						<td>332</td>
						<td>최현우의 빌리브 콘서트 티켓 증정 이벤트 당첨자 안내</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr>
					<tr>
						<td>331</td>
						<td>[공지]도미노피자 개인정보 처리방침 개정 안내</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr>
					<tr>
						<td>330</td>
						<td>[틴매니아 ‘학교대항전 2’ 이벤트 당첨 학교 안내]</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr>
					<tr>
						<td>329</td>
						<td>[공지]도미노피자 이용약관 개정 안내</td>
						<td>2020-02-21</td>
						<td>233</td>
					</tr> -->
				</tbody>
			</table>

			<br>
			<br>

			<div class="pagination" align="center">
				<div>
					<a href="#">&laquo;</a> <a href="#">1</a> <a href="#" class="active">2</a>
					<a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
					<a href="#">&raquo;</a>
				</div>
			</div>

		</div>


	</div>
	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>