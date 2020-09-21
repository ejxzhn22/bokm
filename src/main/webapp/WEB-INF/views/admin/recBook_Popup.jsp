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
<style>
	.image_book{
		width:430px;
		height:400px;
	}
	.all{
		text-align:center;
	}
</style>
<body>
	<h3>${rbp.bk_name}</h3>
	<div class="all">
		<div>
			<img src="${rbp.bk_image}" class="image_book">
		</div>
		<p>
			해당 도서 [<span>${rbp.bk_name}</span>]을(를) 추천도서 항목에서 제외하시겠습니까?
		</p>
		<form method="post" action="recBook_Popup">
			<input type="hidden" name="bk_icode" value="${rbp.bk_icode}">
			<input type="submit" value="확인"> <input type="button" value="나가기" onClick="window.close()">
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
	</script>
</body>
</html>