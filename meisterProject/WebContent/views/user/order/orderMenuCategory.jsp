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


        .sub-menu-area *{
            padding: 5px;
        }
        .sub-menu-area>a{
            font-size: 17px;
            color:black;
            font-weight: bolder;
        }

        /* 서브메뉴 스타일 끝 */



        #account-check-area{
            margin: auto;
            margin-top: 30px;
            /* border:1px solid red; */
            width:400px;
            height:400px;
        }

        #account-check-area>div{
            width:100%;
            /* border:1px solid red; */
        }

        #img-area{height: 75%;}
        #img-area>img{
            display: block;
            margin: 0 auto;
            padding-top: 50px;
        }

        #btn-area{height:15%;}

        /* 회원정보 인증 버튼 */       
        #user-check{
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

        #text-area{height:10%;
           text-align: center;
           color:gray
        }
        
         /* 회원정보 인증 버튼 */   
    </style>
</head>
<body>
    <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1 style="margin-top: 0px; margin-bottom: 0px; color:rgb(76, 60, 60); font-weight:bold;">메뉴카테고리</h1>

        <div id="index-area"><a href="">홈</a> &gt; <a href="">주문선택 방법</a></div>
        <hr>                
        <br>    

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
          
            <table>
                <tr>
                    <td><p style="style=color:rgb(76, 60, 60);">배달주소</p></td>
                </tr>
                <tr>
                    <th style="padding-top: 15px; font-size: 20px;" ><p>주소주소</p></th>
                </tr>
            </table>
            
            <br>
            <div>
            <table style="margin:auto;">
	                <tr style="margin:auto;">
	                    <td style="width: 200px; height:200px; align:cnter; border:1px solid rgb(76, 60, 60);">
	                    	<img src="<%=contextPath%>/resources/siteImgs/pageImg/pizza.png" style="width:100%; height:100%;"> 
						</td>
	                    <td style="width: 200px; height:200px; align:cnter; border:1px solid rgb(76, 60, 60);">
	                    	<img src="<%=contextPath%>/resources/siteImgs/pageImg/sideDish.png" style="width:100%; height:100%;"> 
	                    </td>
	                    <td style="width: 200px; height:200px; align:cnter; border:1px solid rgb(76, 60, 60);">
	                     	<img src="<%=contextPath%>/resources/siteImgs/pageImg/drinkEtc.png" style="width:100%; height:100%;"> 
				      	</td>
	                </tr>
            </table>
			</div>
        </div>

        
    </div>
    <br><br><br><br><br><br>
    <%@ include file="../../common_user/footer.jsp"%>
</body>
</html>