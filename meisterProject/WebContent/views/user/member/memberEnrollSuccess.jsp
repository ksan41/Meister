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

	
    <%@ include file="../../common_user/menubar.jsp"%>
		
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
	

 <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1>회원가입</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 회원가입</div>
        <hr>
        <br>
        <!-- <div class="sub-menu-area"> -->
        <div class="step" align="center">
            <!-- 현재 페이지는 orange 로 표시 -->
            <a href="">01 본인인증</a>
            >
            <a href="" >02 개인정보입력</a>
            >
            <a href="" style="color:orange">03 가입완료</a>
        </div>
        <br>
        <hr><br><br><br><br>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner" align="center">
            
            <h1>감사합니다</h1>
            <p>회원가입이 완료되었습니다.</p>
            <br><br><br><br>
            <div id="btn-area">
                <button class="middle_btn" id="#" onclick="location.href='<%=contextPath %>/showLoginPage.me'">로그인</button>
                <!-- <%=contextPath %>/showLoginPage.me -->
                <br>
                <p>
                    로그인페이지로 이동합니다.
                </p>
            </div>
            
        </div>


    </div>
    
    <%@ include file="../../common_user/footer.jsp"%>

</body>
</html>