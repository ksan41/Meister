<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">"C:/Users/이태경/Downloads/19_DB_EVENT.xlsx"
<title>Insert title here</title>

<style>
/* 서브메뉴 스타일 시작 (위에 웹폰트 링크도 복붙해주세요)*/
div {
	box-sizing: border-box;
}


.outer {
	width: 1000px;
	box-sizing: border-box;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 150px;
}

.outer * {
	
	font-family: inherit;
}

.outer a {
	text-decoration: none;
}

#index-area {
	text-align: right;
	font-size: 12px;
}

#index-area a {
	color: gray
}

/* 서브메뉴 스타일 끝 */
.step * {
	padding: 5px;
}

.step>a {
	font-size: 17px;
	color: black;
	font-weight: bolder;
}

/* 작은버튼 스타일 */
.small_btn {
	display: block;
	height: 25px;
	width: 60px;
	margin: 0 auto;
	font-size: 10px;
	font-weight: bolder;
	color: white;
	background-color: orange;
	border: 0;
	border-radius: 5px;
}
/* 작은버튼 스타일 */

/* 중간버튼 스타일 */
.middle_btn {
	display: block;
	height: 40px;
	width: 150px;
	margin: 0 auto;
	font-size: 15px;
	font-weight: bolder;
	color: white;
	background-color: rgb(76, 60, 60);
	border: 0;
	border-radius: 5px;
}
/* 중간버튼 스타일 */
input {
	border-radius: 5px;
	
}

th {
	height: 50px;
	width: 130px;
}

table {
	font-size: 18px;
	margin: auto;
}

#doubleCheck {
	margin-left: 0px;
}

.text-area {
	width: 200px;
	height: 20px;
}

#email_area {
	width: 100px;
	height: 25px;
	border-radius: 5px;
}
</style>
</head>


<body>

	<%@ include file="../../common_user/menubar.jsp"%>
	<%@ include file="../../common_user/menubarMenuIMG.jsp"%>



	<div class="outer">
		<!-- 서브메뉴 타이틀 -->
		<h1>회원가입</h1>
		<br>
		<!-- 서브메뉴 우측 인덱스 -->
		<div id="index-area">
			<a href="">홈</a> &gt; 회원가입
		</div>
		<hr>
		<br>
		<!-- <div class="sub-menu-area"> -->
		<div class="step" align="center">
			<!-- 현재 페이지는 orange 로 표시 -->
			<a href="">01 본인인증</a> > <a href="" style="color: orange">02
				개인정보입력</a> > <a href="">03 가입완료</a>
		</div>
		<br>
		<hr>
		<br>
		<br>

		<!-- inner영역에 콘텐츠 작성 -->


		<form id="enrollForm" action="<%=contextPath%>/memberInsert.me" method="post">
			<div class="inner">
				<table style="text-align: left;">
					<tr>
						<th>이름</th>
						<td colspan="2"><input class="text-area" type="text" id="name"
							name="name"  required style="height: 31px;" placeholder="한글 2글자 이상"></td>

					</tr>
					<tr>
						<th>아이디</th>
						<td colspan="2"><input class="text-area" type="text" id="userId"
							name="userId" placeholder="영문,숫자 5~12글자 이하" required style="height: 31px;">&nbsp;&nbsp;
							<button class="small_btn" type="button" id="idCheck"
								style="display: inline;">중복확인</button></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="2"><input class="text-area" type="password" id="userPwd"
							name="userPwd" required style="height: 31px; font-family: inherit;" placeholder="영문,숫자 8~15글자 이하" ></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td colspan="2"><input class="text-area" type="password" id="userPwd1"
							name="userPwd1" style="height: 31px;"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td colspan="2"><input class="text-area" type="date"
							name="dateIn" style="height: 31px;"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td colspan="2" style="font-size: 15px;"><input type="radio"
							name="gender" value="M" >남 <input type="radio"
							name="gender" value="F" >여</td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td colspan="2"><input class="text-area" id="phone"
							name="phone"  type="tel" placeholder="-포함해서 입력해주세요" style="height: 31px;"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="2"><input class="text-area" type="email"
							name="email"  style="height: 31px;"></td>
					</tr>
				</table>
				<br>
				<br>

				<div id="btn-area">
					<button class="middle_btn" type="submit" id="joinBtn" onclick="return validate();" style="margin-left: 450px;" disabled
					>가입하기</button>
				</div>
			</div>

		</form>

	</div>



	<script>
	
		function validate() {

			// 유효성 검사할 각각의 input 요소들 변수에 받아두기
			var name = document.getElementById("name");
			var id = document.getElementById("userId");
			var pwd1 = document.getElementById("userPwd");
			var pwd2 = document.getElementById("userPwd1");
			
							
			// 1) 아이디 검사 
			// 영문자 또는 숫자 포함해서 총 4~12자로 입력(단,첫글자 영문자로)
			var regExp = /^[a-z][a-z\d]{3,11}$/i;

			if (!regExp.test(id.value)) {
				alert("유효한 아이디를 입력하세요!!");
				// 아이디에 입력한 값이 없어진다.
				id.value = "";
				// focus 그 부분에 깜빡거린다.
				id.focus();
				return false;
			}

			// 2) 비밀번호 검사 
			// 특수문자(!@#$%^&*) 또는 영문자 또는 숫자 포함 총 8자~15자
			regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;

			if (!regExp.test(pwd1.value)) {
				alert("유효한 비밀번호를 입력하세요!!");
				pwd1.value = "";
				pwd1.focus;
				return false;

			}

			// 3) 비밀번호값과 비밀번호 확인값이 일치하는지 검사

			if (pwd1.value != pwd2.value) {
				alert("동일한 비밀번호 확인값을 입력하세요");
				pwd2.value = "";
				pwd2.focus;
				return false;
			}

			// 4) 이름 검사 
			// 한글로만 2글자 이상
			regExp = /^[가-힣]{2,}$/;
			if (!regExp.test(name.value)) {
				alert("유효한 이름을 입력하세요");
				name.value = "";
				name.focus;
				return false;
			}
			return true;

		}
	</script>
	
	
	<script>
		
		$(function() {
			
			// 중복확인 클릭했을 때
			$("#idCheck").click(function(){
				
				// 아이디 입력하는 input 요소
				var userId = $("#enrollForm input[name=userId]");
				
				if(!userId.val()) {
					alert("아이디를 입력해주세요.");
					return;
				}
				
				$.ajax({
					url:"/Meister/idCheck.me",
					data:{userId:userId.val()},
					type:"post",
					success:function(result){ 
						
						if(result == 0) { // 사용 가능한 아이디 
							

							if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")) {
								// 아이디 더 이상 수정이 불가하게끔
								userId.attr("readonly","true");
								// 회원가입 버튼 활성화
								$("#joinBtn").removeAttr("disabled");
						
								
								
								
							} else {
								userId.focus();
							}
							
							
							
						} else { // 사용 불가능한 아이디 
							alert("사용할 수 없는 아이디 입니다.");
							userId.focus();
						
						}
						
					}, error:function(){
						console.log("ajax통신 실패!!");
					}
					
					
				});
				
			});
			
		});
	
	
	
	</script>
	

	



	<%@ include file="../../common_user/footer.jsp"%>
	
	


</body>
</html>