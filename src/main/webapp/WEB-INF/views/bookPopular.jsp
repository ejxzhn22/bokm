<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.all-book{
		display:flex;
		/* 트랜지션을 회전으로 설정 */
		transition-property: transform;
		/* 트랜지션 시간은 1초 */
		transition-duration: 1s;
		/* x축 회전 0. 기본 수치 */
		transform: rotateX(0deg);
		/* 회전 기준 위쪽. */
		transform-origin: top;
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
		font-size: 17px;
	    background: #f3f1f0;
	    width: 800px;
	    height: 60px;
	    padding: 5px;
	    padding-top: 16px;
	    padding-left: 20px;
	    margin-bottom: 50px;
	}

	.count_num{
		    font-size: 100px;
		    margin-right:20px;
		    margin-left:20px;
		    color:black;
	}

	.count_no3{
		color: #b5956f;
	}

	.count_no2{
		color: #b2bcc8;
	}

	.count_no1{
		color: #f8efab;
	}

/* 	.fa-medal{
		transform:scale(1.5,1.5);
	} */
</style>
<body>
		<%@ include file="include/pagelayoutHeader.jsp" %>
	<div class="mainaa">
			<div class="side">
				<%@ include file="include/pagelayoutSide1.jsp" %>
			</div>
			<div class="content">
				<h1 class="h1">인기 도서</h1>
				<p class="back_gd">※ 김이문오조 도서관에서 대출횟수가 높은 <strong>TOP10</strong>만 선보입니다.</p>
				 <c:forEach var="popbook" items="${pop}" varStatus="status">
					<div class="all-book all-book${status.count}">
					<c:choose>
					<c:when test="${status.count eq 1}">
						<%-- <p class="count_num"><strong class="count_no1">${status.count}</strong></p> --%>
						<i class="fas fa-medal" style="color:#f8efab;font-size:100px;"></i>
					</c:when>
					<c:when test="${status.count eq 2}">
						<%-- <p class="count_num"><strong class="count_no2">${status.count}</strong></p> --%>
						<i class="fas fa-medal" style="color:#b2bcc8;font-size:100px;"></i>
					</c:when>
					<c:when test="${status.count eq 3}">
						<%-- <p class="count_num"><strong class="count_no3">${status.count}</strong></p> --%>
						<i class="fas fa-medal" style="color:#b5956f;font-size:100px;"></i>
					</c:when>
					 <c:otherwise>
						<p class="count_num" style="color:dimgray;"><strong>${status.count}</strong></p>
					</c:otherwise>
					</c:choose>
						<div class="thumbnail">
							<img src="${popbook.bk_image}" class="thumbnail">
						</div>

						<table class="info">
							<tr>
							<td><strong>제목  </strong></td>
							<td><a href="search/detail?isbn=${popbook.bk_icode}">${popbook.bk_name}</a></td>
							</tr>
							<tr>
							<td><strong>저자  </strong></td>
							<td>${popbook.bk_writer}</td>
							</tr>  
							<tr>
							<td><strong>출판사  </strong></td>
							<td>${popbook.bk_publisher}</td>
							</tr> 
							<tr>
							<td><strong>isbn  </strong></td>
							<td>${popbook.bk_icode}</td>
							</tr>
							<tr>
							<td><strong>대출횟수  </strong></td>
				 			<td>${popbook.bk_sg_num}</td>
							</tr>
						</table>
					</div>
					</c:forEach>
			</div>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp" %>
</body>

</html>