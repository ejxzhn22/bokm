<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
</head>
<style>
	.content{
		border-top:3px solid orange;
		width:900px;
		margin-top:100px;
	}
	.borrowlist3{
		margin-top:30px;
		
	}
	.section{
		
		margin-top:30px;
	
	}
	h2{
    border-bottom: 2px solid #3a5696;
	padding-bottom:30px;
	}
</style>
<body>
<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="mainaa">
		<div class="side">
			<%@include file="include/pagelayoutSide3.jsp" %>
		</div>
		<div class="content">
<div class="tot">
	<div class="nav">
	</div>
	<div class="section">
		 <h2>게시글 수정</h2>
	<div class="form-group">
	<form method="post" enctype="multipart/form-data">
		  <label>작성자</label>
		  <input type="hidden"  name="bb_num" value="${board.bb_num}" class="form-control">
	      <input value = "${user.mb_name}" name = "mb_name" type="text" class="form-control" readonly><br>
		  <input value=${user.mb_email } name="mb_email" type="hidden">
		  
	      <label>글 제목</label>
	      <input  type="text" name="bb_title" value="${board.bb_title}" class="form-control"><br>
	      
	      <label>글 내용</label>
	      <textarea class="form-control" name="bb_content" rows="10">${board.bb_content}</textarea>
	      
	      <label>파일</label>
	          등록된 파일 : ${board.bb_image}
	      <input name="ufile" type="file" class="form-control">      
	      <button type="submit" class="btn btn-primary">수정</button>
	    </form>
	    </div>

	</div>
</div>
</div>
</div>
<%@ include file = "include/pagelayoutFooter.jsp" %>
</body>
</html>