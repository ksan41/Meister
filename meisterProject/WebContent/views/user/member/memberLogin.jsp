<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
        /* 탭 메뉴 */
        body {
            color: #555;
            /*background: #eeeeee;*/
            margin:0;
            padding: 0;
            box-sizing: border-box;
        }
        p {
            margin: 0 0 20px;
            line-height: 1.5;
        }
        .main {
            min-width: 320px;
            max-width: 800px;
            padding: 50px;
            margin: 0 auto;
            background: #ffffff;
        }
        section {
            display: none;
            padding: 20px 0 0;
            border-top: 1px solid #ddd;
        }
        /*라디오버튼 숨김*/
        #tab1, #tab2 {
            display: none;
        }
        label {
            display: inline-block;
            margin: 0 0 -1px;
            padding: 15px 0px;
            font-weight: 600;
            text-align: center;
            color: #bbb;
            /* border: 1px solid transparent; */
        }
        label:hover {
            color: #2e9cdf;
            cursor: pointer;
        }
        /*input 클릭시, label 스타일*/
        input:checked + label {
              color: white;
              background-color: rgb(76, 60, 60);
              /* border-radius: 5px; */
              /* border: 1px solid #ddd;
              border-top: 2px solid #2e9cdf;
              border-bottom: 1px solid #ffffff; */
        }
        #tab1:checked ~ #content1,
        #tab2:checked ~ #content2,
        #tab3:checked ~ #content3,
        #tab4:checked ~ #content4 {
            display: block;
        }
        section{
            width: 354px;
            height:300px;
            background-color:rgb(76, 60, 60);
            margin: auto;
        }
        /* 탭 메뉴 끝 */
        /* 중간버튼 스타일 */
        .middle_btn{
            display: block;
            height:40px;
            width:200px;
            margin: 0 auto;
            font-size: 15px;
            font-weight: bolder;
            color:white;
            background-color: orange;
            border:0;
            border-radius: 5px;
        }
        /* 중간버튼 스타일 */
        .sub_btn{
            display: block;
            height:30px;
            width:200px;
            margin: 0 auto;
            font-size: 15px;
            font-weight: bolder;
            color:white;
            background-color: orange;
            border:0;
            border-radius: 5px;
        }
        input{
            border-radius: 5px;
            padding: 10px;
        }
        a{
            color: white;
        }
    </style>


</head>
<body>
	
	
	 <div class="outer">
        <!-- 서브메뉴 타이틀 -->
        <h1>로그인</h1>
        <br>
        <!-- 서브메뉴 우측 인덱스 -->
        <div id="index-area"><a href="">홈</a> &gt; 로그인</div>
        <hr>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner" style="text-align: center;">
            
            <div class="main">
                <input id="tab1" type="radio" name="tabs" style="width: 200; height: 50;" checked><!--디폴트 메뉴-->
                <label for="tab1" style="width: 175px; border-top-left-radius: 10px;">회원 로그인</label>
            
                <input id="tab2" type="radio" name="tabs">
                <label for="tab2" style="width: 175px; border-top-right-radius: 10px;">비회원 주문</label>
                
                <section id="content1" style="padding-top: 0px">
                    <br><br>
                    
                    <form action="<%= contextPath %>/loginU.me" method="post">
                    <input type="text" name="userId" style="width: 200px;" placeholder="아이디"> <br>
                    <input type="text" name="userPwd" style="width: 200px; margin-top: 10px;" placeholder="비밀번호">
                    <br><br>
                    <input class="middle_btn" type="submit" value="로그인" >
                    <br>
                    </form>	
						
                    <a href="">아이디찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="">비밀번호찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <a href="">회원가입</a>
                </section>
                
                <section id="content2" style="padding-top: 25px;">
                    <input type="text" name="userId" placeholder="아이디" style="width: 219px;padding-left: 10px;margin-left: 17px;margin-right: 15px;padding-right: 10px;height: 48px;"><br>
                    <input class="text-area" style="width: 90px; margin-left: 2px; margin-top:10px;" type="email" name="email1" >
                    <b style="color: white;">@</b>
                    <select id="email_area" name="email2" style="margin-right: 3px; height: 30px; border-radius: 5px;">
                        <option value="gmail.com">gmail.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                    </select>
                    <br>
                    <button class="sub_btn" id="#" style="font-size:smaller; width: 217px; margin-top: 10px; margin-bottom: 10px">이메일 인증번호 발송</button>
                    
                    <input type="text" name="certifiedNumber" style="width: 214px;" placeholder="인증번호 입력"><br>
                    <button class="middle_btn" id="#" style="width: 222px; background-color: orangered; margin-top: 10px">주문하기</button>
                </section>
            </div>
        </div>
    </div>
		


    <%@ include file="../../common_user/footer.jsp"%>

</body>
</html>