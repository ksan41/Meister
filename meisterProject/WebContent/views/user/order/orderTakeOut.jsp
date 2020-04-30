<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head> 
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>주문방법 선택</title>
	
	<%@ include file="../../common_user/menubar.jsp" %>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
	<!-- 스타일 링크 1-->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	
	<!-- 모달 부트스트랩 시작-->
	<link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- 모달 부트스트랩 끝-->

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<style>
		/* 서브메뉴 스타일 시작 (위에 웹폰트 링크도 복붙해주세요)*/
        div table tr td tbody{box-sizing: border-box;}
        .outer{
            width:1000px;
            box-sizing: border-box;
            margin: auto;
            margin-top: 100px;
            margin-bottom: 150px;
            height:1000px;
        }
        
        .outer *{
            font-family: 'NanumSquare';
        }
        
        .outer a{text-decoration: none; height:100%; margin-top:0px;}
        #index-area{
           text-align: right;
           font-size: 12px;
        }
        #index-area a{color:gray}

        /* 주문방법 상세페이지 스타일 시작 */
        div{
            /* border:1px solid red; */
            box-sizing:border-box;
        }
        .inner>div:nth-child(1)>div:nth-child(2){
            background-color: rgb(76, 60, 60);
            color:white;
        }
         #orderDelivery, #orderTakeOut{
         	display:block;
         }
        .inner a{
            font-size:18px;
            /* border:1px solid red; */
            display:block;
            margin-top: 8%;
            font-weight:bold;
        }
        .inner div{
            float:left;
        }
        .inner>div:nth-child(1) div{
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
        .inner div:nth-child(1) div{
            width:100px;
            height:40px;
            text-align: center;
            float:left;
        }
        .inner div:nth-child(2){
            width:100%;
            height:40px;
        }
        .inner div:nth-child(3){
            width:100%;
            height:120px;
        }
        .inner div:nth-child(3) div{
            width:10%;
            height:120px;
        }
        .inner div:nth-child(4){
            width:100%;
            height:70px;
        }
        #content1 input {
            margin-top:50%;
            margin-left:50%;
            width:20px;
            height:20px;
        }
        #content1>div:nth-child(3), #content1>div:nth-child(7), #content1>div:nth-child(11){
            width:40%;
        }
        #content1>div:nth-child(4), #content1>div:nth-child(8), #content1>div:nth-child(12){
            width:40%;
            padding-top:4.5%;
            padding-left:35%;
        }
        #addDeliveryAddress button{
            margin-top:10%;
            margin-left:12%;
            width:40%;
            height:30%;
            font-size:85%;
            background-color:whitesmoke;
        }
       
        #content1>div:nth-child(15) span{
            display:inline-block;
            margin-top:5%;
        }
        .inner button{
            border-radius: 3px;
            box-shadow:gainsboro;
            color:black;
            border:gainsboro;
            
        }
       #bottom{
           height:50%;
           background-color:rgb(76, 60, 60);
       }
       #bottom div{
           display:inline-block;
           float:left;
       }
        #bottomMiddle{
            width:50%;
            height:70px;
        }
        h1, h3, h5{
            color:rgb(76, 60, 60);
        }
        #remove{
            font-size:20px;
        }
        
	     /* 모달 스타일 시작*/
		 .modal-body{
		     margin:auto;
		 }
		 
		 .modal-content {
		  width:600px;
		  margin:auto;
		 }
		 #addPostInput{
		 	margin-bottom:2px;
		 }
		 .modal-header{
		 	background-color:rgb(76, 60, 60);
		 }
		 /* 모달 스타일 끝*/
    </style>
