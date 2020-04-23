<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.center.model.vo.Center"%>
<%
	ArrayList<Center> list = (ArrayList<Center>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageOneOnOneList</title>
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
			<a href="<%=contextPath%>">홈</a> &gt; <a href="<%=contextPath%>/myOrderList.my">나의 정보</a> &gt; 1:1문의
		</div>
		<div class="sub-menu-area">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="<%=contextPath%>/myOrderList.my">주문내역</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="<%=contextPath%>/myCouponList.my">쿠폰함</a> <span style="color: lightgray; font-size: 17px;">|</span>
			<a href="<%=contextPath%>/myOneList.my" style="color: orange">1:1문의</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href="<%=contextPath%>/myInfoUpdateCheck.my">정보수정</a>
		</div>
		<hr>

		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">
			<div id="order-info">
				<table style="font-size: 16px;" width="1000px" height="200px">
					<tr>
						<th width="65%" style="padding-left: 2px; text-align:center;">
							<b style="font-weight: bold; font-size: 1.5em;"><%= loginUser.getMemberName() %></b>님께서 문의하신 내용입니다.
							<hr class="bline">
						</th>
						<th width="35%" style="text-align:left;">
							<p style="color:white;">
								문의하신 내용은 <b style="font-weight: bold; font-size: 1.5em;">총 <%= list.size() %>건</b>입니다.
							</p>
						</th>
					</tr>
				</table>
			</div>

			<div class="inner">
				<br><br>

				<table id="noticeList" align="center" width="1000px">
					<thead>
						<tr style="text-align:center;">
							<th style="width:10%;">번호</th>
							<th style="width:55%;">제목</th>
							<th style="width:20%;">등록일</th>
							<th style="width:15%;">처리상태</th>
						</tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()){ %>
							<tr>
								<td colspan="4">존재하는 문의가 없습니다.</td>
							</tr>
						<% }else { %>
							<% int count = list.size(); %>
							<% for(int i=0;i<list.size();i++){ %>
							<tr class="trList">
								<td><%=count--%></td>
								<td><%=list.get(i).getInquiryTitle()%></td>
								<td><%=list.get(i).getRegistDate()%></td>
								<% if(list.get(i).getInquiryProStatus().equals("N")){ %>
									<td>처리중</td>
								<% }else { %>
									<td>답변완료</td>
								<% }%>
								<td><input type="hidden" class="hiddenNo" value="<%=list.get(i).getInquiryNo()%>"></td>

							</tr>
							<% } %>
							
						<% } %>
					</tbody>
				</table>

				<br><br>
				<!--
				<div class="pagination" align="center">
					<a href="#">&laquo;</a> <a href="#" class="active">1</a> <a
						href="#">&raquo;</a>
				</div>
				-->
				<br><br><br>

				<div id="btns" align="center">
					<button class="middle_btn" id="#" onclick="location.href='<%=contextPath%>/cOneForm.ce';">문의하기</button>
				</div>
			</div>
		</div>
		</div>
		
		<script>
			$(document).on("click",".trList",function(){
				//var cno = $(this).children().eq(0).text();
				var index = $(".trList").index(this);
				
				var cno = $(".hiddenNo:eq("+index+")").val();
				
				location.href="<%=contextPath%>/myOneDetail.my?cno=" + cno;
			});
		</script>

		<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>