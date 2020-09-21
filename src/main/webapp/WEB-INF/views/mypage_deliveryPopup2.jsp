<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page session="true"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
      crossorigin="anonymous" />
<style>
	.dv_2{
		margin:0%;
		width:683px;
		width:100%;
	}
	.btn_div{
		display:flex;
		justify-content:center;
		align-items:centr;
	}
</style>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<img src="${pageContext.request.contextPath}/resources/images/dv_22.jpg" class="dv_2">
 		<c:forEach var="dd" items="${dv2}">
 		<table class="table table-bordered">
 		<tr>
			<td colspan="2"><strong>배송중</strong>인 상품입니다. 집배원 <strong>${dd.dv_deliveryman}</strong>이 배송중입니다.</td>
		</tr>
		<tr>
			<td>수령인</td>
			<td>${dd.dv_user}</td>
		</tr>
		<tr>
			<td>도서명</td>
			<td>${dd.dv_bk_name}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${dd.dv_location}</td>
		</tr>
		<tr>
			<td>예상완료시간</td>
			<td>${dd.dv_expectedtime}</td>
		</tr>

	</table>
	</c:forEach>
	<div class="btn_div">
	<button type="button" class="btn btn-danger" onclick="window.close();">닫기</button>
	</div>
</body>
</html>