<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.meister.event.model.vo.Event, java.util.ArrayList"%>
<%
   ArrayList<Event> list = (ArrayList<Event>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>meister_통합 - 이벤트관리</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	
	<!-- 모달 부트스트랩-->
	<link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!-- 모달 부트스트랩 -->

	<style>
		/* 부트스트랩 덮어씌우기용 스타일 */
        a{
        	text-decoration: none !important;;
        }
        
        h1, h2, h3, h4, h5, h6,
		.h1, .h2, .h3, .h4, .h5, .h6 {
  			margin-bottom:0;
 			font-weight: 500;
  			line-height: 1.2;
		} 
        
         h1, .h1 {
  			font-size: 2em;
  			display: block;
    		margin-block-start: 0.67em;
   			margin-block-end: 0.67em;
    		margin-inline-start: 0px;
    		margin-inline-end: 0px;
    		font-weight: bold;
		}

		h2, .h2 {
  			
  			display: block;
    		font-size: 1.5em;
    		margin-block-start: 0.83em;
    		margin-block-end: 0.83em;
    		margin-inline-start: 0px;
    		margin-inline-end: 0px;
   			 font-weight: bold;
		}

		h3, .h3 {
  			display: block;
    		font-size: 1.17em;
   			 margin-block-start: 1em;
    		margin-block-end: 1em;
    		margin-inline-start: 0px;
    		margin-inline-end: 0px;
    		font-weight: bold;
		}

		h4, .h4 {
  			font-size: 1rem;
		}

        p {
   		 display: block;
   		 margin-block-start: 1em;
    		margin-block-end: 1em;
   		 margin-inline-start: 0px;
    		margin-inline-end: 0px;
		}
        
        
        /* 부트스트랩 덮어씌우기용 스타일 */


		/* 이벤트 목록 스타일 시작 */
		#eventListTable {
			width: 1000px;
			height: 700px;
		}
		
		#eventListTable td {
			padding: 20px;
		}
		
		#eventListTable img {
			width: 100%;
			cursor: pointer;
		}
		tr{
			height:50px;
		}
		input{
			height:30px;
		}
		
		/* 이벤트 목록 스타일 끝 */
		.colLine {
			float: left;
			border: solid 1px #cccccc;
		}
		
		.tdFirst {
			float: left;
			border-bottom: solid 1px #cccccc;
		}
		
		.tdLast {
			float: left;
			border-left: solid 1px #cccccc;
			border-bottom: solid 1px #cccccc;
		}
		
		.tdBottom {
			float: left;
			border-left: solid 1px #cccccc;
		}
		
		.inner{
			width:1400px;
			height:auto;
			margin-top:50px;
			margin-left:100px;
		}
		
		
		.inner>div {
			display: inline-block;
			margin:30px;
		}
		
		.thumbnail{/*이미지 바깥영역 div*/
			width:523px;
			height:200px;
			box-sizing: border-box;
			margin-top: 50px;
			margin-bottom: 60px;
			margin-right: 20px;
			margin-left: 50px;
		}
		
		.thumbImg{/*이벤트 배너이미지*/
			overflow: hidden;
			display: flex;
			align-items: center;
			justify-content: center;
			width:523px;
			height:auto;
		}
	</style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">이벤트</h1>
			<br>

			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 이벤트 관리
				</div>
				<div class="card-body" align="center">

					<div align="right">
						<button class="button" data-toggle="modal" data-target="#eventEnrollModal">
							이벤트 등록
						</button>
					</div>
					<% if(list.isEmpty()){ %>
						<p>조회된 결과가 없습니다</p>
					<% } else { %>
						<% for(int i=0; i<list.size(); i++) { Event ev = list.get(i); %>

							<div class="thumbnail" align="center" style="height:400px; margin:auto; margin-top:70px">
								<input type="hidden" name="bno" value="<%=ev.getEventNo() %>"> 
								<a id="detail1">
									<img id="123" class="thumbImg" src="<%= contextPath %>/resources/siteImgs/eventImg/<%=ev.getEventImage1()%>">
								</a>
								<%=ev.getEventTitle() %><br>
								<%=ev.getEventOpenTime() %> ~ <%=ev.getEventCloseTime() %>
								<p class="bannerStatus" style="color: red">배너노출상태 : <%=ev.getEventStatus() %></p>
								<div align="center">
									<button class="button" class="detailButton" data-toggle="modal" data-target="#eventDetailModal<%=i%>">상세</button>
									<button class="button" class="modifyButton" data-toggle="modal" data-target="#eventUpdateModal<%=i%>">수정</button>
									<button class="button" class="deleteButton">삭제</button>
								</div>
							</div>
						<% } %>
					<% } %>
				</div>
			</div>
		</div>
		</main>
	</div>
	
	<!-- 등록 버튼 모달 시작 -->
	<div class="modal fade" id="eventEnrollModal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin: auto; padding: 0;">이벤트
						등록</h4>
					<button type="button" class="close" data-dismiss="modal" style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="<%= contextPath %>/evMgInsert.evm" name="eventEnrollForm">
						<table id="eventEnrollTable">
							<tr>
								<th>제목</th>
								<td><input name="eventTitle" type="text" placeholder="내용을 입력해주세요" size="40px">
								</td>
							</tr>
							<tr>
								<th>이벤트 기간</th>
								<td><input name="eventOpenTime" type="date"> ~ <input name="eventCloseTime" type="date">
								</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td><input name="eventImage1" type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>상세 이미지</th>
								<td><input name="eventImage2" type="file" style="margin-left: 10px;"></td>
							</tr>
							<!-- 
							<tr>
								<th>노출여부</th>
								<td><input name="eventStatus" type="checkbox" style="margin-left: 10px;"></td>
							</tr>
							 -->
						</table>
						<br><br>

						<!-- 버튼영역 -->
						<div class="faqBtns" style="align-content: right;" align="center">
							<button type="submit" class="btn btn-danger" style="width: 100px; height: 40px; background: #343a40">등록</button>
							<button type="reset" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 40px; background: #343a40" onclick="location.href='<%= contextPath %>/evMgList.evm';">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록 버튼 모달 끝 -->
	
	<% if(list.isEmpty()){%>
	<%}else{ %>
		<%for(int i=0;i<list.size();i++){ %>
			<!-- 상세 버튼 모달 시작 -->
			<div class="modal fade" id="eventDetailModal<%=i%>">
				<!-- modal별 id 변경해주세요-->
				<div class="modal-dialog" style="width:auto; display:table">
					<div class="modal-content">
		
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title" style="margin: auto; padding: 0;">이벤트상세내용</h4>
							<button type="button" class="close" data-dismiss="modal"
								style="margin: 0; padding: 0;">&times;</button>
						</div>
		
						<!-- Modal body -->
						<div class="modal-body">
							<form action="" name="eventDetailForm">
								<table id="eventDetailTable" style="width:700px">
									<tr>
										<th>제목</th>
										<td><input type="text" size="40px" value="<%=list.get(i).getEventTitle()%>">
										</td>
									</tr>
									<tr>
										<th>이벤트 기간</th>
										<td><input type="date" value="<%=list.get(i).getEventOpenTime()%>"> ~ <input type="date" value="<%=list.get(i).getEventCloseTime()%>">
										</td>
									</tr>
									<tr>
										<th>썸네일 이미지</th>
										<td>
											<div style="width:500px; height:250px; border:solid 1px black;">
												<input type="file" style="margin-left: 10px;" value="<%=list.get(i).getEventImage1()%>">
											</div>
										</td>
									</tr>
									<tr>
										<th>상세 이미지</th>
										<td>
											<div style="width:500px; height:250px; border:solid 1px black;">
												<input type="file" style="margin-left: 10px;" value="<%=list.get(i).getEventImage2()%>">
											</div>
										</td>
									</tr>
									<tr>
										<th>배너 등록여부</th>
										<td><input type="checkbox" style="margin-left: 10px;" value="<%=list.get(i).getEventStatus()%>"></td>
									</tr>
								</table>
								<br><br>
		
								<!-- 버튼 영역 -->
								<div class="faqBtns" style="align-content: right;" align="center">
									<button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 40px; background: #343a40">
										확인
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 상세 버튼 모달 끝 -->
		<%} %>
	<%} %>
	
	<% if(list.isEmpty()){%>
	<%}else{ %>
		<%for(int i=0;i<list.size();i++){ %>
			<!-- 수정 버튼 모달 시작 -->
			<div class="modal fade" id="eventUpdateModal<%=i%>">
				<!-- modal별 id 변경해주세요-->
				<div class="modal-dialog">
					<div class="modal-content">
		
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title" style="margin: auto; padding: 0;">이벤트수정</h4>
							<button type="button" class="close" data-dismiss="modal"
								style="margin: 0; padding: 0;">&times;</button>
						</div>
		
						<!-- Modal body -->
						<div class="modal-body">
							<form action="" name="eventUpdateForm">
								<table id="eventUpdateTable">
									<tr>
										<th>제목</th>
										<td>
											<input type="text" size="40px" value="<%=list.get(i).getEventTitle()%>">
										</td>
									</tr>
									<tr>
										<th>이벤트 기간</th>
										<td>
											<input type="date" value="<%=list.get(i).getEventOpenTime()%>"> ~ <input type="date" value="<%=list.get(i).getEventCloseTime()%>">
										</td>
									</tr>
									<tr>
										<th>썸네일 이미지</th>
										<td>
											<input type="file" style="margin-left: 10px;" value="<%=list.get(i).getEventImage1()%>">
										</td>
									</tr>
									<tr>
										<th>상세 이미지</th>
										<td>
											<input type="file" style="margin-left: 10px;" value="<%=list.get(i).getEventImage2()%>">
										</td>
									</tr>
									<tr>
										<th>배너 등록여부</th>
										<td>
											<input type="checkbox" style="margin-left: 10px;" value="<%=list.get(i).getEventStatus()%>">
										</td>
									</tr>
								</table>
		
								<br>
								<br>
		
								<!-- 버튼 영역 -->
								<div class="faqBtns" style="align-content: right;" align="center">
									<button type="submit" class="btn btn-danger" data-dismiss="modal"
										style="width: 100px; height: 40px; background: #343a40">수정</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal"
										style="width: 100px; height: 40px; background: #343a40">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 수정 버튼 모달 끝 -->
		<%} %>
	<%} %>
	
	<script>
		$(document).on("click",".mbutton",function(){
			var dropCheck = confirm("해당 이벤트를 삭제하시겠습니까?");
			var index = $(".deleteButton").index(this);
			
			if(dropCheck){ //확인 클릭시
				//var memNo = $(".memberNo:eq("+index+")").text(); //선택된 해당 회원번호
				var memNo = $("tbody>tr:eq("+(index-1)+")>td:eq(0)").text();
				
				location.href="<%=contextPath%>/deleteMember.memg?memNo="+memNo;
				//???? 이벤트 삭제 서블릿
			
			}
		});
		
		$(document).on("click",".modifyButton",function(){
			var dropCheck = confirm("해당 이벤트를 수정하시겠습니까?");
			var index = $(".deleteButton").index(this);
			
			if(dropCheck){ //확인 클릭시
				//var memNo = $(".memberNo:eq("+index+")").text(); //선택된 해당 회원번호
				var memNo = $("tbody>tr:eq("+(index-1)+")>td:eq(0)").text();
				
				location.href="<%=contextPath%>/deleteMember.memg?memNo="+memNo;
			
			}
		});
		
		$(function(){  		
		    $(".thumbnail").click(function(){ 
			
			 	var bno = $(this).children().eq(0).val();
				location.href="<%=contextPath%>/evMgList.evm?bno=" + bno;
			});
        });
	</script>

</body>
</html>