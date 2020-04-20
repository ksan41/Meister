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
	<title>meister_통합 - 회원 리스트</title>
	
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
			<h1 class="mt-4">회원관리</h1>
			<br>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 회원조회
					<button style="">탈퇴회원조회</button>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataListTable"
							width="100%" cellspacing="0" align="center">
							<thead align="center">
								<tr>
									<th style="height: 50px;" width="20%"><label for="answer"></label>
										<select name="answer" id="answer">
											<option value="processing" selected>회원정보 선택</option>
											<option value="reply">전체</option>
											<option value="reply">회원명</option>
											<option value="reply">회원정보</option>
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
									<th width="10%">순번</th>
									<th width="20%">아이디</th>
									<th width="20%">이름</th>
									<th width="20%">회원가입일</th>
									<th width="15%">보유쿠폰(수량)</th>
									<th width="15%">탈퇴처리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>9</td>
									<td>user01</td>
									<td>New York</td>
									<td>2011/12/12</td>
									<td>21</td>
									<th>
										<button class="button" onclick="deleteMem()">탈퇴</button>
									</th>
								</tr>
								<tr>
									<td>8</td>
									<td>user02</td>
									<td>Sidney</td>
									<td>2010/09/20</td>
									<td>23</td>
									<th>
										<button class="button" onclick="deleteMem()">탈퇴</button>
									</th>
								</tr>
								<tr>
									<td>7</td>
									<td>user03</td>
									<td>London</td>
									<td>2009/10/09</td>
									<td>47</td>
									<th>
										<button class="button" onclick="deleteMem()">탈퇴</button>
									</th>
								</tr>
								<tr>
									<td>6</td>
									<td>user04</td>
									<td>Edinburgh</td>
									<td>2010/12/22</td>
									<td>42</td>
									<th>
										<button class="button" onclick="deleteMem()">탈퇴</button>
									</th>
								</tr>
								<tr>
									<td>5</td>
									<td>user05</td>
									<td>Singapore</td>
									<td>2010/11/14</td>
									<td>28</td>
									<th>
										<button class="button" onclick="deleteMem()">탈퇴</button>
									</th>
								</tr>
								<tr>
									<td>4</td>
									<td>user06</td>
									<td>San Francisco</td>
									<td>2011/06/07</td>
									<td>28</td>
									<th>
										<button class="button" onclick="deleteMem()">탈퇴</button>
									</th>
								</tr>
								<tr>
									<td>3</td>
									<td>user07</td>
									<td>San Francisco</td>
									<td>2010/03/11</td>
									<td>48</td>
									<th>
										<button class="button" onclick="deleteMem()">탈퇴</button>
									</th>
								</tr>
								<tr>
									<td>2</td>
									<td>user08</td>
									<td>Tokyo</td>
									<td>2011/08/14</td>
									<td>20</td>
									<th>
										<button class="button" onclick="deleteMem()">탈퇴</button>
									</th>
								</tr>
								<tr>
									<td>1</td>
									<td>user09</td>
									<td>Sidney</td>
									<td>2011/06/02</td>
									<td>37</td>
									<th>
										<button class="button" onclick="deleteMem()">탈퇴</button>
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
		    confirm('해당 회원을 탈퇴처리 하시겠습니까?');
		};
	</script>
</body>
</html>