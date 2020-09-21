<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	height: 100px;
	width: 600px;
	display:flex;
	align-items:center;
}
.wrap-login span{
	display:block;
}

.login {
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
			<br> <br> <b><font size="6" color="gray">아이디 찾기</font></b> <br>
			<br> <br>
		</div><hr>
			<c:forEach var="list" items="${Memberlist}">
			<div class="wrap-login" style="margin: 0 auto;">
				<div class="login" style="margin: 0 auto;">
					<div class="wnd-login">
						회원님의 아이디는 "${list.mb_email}" 입니다.<br>
					</div>
				</div>
			</div><hr>
					</c:forEach>
					<div class="wrap-btn-login">
						<div class="btn-login">
							<button onclick="location.href='/login'">login</button>
                            <button onclick="location.href='/'">home</button>
						</div>
					</div>

	</div>
	<%@ include file="include/pagelayoutFooter.jsp"%>


</body>
</html>