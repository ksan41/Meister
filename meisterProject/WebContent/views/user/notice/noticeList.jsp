<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.notice.model.vo.Notice, com.meister.common.PageInfo"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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

/*
#noticeList>tbody :nth-child(2) {
	cursor: pointer;
}*/

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

#noticeList>tbody>tr:hover{
	background:orange;
	color:white;
	cursor:pointer;
}


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
					<!--  -->
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
					</tr>
					 -->
					
					<% if(list.isEmpty()){ // 리스트가 비어있을 경우 %>
						<tr>
							<td colspan="4">존재하는 공지사항이 없습니다.</td>
						</tr>
					<% }else{ // 리스트가 비어있지 않을 경우 %>
					
						<% for(Notice n : list){ %>
							
							<tr>
								<td><%= n.getNoticeNo() %></td>
								<td><%= n.getNoticeTitle() %></td>
								<td><%= n.getCreateDate() %></td>
								<td><%= n.getCount() %></td>
							</tr>
						<% } %>
					
					<% } %>
					
					 
				</tbody>
			</table>
			

			<br>
			<br>
			
			<!-- 현재 페이지에 보여질 페이징바 -->
			<div class="pagination" align="center">
				<div>
					<% if(currentPage != 1){ %>
					<!--  맨 처음으로(<<) -->
					<a href="nList.no?currentPage=1">&laquo;&laquo;</a> 
					<!-- 이전페이지로(<) -->
					<a href="nList.no?currentPage=<%= currentPage-1 %>">&laquo;</a> 
					<% } %>
<!-- 					<a href="#">1</a> 
					<a href="#" class="active">2</a>
					<a href="#">3</a> 
					<a href="#">4</a> 
					<a href="#">5</a> 
					<a href="#">6</a> -->
					
					<% for(int p=startPage; p<=endPage; p++){ %>
						<% if(currentPage != p){ %>
							<a href="nList.no?currentPage=<%=p%>"><%= p %></a> 
						<%}else{ %>
							<a href="#" class="active"><%= p %></a>
						<%} %>
					
					<% } %>
					
					<% if(currentPage != maxPage){ %>
					<!-- 다음페이지로(>) -->
					<a href="nList.no?currentPage=<%= currentPage+1 %>">&raquo;</a>
					<!--  맨 마지막으로(>>) -->
					<a href="nList.no?currentPage=<%= maxPage %>">&raquo;&raquo;</a>
					<%} %>
				</div>
			</div>
			
			
			
			
<%-- 			<div class="pagingArea" align="center">
			
				<% if(currentPage != 1){ %>
				<!--  맨 처음으로(<<) -->
				<button onclick="location.href='nList.no?currentPage=1'"> &lt;&lt; </button>
				
				<!-- 이전페이지로(<) -->
				<button onclick="location.href='nList.no?currentPage=<%= currentPage-1 %>'"> &lt; </button>
				<% } %>
				
				<% for(int p=startPage; p<=endPage; p++){ %>
					<% if(currentPage != p){ %>
					<button onclick="location.href='nList.no?currentPage=<%=p%>';"><%= p %></button>
					<%}else{ %>
					<button disabled> <%= p %></button>
					<%} %>
				<% } %>
				
				<% if(currentPage != maxPage){ %>
				<!-- 다음페이지로(>) -->
				<button onclick="location.href='nList.no?currentPage=<%= currentPage+1 %>'"> &gt; </button>
				
				<!--  맨 마지막으로(>>) -->
				<button onclick="location.href='nList.no?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
				<%} %>
			
			</div> --%>
		
		</div>
			
	</div>
	
		<script>
		$(function(){
			$("#noticeList>tbody>tr").click(function(){
				console.log("클릭");
				
				// 현재 클릭했을 때의 해당 공지사항의 번호
				var nno = $(this).children().eq(0).text();
				// 쿼리스트링 이용해서 전달값 전달
				location.href="<%=contextPath %>/nDetail.no?nno=" + nno;
				
				
			});
		});
		
	</script>
	
	

	
	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>