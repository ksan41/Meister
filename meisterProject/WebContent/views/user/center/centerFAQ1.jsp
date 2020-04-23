<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.meister.center.model.vo.Faq"%>
	
<%

	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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

/* 고객센터 FAQ 스타일 시작 */
.faqComment {
	padding: 10px;
	padding-top: 17px;
	font-size: 13px;
}

.faqComment>p {
	color: red;
	font-size: 11px;
}

.faqBtns {
	margin-left: 5px;
	padding-top: 20px;
	padding-bottom: 20px;
}

.faqBtns button {
	background-color: lightgray;
	border: none;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	cursor: pointer;
	width: 240px;
	height: 30px;
}

.faqBtns button.active {
	background-color: rgb(76, 60, 60);
	color: white;
	border: 1px solid rgb(76, 60, 60);
}

.faqQuestion {
	padding-left: 30px;
	border-bottom: 1px solid lightgray;
}

.faqQuestion tr {
	height: 60px;
	font-weight: bold;
	cursor: pointer;
}

.faqAnswer td {
	font-size: 12px;
}

.faqAnswer tr {
	height: 100px;
}

.faqAnswer {
	padding-left: 30px;
	display: none;
	border-bottom: 1px solid lightgray;
}
/* 고객센터 FAQ 스타일 끝 */


