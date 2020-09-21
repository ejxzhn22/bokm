<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출/반납이력</title>
<link rel="stylesheet" href="resources/css/borrowhistory.css" />
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
</head>
<body>
		<div class="header">
			<%@ include file="include/pagelayoutHeader.jsp" %>
		</div>
		
      <section class="borrowhistory">
      <div class="borrowhistory_top">
        <div class="borrowhistory_title">
          	대출/반납 이력
        </div>
        <div class="borrowhistory_topline"></div>
	  </div>
	  
		<div class="borrowhistory_button">
			<div class="borrowhistory_btn"><a class="btn btn-default" href="moveborrowlist?mb_id=${user.mb_id }" role="button">대출현황</a></div>
			<div class="borrowhistory_btn"><a class="btn btn-default" href="moveborrowhistory?mb_id=${user.mb_id}" role="button">대출/반납 이력</a></div>
		</div>
		<!-- <form>
			<div>
      			<input style="margin-left:30px; width:230px; text-align:center;" type="date" value="2019-09-22" min="2010-01-01" max="2019-09-25"> ~ 
      			<input style="width:230px; text-align:center;" type="date" value="2019-09-22" min="2010-01-01" max="2019-09-25">
      			<input class="btn btn-default" type="submit" value="조회">
    		</div>
    	</form> -->
        
	<c:if test="${list[0] eq null}">
		<div class="myinfo_guide-list">대출중인 목록이 없습니다.</div>
	</c:if>
	<c:if test="${list[0] ne null}">
	 <table class="table table-striped table-hover" style="text-align:center">
          <tr>
           <td>대출번호</td>
            <td>책제목</td>
            <td>저자</td>
            <td>출판사</td>
            <td>대출일자</td>
            <td>실제반납일자</td>
            <td>연체여부</td>
            <td></td>
          </tr>
          <c:forEach var="borrowlist" items="${list}">
          <tr>
           <td>${borrowlist.bd_bo_num}</td>
            <td>${borrowlist.bk_name}</td>
            <td>${borrowlist.bk_writer}</td>
            <td>${borrowlist.bk_publisher}</td>
            <td>${borrowlist.bd_date}</td>
            <td>${borrowlist.bd_real_return_date}</td>
            <td>${borrowlist.bd_arrears}</td>
            <td><a href="/search/detail?isbn=${borrowlist.bd_bcode}" >내서평 남기기</a></td>
          </tr>
          </c:forEach>
        </table>
        </c:if>
      </section>
      <%@ include file="include/pagelayoutFooter.jsp" %>
    </body>
</html>