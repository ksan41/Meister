<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.meister.member.model.vo.Member"%>
    
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_통합 - 쿠폰발송_회원리스트</title>
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
            padding: 12px 20px;
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
    </style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">쿠폰관리</h1>
			<br>
			<ul id="ulNavi">
				<li><a href="<%=contextPath%>/couponList.cm">쿠폰정보</a></li>
				<li><a class="active">쿠폰발송</a></li>
			</ul>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 회원 리스트
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<div align="right">
							<button class="button" onclick="memList();">다음으로</button>
						</div>

						<table class="table table-bordered" id="dataListTable"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th width="15%">NO</th>
									<th width="20%">아이디</th>
									<th width="20%">이름</th>
									<th width="20%">회원가입일</th>
									<th width="20%">보유쿠폰(수량)</th>
									<th width="5%"><input class="checkAll" type="checkbox"></th>
								</tr>
							</thead>
							<tbody>
								<%if(list.isEmpty()){ %>
									<tr>
										<th colspan="6">조회된 데이터가 없습니다.</th>
									</tr>								
								<%}else{ %>
								<form name="couponSendMemList" action="<%=contextPath%>/couponSendCpList.cm" method="post">
									<%for(int i=0;i<list.size();i++){ %>
										<tr>
											<td><%=list.get(i).getMemberNo() %></td>
											<td><%=list.get(i).getMemberId() %></td>
											<td><%=list.get(i).getMemberName() %></td>
											<td><%=list.get(i).getMemberEnrolldate() %></td>
											<td><%=list.get(i).getMemberCouponCnt() %></td>
											<th><input class="cb" id="memCheck<%=i%>" name="checkMem" type="checkbox" value="<%=list.get(i).getMemberNo() %>"></th>
										</tr>
									<%} %>
									<input type="submit" id="hiddenNextBtn" style="display:none;">
								</form>	
								<%} %>
							</tbody>
						</table>


					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<script>
	    $( document ).ready( function() {
	        $( '.checkAll' ).click( function() {
	          $( '.cb' ).prop( 'checked', this.checked );
	        } );
	      } );
	
    	function memList(){
  	  
  	 	 	$("#hiddenNextBtn").trigger("click");
   		 }
	</script>
</body>
</html>