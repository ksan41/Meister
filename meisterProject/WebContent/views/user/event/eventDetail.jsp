<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meister.event.model.vo.*"%>
    
<%
	Event list = (Event)request.getAttribute("list1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventDetail</title>

    <%@ include file="../../common_user/menubar.jsp"%>
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

        /* 이벤트 상세페이지 스타일 시작 */
        #eventDetailTitle{
            /* border:1px solid black; */
            height:100px;
            padding-top:22px;
            font-size:17px;
            font-weight:600;
        }
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
        /* 이벤트 상세페이지 스타일 끝 */
    </style>
</head>
<body>

 <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1>이벤트</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 이벤트</div>
        <hr>
	
        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            <div id="eventDetailTitle">
                <!-- 입맛 따라 가격 따라 다양하게 즐기는 환상 조합! 하프앤하프 시그니처 5종 -->
                <%=list.getEventTitle() %>
                <p style="font-size:12px; color:dimgray;">2020-04-03 ~ 2020-04-28</p>
            </div>
			
            <img src= width="1000">
				
            <br><br><br><br>
			
            <a href="<%=contextPath%>/eList.ev"><button class="middle_btn">목록보기</button></a>
          	
            
        </div>



    </div>
    
    <%@ include file="../../common_user/footer.jsp"%>

</body>
</html>