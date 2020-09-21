<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>회원가입 화면</title>

<style>
#wrap {
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	width: 1000px;

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
	position: relative;
	text-align: center;
	margin: 0 auto;
}

input {
	font-size: 15px;
	height: 35px;
}
</style>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>

<script>
	function submitForm() {
		var getCheck = RegExp(/^[a-zA-Z0-9]{8,12}$/);
		var getName = RegExp(/^[가-힣]{2,10}$/);
		var getMail1 = RegExp(/^[A-Za-z0-9]*$/);
		var getMail2 = RegExp(/^[A-Za-z0-9]+\.[A-Za-z0-9]+$/);
		var getPhone = RegExp(/^[0-9]{10,11}$/);

		//비밀번호 공백
		if ($("#mb_pw").val() == "") {
			alert("비밀번호를 써주세요");
			$("#mb_pw").focus();

			return false;
		}
		;

		//비밀번호확인 공백
		if ($("#re_mb_pw").val() == "") {
			alert("비밀번호 확인을 써주세요");
			$("#re_mb_pw").focus();

			return false;
		}
		;

		//이름 공백
		if ($("#mb_name").val() == "") {
			alert("이름을 써주세요");
			$("#mb_name").focus();

			return false;
		}
		;

		//휴대전화 공백
		if ($("#mb_phone").val() == "") {
			alert("휴대전화를 써주세요");
			$("#mb_phone").focus();

			return false;
		}
		;

		//주소 공백
		if ($("#sample4_detailAddress").val() == "") {
			alert("주소를 써주세요");
			$("#sample4_detailAddress").focus();

			return false;
		}
		;

		//전화번호 유효성
		if (!getPhone.test($("#mb_phone").val())) {
			alert("휴대전화를 다시 입력해주세요");
			$("#mb_phone").val("");
			$("#mb_phone").focus();

			return false;
		}
		;

		//이름 유효성검사 
		if (!getName.test($("#mb_name").val())) {
			alert("이름을 형식에 맞게 입력해주세요(한글)");
			$("#mb_name").val("");
			$("#mb_name").focus();

			return false;
		}
		;

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
		;
	};
</script>
<script>
	$(document).ready(function() {

		//아이디 중복체크
		$('#idCheck').click(function() {
			if ($('#mb_email1').val() == "" || $('#mb_email2').val() == "") {
				alert('이메일을 입력하고 중복확인하세요');
			} else {
				var c = $('#mb_email1').val() + '@' + $('#mb_email2').val();

				console.log(c);
				$.ajax({
					type : 'POST',
					url : 'idCheck',
					data : c,
					contentType : "application/json; charset=UTF-8",
					success : function(data) { //data : checkSignup에서 넘겨준 결과값
						alert(data);
					},
					error : function(data) {
						alert("ERORR");

					}
				})
			}
		})
	});
</script>

</head>
<body>
	<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="content" style="font-size: large;">
		<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
		<div id="wrap">
			<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
			<br> <br>

			<form style="text-align: center;" action="join"
				onsubmit="return submitForm()" method="post">
				<table style="height: auto; width: 700px;">

					<tr>
						<td id="title">아이디(이메일)</td>
						<td><input type="text" id="mb_email" name="mb_email"
							value="${mb_email}" readonly></td>
					</tr>


					<tr>
						<td id="title">비밀번호</td>
						<td><input id="mb_pw" type="password" name="mb_pw"
							maxlength="15" placeholder="영어+숫자 8~12자리"></td>
					</tr>

					<tr>
						<td id="title">비밀번호 확인</td>
						<td><input id="re_mb_pw" type="password" name="re_mb_pw"
							maxlength="15" placeholder="비밀번호 다시입력"></td>
					</tr>

					<tr>
						<td id="title">이름</td>
						<td><input type="text" id="mb_name" name="mb_name"
							maxlength="40" placeholder="ex)김철수"></td>
					</tr>



					<tr>
						<td id="title">휴대전화</td>
						<td><input type="text" id="mb_phone" name="mb_phone"
							placeholder="ex)01000000000" /></td>
					</tr>

					<tr>
						<td colspan="2"><input type="text" name="mb_address1"
							id="sample4_postcode" placeholder="우편번호" readonly> <input
							type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기" readonly> <br> <input type="text"
							name="mb_address2" id="sample4_roadAddress" placeholder="도로명주소"
							readonly> <input type="text" name="mb_address3"
							id="sample4_jibunAddress" placeholder="지번주소" readonly> <span
							id="guide" style="color: #999; display: none"></span> <input
							type="text" name="mb_address4" id="sample4_detailAddress"
							placeholder="상세주소"> <input type="text" name="mb_address5"
							id="sample4_extraAddress" placeholder="참고항목" readonly></td>
					</tr>
				</table>
				<br> <input id="submit" type="submit" value="가입" /> <input
					type="button" onclick="location.href = '/' " value="취소">
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="include/pagelayoutFooter.jsp"%>
</body>
</html>

