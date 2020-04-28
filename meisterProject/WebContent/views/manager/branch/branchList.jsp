<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,com.meister.branch.model.vo.*"%>
<%
	ArrayList<Branch> bList = (ArrayList<Branch>)session.getAttribute("bList");
	ArrayList<Manager> mList = (ArrayList<Manager>)session.getAttribute("mList");

%>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>meister_통합_지점조회</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/imMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	
	<!-- 모달 부트스트랩-->
	<link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!-- 모달 부트스트랩 -->
	
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
            cursor: pointer;
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
        #dataListTable>tbody>tr:hover{
            cursor: pointer;
        }

         /* 중간버튼 스타일 */
        .middle_btn{
            display: block;
            height:40px;
            width:150px;
            margin-left: 88%;
            font-size: 15px;
            font-weight: bolder;
            color:white;
            background-color:orange;
            border:0;
            border-radius: 5px;
        }
         /* 중간버튼 스타일 */


        #thumb{
            border:1px solid red;
            width:150px;
            height:150px;
        }

        #branchUpdateTable *{
            margin: 0;
            padding: 0;
            text-align: left;
        }
    
		.layoutSidenav_content{
            margin:auto;
            margin-top: 100px;
            width:1200px;
            height: auto;

       }
    </style>
</head>
<body>
	            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">지점 관리</h1>
                        
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>지점조회</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataListTable" width="100%" cellspacing="0" align="center">
                                        <thead align="center">
                                            <tr>

                                        </thead>
                                        <tbody>
                                        
                                        </tbody>
                                    </table>
                                    <br>
                                    <table class="table table-bordered" id="dataListTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <td colspan="6">
                                                    <button class="middle_btn" onclick="location.href='<%=contextPath%>/branchEnrollForm.br'">지점등록</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th width="10%">지점번호</th>
                                                <th width="10%">지점명</th>
                                                <th width="20%">전화번호</th>
                                                <th width="15%">개점일</th>
                                                <th width="30%">지점주소</th>
                                                <th width="15%">수정/탈퇴</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>9</td>
                                                <td>역삼점</td>
                                                <td>02-2222-2222</td>
                                                <td>2011/12/12</td>
                                                <td>서울시 강남구 역삼동</td>
                                                <th>
                                                    <button class="button" data-toggle="modal" data-target="#branchUpdateModal">수정</button>
                                                    <button class="button" onclick="deleteBranch()">삭제</button>
                                                </th>
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
              <div class="modal fade" id="branchUpdateModal"> <!-- modal별 id 변경해주세요-->
                <div class="modal-dialog" style="width:auto;display:table">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title" style="margin:auto;padding:0;">지점정보 수정</h4>
                    <button type="button" class="close" data-dismiss="modal" style="margin:0;padding:0;">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="">
                        <table id="branchUpdateTable" style="width:900px;height:900px;margin: 12px;" cellpadding="0" cellspacing="10">
                            <tr>
                                <th>지점명</th>
                                <td colspan="3"><input name="branchName" type="text" style="width:310px;"></td>
                            </tr>
                            <tr>
                                <th>점주명</th>
                                <td><input name="name" type="text"></td>
                                <th>지점계정</th>
                                <td><input name="bmId" type="text"></td>
                            </tr>
                            <tr>
                                <th>개점일자</th>
                                <td colspan="3">
                                    <input name="enrollDate" type="date">
                                </td>
                            </tr>
                            <tr>
                                <th>영업시작시간</th>
                                <td style="text-align:left;">
                                    <input name="open" type="text" style="width:100px;">
                                </td>
                                <th>영업종료시간</th>
                                <td><input name="close" type="text" style="width:100px;"></td>
                            </tr>
                            <tr>
                                <th>매장전화번호</th>
                                <td colspan="3"><input name="phone" type="text"></td>
                            </tr>
                            <tr>
                                <th>매장이미지
                                    <input name="branchImg" type="file" style="display: none;">
                                </th>
                                <td colspan="3">
                                    <div id="thumb" style="border: 1px solid red; width:250px;height:250px;">
                                        <img src="" alt="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>지점주소</th>
                                <td colspan="3"><input name="address" type="text"></td>
                            </tr>
                            <tr>
                                <th rowspan="3">매장위치</th>
                                <td colspan="3" rowspan="3">
                                    <div id="branchMap" style="border:1px solid red; width:600px; height:400px;"></div>
                                </td>
                            </tr>
                            <tr><td colspan="4"></td></tr>
                            <tr><td colspan="4"></td></tr>
                            <tr>
                                <th colspan="2">위도: </th>
                                <th colspan="2">경도: </th> 
                            </tr>
                        </table>
                    </form>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer" style="margin:auto;">
                        <!-- 하단버튼 영역-->
                    <button type="button" class="btn btn-danger" data-dismiss="modal"
                    style="width:200px; height:50px;">수정완료</button>
                    </div>
                    
                </div>
                </div>
            </div>
            <!-- 모달 끝 -->
</body>
</html>