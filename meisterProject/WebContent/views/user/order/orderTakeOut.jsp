<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

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
    </style>
</head>
<body>

	<%@ include file="../../common_user/menubar.jsp" %>
	<%@ include file="../../common_user/menubarIndexIMG.jsp" %>
	
    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1>주문방법 선택</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 주문방법 선택</div>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            <div>
                <div><a id="orderDelivery">배달주문</a></div>
                <div><a id="orderTakeOut">포장주문</a></div>
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
                    <br><h3>여수지점&nbsp;&nbsp;&nbsp;031-2222-8282</h3>전라남도 여수시 문수동 문수로 76
                </div>
                <div>
                    <button id="remove">―</button>
                </div>

                <div id="bottom">
                </div>
                <div id="bottom" style="width:50%;">
                    <button style="width:120px; height:40px; font-size:14px; margin-top:10px; margin-left:10%;">+&nbsp;&nbsp;포장매장등록</button>
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
</body>
</html>