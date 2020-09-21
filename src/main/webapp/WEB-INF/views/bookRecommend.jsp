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
	.all-book{
		display:flex;
	}
	.content{
		border-top:3px solid orange;
		margin-top:100px;
		position:relative;
		width:900px;
	}
	table{
		border-bottom: outset;
	}
	.thumbnail{
		border:1px solid;
	}
	.pagination{
		display:flex;
		justify-content: center;
		margin-top: 100px;
	}
	li{
		list-style:none;
	}
	button{
	    display: inline-block;
	    margin: 0 2px;
	    padding: .3em 1em;
	    border: 1px solid #ddd;
	    vertical-align: middle;
	    color: inherit;
	    font-size: 20px;
	    background: white;
	    height: 40px;
	    cursor:pointer;
	}

	button:hover{
		background-color: #3a5696;
   		border-color: #3a5696;
   		color:white;
	}
	.back_gd{
		font-size:17px;
		background: #f3f1f0;
	    width: 800px;
   		height: 90px;
	    padding: 5px;
	    padding-top: 20px;
	    padding-left: 20px;
	    margin-bottom: 50px;
	}
	.count_num{
    	font-size: 100px;
	}
</style>
<body>
	<%@ include file="include/pagelayoutHeader.jsp" %>
	<div class="mainaa">
			<div class="side">
				<%@ include file="include/pagelayoutSide1.jsp" %>
			</div>
			<div class="content">
				<h1 class="h1">추천 도서</h1>
				<p class="back_gd">※ 김이문오조 도서관 직원들이 고른 hot한 책들 <strong>단 10</strong>개만 선보입니다.<br>
				※ 최신 트랜드 30% / 문자투표 50% / 직원투표 20%로 뽑힌 책입니다.</p>
				 <c:forEach var="dv" items="${brd}" varStatus="status">
					<div class="all-book">
					<p class="count_num"><strong>${status.count}</strong></p>
						<div class="thumbnail">
							<img src="${dv.bk_image}" class="thumbnail">
						</div>
						<table class="info">
							<tr>
							<td><strong>제목  </strong></td>
							<td><a href="search/detail?isbn=${dv.bk_icode}">${dv.bk_name}</a></td>
							</tr>
							<tr>
							<td><strong>저자  </strong></td>
							<td>${dv.bk_writer}</td>
							</tr>  

							<tr>
							<td><strong>출판사  </strong></td>
							<td>${dv.bk_publisher}</td>
							</tr> 

							<tr>
							<td><strong>isbn  </strong></td>
							<td>${dv.bk_icode}</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp" %>
</body>
</html>