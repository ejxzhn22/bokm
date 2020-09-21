<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
</head>
<body>

	<c:if test="${rlist[0] eq null}">
		<div class="myinfo_guide-list">예약중인 목록이 없습니다.</div>
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
          <c:forEach var="borrowlist" items="${rlist}"  begin="0" end="5" step="1">
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
</body>
</html>