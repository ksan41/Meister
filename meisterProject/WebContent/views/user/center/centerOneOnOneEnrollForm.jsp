<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>centerOneOnOneEnrollForm</title>
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

/* 고객센터 1:1문의 스타일 시작 */
.oneComment {
	padding: 10px;
	padding-top: 17px;
	font-size: 13px;
	line-height: 22px;
}

.oneComment>p {
	color: red;
	font-size: 11px;
}

#t-area {
	width: 930px;
	height: 120px;
	resize: none;
	font-size: 10px;
	line-height: 25px;
	padding: 20px;
	background: #F6F6F6;
	border-color: #F6F6F6;
	color: gray;
}

#radioBtns {
	font-size: 12px;
	padding-right: 20px;
}

#insertQuestionForm {
	width: 700px;
	margin:auto;
}

#insertQuestionForm tr {
	height: 52px;
}

#insertQuestionForm tr>:nth-of-type(1) {
	padding-left: 100px;
	font-weight: 600;
}
/* 고객센터 1:1문의 스타일 끝 */
#btns {display: flex;}
#cbtn {
	margin-right: 1%;
	box-sizing: border-box;
}

#mbtn {
	margin-left: 1%;
	box-sizing: border-box;
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
		<h1>고객센터</h1>
		<br>
		<!-- 서브메뉴 우측 인덱스 -->
		<div id="index-area">
			<a href="">홈</a> &gt; 고객센터
		</div>
		<div class="sub-menu-area">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="<%=contextPath%>/faqList.ce">자주하는 질문</a> <span
				style="color: lightgray; font-size: 17px;">|</span>
			<a href="" style="color: orange">1:1문의</a>
		</div>
		<hr>

		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">

			<div class="oneComment">
				마이스터 피자를 이용하시면서 느꼈던 불편한 점이나 건의사항, 제품에 대한 의견을 남겨주시면 성심껏 답변해드리겠습니다. <br>
				※ 주문 취소/변경과 같은 긴급한 요청은 매장으로 연락 부탁드립니다. <br>
				<p>마이스터 피자 고객만족센터 080-888-8888</p>
			</div>
			<hr>

			<form id="insertForm" action="<%=contextPath%>/cOneInsert.ce" method="post" enctype="multipart/form-data">
				<table id="insertQuestionForm">
					<tr>
						<td style="width: 200px;">아이디</td>
						<td><%=loginUser.getMemberId() %></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><%=loginUser.getMemberPhone() %></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><%=loginUser.getMemberEmail() %></td>
					</tr>
					<tr>
						<td>문의유형</td>
						<td><select name="inquiryType" style="width: 200px; height: 30px;">
								<option value="1">제품관련</option>
								<option value="2">배달서비스 관련</option>
								<option value="3">직원 서비스 관련</option>
								<option value="4">콜센타 관련</option>
								<option value="5">칭찬</option>
								<option value="6">제안</option>
								<option value="7">단순문의</option>
								<option value="8">기타</option>
						</select></td>
					</tr>
					<tr>
						<td>매장선택</td>
						<td><select name="store" style="width: 100px; height: 30px;">
								<option value="역삼점">역삼점</option>
								<option value="잠원점">잠원점</option>
								<option value="동서초점">동서초점</option>
								<option value="서초점">서초점</option>
								<option value="양재점">양재점</option>
								<option value="방배역점">방배역점</option>
								<option value="잠실점">잠실점</option>
								<option value="석촌점">석촌점</option>
								<option value="명동점">명동점</option>
								<option value="논현점">논현점</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" style="height: 30px; width: 80%;" required></td>
					</tr>
					<tr>
						<td>문의내용</td>
						<td style="height: 300px;">
							<textarea name="content" style="width: 90%; height: 300px; resize: none;" required></textarea>
	                    </td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="upfile"></td>
					</tr>
				</table>
				
				<br><br><br>
				
				<div id="btns">
					<button
						style="background: white; color: black; border: 1px solid darkgray"
						class="middle_btn" id="cbtn" type="reset">취소</button>
					<br>
					<button type="submit" class="middle_btn" id="mbtn">등록</button>
				</div>
				
			</form>
		</div>
	</div>

	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>