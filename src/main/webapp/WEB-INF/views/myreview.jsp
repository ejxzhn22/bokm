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
          	나의 서평
        </div>
		<div class="reservation_topline"></div>
	</div>
        <c:if test="${rlist[0] eq null}">
			<div class="reservation_guide-list">등록된 댓글이 없습니다..</div>
		</c:if>
		<c:if test="${rlist[0] ne null}">
		 	<table class="table table-striped table-hover" style="text-align:center">
	          <tr>
	            <td>책code</td>
	            <td>책제목</td>
	            <td>서평 내용</td>
	            <td>작성 날짜</td>
	            <td>정보</td>
	            <td></td>
	          </tr>
         	<c:forEach var="reviewlist" items="${rlist}">
	          <tr>
	            <td>${reviewlist.rv_icode}</td>
	            <td>${reviewlist.bk_name}</td>
	            <td>${reviewlist.rv_content}</td>
	            <td>${reviewlist.rv_date}</td>
	            <td><a href="/search/detail?isbn=${reviewlist.rv_icode}">상세</a></td>
	          </tr>
	          </c:forEach>
        	</table>
        </c:if>
      </section>
      <%@ include file="include/pagelayoutFooter.jsp" %>
    </body>
</html>