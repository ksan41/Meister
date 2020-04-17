<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	
	<%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp" %>
	
	
		  
        <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
        <link rel="stylesheet" type="text/css" href="<%=contextPath %>/resources/css/bootstrap.css">
       	 
		
      
        <!-- 모달 부트스트랩-->
        <link rel="stylesheet" type="text/css" href="<%=contextPath %>/resources/css/bootstrap.css">        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
       
        <!-- 모달 부트스트랩 -->
		
		
			
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
        /* 모달 스타일 시작*/
        .modal-body{
            margin:auto;
        }
        /* 모달 스타일 끝*/
        th{
        height: 50px;
        width: 100px;
        }
        td input{
            border-radius: 5px;
        }
    </style>
    
    
</head>
<body>



	

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
            <a href="" style="color:orange">01 본인인증</a>
            >
            <a href="" >02 개인정보입력</a>
            >
            <a href="">03 가입완료</a>
        </div>
        <br>
        <hr><br><br><br>

        <!-- inner영역에 콘텐츠 작성 -->
        <div class="inner" align="center">
            
            <h1>반갑습니다</h1>
            <p>
                마이스터피자 회원가입을 위해서는 본인인증이 필요합니다.
                <br><br>
                회원가입은 아동의 개인정보 보호를 위해 만 14세 이상만 가능합니다.
            </p>
            <br><br><br><br>
            <div id="btn-area">
                <button type="button" class="big_btn" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                    <!-- modal별 id 변경해주세요-->
                    이메일 인증
                </button>
            </div>
            <!-- 다른 요소에 모달 적용하고 싶으면, 속성에 data-toggle="modal" ,  data-target="#myModal" 타겟명은 따로 지정 -->



            <!-- 모달 시작 -->
            <div class="modal fade" id="myModal"> <!-- modal별 id 변경해주세요-->
            <div class="modal-dialog">
            <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title" style="margin:auto;padding:0;">이메일 인증하기</h4>
            <button type="button" class="close" data-dismiss="modal" style="margin:0;padding:0;">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <table style="text-align: left;">
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
                    <tr>
                        <th></th>
                        <td>
                            <button class="middle_btn" id="#" style="width: 100%;">인증번호발송</button>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <input type="text" style="width: 100%;" placeholder="인증번호를 입력하세요">
                        </td>
                    </tr>
                </table>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer" style="margin:auto;">
            <!-- 하단버튼 영역-->
            <button type="button" class="btn btn-danger" data-dismiss="modal"
            style="width:200px; height:50px;">인증완료</button>
            </div>
            </div>
            </div>
            </div>
            <!-- 모달 끝 -->
        </div>
    </div>
    
     <%@ include file="../../common_user/footer.jsp"%>

</body>
</html>