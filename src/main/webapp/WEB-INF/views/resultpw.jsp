<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
input {
	width: 220px;
	height: 30px;
	font-size: 17px;
}

.wrap-login {
	background-color: rgba(237, 237, 237);
	margin: 1%;
	height: 160px;
	width: 500px;
}

.login {
	padding: 10%;
}

.btn-login {
	padding: 8%;
	margin: 0 auto;
}

.wrap-btn-login {
	display: flex;
	text-align: center;
}

.content {
	
	margin-top: 100px;
	padding: 50px;
	position: relative;
	width: 900px;
	margin: auto;
	margin-top: 100px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="content" style="font-size: large;">

		<div style="text-align: center;">
			<br> <br> <b><font size="6" color="gray">비밀번호 찾기</font></b> <br>
			<br> <br>
		</div>

			<div class="wrap-login" style="margin: 0 auto;">
				<div class="login" style="margin: 0 auto;">
					<div class="wnd-login">
						<span>회원님의 비밀번호는 "${mb_pw}" 입니다.</span>
					</div>
					<div class="wrap-btn-login">
						<div class="btn-login">
							<button onclick="location.href='/login'">login</button>
                            <button onclick="location.href='/'">home</button>
						</div>
					</div>
				</div>
			</div>

	</div>
	<%@ include file="include/pagelayoutFooter.jsp"%>


</body>
</html>