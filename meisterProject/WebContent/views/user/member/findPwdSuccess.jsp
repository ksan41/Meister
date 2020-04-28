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

    /* #btn-area{height:70px;}        */


    #text-area{
        height:300px;
        text-align: center;
        color:gray
    }
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


	<%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>

 <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1>아이디/비밀번호 찾기</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 아이디/비밀번호 찾기</div>
        <div class="sub-menu-area">
            <!-- 현재 페이지는 orange 로 표시 -->
            <a href="">아이디찾기</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href="" style="color:orange">비밀번호찾기</a>
        </div>
        <hr>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            <div id="text-area" style="height: 200px;">
                <br><br><br>
                <h1>비밀번호가 성공적으로 변경되었습니다</h1>
                <br><br>
                변경된 비밀번호로 로그인 해주세요
            </div>
            <div id="btn-area">
                <button  class="big_btn" id="#" style="background-color: orange;" onclick="location.href='<%=contextPath %>/showLoginPage.me'">로그인</button>
            </div>
        </div>
    </div>
    
    <%@ include file="../../common_user/footer.jsp"%>

</body>
</html>