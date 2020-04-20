<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- 장바구니아이콘 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- 장바구니 아이콘 끝 -->

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


        .sub-menu-area *{
            padding: 5px;
        }
        .sub-menu-area>a{
            font-size: 17px;
            color:black;
            font-weight: bolder;
        }

        /* 서브메뉴 스타일 끝 */

        th:nth-child(1){
            text-align: left;
            font-size: large;
            padding:10px;
        }

        #orderB1{
            width:1000px;
            height:100px;
        }

        .small_btn{
            display: block;
            height:25px;
            width:60px;
            margin: 0 auto;
            font-size: 10px;
            font-weight: bolder;
            color:white;
            background-color: darkgray;
            border:0;
            border-radius: 5px;
        }

        #mbtn{
            height:30px;
            width:70px;
            font-size: 13px;
            font-weight: bolder;
            color:white;
            border:0;
            border-radius: 5px;
        }

        #orderB2{
            width:600px;
            text-align: center;
        }

        /* 중간버튼 스타일 */
        .middle_btn{
                display: block;
                height:40px;
                width:150px;
                margin: 0 auto;
                font-size: 15px;
                font-weight: bolder;
                color:white;
                background-color: rgb(76, 60, 60);
                border:0;
                border-radius: 5px;
            }
        /* 중간버튼 스타일 */


        



    </style>
</head>
<body>
	

    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1 style="font-weight:bold; color:rgb(76, 60, 60);">장바구니</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈 </a> &gt; 장바구니</div>
        <hr>



        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            <table id="orderB1">
                <tr>
                    <th colspan="2" style="color:white; background-color: rgb(76, 60, 60);">배달주문</th>
                </tr>
                <tr style="height:15px;"></tr>
                <tr>
                    <th height="50px;" style="color:black">주소주소주소주소</th>
                    <!-- <th rowspan="2"><button class="small_btn" id="#">수정</button></th> -->
                </tr>
                <tr>
                    <th style="color:gray;"><button style="background:white; color:darkgray; border:1px solid darkgray" id="mbtn">역삼점</button>&nbsp;&nbsp;&nbsp; 02-1111-1111</th>
                </tr>
                
            </table>
            <hr>

            <table id="orderB2" style="text-align:center; margin:auto;">
                <tr>
                    <td height="300px"><img src="img/shoppingbasket.jpg" alt="orderBasket"></td>
                </tr>
                <tr>
                    <td style="font-size: 2.0em;">장바구니가 비어 있습니다.</td>
                </tr>
                <tr>
                    <td style="font-size: .9em; color:darkgray;">마이스터피자의 맛있는 메뉴를 마음껏 골라 담으세요</td>
                </tr>
               
            </table>
            <br><br>
            <div align="center">
                <button style="background:white; color:black; border:1px solid darkgray" class="middle_btn" id="cbtn">+ 메뉴 추가하기</button>
            </div>
       

            
        </div>


    </div>

	<%@ include file="../../common_user/footer.jsp"%>
   



</body>
</html>