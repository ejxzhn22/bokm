<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
		margin-top: 40px;
	}
	.content{
		border-top:3px solid orange;
		width:900px;
		margin-top:100px;
		height: inherit;
	}
	.borrowlist3{
		margin-top:30px;
	}
	.ssatda{
		    display: flex;
    justify-content: flex-end;
    margin: 30px 0 20px;
    background: #f1f1f1;
    height: 100px;
    padding-top: 31px;
	}
	.all-book{
		display:flex;
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
	.thumbnail{
	    width: 120px;
    	height: 160px;
    	margin-right: 20px;
    	margin-bottom: 10px;
	}
	.info{
	    font-size: 22px;
	}
	#keywordInput{
		margin-right:10px;
	}
</style>
<body>
<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="mainaa">
		<div class="side">
			<%@include file="include/pagelayoutSide1.jsp" %>
		</div>
		<div class="content">
			<section class="borrowlist3">
				<h1>우리책검색</h1>
				<div class="ssatda">
				    <div class="form-group col-sm-2">
				        <select class="form-control" name="searchType" id="searchType">
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
				            <input type="text" class="form-control" name="keyword" id="keywordInput" value="${pageMaker.criteria.keyword}" placeholder="통합검색 검색어를 입력하세요.">
				            <span class="input-group-btn">
				                <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
				                    <i class="fa fa-search"></i> 검색
				                </button>
				            </span>
				        </div>
				    </div>
		    </div>
		

				 <c:forEach var="dv" items="${dvlist}">
					<div class="all-book">
						<div class="thumbnail">
							<img src="${dv.bk_image}" class="thumbnail">
						</div>
						<table class="info">
							<tr>
							<td><strong>제목  </strong></td>
							<td><a href="search/detail?isbn=${dv.bk_icode}" role="button">${dv.bk_name}</a></td>
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
								<div class="text-center">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li><button type="button" class="prev_button" onClick="location.href='${pageContext.request.contextPath}/allBookSearch?page=${pageMaker.startPage - 1}';">이전</button></li>
            </c:if>
            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                    <button type="button" class="hey_button" onClick="location.href='${pageContext.request.contextPath}/allBookSearch?page=${idx}';">${idx}</button>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                <li><button type="button" class="next_button" onClick="location.href='${pageContext.request.contextPath}/allBookSearch?page=${pageMaker.endPage + 1}';">다음</button></li>
            </c:if>
        </ul>
    </div>

	</section>

		</div>
	</div>
	<%@ include file = "include/pagelayoutFooter.jsp" %>
</body>

<script>
$(document).ready(function () {

    $("#searchBtn").on("click", function (event) {
        self.location =
            "allBookSearch${pageMaker.makeQuery1(1)}"
            + "&searchType=" + $("select option:selected").val()
            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
            
    });
		$("#keywordInput").keydown(function(key) {
			if (key.keyCode == 13) {
				$("#searchBtn").click();
			}
		});
});
</script>
</html>