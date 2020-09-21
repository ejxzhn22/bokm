<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {

	margin-top: 100px;
	padding: 50px;
	position: relative;
	width: 900px;
	margin: auto;
	margin-top: 100px;
}

input {
	width: 220px;
	height: 30px;
	font-size: 17px;
}
</style>
</head>
<body>
	<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="content" style="font-size: large;">
		<div style="text-align: center;">
			<br> <br> <b><font size="6" color="gray">비밀번호 찾기</font></b> <br>
			<br> <br>
		</div>

		<table border="0" width="480" height="200" align="center">
			<center>
				<span style="color: rgb(80, 80, 80); font-weight: bold;"></span>


				<div style="text-align: center;">
					<tr>
						<td style="background-color: rgba(237, 237, 237);">
							<center>
								<form action="join_injeung.do2${dice}" method="post">
									<center>
										<br>
										<div>
											인증번호 입력 : <input type="text" name="email_injeung"
												placeholder="  인증번호를 입력하세요. ">
										</div>

										<br> <br>
										<button type="submit" name="submit">인증번호 전송</button>
										<input type="hidden" name="mb_pw" value="${mb_pw}">
				</div>
				</td>
				</tr>
			</center>
		</table>
		</form>
		</center>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp"%>

</body>
</html>
