<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출현황</title>
<link rel="stylesheet" href="resources/css/borrowlist.css" />
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
</head>
<body>

	<div class="header">
	<%@ include file="include/pagelayoutHeader.jsp" %>
	</div>
      <section class="borrowlist">
      <div class="borrowlist_top">
        <div class="borrowlist_title">
          	대출현황
        </div>
        <div class="borrowlist_topline"></div>
	  </div>
        

		<div class="borrowlist_button">
			<div class="borrolist_btn"><a class="btn btn-default" href="moveborrowlist?mb_id=${user.mb_id }" role="button">대출현황</a></div>
			<div class="borrolist_btn"><a class="btn btn-default" href="moveborrowhistory?mb_id=${user.mb_id}" role="button">대출/반납 이력</a></div>
		</div>
		<c:if test="${list[0] eq null}">
        <div class="borrowlist_guide-list">대출 목록이 없습니다.</div>
        </c:if>
        <c:if test="${list[0] ne null}">
        <table class="table table-striped table-hover" style="text-align:center">
          <tr>
           <td>대출번호</td>
            <td>책제목</td>
            <td>저자</td>
            <td>대출일자</td>
            <td>예정반납일자</td>
            <td>실제반납일자</td>
            <td>연장여부</td>
            <td>연체여부</td>
          </tr>
          <c:forEach var="borrowlist" items="${list}">
          <tr>
           <td>${borrowlist.bd_bo_num}</td>
            <td>${borrowlist.bk_name}</td>
            <td>${borrowlist.bk_writer}</td>
            <td>${borrowlist.bd_date}</td>
            <td>${borrowlist.bd_return_date}</td>
            <td>${borrowlist.bd_real_return_date}</td>
            
            <td>
	            <c:if test="${borrowlist.bd_reservation eq 0 && borrowlist.bd_real_extension eq '-' &&borrowlist.bd_arrears ne '연체'}">
	            	<a href="extension?bd_bo_num=${borrowlist.bd_bo_num}&mb_id=${borrowlist.bl_id}">연장하기</a>
	            </c:if>
	            <c:if test="${borrowlist.bd_reservation ne 0 or borrowlist.bd_arrears eq '연체'}">
	            	연장불가
	            </c:if>
	            <c:if test="${borrowlist.bd_real_extension eq '연장함'}">
	            	연장함
	            </c:if>
            </td>
            <td>
            	<c:if test="${borrowlist.bd_arrears eq '연체'}">
            		<span style="color:red;">연체 ${borrowlist.arrearsdate}일</span>
            	</c:if>
            	<c:if test="${borrowlist.bd_arrears eq '-'}">
            		-
            	</c:if>
            </td>
          </tr>
          </c:forEach>
        </table>
       </c:if>
      </section>
      <%@ include file="include/pagelayoutFooter.jsp" %>
    </body>
</html>