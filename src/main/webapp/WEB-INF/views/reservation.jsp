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
          	예약현황
        </div>
		<div class="reservation_topline"></div>
	</div>
        <c:if test="${rlist[0] eq null}">
			<div class="reservation_guide-list">예약중인 목록이 없습니다.</div>
		</c:if>
		<c:if test="${rlist[0] ne null}">
		 	<table class="table table-striped table-hover" style="text-align:center">
	          <tr>
	            <td>책제목</td>
	            <td>저자</td>
	            <td>출판사</td>
	            <td>대출예정일자</td>
	            <td>알림</td>
	            <td></td>
	          </tr>
         	<c:forEach var="borrowlist" items="${rlist}">
	          <tr>
	            <td>${borrowlist.bk_name}</td>
	            <td>${borrowlist.bk_writer}</td>
	            <td>${borrowlist.bk_publisher}</td>
	            <td>${borrowlist.bd_real_return_date}</td>
	            <td><a href="search/detail?isbn=${borrowlist.bk_icode}">상세</a></td>
	            <td><a href="cancelreser?bk_id=${user.mb_id}&bk_icode= ${borrowlist.bk_icode}">예약취소</a></td>
	          </tr>
	          </c:forEach>
        	</table>
        </c:if>
      </section>
      <%@ include file="include/pagelayoutFooter.jsp" %>
    </body>
</html>