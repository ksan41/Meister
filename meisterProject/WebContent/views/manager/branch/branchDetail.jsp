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
        <title>meister_통합 - 지점상세조회</title>
        
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
            .layoutSidenav_content{
                margin:auto;
                margin-top: 100px;
                width:1200px;
                height: auto;

            }
            th {height: 80px; width: 130px;}
            table{
                font-size: 18px;
                margin: auto;
            }
            input{border-radius: 5px;}
        </style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">지점관리</h1><!-- 제목-->
                        <br>
                        <div class="card mb-4">    <!-- 아이콘은 위에 메뉴에서 해당 i태그 가져오세요-->
                            <div class="card-header"><i class="fas fa-table mr-1"></i> 지점 상세조회</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div id="btn-area" align="right">
                                        <input class="button" id="modifyBtn" type="submit" value="수정">
                                        <input class="button" id="deleteBtn" type="submit" value="삭제">
                                    </div>
                                    <table style="width: 100%;">
                                        <tr>
                                            <th>지점명</th>
                                            <td colspan="3"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>지점번호</th>
                                            <td><input type="text"></td>
                                            <th>지점장명</th>
                                            <td><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>영업시간</th>
                                            <td><input type="text"></td>
                                            <th>지점계정명</th>
                                            <td><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>주차정보</th>
                                            <td><input type="text"></td>
                                            <th>지점장번호</th>
                                            <td><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>할인율</th>
                                            <td colspan="3"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>개점일자</th>
                                            <td colspan="3"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>지점주소</th>
                                            <td colspan="3"><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>매장이미지</th>
                                            <td></td>
                                            <th>매장위치</th>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><img src="" alt="" width="100%"></td>
                                            <td colspan="2"><img src="" alt="" width="100%"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
</body>
</html>