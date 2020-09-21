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
		margin-top:100px;
		padding:50px;
		position:relative;
		}
</style>
<body>
	<%@ include file="include/pagelayoutHeader.jsp" %>
	<div class="mainaa">
			<div class="side">
				<%@ include file="include/pagelayoutSide2.jsp" %>
			</div>
			<div class="content">
				내용
			</div>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp" %>
</body>
</html>