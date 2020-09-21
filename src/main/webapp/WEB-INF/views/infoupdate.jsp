<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<style>
.content {
	border-top: 3px solid orange;
	margin-top: 100px;
	padding: 50px;
	position: relative;
	width: 900px;
	left: 20%;
}
ul {
    margin-top: 0;
    margin-bottom: 1rem;
    list-style: none;
}
</style>
<meta charset="UTF-8" />
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../resources/css/infoupdate.css" />
<title>Document</title>

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
		var getMail = RegExp(/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/);
		var getPhone = RegExp(/^[0-9]{10,11}$/);

		//이메일 공백
		if ($("#mb_email").val() == "") {
			alert("이메일을 써주세요");
			$("#mb_email").focus();

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

		//이메일 유효성검사 
		if (!getMail.test($("#mb_email").val())) {
			alert("이메일 앞부분을 형식에 맞게 입력해주세요");
			$("#mb_email").val("");
			$("#mb_email").focus();

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

	};
</script>
</head>
<body>
	
	
	<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="content">



			<form onsubmit="return submitForm()" method="post">
				<section class="infoUpdate">
					<div class="infoUpdate_title">개인정보수정</div>
					<ul>
						<li><label>이름</label> <input type="text" id="mb_name"
							name="mb_name" value="${user.mb_name}"></li>
						
						<li>
						<label>주소</label> 
						<input type="text" name="mb_address1"
						value="${mb_address0}"
							id="sample4_postcode" placeholder="우편번호" readonly> 
						<input
							type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기" readonly> 
							<br> 
						<input type="text"
							name="mb_address2" value="${mb_address1}" id="sample4_roadAddress" placeholder="도로명주소"
							readonly> 
						<input type="text" name="mb_address3" value="${mb_address2}"
							id="sample4_jibunAddress" placeholder="지번주소" readonly>
							 <span
							id="guide" style="color: #999; display: none"></span> 
						<input
							type="text" name="mb_address4" value="${mb_address3}" id="sample4_detailAddress"
							placeholder="상세주소"> 
						<input type="text" name="mb_address5" value="${mb_address4},${mb_address5}"
							id="sample4_extraAddress" placeholder="참고항목" readonly>
						</li>
						<li><label>이메일</label> <input type="email" id="mb_email"
							name="mb_email" value="${user.mb_email}" readonly></li>
						<li><label>휴대전화</label> <input type="text" id="mb_phone"
							name="mb_phone" value="${user.mb_phone}"></li>
						<li><label>비밀번호</label> <input type="password" id="mb_pw"
							name="mb_pw" value="${user.mb_pw}" style="display: none;">
							<input type="button" onclick="location.href='updatepw'"
							value="비밀번호 변경"></li>
					</ul>
					<input type="text" name="mb_id" value="${user.mb_id}"
						style="display: none;">
					<div style="text-align: center;">
						<input id="submit" type="submit" value="수정"> <input
							type="button" onclick="location.href='/delete'" value="탈퇴하기">
					</div>
				</section>
			</form>
		</div>

	<%@ include file="include/pagelayoutFooter.jsp"%>
</body>
</html>
