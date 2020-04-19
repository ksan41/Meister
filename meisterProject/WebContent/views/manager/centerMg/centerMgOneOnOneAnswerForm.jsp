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
	<title>meister_통합 - 1:1문의 답변</title>
	
	<!-- 메뉴바 include여기에 해주세요 -->
	<%@ include file="../../common_manager/ImMenubar.jsp"%>
	<!-- 메뉴바 include여기에 해주세요 -->
	
	<link href="../resources/admin/dist/css/styles.css" rel="stylesheet" />
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
	
	<style>
        #contentArea{
            width:100%; 
            height:250px;
            resize:none;
            box-sizing: border-box;
            padding: 2px;
            border: solid 2px darkgray;
        }
        td:nth-child(1){
            text-align: center;
        }

        select { 
            width: 200px; /* 원하는 너비설정 */
            padding: .5em .5em; /* 여백으로 높이 설정 */ 
            font-family: inherit; /* 폰트 상속 */ 
            background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
            border: 1px solid #999; 
            border-radius: 0px; /* iOS 둥근모서리 제거 */ 
            -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
            -moz-appearance: none; 
            appearance: none; 
            color:red;
        }
    </style>
</head>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<h1 class="mt-4">1:1 문의</h1>
			<br>
			<!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="menubar_im.html">홈</a></li>
                            <li class="breadcrumb-item active">지점 공지사항</li>
                        </ol> -->
			<!-- <div class="card mb-4">
                            <div class="card-body">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>.</div>
                        </div> -->
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table mr-1"></i> 1:1 문의 답변하기
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr>
								<td width="15%" style="padding-top: 20px;">처리상태</td>
								<th style="height: 50px; color: red;"><label for="answer"></label>
									<select name="answer" id="answer">
										<option value="processing" selected>처리중</option>
										<option value="reply">답변완료</option>
								</select></th>
							</tr>
							<tr>
								<td>아이디</td>
								<th style="height: 50px;">user01</th>
							</tr>
							<tr>
								<td>연락처</td>
								<th style="height: 50px;">010-7777-7777</th>
							</tr>
							<tr>
								<td>이메일</td>
								<th style="height: 50px;">user01@naver.com</th>
							</tr>
							<tr>
								<td>제목</td>
								<th style="height: 50px;">현기증나요</th>
							</tr>
							<tr>
								<td>내용</td>
								<th style="height: 250px; font-size: 13px;">안녕하세요 장인님<br>
									너무 맛있어서 현기증 나요<br> 어떻게 하나요?
								</th>
							</tr>
							<tr>
								<td>답변</td>
								<th style="height: 250px; font-size: 13px; color: brown"><textarea
										id="contentArea"
										style="font-size: 1.0em; color: cornflowerblue"
										placeholder="답변을 작성해주세요"></textarea></th>
							</tr>
						</table>

						<div align="center">
							<button class="button" onclick="">등록</button>
							<button class="button" onclick="">취소</button>
						</div>

					</div>
				</div>
			</div>
		</div>
		</main>
	</div>

</body>
</html>