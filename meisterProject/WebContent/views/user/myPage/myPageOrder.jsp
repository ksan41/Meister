<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	/* 서브메뉴 스타일 시작 (위에 웹폰트 링크도 복붙해주세요)*/
	div{box-sizing: border-box;}
	.outer{
	    width:1000px;
	    box-sizing: border-box;
	    margin: auto;
	    margin-top: 100px;
	    margin-bottom: 150px;
	}
	
	.outer *{
	    font-family: 'NanumSquare';
	}
	
	.outer a{text-decoration: none;}
	
	#index-area{
	   text-align: right;
	   font-size: 12px;
	}
	#index-area a{color:gray}
	
	
	.sub-menu-area *{
	    padding: 5px;
	}
	.sub-menu-area>a{
	    font-size: 17px;
	    color:black;
	    font-weight: bolder;
	}
	
	/* 서브메뉴 스타일 끝 */
	#order-info{
	                
	    width:1000px;
	    height:250px;
	    border:1px solid rgb(76, 60, 60);
	    background-color: rgb(76, 60, 60);
	    margin-top:20px;
	    color:white;
	}
	
	.bline {
	     background-color: skyblue;
	     height: 2px;
	     border:0px;
	     width: 270px;
	 }
	
	.pagination {
		display:inline-block;
	}
	.pagination a {
	    color: black;
	    padding: 5px 10px;
	    text-decoration: none;
	    transition: background-color .3s;
	    border: 1px solid #ddd;
	    margin: 0 2px;
	    font-size:12px;
	}
	
	.pagination a.active {
	    background-color: orange;
	    color: white;
	    border: 1px solid orange;
	}
	.pagination a:hover:not(.active) {background-color: #ddd;}
	
	#noticeList>tbody td{text-align: center;}
	#noticeList *{
	    height:30px;
	    font-size:12px;
	    border-bottom:1px solid lightgray;
	}
	#noticeList{border-top:1px solid black;}
	#noticeList>thead th{
	    font-size:14px;
	    font-weight:750;
	}
	
	#noticeList>tbody :nth-child(2){cursor: pointer;}
	
	.small_btn{
	    display: block;
	    height:25px;
	    width:60px;
	    margin: 0 auto;
	    font-size: 10px;
	    font-weight: bolder;
	    color:white;
	    background-color: rgb(76, 60, 60);
	    border:0;
	    border-radius: 5px;
	}
	</style>
</head>
<body>

	<%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
	
    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1>나의 정보</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; <a href="">나의 정보</a> &gt; 주문내역</div>
        <div class="sub-menu-area">
            <!-- 현재 페이지는 orange 로 표시 -->
            <a href="" style="color:orange">주문내역</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href="" >쿠폰함</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href="" >1:1문의</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href="" >정보수정</a>
        </div>
        <hr>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            
            <div id="order-info">
                
                <table id="table1" style="font-size: 16px;" width="1000px" height="250px">
                    <tr>
                        <th rowspan="2" width="50%" height="100px" style="text-align:center;">
	                        <b style="font-weight:bold; font-size: 1.5em;">절대미각</b>님이 주문하신 내역입니다.
	                        <hr class="bline">
	                        <p style="font-size: 0.7em; color:white">주문을 취소하시려면 해당 매장으로 전화하셔야 합니다.</p>
                        </th>
                        <th width="300px" style="padding-top: 10px">
                            <p align="left" style="color:white;">
                                	주문<br>
                                (2020.01~2020.03)
                                <b></b>
                            </p>
                    </th>
                        
                        <th width="25%" style="padding-top: 10px">
                            <p align="left" style="color:white;">
                                	주문금액<br>
                                (2020.01~2020.03)
                            </p>
                        </th>
                    </tr>
                    <tr>
                        <th height="25%" style="font-weight:bold; font-size: 4.0em; padding-bottom: 20px">0</th>
                        <th style="font-weight:bold; font-size: 4.0em; padding-bottom: 20px">0</th>
                    </tr>
                    
                </table>
                
            </div>

            <div class="inner">
                <br><br>
                <div align="left" style="font-size:22px; font-weight:700; padding-bottom:10px;">피자 주문</div>
    
                <table id="noticeList" align="center" width="1000px">
                    <thead>
                        <tr style="text-align:center;">
                            <th style="width:80px;">포장(배달)</th>
                            <th style="width:430px;">주문목록</th>
                            <th style="width:200px;">주문번호</th>
                            <th style="width:100px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>수령완료</td>
                            <td>MeisterPizza_KH 외 1건 23,540원</td>
                            <td>20190827863688990015</td>
                            <td><button class="small_btn" id="#">상세보기</button></td>
                        </tr>
                        <tr>
                            <td>수령완료</td>
                            <td>MeisterPizza_KH 외 2건 45,540원</td>
                            <td> 20190827863688990015</td>
                            <td><button class="small_btn" id="#">상세보기</button></td>
                        </tr>

                    </tbody>
                </table>
    
                <br><br>
                
                <div class="pagination" align="center">
                    <a href="#">&laquo;</a>
                    <a href="#" class="active">1</a>
                    <a href="#">&raquo;</a>
                </div>            
        </div>
    </div>	
	
	<%@ include file="../../common_user/footer.jsp"%>
</body>
</html>