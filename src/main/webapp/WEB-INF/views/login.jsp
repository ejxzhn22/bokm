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
	height: 265px;
	width: 370px;
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
	
	padding: 50px;
	position: relative;
	width: 900px;
	margin: 30px auto;
	margin-bottom : 80px;
}
.login_title{
	text-align: center;
	margin: 50px 0;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="content" style="font-size: large;">

		<div class="login_title" >
			<h3>로그인</h3>
		</div>

		<form method="POST">
			<div class="wrap-login" style="margin: 0 auto;">
				<div class="login" style="margin: 0 auto;">
					<div class="wnd-login">
						<input type="text" name="mb_email" placeholder="id" required
							style="display: block; margin: 0 auto;"><br> <input
							type="password" name="mb_pw" placeholder="password" required
							style="display: block; margin: 0 auto;">
					</div>
					<div class="wrap-btn-login">
						<div class="btn-login">
							<button type="submit">로그인</button>
							<button type="button">
								<a href="/">홈으로</a>
							</button>
							<br><br>
							<a href="membersearch/searchid">[아이디 찾기]</a><br>
							<a href="membersearch/searchpw">[비밀번호 찾기]</a>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="referer" value="${referer}">
		</form>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp"%>


</body>
</html>