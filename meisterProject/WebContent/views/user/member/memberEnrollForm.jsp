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




        /* 작은버튼 스타일 */
          .small_btn{
            display: block;
            height:25px;
            width:60px;
            margin: 0 auto;
            font-size: 10px;
            font-weight: bolder;
            color:white;
            background-color: orange;
            border:0;
            border-radius: 5px;
        }
        /* 작은버튼 스타일 */


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




        input{ border-radius: 5px;}
        th {height: 50px; width: 130px;}
        table{
            font-size: 18px;
            margin: auto;
        }
        #doubleCheck{
            margin-left: 0px;
        }

        .text-area{
            width:200px;
            height:20px;
        }

        #email_area{
            width:100px;
            height:25px;
            border-radius: 5px;
        }
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
            <a href="" style="color:orange">02 개인정보입력</a>
            >
            <a href="">03 가입완료</a>
        </div>
        <br>
        <hr><br><br>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner">
            <table style="text-align: left;">
                <tr>
                    <th>이름</th>
                    <td colspan="2">
                        <input class="text-area" type="text" name="name">
                    </td>
                    
                </tr>
                <tr>
                    <th>아이디</th>
                    <td colspan="2">
                        <input class="text-area" type="text" name="userId">&nbsp;&nbsp;
                        <button class="small_btn" id="doubleCheck" style="display: inline;">중복확인</button>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td colspan="2">
                        <input class="text-area" type="password" name="userPwd">
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td colspan="2">
                        <input class="text-area" type="password" name="userPwd2">
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td colspan="2">
                        <input class="text-area" type="date" name="dateIn">
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td colspan="2" style="font-size: 15px;">
                        <input type="radio" name="gender" value="M">남
                        <input type="radio" name="gender" value="F">여
                    </td>
                </tr>
                <tr>
                    <th>휴대전화</th>
                    <td colspan="2">
                        <input class="text-area" id="phone" type="tel" placeholder="-포함해서 입력해주세요">
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td colspan="2">
                        <input class="text-area" type="email" name="email1">
                        &nbsp;@&nbsp;
                        <select id="email_area" name="email2">
                            <option value="gmail.com">gmail.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                        </select>
                    </td>
                </tr>
            </table>
            <br><br>

            <div id="btn-area">
                <button class="middle_btn" id="enroll_btn">가입하기</button>
            </div>
        </div>
    </div>
    
    <%@ include file="../../common_user/footer.jsp"%>




</body>
</html>