</head>
<body>

    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1 style="font-weight:bold; color:rgb(76, 60, 60);">주문방법 선택</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 주문방법 선택</div>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            <div>
                <div id="orderDelivery"><a id="orderDelivery">배달주문</a></div>
                <div id="orderDelivery"><a id="orderTakeOut">포장주문</a></div>
            </div>
            <div style="background-color:rgb(76, 60, 60);">
                
            </div>
            <div id="content1">

                <div>
                </div>
                <div>
                    <input type="checkbox">
                </div>
                <div>
                    <br><h4 style="font-weight:bold; color:rgb(76, 60, 60);">여수지점&nbsp;&nbsp;&nbsp;031-2222-8282</h4>전라남도 여수시 문수동 문수로 76
                </div>
                <div>
                    <button id="remove">―</button>
                </div>

                <div id="bottom">
                </div>
                <div id="bottom" style="width:50%;">
                    <button style="width:120px; height:40px; font-size:14px; margin-top:10px; margin-left:10%;" data-toggle="modal"  data-target="#myModal">+&nbsp;&nbsp;포장매장등록</button>
                </div>
                <div id="bottom" style="width:40%; padding-left:12%; padding-top:2.2%;">
                    <h6 style="color:white; width:300px;">* 포장매장은 최대 5개까지 등록 가능합니다.</h6>
                </div>
                <div style="width:100%; height:45px;">
                </div>
                <div style="width:45%; height:60px;">
                </div>
                <div style="width:35%; height:60px; padding-left:12%;">
                    <h6 style="padding-top:9%; padding-right:0; width:250px;">해당 매장으로 주문을 진행하시겠습니까?</h6>
                </div>
                <div style="width:20%; height:60px; padding-left:7%;">
                    <button style="width:120px; height:40px; font-size:14px; margin-top:8px; text-align:center; background-color: rgb(76, 60, 60); color:white">&nbsp;&nbsp;다음으로</button>
                </div>
            </div>
          
        </div>
    </div>
     <%@ include file="../../common_user/footer.jsp"%>
     
     <!-- 다른 요소에 모달 적용하고 싶으면, 속성에 data-toggle="modal" ,  data-target="#myModal" 타겟명은 따로 지정 -->
  <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><!-- modal별 id 변경해주세요
    버튼
  </button>-->
  
          <!-- 모달 시작 -->
          <div class="modal fade" id="myModal"> <!-- modal별 id 변경해주세요-->
            <div class="modal-dialog">
              <div class="modal-content">
              
                <!-- Modal Header -->
                <div class="modal-header" style="padding:0px; height:60px; background-color:background-color:rgb(76, 60, 60);">
	                <div style="background-color:white; width:290px; height:60px;"><a id="orderDelivery" style="padding-left:35%; padding-top:3%; width:auto; height:60px; box-sizing:border-box; font-size:28px;  font-family:'NanumSquare'; font-weight:bold;">지역 검색</a></div>
	                <div style="box-sizing:border-box;">
	                	<div style="box-sizing:border-box; float:left; width:270px; height:px; background-color:rgb(76, 60, 60); color:white;"><a id="orderTakeOut" style="padding-left:35%; padding-top:3%; width:auto; height:58px; box-sizing:border-box; font-size:28px;  font-family:'NanumSquare'; font-weight:bold;">매장명</a></div>
                  		<button type="button" class="close" data-dismiss="modal" style="margin:0;padding:0; color:white; background-color:rgb(76, 60 ,60); opacity:unset; box-sizing:border-box;">&times;</button>
                  	</div>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" style="margin:auto;">
                    <form id="form" name="form" method="post">
                        <input type="hidden" id="confmKey" name="confmKey" value=""/>
                        <input type="hidden" id="returnUrl" name="returnUrl" value=""/>
                        <input type="hidden" id="resultType" name="resultType" value=""/>
                        <!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
                        <!-- 
                        <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
                            -->
                        <!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
                        
						<div  style="width:570px; height:30px;"></div>
						<div style="width:245px; height:60px; float:left; margin-right:5px;">
							<select name="national" style="width:245px; border-box:box-sizing; height:100%; font-size:20px;  font-family:'NanumSquare'; font-weight:bold;">
					            <option value="ko" selected>서울</option>
					        </select>
						</div>
						<div style="width:245px; height:60px; float:left;">
							<select name="national" style="width:245px; height:100%; border-box:box-sizing; font-size:20px;  font-family:'NanumSquare'; font-weight:bold;">
					            <option value="Jung">중구</option>
					            <option value="GwanAck">관악구</option>
					            <option value="Guro">구로구</option>
					            <option value="DoBong">도봉구</option>
					            <option value="DongDae" selected>동대문구</option> 
					            <option value="MaPo">마포구</option>
					        </select>
						</div><img src="../../../resources/siteImgs/PageIcons/baseline_search_black_18dp.png" style="width:70px; height:60px; padding-left:10px;"><br>
						<div  style="width:570px; height:15px;"></div>
						
						<div id="wrap" style="display:none; border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
						<div>
							<input type="text" id="addressName" style="width:562px; height: 40px; font-size:large; margin:3px;"placeholder="배달지 이름">
							<input type="text" id="addressName" style="width:562px; height: 40px; font-size:large; margin:3px;"placeholder="담당 지점">
						</div>
						<input type="button" onclick="" value="등록하기" style="border:none; border-radius:4px; width:562px; height: 40px; font-size:large; margin:3px; color:white; background-color:rgb(76, 60, 60); font-weight:bold;"><br>
                    </form>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer" style="margin:auto;">
                    <!-- 하단버튼 영역-->
                  <button type="button" class="btn btn-danger" data-dismiss="modal"
                  style="width:200px; height:50px;">Close</button>
                </div>
                
              </div>
            </div>
          </div>
           <!-- 모달 끝 -->
</body>
</html>