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
	.img_book{
		width:400px;
		display:flex;
	}
	img{
	width: 284px;
    margin-top: 41px;
	}
	.all_info{
    display: flex;
    margin: 0 auto;
    margin-bottom: 30px;
    justify-content: center;
    align-items: center;
    width: 800px;
	}
	.td_info{
		width:200px;
	}
	form {
 	   display: flex;
  	  justify-content: center;
	}
table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

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
            <h1 class="h3 mb-2 text-gray-800">도서 관리</h1>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3"></div>
              <div class="card-body">
                <div class="table-responsive">
                <div class="all_info">
			<div class="img_book"><img src="${abd.bk_image}"></div>
                  <table>
			<tr><td colspan="2"><strong>책정보</strong></td>
				</tr>
			<tr><th class="td_info">책이름  </th>
				<td>${abd.bk_name}</td></tr>
			<tr><th class="td_info">책저자  </th>
				<td>${abd.bk_writer}</td></tr>
			<tr><th class="td_info">출판일  </th>
				<td>${abd.bk_publicday}</td></tr>
			<tr><th class="td_info">출판사  </th>
				<td>${abd.bk_publisher}</td></tr>
			<tr><th class="td_info">ISBN  </th>
				<td>${abd.bk_icode}</td></tr>
			<tr><th class="td_info">책내용  </th>
				<td>${abd.bk_introduction}</td></tr>
		</table>
		</div>
		<form action="allBookDetail" method="post">
		<input type="hidden" name="bk_icode" value="${abd.bk_icode}">
		<input type="submit" value="추천도서지정" id="rec-button" class="btn btn-primary">
		</form>		
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            Select "Logout" below if you are ready to end your current session.
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">
              Cancel
            </button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>