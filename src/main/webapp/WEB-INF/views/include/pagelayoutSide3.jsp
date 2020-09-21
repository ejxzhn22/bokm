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
			<div class="side-menu">열린마당</div>
			<ul class="side-menu-ul">
				<li class="side-menu-sub"><a href="../board/boardlist?bb_bnum=notice">공지사항</a></li><hr>
				<li class="side-menu-sub"><a href="../board/boardlist?bb_bnum=frequestions">자주 하는 질문</a></li><hr>
				<li class="side-menu-sub"><a href="../board/boardlist?bb_bnum=qna">묻고 답하기</a></li><hr>
			</ul>
		</div>
		
</body>
</html>