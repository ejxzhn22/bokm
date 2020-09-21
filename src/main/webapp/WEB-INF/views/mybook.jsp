<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBook</title>
<style>
.mybook_title {
  font-size: 35px;
  margin: 0 0 40px;
}

.mybook_guide-list {
  border: 1px solid #ddd;
  text-align: center;
  padding: 1em;
  margin-bottom: 65px;
}
	.mybook_top{
		display:flex;
		padding-top:20px;
	}
	.mybook_topline{
		width:1500px;
		border-top:3px solid #f0f0f0;
	}
	.mybook_title {
	  width:200px;
	  text-align:center;
	  font-size: 35px;
	  margin: 0 0 40px;
	  padding-top:20px;
	  border-top:3px solid orange;
	}
	.mybook{
		width:1400px;
	}
</style>
<link rel="stylesheet" href="resources/css/mybook.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
		<%@ include file="include/pagelayoutHeader.jsp" %>
      <section class="mybook">
	<div class="mybook_top">
		<div class="mybook_title">내 서재</div>
		<div class="mybook_topline"></div>
	</div>

        <div class="mybook_guide-list">예약중인 목록이 없습니다.</div>
        
        <table class="table table-striped table-hover">
          <tr>
            <td>번호</td>
            <td>책제목</td>
            <td>저자</td>
            <td>권수</td>
            <td>대출상태</td>
          </tr>
        </table>
      </section>
      	<%@ include file="include/pagelayoutFooter.jsp" %>
    </body>
</html>