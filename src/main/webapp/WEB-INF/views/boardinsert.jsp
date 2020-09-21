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
		 <h2>게시글 추가</h2>
	<div class="form-group">
	<form method="post" enctype="multipart/form-data">
		  <label>작성자</label>
	      <input value = "${user.mb_name}" name = "mb_name" type="text" class="form-control" readonly><br>
		  <input value=${user.mb_email } name="mb_email" type="hidden">
	      <label>글 제목</label>
	      <input name = "bb_title" type="text" class="form-control"  placeholder="제목을 입력하세요"><br>
	      
	      <label>글 내용</label>
	      <textarea name = "bb_content" class="form-control" rows="3"></textarea>
	      
	      <label>파일</label>
	      <input name = "ufile" type="file" class="form-control"><br>
	      
	      <button type="submit" class="btn btn-primary">등록</button>
	    </form>
	    </div>

	</div>
</div>
</div>
</div>
<%@ include file = "include/pagelayoutFooter.jsp" %>
</body>
</html>