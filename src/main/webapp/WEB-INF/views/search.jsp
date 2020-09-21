<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<style>
		.content{
		border-top:3px solid orange;
		margin-top:100px;
		padding:20px;
		position:relative;
		}
		
		.image{
			margin-bottom:55px;
			
		}
		
		.resultContainer {
		    padding: 10px 0;
		
		}
		.search{
			margin-top:30px;
		}
		
		
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/style.css">
</head>
<body>
<input type="hidden" id="totalCount" value="${result.meta.total_count}">
		<%@ include file="include/pagelayoutHeader.jsp" %>
	<div class="mainaa">
		<div class="side">
			<%@ include file="include/pagelayoutSide1.jsp"%>
		</div>
		<div class="content">
		
		<div class="image">
		<h2>${msg}</h2>
		<h2>전국 도서 통합검색</h2>
        <div class="search">
	        <form method="get" action="/search">
	            <input ik-auto-complete="" id="bar-search" class="bar-search" title="통합검색 검색어 입력창" name="query" value="${query}"
	                placeholder="도서명, 저자, 키워드 등 검색어를 입력하세요." ng-model="keyword" value="keyword" data-role="autocomplete" type="text"
	                autocomplete="off" role="textbox" aria-haspopup="true" style="width: 400px;" aria-disabled="false"
	                aria-readonly="false" aria-owns="keyword_listbox" aria-autocomplete="list">
	            <input type="hidden" name="page" value="1">
				<input type="hidden" name="pageNum" value="0">
	            <button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
	        </form>
        </div>
        </div>
        
        
		<c:forEach var="result" items="${result.documents}">
			<div class="resultContainer">
				<div class="resultThumbnail">
					<c:choose>
						<c:when test="${result.thumbnail == null}">
							<img src="/resources/img/defaultThumbnail.png">
						</c:when>
						<c:otherwise>
							<img src="${result.thumbnail}">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="resultDetail">
					<ul>
						<li id="titleInfo"><a href="/search/detail?isbn=${result.isbn}">${result.title}</a></li>
						<li>${result.authors}</li>
						<li>${result.publisher}</li>
						<li>도서관 소장 여부 : 대출 가능</li>
					</ul>
				</div>
			</div>
			<hr>
		</c:forEach>
		<div id="pagination">
			<span id='prev'>prev</span> <span id="page"> </span> <span id='next'>next</span>
		</div>
	</div>
	</div>
	
	<%@ include file="include/pagelayoutFooter.jsp"%>
	<script src="/resources/page.js"></script>
</body>
</html>

