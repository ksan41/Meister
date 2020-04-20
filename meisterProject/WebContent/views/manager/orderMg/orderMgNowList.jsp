<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_지점 - 주문현황</title>
	
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
		.layoutSidenav_content {
			margin: auto;
			margin-top: 100px;
			width: 1200px;
			height: auto;
		}
		
		tr {
			text-align: center;
		}
		
		#index-area {
			text-align: right;
			font-size: 12px;
		}
		
		#index-area a {
			color: gray
		}
		
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
	</style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content" id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">주문현황</h1>
			<!-- 제목-->
			<div id="index-area">
				<a href="">홈</a> &gt; <a href="">현재 들어온 주문</a>
			</div>
			<br>
			<div class="card mb-4">
				<!-- 아이콘은 위에 메뉴에서 해당 i태그 가져오세요-->
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 현재 들어온 주문
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<!-- 내용작성-->
						<table class="table table-bordered" id="dataListTable" width="60%" cellspacing="0";>
							<thead>
								<tr>
									<th width="10%">주문번호</th>
									<th width="10%">고객명</th>
									<th width="48%">주문정보</th>
									<th width="20%">주문일시</th>
									<th width="12%">접수상태</th>
								</tr>
							</thead>
							<tbody>
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2011/12/12 13:24</td>
									<th>
										<button class="button" onclick="" style="background-color: yellowgreen;">접수</button>
									</th>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2010/09/20 13:24</td>
									<th>
										<button class="button" onclick="" style="background-color: yellowgreen;">접수</button>
									</th>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2009/10/09 13:24</td>
									<th>
										<button class="button" onclick=""
											style="background-color: yellowgreen;">접수</button>
									</th>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2010/12/22 13:24</td>
									<th>
										<button class="button" onclick=""
											style="background-color: yellowgreen;">접수</button>
									</th>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2010/11/14 13:24</td>
									<th><button class="button" onclick="">접수완료</button></th>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2011/06/07 13:24</td>
									<th><button class="button" onclick="">접수완료</button></th>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2010/03/11 13:24</td>
									<th><button class="button" onclick="">접수완료</button></th>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2011/08/14 13:24</td>
									<th><button class="button" onclick="">접수완료</button></th>
								</tr>
								<tr data-toggle="modal" data-target="#myModal">
									<td>14414</td>
									<td>홍길동</td>
									<td>치즈 L X 1, 콜라 L, 피클</td>
									<td>2011/06/02 13:24</td>
									<th><button class="button" onclick="">접수완료</button></th>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<!-- 모달 시작 -->
	<div class="modal fade" id="myModal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin: auto; padding: 0;">주문
						상세정보</h4>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table>
						<tr>
							<td>주문번호 :</td>
							<td>14414</td>
						</tr>
						<tr>
							<td style="padding-top: 8px;">주문일시 :</td>
							<td>2020-03-31 13:24</td>
						</tr>
						<tr>
							<td style="padding-top: 8px;">고객명 :</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td style="padding-top: 8px;">연락처 :</td>
							<td>010-0000-0000</td>
						</tr>
						<tr>
							<td style="padding-top: 8px;">배달주소 :</td>
							<td style="padding-top: 8px;">인천 송도문화로</td>
						</tr>
						<tr></tr>
						<tr>
							<td style="padding-top: 8px;">주문내용 :</td>
							<td style="height: 100px;">주문내용</td>
						</tr>
						<tr>
							<td style="padding-top: 8px;">요청사항 :</td>
							<td style="padding-top: 10px; height: 100px; padding-left: 10px;">치즈에
								빼고 넣어주세요</td>
						</tr>
					</table>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer" style="margin: auto;">
					<!-- 하단버튼 영역-->
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						style="width: 200px; height: 50px; background: yellowgreen; border-color: yellowgreen;">배달완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->

</body>
</html>