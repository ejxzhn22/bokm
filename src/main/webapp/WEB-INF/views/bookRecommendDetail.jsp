<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.content{
		border-top:3px solid orange;
		margin-top:100px;
		position:relative;
		width:900px;
	}
</style>
</head>
<body>
	<%@ include file="include/pagelayoutHeader.jsp" %>
	<div class="mainaa">
			<div class="side">
				<%@ include file="include/pagelayoutSide1.jsp" %>
			</div>
			<div class="content">
				<h1>추천 도서 상세 보기</h1>
					<div class="all-book">
						<div class="thumbnail">
							<img src="${brd.bk_image}" class="thumbnail">
						</div>
						<table class="info">
							<tr>
							<td><strong>제목  </strong></td>
							<td><a href="">${brd.bk_name}</a></td>
							</tr>
							<tr>
							<td><strong>저자  </strong></td>
							<td>${brd.bk_writer}</td>
							</tr>  
							<tr>
							<td><strong>출판사  </strong></td>
							<td>${brd.bk_publisher}</td>
							</tr> 
							<tr>
							<td><strong>isbn  </strong></td>
							<td>${brd.bk_icode}</td>
							</tr>
						</table>
					</div>
			</div>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp" %>
</body>
</html>