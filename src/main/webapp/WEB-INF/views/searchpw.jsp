<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {
/* 	border-top: 3px solid orange; */	
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
	let checkk = false;
	$(document).ready(function() {

		//아이디 중복체크
		$('#idCheck2').click(function() {
			if ($('#mb_email').val() == "") {
				alert('이메일을 입력하고 중복확인하세요');
			} else {
				var mb_email = $('#mb_email').val();
				console.log(mb_email);

				$.ajax({
					type : 'POST',
					url : 'idCheck2',
					data : mb_email,
					contentType : "application/json; charset=UTF-8",
					success : function(data) { //data : checkSignup에서 넘겨준 결과값
						alert(data);
						if (data == "인증가능!") {
							checkk = true;
						} else {
							checkk = false;
						}
					},
					error : function(data) {
						alert("ERORR");

					}
				})
			}
		})
	});

	function submitForm() {
		var getMail = RegExp(/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/);

		//이메일 공백
		if ($("#mb_email").val() == "") {
			alert("이메일을 써주세요");
			$("#mb_email").focus();

			return false;
		}

		//이메일 유효성검사 
		if (!getMail.test($("#mb_email").val())) {
			alert("이메일을 형식에 맞게 입력해주세요");
			$("#mb_email").val("");
			$("#mb_email").focus();

			return false;
		}

		if (checkk) {
			return true;
		} else {
			alert("중복확인부터하세요");
			return false;
		}

	};
</script>
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
								<form action="auth.do2" onsubmit="return submitForm()"
									method="post">

									<center>
										<br>
										<div>
											이메일 : <input type="email" id="mb_email" name="mb_email"
												placeholder="  이메일주소를 입력하세요. ">
											<button>
												<a href="javascript:void(0)" id="idCheck2">중복확인</a>
											</button>
										</div>

										<br> <br>
										<button type="submit" name="submit">인증키 전송</button>
				</div>
				</td>
				</tr>
			</center>
		</table>
		</form>
		</center>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="include/pagelayoutFooter.jsp"%>

</body>
</html>
