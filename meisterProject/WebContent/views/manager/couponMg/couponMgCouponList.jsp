<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.meister.coupon.model.vo.Coupon"%>
<%
	ArrayList<Coupon> list = (ArrayList<Coupon>)request.getAttribute("list");

%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_통합 - 쿠폰 리스트</title>
        
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
        tr{text-align: center;}
        select { 
            width: 200px; /* 원하는 너비설정 */
            padding: .8em 1.5em; /* 여백으로 높이 설정 */ 
            font-family: inherit; /* 폰트 상속 */ 
            background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
            border: 1px solid #999; 
            border-radius: 0px; /* iOS 둥근모서리 제거 */ 
            -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
            -moz-appearance: none; 
            appearance: none; 
        }
        .button5 {
            background-color: #343a40;
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;
            margin: 4px 2px;
            cursor: pointer;
        }
        #search{padding: 10px;}
        input[type=checkbox]{
            cursor:pointer;
            width:18px;
            height:18px;
        }
        /* 네비게이션 바 스타일 시작 */
        #ulNavi {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: white;
        width:300px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        }

        #ulNavi li{
        float: left;
        width:50%;
        }

        #ulNavi li a{
        display: block;
        color: black;
        font-weight: bold;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        }

        #ulNavi li a.active{
        background-color: #343a40;
        color:white;
        }
        /* 네비게이션 바 스타일 끝 */
        #couponEnrollTable tr{
            height:70px;
            font-size:17px;
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
	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">쿠폰관리</h1>
			<br>
			<ul id="ulNavi">
				<li><a class="active" href="">쿠폰정보</a></li>
				<li><a href="">쿠폰발송</a></li>
			</ul>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 쿠폰 리스트
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataListTable"
							width="100%" cellspacing="0" align="center">
							<thead align="center">
								<tr>
								<form name="searchName" action="<%=contextPath%>/couponList.cm" method="post">
									<th style="vertical-align:middle;">쿠폰명 검색</th>
									<th><input name="couponName" type="text" id="search"
										style="width: 120px;height:30px">
									<button class="small_btn" type="submit">검색</button></th>
								</form>
								<form name="searchDate" action="<%=contextPath %>/couponList.cm" method="post">
									<th style="vertical-align:middle;">기간별 조회</th>
									<th>
										<input type="date" name="startDate" required>
										~
										<input type="date" name="endDate">
										<button class="small_btn" type="submit" required>검색</button></th>
									</th>
								</form>
							</thead>
							<tbody>

							</tbody>
						</table>

						<div align="right">
							<button class="button" onclick="" data-toggle="modal"
								data-target="#couponEnrollModal">등록</button>
							<button class="button" onclick="">선택삭제</button>
						</div>

						<table class="table table-bordered" id="dataListTable"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th width="7%">NO</th>
									<th width="40%">쿠폰</th>
									<th width="25%">기간</th>
									<th width="8%">할인율</th>
									<th width="15%">등록일</th>
									<th width="5%"><input type="checkbox"></th>
								</tr>
							</thead>
							<tbody>
								<%if(list.isEmpty()){ //조회결과 없을경우 %>
									<tr>
										<th colspan="6">조회 결과가 없습니다.</th>
									<tr>
								<%}else{ //조회결과 있을경우%>
									<%for(int i=0;i<list.size();i++){ %>
										<tr>
											<td><%=list.get(i).getCouponNo() %></td>
											<td><%=list.get(i).getCouponName() %></td>
											<td><%=list.get(i).getCouponStart() %> ~ <%=list.get(i).getCouponEnd() %></td>
											<td><%=list.get(i).getCouponDiscount()%>%</td>
											<td><%=list.get(i).getCouponRegisterDate() %></td>
											<th><input id="couponCheck<%=i%>" type="checkbox"></th>
										</tr>
									<%} %>
								<%} %>
							</tbody>
						</table>


					</div>
				</div>
			</div>
		</div>
		</main>
	</div>

	<!-- 모달 시작 -->
	<div class="modal fade" id="couponEnrollModal">
		<!-- modal별 id 변경해주세요-->
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin: auto; padding: 0;">쿠폰
						등록</h4>
					<button type="button" class="close" data-dismiss="modal"
						style="margin: 0; padding: 0;">&times;</button>
				</div>

				<!-- Modal body -->
				<form name="couponInsertForm" action="<%=contextPath%>/couponInsert.cm" method="post">
				<div class="modal-body">
					<table id="couponEnrollTable">
						<tr>
							<th>쿠폰명</th>
							<td><input name="couponName" type="text" placeholder="쿠폰명을 입력해주세요"
								style="width: 310px;" required></td>
						</tr>
						<tr>
							<th>할인율(%)</th>
							<td style="text-align: left;"><input name="discount" type="number" step="5"
								min="0" max="100" style="width: 100px;" required></td>
						</tr>
						<tr>
							<th>기간</th>
							<td><input name="startDate" type="date" style="width: 145px;" required> ~ <input
								name="endDate" type="date" style="width: 145px;" required></td>
						</tr>
					</table>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer" style="margin: auto;">
					<!-- 하단버튼 영역-->
					<button id="couponEnrollBtn" type="submit" class="btn btn-danger"
						style="width: 200px; height: 50px; background: #343a40; border-color: #343a40;">등록완료</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
	
</body>
</html>