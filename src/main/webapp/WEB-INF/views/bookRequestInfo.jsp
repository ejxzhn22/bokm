<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망도서 안내</title>
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
		height: 85px;
		padding: 5px;
  	    padding-top: 20px;
  	    padding-left: 20px;
	}

table {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
	  margin : 20px 10px;
}
th {
    width: 240px;
    padding: 10px;
    color:#e38045;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
}
td {
    width: 200px;
    padding: 10px;
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
		 
		<h1 class="h1">희망도서 안내</h1><br>
		<h3><strong>운영방침</strong></h3>
		<p class="policy1">희망도서 신청시 편중된 주제신청을 방지하고 보다 많은 이용자가 참여할 수 있도록<br>
			아래와 같이 희망도서 관련 규정을 운영하오니 이용자 여러분께서는 신청시 참고하여 주시기 바랍니다.</p>
		<strong>| 희망도서 신청권수</strong><br>
		<p>1인당 월 5 권, 연 12권까지 가능</p>
		<strong>| 신청가능대상</strong>
		<p>관외 대출이 가능한 회원에 한함</p>
		<strong>| 희망도서 선정제외 대상</strong><br><br>
		<span>- 소속 도서관 소장 자료 제외<br>
		 - 도서의 서지사항이 정확하지 않을 경우 (도서명, 저자, 출판사, 출판년도) 제외<br>
		 - 만화책, 로맨스ㆍ판타지ㆍ무협지, 대본집, 각종 수험서, 대학교재, 문제풀이집, 심화단계 전문서, 비도서 제외<br>
		 - 자료의 형태상 도서관 소장용으로 부적합한 도서(POD도서,스프링도서,쓰기익힘책, 퍼즐북,스티커북,팝업북,컬러링북,50페이지 미만의 소책자 등) 제외<br>
		 - 게임이나 스포츠 가이드북 제외<br>
		 - 외국서적, 원서 제외<br>
		 - 출판년도가 오래된 도서 제외 (출판된 지 5년 경과, 컴퓨터, 과학 분야의 경우 출판된 지 2년 경과)<br>
		 - 이용이 극히 특정인에 한정 될 것으로 판단되는 자료 제외<br>
		 - 동일 제목 자료가 많은 경우 (출판사만 다른 경우, 관련도서가 많은 경우) 제외<br>
		 - 5만원 이상의 고가의 자료 제외<br>
		 - 대형 인터넷 서점 2곳 이상에서 품절 및 절판으로 확인된 자료 제외<br>
		 - 5권 이상 전집 (정기 구입 차수에 반영) 제외<br></span>
		<h3>문의사항</h3>
		<table class="lib-info">
			<tr>
				<th>중앙도서관</th>
				<td>☎ 310-5224</td>
				<th>능곡도서관</th>
				<td>☎ 310-2552</td>
				<th>대야도서관</th>
				<td>☎ 310-5271</td>
			</tr>
			<tr>
				<th>대야어린이도서관</th>
				<td>☎ 310-5241</td>
				<th>군자도서관</th>
				<td>☎ 310-5191</td>
				<th>정왕어린이도서관</th>
				<td>☎ 310-5182</td>
			</tr>
			<tr>
				<th>목감도서관</th>
				<td>☎ 310-2592</td>
				<th>장곡도서관</th>
				<td>☎ 310-5236</td>
				<th>신천ㆍ매화ㆍ월곶</th>
				<td>☎ 310-5208</td>
			</tr>
		</table>
		<h3>신청방법</h3>
		<p>1로그인을 합니다.<br>
		2나의 서재 > 희망도서 신청ㆍ조회 화면으로 이동합니다.<br>
		3온라인 도서 검색신청 또는 직접신청 버튼을 클릭합니다.<br>
		4-1온라인도서검색 신청 : 도서검색 후 신청 버튼을 클릭합니다.<br>
		4-2직접신청 : 도서명, 출판사, 저자를 입력 후 확인버튼을 클릭합니다.<br></p>

	</div>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp" %>
	
</body>
</html>