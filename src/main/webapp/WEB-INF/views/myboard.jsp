<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
<link rel="stylesheet" href="resources/css/reservation.css" />
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="header">
		<%@ include file="include/pagelayoutHeader.jsp" %>
	</div>
      <section class="reservation">
	<div class="reservation_top">
		<div class="reservation_title">
          	내가쓴글 
        </div>
		<div class="reservation_topline"></div>
	</div>
        <c:if test="${boardlist[0] eq null}">
			<div class="reservation_guide-list">글 목록이 없습니다.</div>
		</c:if>
		<c:if test="${boardlist[0] ne null}">
		 	<table class="table table-striped table-hover" style="text-align:center">
	          <tr>
	          	<td>게시판</td>
	            <td>글번호</td>
	            <td>제목</td>
	            <td>작성일</td>
	            <td>조회수</td>
	          </tr>
         	<c:forEach var="list" items="${boardlist}">
	          <tr>
	          	<td>묻고답하기</td>
	            <td>${list.bb_num}</td>
	            <td><a href="board/boarddetail${pageMaker.makeSearch(pageMaker.criteria.page)}&bb_num=${list.bb_num}">${list.bb_title}</a></td>
	            <td>${list.bb_date}</td>
	            <td>${list.bb_readcnt}</td>
	          </tr>
	          </c:forEach>
        	</table>
        </c:if>
      </section>
      <%@ include file="include/pagelayoutFooter.jsp" %>
    </body>
</html>