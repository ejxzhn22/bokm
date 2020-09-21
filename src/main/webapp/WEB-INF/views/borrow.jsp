<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출신청</title>
<link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
      crossorigin="anonymous"
    />
    <script src="https://code.jquery.com/jquery-3.5.1.js"
      integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
   </script>
  </head>
  <style>
    .table {
      width: 800px;
      margin: 0 auto;
    }
    .borrow{
    	text-align:center;
    }
   	.content{
	border-top:3px solid orange;
	margin-top:100px;
	padding:30px;
	position:relative;
	width: 900px;
	}
	.borrow_title{
		color:#3a5696;
		margin-bottom : 30px;
	}
  </style>
  <body>
  	<%@ include file="include/pagelayoutHeader.jsp" %>
	<div class="mainaa">
		<div class="side">
			<%@ include file="include/pagelayoutSide1.jsp"%>
		</div>
		<div class="content">
		    <section class="borrow">
		      <h2 class="borrow_title">
		        대출신청
		      </h2>
		      <table class="table table-hover">
		        <tr>
		          <td rowspan="2"><img src="${book.bk_image}"></td>
		          <td>책제목</td>
		          <td>${book.bk_name}</td>
		        </tr>
		        <tr>
		          <td>저자</td>
		          <td>${book.bk_writer}</td>
		        </tr>
		        <tr>
		          <td colspan="3" style="text-align: center;">
		        <form action="addborrow" method="post">
		          <input type="hidden" name="bk_icode" value="${book.bk_icode}">
		          <input type="hidden" name="bl_id" value="${user.mb_id}">
		            <button type="submit" class="btn btn-default" ">신청</button>
		          </form>
		            <a class="btn btn-default" href="#" role="button">취소</a>
		          </td>
		        </tr>
		      </table>
		    </section>
		    </div> <!-- end of content -->
	</div> <!-- end of mainaa -->
	<%@ include file="include/pagelayoutFooter.jsp"%>
  </body>
</html>