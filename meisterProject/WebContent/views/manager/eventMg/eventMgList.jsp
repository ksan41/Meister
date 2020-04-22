<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.meister.event.model.vo.Event,java.util.ArrayList"%>
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

		.eventImg{
			width: 350px;
		    height: auto;
		    overflow: hidden;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    margin: auto;
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
				<div class="card-body">

					<div align="right">
						<button class="button" onclick="" data-toggle="modal"
							data-target="#eventEnrollModal">이벤트 등록</button>
					</div>

					<table id="eventListTable" align="center">
						
						<% for(Event e : list) { %>

							<div class="thumbnail" align="center">
							
								<input type="hidden" name="bno" value="<%=e.getEventNo() %>"> 
								<a id="detail1">
								<img id="123" class="thumbImg" src="<%= contextPath %>/resources/siteImgs/eventImg/<%=e.getEventImage1()%>">
								</a>
				
							</div>
						<% } %>
						 
					</table>
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
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" name="eventEnrollForm">
						<table id="eventEnrollTable">
							<tr>
								<th>제목</th>
								<td><input type="text" placeholder="내용을 입력해주세요" size="40px">
								</td>
							</tr>
							<tr>
								<th>이벤트 기간</th>
								<td><input type="date"> ~ <input type="date">
								</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>상세 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>배너 등록여부</th>
								<td><input type="checkbox" style="margin-left: 10px;"></td>
							</tr>
						</table>

						<br>
						<br>

						<!-- 버튼 영역 -->
						<div class="faqBtns" style="align-content: right;" align="center">
							<button type="submit" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">등록</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록 버튼 모달 끝 -->

	<!-- 수정 버튼 모달 시작 -->
	<div class="modal fade" id="eventUpdateModal">
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
								<td><input type="text" size="40px" value="기존 이벤트 제목">
								</td>
							</tr>
							<tr>
								<th>이벤트 기간</th>
								<td><input type="date"> ~ <input type="date">
								</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>상세 이미지</th>
								<td><input type="file" style="margin-left: 10px;"></td>
							</tr>
							<tr>
								<th>배너 등록여부</th>
								<td><input type="checkbox" style="margin-left: 10px;"></td>
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
	
	<!-- 상세 버튼 모달 시작 -->
	<div class="modal fade" id="eventDetailModal">
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
								<td><input type="text" size="40px" value="기존 이벤트 제목">
								</td>
							</tr>
							<tr>
								<th>이벤트 기간</th>
								<td><input type="date"> ~ <input type="date">
								</td>
							</tr>
							<tr>
								<th>썸네일 이미지</th>
								<td>
									<div style="width:500px; height:250px; border:solid 1px black;">
										
									</div>
								</td>
							</tr>
							<tr>
								<th>상세 이미지</th>
								<td>
									<div style="width:500px; height:250px; border:solid 1px black;">
										
									</div>
								</td>
							</tr>
							<tr>
								<th>배너 등록여부</th>
								<td><input type="checkbox" style="margin-left: 10px;"></td>
							</tr>
						</table>
						<br><br>

						<!-- 버튼 영역 -->
						<div class="faqBtns" style="align-content: right;" align="center">
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								style="width: 100px; height: 40px; background: #343a40">확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 상세 버튼 모달 끝 -->
	
	<script>
		function deleteConfirm(){
		    confirm('해당 이벤트를 삭제하시겠습니까?');
		};
		
		$(function(){  		
		    $(".thumbnail").click(function(){ 
			
			 	var bno = $(this).children().eq(0).val();
				location.href="<%=contextPath%>/evMgList.evm?bno=" + bno;
			});
        });
	</script>

</body>
</html>