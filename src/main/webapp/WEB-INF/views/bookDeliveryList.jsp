<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap-theme.min.css">

</head>
<!-- jQuery 3.4.1 -->
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">

<style>
	.all-book{
		display:flex;
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
		font-size:17px;
		background: #f3f1f0;
	    width: 800px;
   		 height: 90px;
	    padding: 5px;
	    padding-top: 20px;
	    padding-left: 20px;
	    margin-bottom: 50px;
	    margin-top: 20px;
	    margin-left:50px;
	}
	.h1{
		margin-top:20px;
		margin-bottom:30px;
	}
	.ssatda {
	display: flex;
    justify-content: flex-end;
    margin: 30px 0 20px;
    background: #f1f1f1;
    height: 100px;
    padding-top: 31px;
	}
	#keywordInput{
		margin-right:10px;
		    border: 3px solid;
	}
	#searchType{
	    border: 3px solid;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/pagelayoutHeader.jsp" %>
	<div class="mainaa">
			<div class="side">
				<%@ include file="include/pagelayoutSide2.jsp" %>
			</div>
			<div class="content">
			<h1 class="h1">책 배송 신청</h1>
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
				            <input type="text" class="form-control" name="keyword" id="keywordInput" value="${pageMaker.criteria.keyword}" placeholder="배송하고 싶은 책을 골라주세요.">
				            <span class="input-group-btn">
				                <button type="button" class="btn btn-primary btn-flat" id="searchBtn">
				                    <i class="fa fa-search"></i> 검색
				                </button>
				            </span>
				        </div>
				    </div>
		    </div>
				<p class="back_gd">※ 김이문오조 도서관에 있는 책들을<strong>무료</strong>로 배송해드립니다.<br>
				※ 예상 배송 시간은 영업일 기준 3일로 신속정확 배송해드립니다!</p>
				 <c:forEach var="dv" items="${dvlist}">
					<div class="all-book">
						<div class="thumbnail">
							<img src="${dv.bk_image}" class="thumbnail">
						</div>
						<table class="info">
							<tr>
							<td><strong>제목  </strong></td>
							<td><a href="bookDeliveryDetail?isbn=${dv.bk_icode}&bk_state=${dv.bk_state}" role="button">${dv.bk_name}</a></td>
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
							<tr>
							<td><strong>배송 가능 여부 </strong></td>
							<td>${dv.bk_state}</td>
							</tr>
						</table>
					</div>
				</c:forEach>
				<div class="text-center">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li><button type="button" class="prev_button" onClick="location.href='${pageContext.request.contextPath}/bookDeliveryList?page=${pageMaker.startPage - 1}';">이전</button></li>
            </c:if>
            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                    <button type="button" class="hey_button" onClick="location.href='${pageContext.request.contextPath}/bookDeliveryList?page=${idx}';">${idx}</button>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                <li><button type="button" class="next_button" onClick="location.href='${pageContext.request.contextPath}/bookDeliveryList?page=${pageMaker.endPage + 1}';">다음</button></li>
            </c:if>
        </ul>
    </div>
			</div>
	</div>
	 
	<%@ include file="include/pagelayoutFooter.jsp" %>
			

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









<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
		margin-top:30px;
		display:flex;
		justify-content:flex-end;
		
	}
		.all-book{
		display:flex;
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
				<h1>통합검색</h1>
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
				            <input type="text" class="form-control" name="keyword" id="keywordInput" value="${pageMaker.criteria.keyword}" placeholder="검색어">
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
							<td><a href="bookDeliveryDetail?isbn=${dv.bk_icode}&bk_state=${dv.bk_state}" role="button">${dv.bk_name}</a></td>
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
							<tr>
							<td><strong>배송 가능 여부 </strong></td>
							<td>${dv.bk_state}</td>
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
</html> --%>