<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.content{
		border-top:3px solid orange;
		width:900px;
		margin-top:100px;
	}
	.policy1{
		background:#f3f1f0;
		width:800px;
		height: 100px;
		padding: 15px;
   	    padding-top: 15px;
        padding-left: 20px;
	}
	table {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
	  margin : 20px 10px;
	  width:800px;
}
h3{
	margin-bottom: 15px;
}
th {
    width: 90px;
    padding: 5px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
}
td {
    width: 300px;
    padding: 5px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
	</script>
	<div class="header">
	<%@ include file="include/pagelayoutHeader.jsp" %>
	</div>
	<div class="mainaa">
	<div class="side">
	<%@ include file="include/pagelayoutSide2.jsp" %>
	</div>
	<div class="content">

		<h1 class="h1">대출/반납/예약/연장</h1><br>
		<h3><strong>대출자격</strong></h3>
		<p>| 주민등록상 경기도 및 인천 남동구 시민, 경기도 및 인천 남동구 소재 학교 재학생 및 직장인</p>
		
		<h3><strong>대출가능권수</strong></h3>
		<p>| 1인당 1관당 10권(시흥시 전체 30권) ※ 1인당 DVD 2점(대출권수 포함)</p>
		<p>| 상호대차 권수 포함 10권입니다.</p>
		
		<h3><strong>대출기간</strong></h3>
		<p>| 기본 14일 + 1회연장(7일)</p>
		<p>| 재대출의 경우 도서 반납일 당일부터 가능</p>
		
		<h3><strong>아래의 자료는 대출이 되지않습니다.</strong></h3>
		<p>| 희귀자료 및 고서 등 귀중본자료</p>
		<p>| 참고자료 및 행정자료</p>
		<p>| 연속간행물</p>
		<p>| 기타 대출제한이 필요하다고 인정된 자료</p>
		
		<h3><strong>자가대출ㆍ반납기</strong></h3>
		<p class="policy1">자가 대출ㆍ반납기는 공공도서관 각 자료실내에 설치되어 있으며, 자료실 운영시간에 한하여 대출ㆍ반납이 가능합니다.
단, 대출시 본인확인을 위한 비밀번호 입력 절차를 진행하며, 반납시는 해당실에 소속된 자료만 반납가능합니다.</p>
		<table class="lib-info">
			<tr>
				<th><strong>중앙도서관</strong></th>
				<td>종합자료실, 어린이정보실</td>
			</tr>
			<tr>
				<th><strong>능곡도서관</strong></th>
				<td>종합자료실, 어린이자료실</td>
			</tr>
			<tr>
				<th><strong>대야도서관</strong></th>
				<td>일반자료실, 어린이자료실</td>
			</tr>
			<tr>
				<th><strong>군자도서관</strong></th>
				<td>종합자료실, 어린이자료실</td>
			</tr>
			<tr>
				<th><strong>대야어린이도서관</strong></th>
				<td>아이마루, 생각샘, 동화샘</td>
			</tr>
			<tr>
				<th><strong>정왕어린이도서관</strong></th>
				<td>영유아자료실, 어린이자료실</td>
			</tr>
			<tr>
				<th><strong>신천도서관</strong></th>
				<td>종합자료실,어린이자료실</td>
			</tr>
			<tr>
				<th><strong>매화도서관</strong></th>
				<td>종합자료실,어린이자료실</td>
			</tr>
			<tr>
				<th><strong>월곶도서관</strong></th>
				<td>종합자료실,어린이자료실</td>
			</tr>
			<tr>
				<th><strong>장곡도서관</strong></th>
				<td>글마루, 아이마루</td>
			</tr>
			<tr>
				<th><strong>목감도서관</strong></th>
				<td>어린이자료실, 종합자료실</td>
			</tr>
		</table>
		
		
		<h3><strong>무인반납기</strong></h3>
		<p class="policy1">무인반납기는 공공도서관 외부에 설치되어 있으며, 24시간 도서반납이 가능합니다.
단, 상호대차 반납은 불가하며, 타도서관 도서 반납은 도서관별 상세내역을 확인하시기 바랍니다.</p>
		<table class="lib-info">
			<tr>
				<th><strong>중앙도서관</strong></th>
				<td>타도서관 도서 반납 가능</td>
			</tr>
			<tr>
				<th><strong>능곡도서관</strong></th>
				<td>타도서관 도서는 반납함에 반납가능(익일처리)</td>
			</tr>
			<tr>
				<th><strong>대야도서관</strong></th>
				<td>타도서관 도서 반납 가능</td>
			</tr>
			<tr>
				<th><strong>군자도서관</strong></th>
				<td>타도서관 도서 반납 가능</td>
			</tr>
			<tr>
				<th><strong>대야어린이도서관</strong></th>
				<td>타도서관 도서 반납 가능</td>
			</tr>
			<tr>
				<th><strong>정왕어린이도서관</strong></th>
				<td>타도서관 도서는 반납함에 반납가능(익일처리)</td>
			</tr>
			<tr>
				<th><strong>신천도서관</strong></th>
				<td>타도서관 도서 반납 가능</td>
			</tr>
			<tr>
				<th><strong>매화도서관</strong></th>
				<td>타도서관 도서 반납 가능</td>
			</tr>
			<tr>
				<th><strong>월곶도서관</strong></th>
				<td>타도서관 도서 반납 가능</td>
			</tr>
			<tr>
				<th><strong>장곡도서관</strong></th>
				<td>타도서관 도서 반납 가능</td>
			</tr>
			<tr>
				<th><strong>목감도서관</strong></th>
				<td>타도서관 도서 반납 가능</td>
			</tr>
		</table>

	</div>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp" %>
	
</body>
</html>