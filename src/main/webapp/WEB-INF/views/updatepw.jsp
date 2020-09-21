<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>update PW</title>

<style>
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}



table {
	margin: 0 auto;
	text-align: center;
}

td {
	border: 1px solid rgba(139, 139, 139, 0.473);
}

#title {
	background-color: rgba(237, 237, 237);
}

.content {
	border-top: 3px solid orange;
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

<script>

	function submitForm() {
		var getCheck = RegExp(/^[a-zA-Z0-9]{8,12}$/);	

		//비밀번호 공백
		if ($("#mb_pw").val() == "") {
			alert("비밀번호를 써주세요");
			$("#mb_pw").focus();

			return false;
		}

		//비밀번호확인 공백
		if ($("#re_mb_pw").val() == "") {
			alert("비밀번호 확인을 써주세요");
			$("#re_mb_pw").focus();

			return false;
		}

		//비밀번호 유효성검사 
		if (!getCheck.test($("#mb_pw").val())) {
			alert("비밀번호를 형식에 맞게 입력해주세요(8~12자리)");
			$("#mb_pw").val("");
			$("#mb_pw").focus();

			return false;
		}
		;

		//비밀번호 똑같은지
		if ($("#mb_pw").val() != ($("#re_mb_pw").val())) {
			alert("비밀번호 확인을 다시 입력해주세요");
			$("#mb_pw").val("");
			$("#re_mb_pw").val("");
			$("#mb_pw").focus();
			return false;
		}
	};
</script>

</head>
<body>
	<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="content" style="font-size: large;">

	<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">비밀번호변경</font></b> <br>
		<br> <br>

		<form onsubmit="return submitForm()" method="post">
			<table>
				
				<tr>
					<td id="title">기존 비밀번호</td>
					<td><input id="co_mb_pw" type="password" name="co_mb_pw"
						maxlength="15"placeholder="영어+숫자 8~12자리"></td>
				</tr>

				
				<tr>
					<td id="title">수정할 비밀번호</td>
					<td><input id="mb_pw" type="password" name="mb_pw"
						maxlength="15"placeholder="영어+숫자 8~12자리"></td>
				</tr>
				<tr>
					<td id="title">수정할 비밀번호 확인</td>
					<td><input id="re_mb_pw" type="password" name="re_mb_pw"
						maxlength="15" placeholder="비밀번호 다시입력"></td>
				</tr>
				
			</table>
			<br> 
			<button type="submit" id="submit">수정</button>
			<!-- <input id="submit" type="submit" value="수정" /> -->
			<button onclick="location.href = '/infoupdate' ">취소</button>
			
			
		</form>
	</div>
	</div>

	<%@ include file="include/pagelayoutFooter.jsp"%>
</body>
</html>
