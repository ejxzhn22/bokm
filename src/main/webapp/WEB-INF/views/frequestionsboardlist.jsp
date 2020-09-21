<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap-theme.min.css">

</head>
<!-- jQuery 3.4.1 -->
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">

<style>
	.abcde{
		cursor:default;
		color:red;
		font-size: 30px;
	}
	.selectT:hover{
	text-decoration: underline;
	}
	.input-group{
		width:300px;
	}

	.pagination{
		width:500px;
		margin:0 auto;
	}
	.content{
		border-top:3px solid orange;
		width:900px;
		margin-top:100px;
		height:815px;
	}
	.borrowlist3{
		margin-top:30px;
		
	}
	.ssatda{
		margin-top:30px;
		display:flex;
		justify-content:flex-end;
		
	}
	th{
		padding:10px;
	}
</style>
<body>
<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="mainaa">
		<div class="side">
			<%@include file="include/pagelayoutSide3.jsp" %>
		</div>
		<div class="content">
			<section class="borrowlist3">
				<h1>자주하는 질문</h1>
				<div class="ssatda">
				    <div class="form-group col-sm-2">
				        <select class="form-control" name="searchType" id="searchType">
				            <option value="n" <c:out value="${pageMaker.criteria.searchType == null ? 'selected' : ''}"/>>:::::: 선택 ::::::</option>
				            <option value="t" <c:out value="${pageMaker.criteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				            <option value="c" <c:out value="${pageMaker.criteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
				            <option value="w" <c:out value="${pageMaker.criteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				            <option value="tc" <c:out value="${pageMaker.criteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				            <option value="cw" <c:out value="${pageMaker.criteria.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
				            <option value="tcw" <c:out value="${pageMaker.criteria.searchType eq 'tcw' ? 'selected' : ''}"/>>제목+내용+작성자</option>
				        </select>
				    </div>
				    <div class="form-group col-sm-10">
				        <div class="input-group">
				            <input type="text" class="form-control" name="keyword" id="keywordInput" value="${pageMaker.criteria.keyword}" placeholder="검색어">
				            <span class="input-group-btn">
				                <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
				                    <i class="fa fa-search"></i> 검색
				                </button>
				            </span>
				        </div>
				    </div>
		    </div>
		
		
		<table class="table table-striped table-hover">
			<thead>
				<tr >
					<th scope="col" style="background-color:#337ab7; color:white">글 번호</th>
					<th scope="col" style="background-color:#337ab7; color:white">제목</th>
					<th scope="col" style="background-color:#337ab7; color:white">게시일자</th>
					<th scope="col" style="background-color:#337ab7; color:white">작성자</th>
					<th scope="col" style="background-color:#337ab7; color:white">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${list }" varStatus="status">
					<c:if test="${empty board}">
						<li>등록된 댓글이 없습니다.</li>
					</c:if>
					<tr class="table-light">
						<th scope="row">${pageMaker.totalCount - ((pageMaker.criteria.page-1) * pageMaker.criteria.perPageNum + status.index)}</th>
						<td>
						<form method="post" action="boarddetail${pageMaker.makeSearch(pageMaker.criteria.page)}&bb_num=${board.bb_num}" >
							<input class="selectT" type="submit" style="border:0;background:none;" value = "${board.bb_title} "> 
					 		<input type="hidden" name="page" value="${pageMaker.criteria.page}">
				   			<input type="hidden" name="perPageNum" value="${pageMaker.criteria.perPageNum}">
			   			</form>
						</td>
						<td>${board.bb_date}</td>
						<td>${board.bb_name}</td>
						<td><span class="badge">${board.bb_readcnt}</span></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr >
					<th scope="col" style="background-color:#337ab7; color:white">글 번호</th>
					<th scope="col" style="background-color:#337ab7; color:white">제목</th>
					<th scope="col" style="background-color:#337ab7; color:white">게시일자</th>
					<th scope="col" style="background-color:#337ab7; color:white">작성자</th>
					<th scope="col" style="background-color:#337ab7; color:white">조회수</th>
				</tr>
			</tfoot>
		</table>
	</section>
	<form id="listPageForm">
    <input type="hidden" name="page" value="${pageMaker.criteria.page}">
    <input type="hidden" name="perPageNum" value="${pageMaker.criteria.perPageNum}">
    <input type="hidden" name="bb_bnum" value="${board.bb_bnum}">
    

	<div class="box-footer">
    
	    <div class="text-center">
	        <ul class="pagination">
			    <c:if test="${pageMaker.prev}">
			        <%--<li><a href="${path}/article/listPaging?page=${pageMaker.startPage - 1}">이전</a></li>--%>
			        <%--<li><a href="${path}/article/listPaging${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>--%>
			        <li><a class="page-link" href="${pageMaker.startPage - 1}">이전</a></li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			        <li <c:out value="${pageMaker.criteria.page == idx ? 'class=abcde' : ''}"/>>
			            <%--<a href="${path}/article/listPaging?page=${idx}">${idx}</a>--%>
			            <%--<a href="${path}/article/listPaging${pageMaker.makeQuery(idx)}">${idx}</a>--%>
			            <a class="page-link" href="${idx}">${idx}</a>
			        </li>
			        
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			        <%--<li><a href="${path}/article/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>--%>
			        <%--<li><a href="${path}/article/listPaging?${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>--%>
			        <li><a class="page-link" href="${pageMaker.endPage + 1}">다음</a></li>
   			 	</c:if>
			</ul>
	    </div>
	</div>
	

</form>
		</div>
	</div>
	<%@ include file = "include/pagelayoutFooter.jsp" %>
</body>
<script>
$(".pagination li a").on("click", function (event) {
    event.preventDefault();

    var targetPage = $(this).attr("href");
    var listPageForm = $("#listPageForm");
    listPageForm.find("[name='page']").val(targetPage);
    listPageForm.find("[name='searchType']");
    listPageForm.find("[name='keyword']");
    listPageForm.attr("action", "boardlist").attr("method", "get");
    listPageForm.submit();
});
</script>
<script>
$(document).ready(function () {

    $("#searchBtn").on("click", function (event) {
        self.location =
            "boardlist${pageMaker.makeQuery(1)}"
            + "&searchType=" + $("select option:selected").val()
            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
    });
});
</script>
</html>