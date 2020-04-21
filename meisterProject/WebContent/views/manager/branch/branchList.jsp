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

    </style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">지점 관리</h1>
			<br>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 지점조회
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataListTable"
							width="100%" cellspacing="0" align="center">
							<thead align="center">
								<tr>
									<th width="20%"><label for="answer"></label> <select
										name="answer" id="answer">
											<option value="processing" selected>지점정보 선택</option>
											<option value="reply">전체</option>
											<option value="reply">지점명</option>
											<option value="reply">지점정보</option>
									</select></th>

									<th width="70%"><input type="text" id="search"
										style="width: 100%; height: 50px" placeholder="검색어를 입력해주세요."></th>
									<th width="10%"><button class="button button5">검색</button></th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>

						<br>

						<table class="table table-bordered" id="dataListTable"
							width="100%" cellspacing="0">
							<thead>
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
										<button class="button" onclick="">수정</button>
										<button class="button" onclick="deleteBranch()">삭제</button>
									</th>
								</tr>
								<tr>
									<td>8</td>
									<td>강남점</td>
									<td>02-1111-2222</td>
									<td>2010/09/20</td>
									<td>서울시 강남구 강남동</td>
									<th>
										<button class="button" onclick="">수정</button>
										<button class="button" onclick="deleteBranch()">삭제</button>
									</th>
								</tr>
								<tr>
									<td>7</td>
									<td>교대점</td>
									<td>02-0000-9999</td>
									<td>2009/10/09</td>
									<td>서울시 서초구 교대</td>
									<th>
										<button class="button" onclick="">수정</button>
										<button class="button" onclick="deleteBranch()">삭제</button>
									</th>
								</tr>
								<tr>
									<td>6</td>
									<td>양재점</td>
									<td>02-6666-5555</td>
									<td>2010/12/22</td>
									<td>서울지 서초구 양재</td>
									<th>
										<button class="button" onclick="">수정</button>
										<button class="button" onclick="deleteBranch()">삭제</button>
									</th>
								</tr>
								<tr>
									<td>5</td>
									<td>위례점</td>
									<td>031-9999-5555</td>
									<td>2010/11/14</td>
									<td>경기도 성남시 위례</td>
									<th>
										<button class="button" onclick="">수정</button>
										<button class="button" onclick="deleteBranch()">삭제</button>
									</th>
								</tr>
								<tr>
									<td>4</td>
									<td>송도점</td>
									<td>032-5555-9999</td>
									<td>2011/06/07</td>
									<td>인천광역시 연수구 송도</td>
									<th>
										<button class="button" onclick="">수정</button>
										<button class="button" onclick="deleteBranch()">삭제</button>
									</th>
								</tr>
								<tr>
									<td>3</td>
									<td>수원</td>
									<td>031-9999-5555</td>
									<td>2010/03/11</td>
									<td>경기도 수원시 팔달구</td>
									<th>
										<button class="button" onclick="">수정</button>
										<button class="button" onclick="deleteBranch()">삭제</button>
									</th>
								</tr>
								<tr>
									<td>2</td>
									<td>동탄</td>
									<td>031-5555-2222</td>
									<td>2011/08/14</td>
									<td>경기도 동탄시</td>
									<th>
										<button class="button" onclick="">수정</button>
										<button class="button" onclick="deleteBranch()">삭제</button>
									</th>
								</tr>
								<tr>
									<td>1</td>
									<td>시흥점</td>
									<td>031-1111-2222</td>
									<td>2011/06/02</td>
									<td>경기도 시흥</td>
									<th>
										<button class="button" onclick="">수정</button>
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
	<script>
            function deleteMem(){
                confirm('정말 탈퇴하시겠습니까?');
            };
        </script>
</body>
</html>