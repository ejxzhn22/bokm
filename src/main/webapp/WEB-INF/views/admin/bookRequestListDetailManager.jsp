<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <title>Library-admin</title>
  </head>
  <style>
	.approve-button{
		text-align:center;
	}
	.all_div{
		display:flex;
		justify-content:center;
		align-items:center;
		flex-direction:column;
	}
	table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
	margin-bottom: 30px;
}
table th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<body>

  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
    
    <!-- 사이드바 -->
    <%@include file="include/sidebar.jsp" %>
    
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
        
        <!-- 상단바 -->
        <%@include file="include/topbar.jsp" %>
        
<!--  메인!!!!!!!!!!!!!!!! -->
         <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">희망 도서 신청 관리</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3"></div>
              <div class="card-body">
                <div class="table-responsive">
                <div class="all_div">
                  <table>
			<tr><th><strong>신청번호</strong></th>
				<td>${brd.br_num}</td></tr>
			<tr><th>책이름 : </th>
				<td>${brd.br_name}</td></tr>
			
			<tr><th>책저자 : </th>
				<td>${brd.br_writer}</td></tr>
			
			<tr><th>신청일자 : </th>
				<td>${brd.br_date}</td></tr>
			
			<tr><th>신청자 ID : </th>
				<td>${brd.br_id}</td></tr>
			
			<tr><th>ISBN CODE : </th>
				<td>${brd.br_bcode}</td></tr>
			
			<tr><th>신청제목</th>
				<td>${brd.br_title}</td></tr>
			
			<tr><th>신청이유</th>
				<td>${brd.br_reason}</td></tr>
			
		</table>
		
	<form action="bookRequestListDetailManager" method="POST">
		<input type="hidden" value="${brd.br_num}" name="br_num"> 
		<input type="hidden" value="${isbn}" name="bk_icode"> 
		<input type="hidden" class="title" name="bk_name"> 
		<input type="hidden" class="introduction" name="bk_introduction"> 
		<input type="hidden" class="datetime" name="bk_publicday"> 
		<input type="hidden" class="publisher" name="bk_publisher"> 
		<input type="hidden" class="authors" name="bk_writer"> 
		<input type="hidden" class="thumbnail" name="bk_image"> 
		<input type="submit" value="신청 승인" id="approve-button" class="btn btn-primary">
		<input type="button" value="홈으로" id="home-button" class="btn btn-info"></input>
	</form>
		</div>

		
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
		</script>
		<script>
	var isbn=${isbn};
	
		$(document).ready(function () {
				$.ajax({
					method:"GET",
					url:"https://dapi.kakao.com/v3/search/book?target=title",
					data:{query: isbn},
					headers : {Authorization:"KakaoAK ac96be09e1d7b8a94633476caf244876"}
				})
			
				.done(function(search){
				 console.log(search.documents[0].thumbnail);
					var htmls="";
						htmls += '<div class="all-book">';
						htmls += '<h2>신청한 책 정보</h2>';
						htmls += '<div class="thumbnail-book">';
						htmls += "<img src='"+search.documents[0].thumbnail+"' class='thumb'>";
						htmls += '</div>';
						htmls += '<div class="info-book">';
						htmls += '<strong>제목 : </strong>'+search.documents[0].title+"<br>";
						htmls += '<strong>저자 : </strong>'+search.documents[0].authors+"<br>";
						htmls += '<strong>출판사 : </strong>'+search.documents[0].publisher+"<br>";
						htmls += '<strong>대출여부 : </strong>'+search.documents[0].status+"<br>";
						htmls += '<strong>isbn : </strong>'+search.documents[0].isbn+"<br>";
						htmls += '<strong>출판일 : </strong>'+search.documents[0].datetime+"<br>";
						htmls += '<strong>번역자 : </strong>'+search.documents[0].translators+"<br>";
						htmls += '<strong>판매가 : </strong>'+search.documents[0].sale_price+" 원<br>";
						htmls += '<strong>내용 : </strong>'+search.documents[0].contents+"<br>";
						htmls += '</div><hr>';
						htmls += '</div>';
					$("#list").html(htmls);
					
					
					$(".title").val(search.documents[0].title);
					$(".introduction").val(search.documents[0].contents);
					$(".datetime").val(search.documents[0].datetime);
					$(".publisher").val(search.documents[0].publisher);
					$(".authors").val(search.documents[0].authors);
					$(".thumbnail").val(search.documents[0].thumbnail);
				})
			});
					$("#home-button").click(function(){
						location.href="adminHome";
					});
		</script>
                </div>
              </div>
            </div>
          </div>
          <!-- /.container-fluid -->
        </div>
        <!-- Footer -->
   	 <%@include file="include/footer.jsp" %>
        <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div
      class="modal fade"
      id="logoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button
              class="close"
              type="button"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            Select "Logout" below if you are ready to end your current session.
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-secondary"
              type="button"
              data-dismiss="modal"
            >
              Cancel
            </button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>