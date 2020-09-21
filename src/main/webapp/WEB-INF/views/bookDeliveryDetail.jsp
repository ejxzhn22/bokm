<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
		</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.all-book{
		display:flex;
		margin-top: 30px;
	}
	.thumb{
    width: 210px;
    height: 270px;
    MARGIN-RIGHT: 18PX;
	}

	.content{
		border-top:3px solid orange;
		margin-top:100px;
		padding:50px;
		position:relative;
		width:900px;
	}	
	#sample4_postcode{
		width: 570px;
		font-size: 25px;
		margin-bottom:10px;
	}
	#sample4_roadAddress,#sample4_jibunAddress,#sample4_extraAddress{
		font-size: 20px;
		margin-bottom:10px;
		margin-right: 11px;
	}
	#sample4_detailAddress{
		margin-bottom:10px;
		width:757px;
		font-size: 20px;
	}
	.search_button{
		border: 1px solid #624941;
		background-color: #624941;
		color: white;
		padding: 0px;
		font-size: 20px;
		width: 180px;
		height: 38px;
		border-radius: 5px;
	}
	.search_button:hover{
		color:#ef7a34;
	}
	.div4{
		display:flex;
		align-items:center;
		justify-content: center;
	}
	.div_all{
		display:flex;
		align-items:center;
		justify-content: center;
		flex-direction:column;
		padding-top: 60px;
	}
	.err_message{
		text-align:center;
		height:100px;
		width:800px;
		background:lightgray;
		font-size:40px;
		padding-top:15px;
		margin-top: 50px;
	}
	table {
	    border-collapse: collapse;
	    text-align: left;
	    line-height: 1.5;
	        WIDTH: 580PX;
	}
	table th {
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
	}
	table th {
	    width: 150px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
	}
	table td {
	    width: 350px;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
</style>
</head>
<body>
	<div class="header">
		<%@ include file="include/pagelayoutHeader.jsp" %>
	</div>
	
	<div class="mainaa">
			<div class="side">
				<%@ include file="include/pagelayoutSide2.jsp" %>
			</div>
		<div class="content">
			<h1>상세보기</h1>
				<div class="all-book">
					<div class="thumbnail-book">
						<img src="${dvdetail.bk_image}" class='thumb'>
					</div>
					<table class="info-book">
						<tr><th><strong>제목  </strong></th><td>${dvdetail.bk_name}</td></tr>
						<tr><th><strong>저자  </strong></th><td>${dvdetail.bk_writer}</td></tr>
						<tr><th><strong>출판사  </strong></th><td>${dvdetail.bk_publisher}</td></tr>
						<tr><th><strong>대출여부  </strong></th><td>${dvdetail.bk_state}</td></tr>
						<tr><th><strong>ISBN  </strong></th><td>${dvdetail.bk_icode}</td></tr>
						<tr><th><strong>출판일  </strong></th><td>${dvdetail.bk_publicday}</td></tr>
						<tr><th><strong>내용  </strong></th><td>${dvdetail.bk_introduction}</td></tr>
					</table>
				</div>
				<c:if test="${dvdetail.bk_state eq '대출가능' && empty dvdvdv}">
				<div class="div_all">
						<form action="bookDeliveryDetail" method="post">
						<div class="div1">
							<input type="text" name="dv_location1" id="sample4_postcode" placeholder="우편번호" readonly> 
							<input type="button" onclick="sample4_execDaumPostcode()" class="search_button" value="우편번호 찾기" readonly>
						</div>
						<div class="div2">
							<input type="text" name="dv_location2" id="sample4_roadAddress" placeholder="도로명주소" readonly>
							<input type="text" name="dv_location3" id="sample4_jibunAddress" placeholder="지번주소" readonly>
							<span id="guide" style="color: #999; display: none"></span> 
							<input type="text" name="dv_location5" id="sample4_extraAddress" placeholder="참고항목" readonly>
						</div>
						<div class="div3">
							<input type="text" name="dv_location4" id="sample4_detailAddress" placeholder="상세주소">
							<input type="hidden" name="dv_bcode" value="${dvdetail.bk_icode}">
							<input type="hidden" name="dv_bk_name" value="${dvdetail.bk_name}">
						</div>
						<div class="div4">	
							<input type="submit" onsubmit="return submitForm()" class="search_button" value="배송 신청">
						</div>
						</form>
				</div>
				</c:if>
				<c:if test="${dvdetail.bk_state eq '대출중'}">
				<div class="err_message">대출 중인 도서로 대출불가합니다.</div>
				</c:if>
				<c:if test="${dvdvdv.dv_state eq '배송중' || dvdvdv.dv_state eq '배송준비'}">
				<div class="err_message">배송중/배송준비 (으)로 대출 불가합니다. </div>
				</c:if>
			</div>
			</div>
			<%@ include file="include/pagelayoutFooter.jsp" %>
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
		//주소 공백
		if ($("#sample4_detailAddress").val() == "") {
			alert("주소를 써주세요");
			$("#sample4_detailAddress").focus();

			return false;
		};
	}
</script>	
	
</body>
</html>