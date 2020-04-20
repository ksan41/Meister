<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
        
        <%@ include file="../../common_user/menubar.jsp" %>
		<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
		
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

        /* 서브메뉴 스타일 끝 */

        .step *{
            padding: 5px;

        }
        .step>a{
            font-size: 17px;
            color:black;
            font-weight: bolder;
        }

        #btn-area{height:70px;}
        
    /* 큰버튼 스타일 */
    .big_btn{
            display: block;
            height:50px;
            width:280px;
            margin: 0 auto;
            font-size: 20px;
            font-weight: bolder;
            color:white;
            background-color: rgb(76, 60, 60);
            border:0;
            border-radius: 5px;
        }
    /* 큰버튼 스타일 */

    </style>
</head>
<body>
    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1 style="color:rgb(76, 60, 60); opacity:100%; font-weight:bold;">주문완료</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 장바구니 &gt; 결제하기</div>
        <br><hr>
        <!-- <div class="sub-menu-area"> -->
        <div></div>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner" align="center">
            <div id="img-area">
                <img style="height:140px;;" width="200px" src="<%=contextPath%>/resources/siteImgs/pageImg/delivery.png" alt="피자 배달 이미지;">
            </div>
            <h1 style="color:rgb(76, 60, 60); opacity:100%;">주문이 완료되었습니다</h1>
            <h3 style="color:rgb(76, 60, 60); opacity:100%;">마이스터 피자가 맛있는 행복을 전하러 갑니다.<br>이용해주셔서 감사합니다.</h3>
            <br><hr width="500px;" style="height:3px; background-color:black;"><br>
            <h5 style="color:rgb(76, 60, 60); opacity:100%;">
                주문을 취소하실 경우, 해당 매장에 전화로 문의 부탁드립니다.
                <br><br>
                주문 접수 완료 후에는 취소가 불가능하오니 양해 부탁드립니다.</h5><br><br>
            <div id="btn-area">
                <button class="big_btn" id="#" style="background-color:rgb(243, 156, 18);">주문내역확인</button>
            </div>
        </div>
    </div>
    <%@ include file="../../common_user/footer.jsp"%>
</body>
</html>