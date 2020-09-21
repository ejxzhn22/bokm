<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet">
</head>
<body>
	 	<div class="side">
			<div class="side-menu">도서관 서비스</div>
			<ul class="side-menu-ul">
				<li class="side-menu-sub"><a href="bookServiceInfo">대출/반납/예약/연장 안내</a></li><hr>
				<li class="side-menu-sub"><a href="bookRequestInfo">희망도서 안내</a></li><hr>
				<li class="side-menu-sub"><a href="bookRequestSearch">희망도서 신청</a></li><hr>
				<li class="side-menu-sub"><a href="bookDeliveryList">책 배송</a></li><hr>
			</ul>
		</div>
		
</body>
</html>