<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
	//String msg = (String)session.getAttribute("msg");
	//Member loginUser = (Member)session.getAttribute("loginUser");

%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
       <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>meister_통합</title>
        <link href="<%=contextPath %>/views/common_manager/resources/admin/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>


        <style>
        	body{
        		height:600px;
        	}
            #layoutSidenav_content{
                width:1300px;
                height:auto;
                margin: auto;
                margin-top: 100px;
                margin-bottom: 100px;
            }

        </style>
</head>
<body>
           <div id="layoutSidenav_content">
                
                <!-- 관리자페이지 로그인 폼 영역 시작 -->
                <div id="loginForm">
                    <p id="loginSign" align="center">관리자 로그인</p>
                    <form id="loginInputForm">
                        <input id="loginInputId" type="text" align="center" placeholder="USERNAME"> <br>
                        <input id="loginInputPwd" type="password" align="center" placeholder="PASSWORD"> <br>
                        <a id="loginBtn" align="center">Login</a>
                    </form>
                </div>
                <!-- 관리자페이지 로그인 폼 영역 끝 -->
                 
            </div>
</body>
</html>