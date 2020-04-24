<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.center.model.vo.Faq"%>
<%
	ArrayList<Faq> list = (ArrayList<Faq>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_통합 - FAQ_피자주문</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	
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
        
        .contentMg2, .contentMg3, .contentMg4{display:none;}
        
        .inactive{
        	background:lightgray;
        }
	</style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">고객센터</h1>
			<br>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 자주하는 질문
				</div>
				<div class="card-body">
					<div class="faqBtns">
						<button id="activeMgFAQ1" class="active">피자 주문하기</button>
						<button id="activeMgFAQ2">주문확인</button>
						<button id="activeMgFAQ3">포장 주문</button>
						<button id="activeMgFAQ4">홈페이지 관련</button>
					</div>
					<div align="right">
						<button class="button" onclick="" data-toggle="modal" data-target="#faqEnrollModal">등록</button>
					</div>
					<hr>
	
					<div class="contentMg1">
						<% for (Faq f : list) { %>

							<% if (f.getFaqType().equals("피자주문하기")) { %>
							
								<div class="faqQuestion">
									<table>
										<tr>
											<th style="width: 30px; text-align: center; color: blue">Q</th>
											<td style="width: 900px;"><%=f.getFaqQuestion()%></td>
										</tr>
									</table>
								</div>
								<div class="faqAnswer">
									<table>
										<tr>
											<th style="width: 30px; text-align: center; color: red; font-weight: bold;">A</th>
											<td style="width: 800px;"><%=f.getFaqAnswer()%></td>
										</tr>
									</table>
									<div align="right">
										<button class="button" onclick="" data-toggle="modal" data-target="#faqUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
									<br>
								</div>
							<% } %>
						<% } %>
					</div>


					<div class="contentMg2">
					
						<% for (Faq f : list) { %>

							<% if (f.getFaqType().equals("주문확인")) { %>
							
								<div class="faqQuestion">
									<table>
										<tr>
											<th style="width: 30px; text-align: center; color: blue">Q</th>
											<td style="width: 900px;"><%=f.getFaqQuestion()%></td>
										</tr>
									</table>
								</div>
								<div class="faqAnswer">
									<table>
										<tr>
											<th	style="width: 30px; text-align: center; color: red; font-weight: bold;">A</th>
											<td style="width: 800px;"><%=f.getFaqAnswer()%></td>
										</tr>
									</table>
									<div align="right">
										<button class="button" onclick="" data-toggle="modal" data-target="#faqUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
									<br>
								</div>
							<% } %>
						<% } %>
					</div>

					<div class="contentMg3">
						
						<% for (Faq f : list) { %>
						
							<% if (f.getFaqType().equals("포장주문")) { %>
						
								<div class="faqQuestion">
									<table>
										<tr>
											<th style="width: 30px; text-align: center; color: blue">Q</th>
											<td style="width: 900px;"><%=f.getFaqQuestion()%></td>
										</tr>
									</table>
								</div>
								<div class="faqAnswer">
									<table>
										<tr>
											<th style="width: 30px; text-align: center; color: red; font-weight: bold;">A</th>
											<td style="width: 800px;"><%=f.getFaqAnswer()%></td>
										</tr>
									</table>
									<div align="right">
										<button class="button" onclick="" data-toggle="modal" data-target="#faqUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
									<br>
								</div>
							<% } %>
						<% } %>
					</div>

					<div class="contentMg4">
					
						<% for (Faq f : list) { %>

							<% if (f.getFaqType().equals("홈페이지관련")) { %>
						
								<div class="faqQuestion">
									<table>
										<tr>
											<th style="width: 30px; text-align: center; color: blue">Q</th>
											<td style="width: 900px;"><%=f.getFaqQuestion()%></td>
										</tr>
									</table>
								</div>
								<div class="faqAnswer">
									<table>
										<tr>
											<th style="width: 30px; text-align: center; color: red; font-weight: bold;">A</th>
											<td style="width: 800px;"><%=f.getFaqAnswer()%></td>
										</tr>
									</table>
									<div align="right">
										<button class="button" onclick="" data-toggle="modal" data-target="#faqUpdateModal">수정</button>
										<button class="button" onclick="deleteConfirm();">삭제</button>
									</div>
									<br>
								</div>
							<% } %>
						<% } %>
					</div>
					<br>
				</div>
			</div>
		</div>
		</main>
	</div>

	<!-- 등록 버튼 모달 시작 -->
	<div class="modal fade" id="faqEnrollModal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin: auto; padding: 0;">FAQ 등록</h4>
					<button type="button" class="close" data-dismiss="modal" style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" name="faqEnrollForm">
						<input type="text" class="faqInputTitle" placeholder="질문 내용 입력">
						<br><br>

						<textarea class="faqInputContent" placeholder="답변 내용 입력"></textarea>
						<br><br>

						<!-- 버튼 영역 -->
						<div class="faqBtns" style="align-content: right;" align="center">
							<button type="submit" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 40px; background: #343a40">등록</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 40px; background: #343a40">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록 버튼 모달 끝 -->

	<!-- 수정 버튼 모달 시작 -->
	<div class="modal fade" id="faqUpdateModal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin: auto; padding: 0;">FAQ 수정</h4>
					<button type="button" class="close" data-dismiss="modal" style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="" name="faqEnrollForm">
						<input type="text" class="faqInputTitle" value="기존 질문 내용">
						<br> <br>
						<textarea class="faqInputContent">기존 답변 내용</textarea>

						<br><br>

						<!-- 버튼 영역 -->
						<div class="faqBtns" style="align-content: right;" align="center">
							<button type="submit" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 40px; background: #343a40">수정</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 40px; background: #343a40">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정 버튼 모달 끝 -->

	<!-- 클래스 추가 제거 이벤트 (css변경) -->
	<!-- activeMgFAQ1,2 버튼클릭 아이디	.contentMg1 버튼1의 내용 -->
	<script>
		$("#activeMgFAQ1").click(
			function() {
				if ($('.contentMg1').css('display') == 'none')
					$('.contentMg1').addClass("contentMg1").css("display", "block");
				$('.contentMg2').addClass("contentMg2").css("display", "none");
				$('.contentMg3').addClass("contentMg3").css("display", "none");
				$('.contentMg4').addClass("contentMg4").css("display", "none");
				$("#activeMgFAQ1").css({'background':'#555555','color':'white'});
				$("#activeMgFAQ2").css({'background':'lightgray','color':'black'});
				$("#activeMgFAQ3").css({'background':'lightgray','color':'black'});
				$("#activeMgFAQ4").css({'background':'lightgray','color':'black'});
		});

		$("#activeMgFAQ2").click(
			function() {
				if ($('.contentMg2').css('display') == 'none')
					$('.contentMg2').addClass("contentMg2").css("display", "block");
				$('.contentMg1').addClass("contentMg1").css("display", "none");
				$('.contentMg3').addClass("contentMg3").css("display", "none");
				$('.contentMg4').addClass("contentMg4").css("display", "none");
				$("#activeMgFAQ1").css({'background':'lightgray','color':'black'});
				$("#activeMgFAQ2").css({'background':'#555555','color':'white'});
				$("#activeMgFAQ3").css({'background':'lightgray','color':'black'});
				$("#activeMgFAQ4").css({'background':'lightgray','color':'black'});
		});

		$("#activeMgFAQ3").click(
			function() {
				if ($('.contentMg3').css('display') == 'none')
					$('.contentMg3').addClass("contentMg3").css("display", "block");
				$('.contentMg1').addClass("contentMg1").css("display", "none");
				$('.contentMg2').addClass("contentMg2").css("display", "none");
				$('.contentMg4').addClass("contentMg4").css("display", "none");
				$("#activeMgFAQ1").css({'background':'lightgray','color':'black'});
				$("#activeMgFAQ2").css({'background':'lightgray','color':'black'});
				$("#activeMgFAQ3").css({'background':'#555555','color':'white'});
				$("#activeMgFAQ4").css({'background':'lightgray','color':'black'});
		});

		$("#activeMgFAQ4").click(
			function() {
				if ($('.contentMg4').css('display') == 'none')
					$('.contentMg4').addClass("contentMg4").css("display", "block");
				$('.contentMg1').addClass("contentMg1").css("display", "none");
				$('.contentMg2').addClass("contentMg2").css("display", "none");
				$('.contentMg3').addClass("contentMg3").css("display", "none");
				$("#activeMgFAQ1").css({'background':'lightgray','color':'black'});
				$("#activeMgFAQ2").css({'background':'lightgray','color':'black'});
				$("#activeMgFAQ3").css({'background':'lightgray','color':'black'});
				$("#activeMgFAQ4").css({'background':'#555555','color':'white'});
		});
	</script>

	<script>
	    $(function(){
	        $(".faqQuestion").click(function(){
	            var answer = $(this).next(); 
	
	            if(answer.css("display") == "none"){
	                $(".faqAnswer").slideUp();
	                answer.slideDown();
	            }else{
	                answer.slideUp(); 
	            }
	        });
	    });
	
	    function deleteConfirm(){
	        confirm('정말 삭제하시겠습니까?');
	    };
	</script>
</body>
</html>