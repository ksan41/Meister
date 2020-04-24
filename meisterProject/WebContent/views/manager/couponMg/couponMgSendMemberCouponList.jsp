<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.meister.coupon.model.vo.Coupon"%>

<%
	String mArr = (String)request.getAttribute("mArr"); //쿠폰발송할 회원번호들이 담긴 문자열
	ArrayList<Coupon> cList = (ArrayList<Coupon>)request.getAttribute("cList");
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_통합 - 쿠폰발송_쿠폰선택</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	
	<link href="../resources/admin/dist/css/styles.css" rel="stylesheet" />
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
	
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
	</style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">쿠폰관리</h1> <br>
                        <ul id="ulNavi">
                            <li><a href="">쿠폰정보</a></li>
                            <li><a class="active" href="">쿠폰발송</a></li>
                        </ul>
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i> 발송할 쿠폰 선택</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataListTable" width="100%" cellspacing="0" align="center">
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
                                            </tr>
                                        </thead>
                                        <tbody>
                                         
                                        </tbody>
                                    </table>

                                    <div align="right">
                                        <button class="button" onclick="sendingCoupon();">쿠폰 발송</button>
                                    </div>

                                    <table class="table table-bordered" id="dataListTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th width="7%">NO</th>
                                                <th width="40%">쿠폰</th>
                                                <th width="25%">기간</th>
                                                <th width="8%">할인율</th>
                                                <th width="15%">등록일</th>
                                                <th width="5%"><input class="checkAll" type="checkbox"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%if(cList.isEmpty()){ //조회된 쿠폰이 없을경우 %>
                                        	<tr>
                                        		<th colspan="6">
                                        			조회된 쿠폰이 없습니다. 쿠폰정보페이지에서 쿠폰을 등록해주세요.
                                        		</th>
                                        	</tr>
                                        <%}else{ //조회된 쿠폰이 있을 경우%>
                                        	<% for(int i=0;i<cList.size();i++){ %>
	                                            <tr>
	                                                <td><%=cList.get(i).getCouponNo() %></td>
	                                                <td><%=cList.get(i).getCouponName() %></td>
	                                                <td><%=cList.get(i).getCouponStart() %> ~ <%=cList.get(i).getCouponEnd() %></td>
	                                                <td><%=cList.get(i).getCouponDiscount()%>%</td>
	                                                <td><%=cList.get(i).getCouponRegisterDate() %></td>
	                                                <th><input  class="cb" name="checkCou" type="checkbox" value="<%=cList.get(i).getCouponNo()%>"></th>
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
            
	<script>
		$(document).ready(function() {
			$('.checkAll').click(function() {
				$('.cb').prop('checked', this.checked);
			});
		});

		function sendingCoupon() {
			
		};
	</script>

</body>
</html>