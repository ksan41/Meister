<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.meister.member.model.vo.Member" %>
<%
String testParam = request.getParameter("name2");
System.out.println(testParam);
Member member = (Member)request.getAttribute("selectid");
%>
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
    table{
        width: 100%;
    }
    td{
        height: 50px;
        font-size: 15px;
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
            <a href="" style="color:orange">아이디찾기</a>
            <span style="color:lightgray; font-size: 17px;">|</span>
            <a href="">비밀번호찾기</a>
        </div>
        <hr>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner" id="account-check-area">
            <table>
                <tr>
                    <th colspan="2">
                        <h1><%=member.getMemberName()%></h1>
                    </th>
                </tr>
                <tr>
                    <td><%=member.getMemberId() %></td>
                    <td> 가입일 : <%=member.getMemberEnrolldate() %></td>
                </tr>
                <tr>
                    <td colspan="2">신용평가기관을 통해 실명 인증된 마이스터피자 아이디입니다.</td>
                </tr>
                <tr>
                    <td>
                        <button class="middle_btn" id="#" style="background-color: orange;">로그인</button>
                    </td>
                    <td>
                        <button class="middle_btn" id="#">비밀번호 찾기</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <%@ include file="../../common_user/footer.jsp"%>

</body>
</html>