/*클래스 추가 이벤트 */
 .content2, .content3, .content4{
            display: none;
        }
        
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
			<a href="" style="color: orange">자주하는 질문</a> <span
				style="color: lightgray; font-size: 17px;">|</span> <a href="">1:1문의</a>
		</div>
		<hr>
		
			
		
		<!-- inner영역에 콘텐츠 작성 -->
		<div class="inner">
			<div class="faqComment">
				마이스터 피자에 대한 궁금증을 바로 확인하실 수 있습니다.
				<p>마이스터 피자 고객만족센터 080-888-8888</p>
			</div>
			<hr>

			<div class="faqBtns">
				<button id="active1">피자 주문하기</button>
				<button id="active2">주문확인</button>
				<button id="active3">포장 주문</button>
				<button id="active4">홈페이지 관련</button>
			</div>
			<hr>

			<div class="content1">

				<div class="faqQuestion">
					<table>
						<tr>
							<th style="width: 30px; text-align: center; color: blue">Q</th>
							<td style="width: 900px;">예약주문만 가능한 경우는 왜 그런가요?</td>
						</tr>
					</table>
				</div>
				
				<% if(list.isEmpty()) { %> // 리스트가 비어 있을 경우
				
				<% } else { %> // 리스트가 비어 있지 않을 경우
				
					   <% for(Center c : list) { %>
					   <tr>
							<td><%=  %></td>
							<td><%=  %></td>
							<td><%=  %></td>
							<td><%=  %></td>
					    </tr>
					<% } %>
					
					<% } %>
				
			
				
				<div class="faqAnswer">
					<table>
						<tr>
							<th
								style="width: 30px; text-align: center; color: red; font-weight: bold;">A</th>
							<td style="width: 800px;">배달사원부족, 주문폭주 등으로 부득이 하게 예약주문만 가능한
								경우가 있습니다. 이 경우 매장이나 콜센터(1577-3082)로 전화하셔도 예약주문만 가능하기 때문에 고객님의 많은
								양해 부탁 드립니다. 또한, 매장 오픈시간 전이나, 영업 종료 후엔느 예약 주문만 가능합니다.</td>
						</tr>
					</table>
				</div>


				<div class="faqQuestion">
					<table>
						<tr>
							<th style="width: 30px; text-align: center; color: blue">Q</th>
							<td style="width: 900px;">매장상태에 따른 주문불가는 무엇인가요?</td>
						</tr>
					</table>
				</div>
				<div class="faqAnswer">
					<table>
						<tr>
							<th
								style="width: 30px; text-align: center; color: red; font-weight: bold;">A</th>
							<td style="width: 800px;">배달사원부족, 주문폭주 등으로 부득이 하게 예약주문만 가능한
								경우가 있습니다. 이 경우 매장이나 콜센터(1577-3082)로 전화하셔도 예약주문만 가능하기 때문에 고객님의 많은
								양해 부탁 드립니다. 또한, 매장 오픈시간 전이나, 영업 종료 후엔느 예약 주문만 가능합니다.</td>
						</tr>
					</table>
				</div>

				<div class="faqQuestion">
					<table>
						<tr>
							<th style="width: 30px; text-align: center; color: blue">Q</th>
							<td style="width: 900px;">하프&하프가 무엇인가요?</td>
						</tr>
					</table>
				</div>
				<div class="faqAnswer">
					<table>
						<tr>
							<th style="width: 30px; color: red;">A</th>
							<td style="width: 800px;">배달사원부족, 주문폭주 등으로 부득이 하게 예약주문만 가능한
								경우가 있습니다. 이 경우 매장이나 콜센터(1577-3082)로 전화하셔도 예약주문만 가능하기 때문에 고객님의 많은
								양해 부탁 드립니다. 또한, 매장 오픈시간 전이나, 영업 종료 후엔느 예약 주문만 가능합니다.</td>
						</tr>
					</table>
				</div>
				
				<div class="faqQuestion">
					<table>
						<tr>
							<th style="width: 30px; color: blue">Q</th>
							<td style="width: 900px;">하프&하프가 무엇인가요?</td>
						</tr>
					</table>
				</div>
				<div class="faqAnswer">
					<table>
						<tr>
							<th style="width: 30px; color: red;">A</th>
							<td style="width: 800px;">배달사원부족, 주문폭주 등으로 부득이 하게 예약주문만 가능한
								경우가 있습니다. 이 경우 매장이나 콜센터(1577-3082)로 전화하셔도 예약주문만 가능하기 때문에 고객님의 많은
								양해 부탁 드립니다. 또한, 매장 오픈시간 전이나, 영업 종료 후엔느 예약 주문만 가능합니다.</td>
						</tr>
					</table>
				</div>

				<div class="faqQuestion">
					<table>
						<tr>
							<th style="width: 30px; color: blue">Q</th>
							<td style="width: 900px;">피자를 다량으로 주문하고 싶습니다.</td>
						</tr>
					</table>
				</div>
				<div class="faqAnswer">
					<table>
						<tr>
							<th style="width: 30px; color: red;">A</th>
							<td style="width: 800px;">배달사원부족, 주문폭주 등으로 부득이 하게 예약주문만 가능한
								경우가 있습니다. 이 경우 매장이나 콜센터(1577-3082)로 전화하셔도 예약주문만 가능하기 때문에 고객님의 많은
								양해 부탁 드립니다. 또한, 매장 오픈시간 전이나, 영업 종료 후엔느 예약 주문만 가능합니다.</td>
						</tr>
					</table>
				</div>

				<div class="faqQuestion">
					<table>
						<tr>
							<th style="width: 30px; color: blue">Q</th>
							<td style="width: 900px;">주문 한 메뉴를 변경하거나 취소해야 할 경우에는 어떻게
								하나요?</td>
						</tr>
					</table>
				</div>
				<div class="faqAnswer">
					<table>
						<tr>
							<th style="width: 30px; color: red;">A</th>
							<td style="width: 800px;">배달사원부족, 주문폭주 등으로 부득이 하게 예약주문만 가능한
								경우가 있습니다. 이 경우 매장이나 콜센터(1577-3082)로 전화하셔도 예약주문만 가능하기 때문에 고객님의 많은
								양해 부탁 드립니다. 또한, 매장 오픈시간 전이나, 영업 종료 후엔느 예약 주문만 가능합니다.</td>
						</tr>
					</table>
				</div>
								
				<div class="faqQuestion">
					<table>
						<tr>
							<th style="width: 30px; color: blue">Q</th>
							<td style="width: 900px;">홈페이지 주문으로 피자는 몇 판까지 주문할 수 있나요?</td>
						</tr>
					</table>
				</div>
				<div class="faqAnswer">
					<table>
						<tr>
							<th style="width: 30px; color: red;">A</th>
							<td style="width: 800px;">배달사원부족, 주문폭주 등으로 부득이 하게 예약주문만 가능한
								경우가 있습니다. 이 경우 매장이나 콜센터(1577-3082)로 전화하셔도 예약주문만 가능하기 때문에 고객님의 많은
								양해 부탁 드립니다. 또한, 매장 오픈시간 전이나, 영업 종료 후엔느 예약 주문만 가능합니다.</td>
						</tr>
					</table>
				</div>
				
				
				
        


			</div>
			
			
			
			<div class="content2">
			
			
			 ㄴㅇㄹㅇㄴㄻㄴㅇㄹㅇ
			
			
			</div>
				
            <div class="content3">
            
            
            asdfasdfds
            
            
            
            </div>
            
			
		    <div class="content4">
		    
		    
		    adsfsdf
		    
		    
		    </div>
				
				
			
		</div>
		
		   
		    </div>
		    
		    
		    
		    
		    
		    
		    
		    
			
		
			




		

	<!-- 클래스 추가 제거 이벤트 (css변경) -->
	
	<script>
		$("#active1").click(function() {
			if ($('.content1').css('display') == 'none')
				$('.content1').addClass("content1").css("display", "block");
			$('.content2').addClass("content2").css("display", "none");
			$('.content3').addClass("content3").css("display", "none");
			$('.content4').addClass("content4").css("display", "none");
		});

		$("#active2").click(function() {
			if ($('.content2').css('display') == 'none')
				$('.content2').addClass("content2").css("display", "block");
			$('.content1').addClass("content1").css("display", "none");
			$('.content3').addClass("content3").css("display", "none");
			$('.content4').addClass("content4").css("display", "none");
		});

		$("#active3").click(function() {
			if ($('.content3').css('display') == 'none')
				$('.content3').addClass("content3").css("display", "block");
			$('.content1').addClass("content1").css("display", "none");
			$('.content2').addClass("content2").css("display", "none");
			$('.content4').addClass("content4").css("display", "none");
		});

		$("#active4").click(function() {
			if ($('.content4').css('display') == 'none')
				$('.content4').addClass("content4").css("display", "block");
			$('.content1').addClass("content1").css("display", "none");
			$('.content2').addClass("content2").css("display", "none");
			$('.content3').addClass("content3").css("display", "none");
		});
	</script>



	<script>
		$(function() {
			$(".faqQuestion").click(function() {
				var answer = $(this).next();

				if (answer.css("display") == "none") {
					$(".faqAnswer").slideUp();
					answer.slideDown();
				} else {
					answer.slideUp();
				}
			});
		});
	</script>


	<%@ include file="../../common_user/footer.jsp"%>

</body>
</html>